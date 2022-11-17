package userClass.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ClsCategory;
import common.FileService;
import common.IFileService;
import userClass.service.IUsrClsService;
import userClass.service.UsrClsService;
import userClass.vo.UsrClsVO;

@MultipartConfig
@WebServlet("/UsrClsUpdate.do")
public class UsrClsUpdate extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		IUsrClsService clsService = UsrClsService.getInstance();

		UsrClsVO usrClsVO = clsService.getOneClassDetail(request.getParameter("classId"));

		request.setAttribute("usrClsVO", usrClsVO);

		request.getRequestDispatcher("WEB-INF/userClass/usrClsUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		IUsrClsService clsService = UsrClsService.getInstance();

		UsrClsVO usrClsVO = new UsrClsVO();
		usrClsVO.setClassId(request.getParameter("classId"));
		usrClsVO.setMemId("asdf"); // usrClsVO.setMemId(memId); // 세션 잇다치고
		usrClsVO.setClassTitle(request.getParameter("title"));
		usrClsVO.setClassContent(request.getParameter("content"));
		usrClsVO.setClsCtId(ClsCategory.valueOfKor(request.getParameter("category")));

		// 파일 WebContent/images/thumbnail/에 저장
		if (request.getParameter("old").equals("click")) {
			IFileService fileService = new FileService();
			fileService.saveImage(request, usrClsVO.getClassThumbnail());
			usrClsVO.setClassThumbnail(fileService.getSavePath());
		} else {
			usrClsVO.setClassThumbnail(request.getParameter("old"));
		}

		int cnt = clsService.updatePost(usrClsVO);

		String msg = "실패";
		if (cnt > 0) {
			msg = "성공";
		}
		// req 객체는 리다이렉트로 인해서 insert 후 소멸함 list.do 까지 정보를 유지하기위해 세션사용
		request.getSession().setAttribute("msg", msg);

		response.sendRedirect(request.getContextPath() + "/UsrClsDetail.do?classId=" + usrClsVO.getClassId());
	}

}
