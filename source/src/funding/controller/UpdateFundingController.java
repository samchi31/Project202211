package funding.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import funding.service.FundingServiceImpl;
import funding.service.IFundingService;
import funding.vo.FundingVO;

@WebServlet("/funding/Update.do")
public class UpdateFundingController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		// 기관명 조회
		String fundingId = req.getParameter("fundingId");
		String memId = req.getParameter("memId");
		
		String fundingTitle = req.getParameter("fundingTitle");
		String fundingStartDate = req.getParameter("fundingStartDate");
		String fundingEndDate = req.getParameter("fundingEndDate");
		String fundingAccount = req.getParameter("fundingAccount");
		String fundingAccountHolder = req.getParameter("fundingAccountHolder");
		String fundingBankName = req.getParameter("fundingBankName");
		String fundingDetail = req.getParameter("fundingDetail");
		
		int targetAmount = 0;
		if( req.getParameter("targetAmount") != null && req.getParameter("targetAmount") != ""  ) {
			targetAmount = Integer.parseInt(req.getParameter("targetAmount").trim());
		}
		
		IFundingService fundingService = FundingServiceImpl.getInstance();
		
		FundingVO fv = new FundingVO();
		fv.setFundingId(fundingId);
		fv.setMemId(memId);
		fv.setFundingTitle(fundingTitle);
		fv.setTargetAmount(targetAmount);
		fv.setFundingStartDate(fundingStartDate);
		fv.setFundingEndDate(fundingEndDate);
		fv.setFundingAccount(fundingAccount);
		fv.setFundingAccountHolder(fundingAccountHolder);
		fv.setFundingBankName(fundingBankName);
		fv.setFundingDetail(fundingDetail);
		
		System.out.println("fv = " + fv.toString() );
		int cnt = fundingService.modifyFunding(fv);
		
		String msg = "";
		
		if(cnt>0) {
			msg="성공";
		} else {
			msg="실패";
		}
		
		req.getSession().setAttribute("msg", msg);
		resp.sendRedirect(req.getContextPath()+"/funding/Detail.do?detailFundingId="+fundingId);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}


