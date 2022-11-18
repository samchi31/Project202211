package mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import donate.service.DonateServiceImpl;
import donate.service.IDonateService;
import donate.vo.DonateVO;
import member.vo.MemberVO;
import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;

@WebServlet("/myDonate.do")
public class ListDonateController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IDonateService donateService = DonateServiceImpl.getInstance();
		IMypageService service = MypageServiceImpl.getInstance();
		
		String memId = ((MemberVO)request.getSession().getAttribute("loginUser")).getMemId();

		
		//조회조건
		int pageNo = 1;
		if(request.getParameter("pageNo") != null && request.getParameter("pageNo") != "") {
			pageNo = Integer.parseInt(request.getParameter("pageNo").trim());
		}
		
		DonateVO dv = new DonateVO();
		//세션정보
		dv.setMemId(memId);
		dv.setPageNo(pageNo);
		
		List<DonateVO> donateList = service.getMyDonate(memId);
		
		request.setAttribute("donateList", donateList);
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/mypage/myDonateList.jsp");
		dispatcher.forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
	
	

}
