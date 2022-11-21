package donate.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import donate.service.DonateServiceImpl;
import donate.service.IDonateService;
import donate.vo.DonateVO;
import funding.service.FundingServiceImpl;
import funding.service.IFundingService;
import member.vo.MemberVO;

@WebServlet("/donate/Donate.do")
public class insertDonateController extends HttpServlet {
       
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// req.getRequestDispatcher("/WEB-INF/views/funding/fundingDetail.jsp").forward(req, resp);
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		//String donateId = req.getParameter("donateId");
		String memId = ((MemberVO)req.getSession().getAttribute("loginUser")).getMemId();
		String fundingId = req.getParameter("fundingId");
		int donateAmount = Integer.parseInt(req.getParameter("donateAmount"));
		String donateAccount = req.getParameter("donateAccount");
		String donateAccountHolder = req.getParameter("donateAccountHolder");
		String donateBankName = req.getParameter("donateBankName");
		
		IDonateService donateService = DonateServiceImpl.getInstance();
		IFundingService fundingService = FundingServiceImpl.getInstance();
		
		DonateVO dv = new DonateVO();
		//dv.setDonateId(donateId);
		dv.setMemId(memId);
		dv.setFundingId(fundingId);
		dv.setDonateAmount(donateAmount);
		dv.setDonateAccount(donateAccount);
		dv.setDonateAccountHolder(donateAccountHolder);
		dv.setDonateBankName(donateBankName);
		
		int cnt = donateService.setDonate(dv);
		fundingService.modifyRecentAmount(fundingId);
		
		
		String msg = "";
		
		if(cnt>0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		
		req.getSession().setAttribute("msg", msg);
		req.setAttribute("detailFundingId", fundingId);
		resp.sendRedirect(req.getContextPath()+"/funding/Detail.do?detailFundingId="+fundingId);

//		RequestDispatcher dispatcher = req.getRequestDispatcher("/funding/detail.do");
//		dispatcher.forward(req, resp);
	}

}
