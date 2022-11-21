package qna.controller;

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
import qna.service.IQnaService;
import qna.service.QnaServiceImpl;
import qna.vo.QnaVO;


@WebServlet(value = "/ListQnaController.do")
public class ListQnaController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		IQnaService adminQnaService = QnaServiceImpl.getInstance();
		
		//pagination
		//현재 페이지 값(default 1page)
		int currentPage = 1;
		
		currentPage = req.getParameter("pageNo") == null ? 1 : Integer.parseInt(req.getParameter("pageNo"));
		
		//전체 글 개수 가져오기
		int count = adminQnaService.countList();  //--->쿼리수정필요해요 board테이블 부재 / adminQnA에 맞는 테이블 리스트카운트 값을 불러와야 합니당!!
		
		
		//한 화면에 출력할 페이지 수
		int perPage = 5;
		
		//한 페이지에 출력할 글 개수
		int perList = 10;
		
		//전체 페이지 수 구하기 = (공식: 전체 글 개수 / 페이지당 글 개수)
		//double형으로 소수점을 발생시켜 연산해야 정상적인 값을 얻는다.
		int totalPage = (int) Math.ceil((double)count / (double)perList);
		System.out.print(totalPage);
		
		
		
		//페이지에 표시될 게시글의 start/end값 구하기
		
		// (start 공식: (현재페이지 -1) * 한페이지에 출력할 글 개수 + 1 )
		// 현재 페이지 1일 때 : (1 - 1) * 5 + 1 = 1
		// 현재 페이지 2일 때 : (2 - 1) * 5 + 1 = 6
		// 현재 페이지 3일 때 : (3 - 1) * 5 + 1 = 11
		int start = (currentPage -1) * perList + 1;
		
		// (end 공식: start + 한페이지에 출력할 글 개수 - 1 )
		// 현재 페이지 1일 때 : (1 + 5) - 1 = 5
		// 현재 페이지 1일 때 : (6 + 5) - 1 = 10
		// 현재 페이지 1일 때 : (11 + 5) - 1 = 15
		int end = start + perList - 1;
		//전체 글 개수보다 게시글의 끝 값이 더 클 경우, 처리
		if(end > count) end = count;
		
		
		
		//화면에 보여질 페이지 번호 구하기
		
		// (startPage 공식 : ((현재페이지 - 1) / 화면출력페이지수 * 화면출력페이지수) + 1 )
		// 현재 페이지 1일 때 : ((1 - 1) / 4 * 4) + 1 = 1
		// 현재 페이지 2일 때 : ((2 - 1) / 4 * 4) + 1 = 1
		// 현재 페이지 3일 때 : ((3 - 1) / 4 * 4) + 1 = 1
		// 현재 페이지 4일 때 : ((4 - 1) / 4 * 4) + 1 = 1
		// 현재 페이지 5일 때 : ((5 - 1) / 4 * 4) + 1 = 5
		// 현재 페이지 6일 때 : ((6 - 1) / 4 * 4) + 1 = 5
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;
		
		
		// (endPage 공식 : startPage + 화면출력페이지수 - 1)
		// 4page일 때 : 1 + 4 - 1 = 1
		// 5page일 때 : 5 + 4 - 1 = 8
		// 6page일 때 : 5 + 4 - 1 = 8
		// 7page일 때 : 5 + 4 - 1 = 8
		// 8page일 때 : 5 + 4 - 1 = 8
		// 9page일 때 : 11 + 4 - 1 = 14
		int endPage = startPage + perPage - 1;
		// totalPage보다 endPage의 값이 더 클 경우, 처리
		if(endPage > totalPage) endPage = totalPage;
		
		Map<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		//목록 조회
		List<QnaVO> adminQnaList = adminQnaService.selectAllAdmin(map); //전체 조회하는 것
		
		req.setAttribute("adminQnaList", adminQnaList);
		req.setAttribute("sPage", startPage);
		req.setAttribute("ePage", endPage);
		req.setAttribute("ttPage", totalPage);
		req.setAttribute("cPage", currentPage);
		
		adminQnaService.selectAllAdmin(map);
		
		
		MemberVO memVo = (MemberVO)req.getSession().getAttribute("loginUser");
		
		String viewPage = "/WEB-INF/qnaMember/memberQnalist.jsp";  //회원
		if(memVo != null && memVo.getAdmin().equals("Y")) {
			viewPage = "/WEB-INF/qna/list.jsp";  // 관리자
		}
		
		//회원목록 화면 처리하기
		RequestDispatcher dispatcher = req.getRequestDispatcher(req.getContextPath() + viewPage);
		
		dispatcher.forward(req, resp); //jsp에게 전달
		
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
		
	}
	
}
