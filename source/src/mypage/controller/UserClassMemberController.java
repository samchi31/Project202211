package mypage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ClsCategory;
import member.vo.MemberVO;
import userClass.service.IUsrClsService;
import userClass.service.UsrClsService;
import userClass.vo.UsrClsVO;
import volunteer.service.IVolService;
import volunteer.service.VolService;
import volunteer.vo.ReservationVO;

@WebServlet("/myUserClass.do")
public class UserClassMemberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemberVO memVo = (MemberVO)request.getSession().getAttribute("loginUser");
		String memId = memVo.getMemId(); // session
		
		IUsrClsService clsService = UsrClsService.getInstance();

		int count = clsService.countList();

		int currentPage = 1;
		currentPage = request.getParameter("pageNo")==null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		// 한 화면에 몇페이지 아래버튼
		int perPage = 5;
		
		// 한 페이지에 출력할 글 갯수
		int perList = 9;

		int totalPage = (int) Math.ceil((double) count / (double) perList);
//		System.out.println(totalPage);

		int start = (currentPage - 1) * perList + 1; 
		int end = start + perList - 1; 
		if(end>count) end = count;	

		int startPage = (currentPage - 1) / perPage * perPage + 1;		
		int endPage = startPage + perPage - 1;
		if(endPage>totalPage) endPage = totalPage;
		
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("search",request.getParameter("search"));
		if(request.getParameter("category") != "전체") {
			map.put("category", ClsCategory.valueOfKor(request.getParameter("category")));
		} else {
			map.put("category", null);
		}
		
		List<UsrClsVO> clsList = clsService.selectAllDesc(map); 
		
		request.setAttribute("list", clsList);
		request.setAttribute("perPage", perPage);
		request.setAttribute("sPage", startPage);
		request.setAttribute("ePage", endPage);
		request.setAttribute("ttPage", totalPage);
		request.setAttribute("cPage", currentPage);
		
		request.getRequestDispatcher("/WEB-INF/mypage/myUserClassList.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
