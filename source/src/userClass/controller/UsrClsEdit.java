package userClass.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.FileService;
import common.IFileService;
import userClass.service.IUsrClsService;
import userClass.service.UsrClsService;
import userClass.vo.UsrClsVO;

@MultipartConfig
@WebServlet("/UsrClsEdit.do")
public class UsrClsEdit extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/userClass/usrClsEdit.jsp").forward(request, response);
	}

	// 저장버튼 눌렀을 시
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		IUsrClsService clsService = UsrClsService.getInstance();

		UsrClsVO usrClsVO = new UsrClsVO();
		usrClsVO.setMemId("asdf"); // usrClsVO.setMemId(memId); // 세션 잇다치고
		usrClsVO.setClassTitle(request.getParameter("title"));
		usrClsVO.setClassContent(request.getParameter("content"));
		usrClsVO.setClsCtId("Sports"); // usrClsVO.setClsCtId(request.getParameter("category"));

		// 파일 WebContent/images/thumbnail/에 저장
		IFileService fileService = new FileService();
		fileService.saveImage(request, usrClsVO.getClassThumbnail());
		usrClsVO.setClassThumbnail(fileService.getSavePath());

		int cnt = clsService.insertPost(usrClsVO);
		
		String msg = "실패";
		if(cnt > 0 ) {
			msg="성공";
		} 
		// req 객체는 리다이렉트로 인해서 insert 후 소멸함 list.do 까지 정보를 유지하기위해 세션사용
		request.getSession().setAttribute("msg", msg);
		
		response.sendRedirect(request.getContextPath()+ "/UsrClsList.do");
	}

}
