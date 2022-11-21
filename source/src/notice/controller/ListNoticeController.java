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

import member.vo.MemberVO;
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
		
		int count = noticeService.countList();

		int currentPage = 1;
		currentPage = req.getParameter("pageNo")==null? 
				1 : Integer.parseInt(req.getParameter("pageNo"));
		// 한 화면에 몇페이지
		int perPage = 5;
		
		// 페이지 글 개수
		int perList = 10;

		int totalPage = (int) Math.ceil((double) count / (double) perList);
//		System.out.println(totalPage);

		int start = (currentPage - 1) * perList + 1; 
		int end = start + perList - 1; 
		if(end>count) end = count;	

		int startPage = (currentPage - 1) / perPage * perPage + 1;		
		int endPage = startPage + perPage - 1;
		if(endPage>totalPage) endPage = totalPage;
		
//		Map<String,String> map = new HashMap<String, String>();
		Map<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		//회원 목록 조회
		List<NoticeVO> noticeList = noticeService.selectAllMember(map); //전체 조회하는 것
		
		req.setAttribute("noticeList", noticeList);
		req.setAttribute("perPage", perPage);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("ttPage", totalPage);
		req.setAttribute("cPage", currentPage);
		
		MemberVO memVo = (MemberVO)req.getSession().getAttribute("loginUser");
		
		String viewPage = "/WEB-INF/adminNotice/memberlist.jsp";  // 회원
		if(memVo!=null&&memVo.getAdmin().equals("Y")) {
			viewPage = "/WEB-INF/adminNotice/list.jsp";  // 관리자
		}
		
		//회원목록 화면 처리하기
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
		
		dispatcher.forward(req, resp); //jsp에게 전달
	}
	
	


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}

