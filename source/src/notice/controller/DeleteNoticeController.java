package notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.service.INoticeService;
import notice.service.NoticeServiceImpl;

@WebServlet("/deleteNotice.do")
public class DeleteNoticeController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String noticeId = req.getParameter("noticeId"); //req의 noticeId를 가져옴
		
		INoticeService noticeService = NoticeServiceImpl.getInstance(); //서비스 객체 생성
		
		int cnt = noticeService.removeNotice(noticeId); //서비스에서 removeNotice(noticeId) 삭제가 잘 되면 cnt가 1이 나와서 그 값 가져옴
		
		String msg=""; 
		
		if(cnt > 0) {
			msg = "성공";
			//성공
		} else {
			msg = "실패";
			//실패
		}
		
		req.getSession().setAttribute("msg", msg); //msg에 담긴 메세지를 setAttribute를 통해 'msg'에 저장 >> 서비스로 보냄??
		
		resp.sendRedirect(req.getContextPath() + "/ListNoticeController.do"); //resp. 다녀온 후 /ListNoticeController.do로 이동
		//request 객체는 응답이 일어나고 끝날 때 사라짐 
		//redirect 그때 만들어진 객체 사라져 있어서  session에 저장
		//request, session, servlet context 세 종류 있음 
		//session이 끝난다. 브라우저 종류, 로그아웃 등 
	
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	
	}
	
	
	
	
}
