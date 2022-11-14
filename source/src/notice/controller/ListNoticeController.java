package notice.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.service.INoticeService;
import notice.service.NoticeServiceImpl;
import notice.vo.NoticeVO;


@WebServlet(value = "/ListNoticeController.do")
public class ListNoticeController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		//서비스 객체 생성하기
		INoticeService noticeService = NoticeServiceImpl.getInstance(); 
		
//		Map<String,String> map = new HashMap<String, String>();
		Map<String,Object> map = new HashMap<>();
		map.put("start", "1");
		map.put("end", "100");
		
		//회원 목록 조회
		List<NoticeVO> noticeList = noticeService.selectAllMember(map); //전체 조회하는 것
		
		req.setAttribute("noticeList", noticeList);
		
		//회원목록 화면 처리하기
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/adminNotice/list.jsp");
		
		dispatcher.forward(req, resp); //jsp에게 전달
	}
	
	


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}

