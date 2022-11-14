package notice.controller;

import java.io.IOException;

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
@WebServlet("/InsertNoticeController.do")


public class InsertNoticeController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/adminNotice/insertForm.jsp").forward(req, resp);
		
	}
	
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//	        한글로 인코딩 해주는 코드!
//		req.setCharacterEncoding("UTF-8"); 
		
		// 파라미터값 가져오기
		String noticeId = req.getParameter("noticeId");
		String memId = req.getParameter("memId");
		String noticeDate = req.getParameter("noticeDate");
		String noticeTitle = req.getParameter("noticeTitle");
		String noticeContent = req.getParameter("noticeContent");
//		String atchId = req.getParameter("atchId");
		
		
		// 서비스 객체 생성하기
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
				
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		
		AtchFileVO atchFileVO = new AtchFileVO();
		
		//첨부파일 목록 저장하기 (공통기능)
		atchFileVO = fileService.saveAtchFileList(req);
		
		
		NoticeVO nv = new NoticeVO();
		nv.setNoticeId(noticeId);
		nv.setMemId(memId);
		nv.setNoticeDate(noticeDate);
		nv.setNoticeTitle(noticeTitle);
		nv.setNoticeContent(noticeContent);
		nv.setAtchId(atchFileVO.getAtchFileId());
		
		
		int cnt = noticeService.registerNotice(nv);
		
		String msg="";
		if(cnt > 0) {
			msg = "성공";
			//성공
		} else {
			msg = "실패";
			//실패
		}
		
		
		req.getSession().setAttribute("msg", msg);
		
//		req.getRequestDispatcher("/member/list.do").forward(req, resp);
		
		
		//sendRedirect : 방향이 바뀜. insert를 했는데 최종적으로 url이 list.do으로 바뀜!
		resp.sendRedirect(req.getContextPath() + "/ListNoticeController.do"); //방향이 바뀜. insert를 했는데 최종적으로 list.do url로 바뀜!
		
	}

}
