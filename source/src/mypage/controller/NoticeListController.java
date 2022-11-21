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

import notice.service.INoticeService;
import notice.service.NoticeServiceImpl;
import notice.vo.NoticeVO;

@WebServlet("/myNotice.do")
public class NoticeListController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 서비스 객체 생성하기
		INoticeService noticeService = NoticeServiceImpl.getInstance();

		int count = noticeService.countList();

		int currentPage = 1;
		currentPage = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		// 한 화면에 몇페이지
		int perPage = 5;

		// 페이지 글 개수
		int perList = 10;

		int totalPage = (int) Math.ceil((double) count / (double) perList);
//		System.out.println(totalPage);

		int start = (currentPage - 1) * perList + 1;
		int end = start + perList - 1;
		if (end > count)
			end = count;

		int startPage = (currentPage - 1) / perPage * perPage + 1;
		int endPage = startPage + perPage - 1;
		if (endPage > totalPage)
			endPage = totalPage;

//		Map<String,String> map = new HashMap<String, String>();
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);

		// 회원 목록 조회
		List<NoticeVO> noticeList = noticeService.selectAllMember(map); // 전체 조회하는 것

		request.setAttribute("noticeList", noticeList);
		request.setAttribute("perPage", perPage);
		request.setAttribute("sPage", startPage);
		request.setAttribute("ePage", endPage);
		request.setAttribute("ttPage", totalPage);
		request.setAttribute("cPage", currentPage);

		request.getRequestDispatcher("/WEB-INF/mypage/myNotice.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
