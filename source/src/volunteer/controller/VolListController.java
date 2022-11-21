package volunteer.controller;

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
import javax.servlet.http.HttpSession;

import common.VolCategory;
import common.VolStatus;
import member.vo.MemberVO;
import volunteer.service.IVolService;
import volunteer.service.VolService;
import volunteer.vo.VolunteerVO;
import volunteer.vo.WishVO;

@WebServlet("/volList.do")
public class VolListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memId = ((MemberVO)request.getSession().getAttribute("loginUser")).getMemId();
//		String memId = "c001";
		String location = request.getParameter("location");
	    String status = request.getParameter("status");
	    String category = request.getParameter("category");
	    String date= request.getParameter("date");

		
		IVolService service = VolService.getInstance();
		List<WishVO> wishList = service.getWishList();
		int isIns = service.isInst(memId);
		
		// 기간 지난 것 - 모집 상태 : 모집 중 -> 모집 완료 / 예약 상태 : CONFIRMED, EXPIRED 빼고 나머지는 CANCELED로! 
		int isUpdate = service.updateVolList("FINISHED");
		
///////////////////////////PAGINATION///////////////////////////
		
		//현재 페이지 값(default 1page)
		int currentPage = 1;
		
		currentPage = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		
		//전체 글 개수 가져오기
		int count = service.countList();  //--->쿼리수정필요해요 board테이블 부재 / adminQnA에 맞는 테이블 리스트카운트 값을 불러와야 합니당!!
		
		
		//한 화면에 출력할 페이지 수
		int perPage = 5;
		
		//한 페이지에 출력할 글 개수
		int perList = 3;
		
		//전체 페이지 수 구하기 = (공식: 전체 글 개수 / 페이지당 글 개수)
		//double형으로 소수점을 발생시켜 연산해야 정상적인 값을 얻는다.
		int totalPage = (int) Math.ceil((double)count / (double)perList);
		//System.out.print(totalPage);
		
		
		
		//페이지에 표시될 게시글의 start/end값 구하기
		int start = (currentPage -1) * perList + 1;
		//end 공식: start + 한페이지에 출력할 글 개수 - 1
		int end = start + perList - 1;
		
		//전체 글 개수보다 게시글의 끝 값이 더 클 경우, 처리
		if(end > count) end = count;
		
		
		
		//화면에 보여질 페이지 번호 구하기
		int startPage = ((currentPage - 1) / perPage * perPage) + 1;
		//endPage 공식 : startPage + 화면출력페이지수 - 1
		int endPage = startPage + perPage - 1;
		
		// totalPage보다 endPage의 값이 더 클 경우, 처리
		if(endPage > totalPage) endPage = totalPage;	

		
		//pagination
		Map<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		if(location == null || location.equals("전체") || location.equals("")) {
			map.put("location", null);
		} else {
			map.put("location", location);
		}
	
		if(status == null || status.equals("전체") || status.equals("")) {
			map.put("status", null);
		} else {
			map.put("status", VolStatus.getVolStatusEnum(status));
		}
		
		if(category == null || category.equals("전체") || category.equals("")) {
			map.put("category", null);
		} else {
			map.put("category", VolCategory.getVolCategoryEnum(category));
		}
		
		// 기본으로 정해져 있는 value 시 어떻게?
		if(date == null || date.equals("")) {
			map.put("date", null);
		} else {
			map.put("date", date);
		}
		
		List<VolunteerVO> volList = service.getList(map);
		
		
		
		request.setAttribute("volList", volList);
		request.setAttribute("wishList", wishList);
		request.setAttribute("memId", memId);
		request.setAttribute("isIns", isIns);
		
		//PAGINATION
		request.setAttribute("sPage", startPage);
		request.setAttribute("ePage", endPage);
		request.setAttribute("ttPage", totalPage);
		request.setAttribute("cPage", currentPage);
		
//		RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath() + "/WEB-INF/volunteer/volList.jsp");
//		dispatcher.forward(request, response); //jsp에게 전달
		//PAGINATION
		
		
		
		request.getRequestDispatcher("/WEB-INF/volunteer/volList.jsp").forward(request, response);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
