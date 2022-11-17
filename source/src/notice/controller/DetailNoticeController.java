package notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
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


@WebServlet("/detail.do")

public class DetailNoticeController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//파라미터값 조회
		String noticeId = req.getParameter("noticeId");
		
		//서비스객체 생성
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		NoticeVO nv = noticeService.getNotice(noticeId);
		
		// 첨부파일 목록 조회
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		List<AtchFileVO> atchFileList = fileService.getAtchFileList(nv.getAtchId());
		
		req.setAttribute("atchFileList", atchFileList); //저장~~		
		req.setAttribute("nv", nv);
		
		//JSP에게 포워딩 처리
		req.getRequestDispatcher("/WEB-INF/adminNotice/detail.jsp").forward(req, resp);
	}
	
	
	
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//	}

}
