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
@WebServlet("/InsertNoticeController.do")
public class InsertNoticeController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/adminNotice/insertForm.jsp").forward(req, resp);
		
	}	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 파라미터값 가져오기
		String memId = "admin";//String memId = req.getParameter("memId");	//admin 세션있다치고
		String noticeTitle = req.getParameter("noticeTitle");
		String noticeContent = req.getParameter("noticeContent");	
		
		INoticeService noticeService = NoticeServiceImpl.getInstance();	
		NoticeVO nv = new NoticeVO();
		nv.setMemId(memId);
		nv.setNoticeTitle(noticeTitle);
		nv.setNoticeContent(noticeContent);		
		
		// 서비스 객체 생성하기
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();			
		
		//첨부파일 목록 저장하기 (공통기능)
		List<AtchFileVO> atchFileVOList = fileService.saveAtchFileList(req);
		int cnt = noticeService.registerNotice(nv, atchFileVOList);
		
		String msg="";
		if(cnt > 0)  {
			msg = "성공";
		} else {
			msg = "실패";
		}		
		
		req.getSession().setAttribute("msg", msg);
		
//		req.getRequestDispatcher("/member/list.do").forward(req, resp);
		
		
		//sendRedirect : 방향이 바뀜. insert를 했는데 최종적으로 url이 list.do으로 바뀜!
		resp.sendRedirect(req.getContextPath() + "/ListNoticeController.do"); //방향이 바뀜. insert를 했는데 최종적으로 list.do url로 바뀜!
		
	}

}
