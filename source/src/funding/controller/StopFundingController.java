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

@WebServlet("/funding/Stop.do")
public class StopFundingController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println(" stop ");
		// 파라미터값 가져오기
		String fundingId = req.getParameter("stopFundingId");
		
		IFundingService fundingService = FundingServiceImpl.getInstance();
		
		FundingVO fv = new FundingVO();
		fv.setFundingId(fundingId);
		fv.setFundingStop("Y");
		
		int cnt = fundingService.stopFunding(fv);
		
		String msg = "";
		
		if(cnt>0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		
		req.getSession().setAttribute("msg", msg);
		resp.sendRedirect(req.getContextPath() + "/funding/List.do");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
