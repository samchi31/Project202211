package notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.service.AtchFileServiceImpl;
import notice.service.IAtchFileService;
import notice.service.INoticeService;
import notice.service.NoticeServiceImpl;
import notice.vo.AtchFileVO;
import notice.vo.NoticeVO;

@MultipartConfig
@WebServlet("/UpdateNoticeController.do")
public class UpdateNoticeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 파라미터값 조회
		String noticeId = req.getParameter("noticeId");

		// 서비스객체 생성
		INoticeService noticeService = NoticeServiceImpl.getInstance();

		NoticeVO nv = noticeService.selectNotice(noticeId);

		// 첨부파일 목록 조회
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();

		List<AtchFileVO> atchFileList = fileService.getAtchFileList(nv.getAtchId());

		req.setAttribute("atchFileList", atchFileList); // 저장~~
		req.setAttribute("nv", nv);

		// JSP에게 포워딩 처리
		req.getRequestDispatcher("/WEB-INF/adminNotice/updateForm.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 파라미터값 가져오기
		String memId = "admin"; // String memId = req.getParameter("memId"); // 세션 있다치고
		String noticeTitle = req.getParameter("noticeTitle");
		String noticeContent = req.getParameter("noticeContent");

		// 서비스 객체 생성하기
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		NoticeVO nv = new NoticeVO();
		nv.setNoticeId(req.getParameter("noticeId"));
		nv.setMemId(memId);
		nv.setNoticeTitle(noticeTitle);
		nv.setNoticeContent(noticeContent);

		IAtchFileService fileService = AtchFileServiceImpl.getInstance();

		// 첨부파일 목록 저장하기 (공통기능)
		List<AtchFileVO> atchFileVOList = null;
		if (req.getParameter("isChange").equals("yes")) {
			atchFileVOList = fileService.saveAtchFileList(req);
		}
		int cnt = noticeService.modifyNotice(nv,atchFileVOList); // db에 보내기!

		resp.sendRedirect(req.getContextPath() + "/ListNoticeController.do"); // 방향이 바뀜. insert를 했는데 최종적으로 list.do url로
																				// 바뀜!

	}

}
