package mypage.controller;

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
import volunteer.service.IVolService;
import volunteer.service.VolService;
import volunteer.vo.VolunteerVO;

@WebServlet("/myQna.do")
public class QnaMyList extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		IQnaService adminQnaService = QnaServiceImpl.getInstance();
		
		//pagination
		int currentPage = 1;
		currentPage = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		int count = adminQnaService.countList();  //--->쿼리수정필요해요 board테이블 부재 / adminQnA에 맞는 테이블 리스트카운트 값을 불러와야 합니당!!
		int perPage = 5;
		int perList = 10;
		int totalPage = (int) Math.ceil((double)count / (double)perList);
		int start = (currentPage -1) * perList + 1;
		int end = start + perList - 1;
		if(end > count) end = count;
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
		Map<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		//목록 조회
		List<QnaVO> adminQnaList = adminQnaService.selectAllAdmin(map); //전체 조회하는 것
		
		request.setAttribute("adminQnaList", adminQnaList);
		request.setAttribute("sPage", startPage);
		request.setAttribute("ePage", endPage);
		request.setAttribute("ttPage", totalPage);
		request.setAttribute("cPage", currentPage);
		
		adminQnaService.selectAllAdmin(map);
		
		
		MemberVO memVo = (MemberVO)request.getSession().getAttribute("loginUser");
		
		request.getRequestDispatcher("/WEB-INF/mypage/myQna.jsp").forward(request, response);
	}	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
