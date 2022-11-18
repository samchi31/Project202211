package donate.controller;

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

@WebServlet("/donate/DonateList.do")
public class ListDonateController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IDonateService donateService = DonateServiceImpl.getInstance();
		
		MemberVO mv = (MemberVO)req.getSession().getAttribute("loginUser");
		String memId = mv.getMemId(); //로그인사용자 아이디
		
		//조회조건
		int pageNo = 1;
		if(req.getParameter("pageNo") != null && req.getParameter("pageNo") != "") {
			pageNo = Integer.parseInt(req.getParameter("pageNo").trim());
		}
		
		DonateVO dv = new DonateVO();
		//세션정보
		dv.setMemId(memId);
		dv.setPageNo(pageNo);
		
		List<DonateVO> DonateList = donateService.getDonateList(dv);
		
		req.setAttribute("DonateList", DonateList);
		req.setAttribute("param", dv);
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/donate/donateList.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
	
	

}
