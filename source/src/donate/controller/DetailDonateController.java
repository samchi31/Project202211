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

@WebServlet("/donate/Detail.do")
public class DetailDonateController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("D_detail");
		
		IDonateService donateService = DonateServiceImpl.getInstance();
		
		String memId ="b001";		// 사용자ID  세션 처리
		String memGb = "2";			// 사용자 구분  세선 처리
		String fundingId = req.getParameter("cancelFundingId");
		String donateId = req.getParameter("donateId");
		String donateAmount = req.getParameter("detatilDonateAmount");
		String refund = req.getParameter("detailRefund");
		String donateDate = req.getParameter("detailDonateDate");
		
		System.out.println("memId : " + memId);
		System.out.println("fundingId : " + fundingId);
		System.out.println("donateId : " + donateId);

		DonateVO dv = new DonateVO();
		
		// 세션정보
		dv.setMemId(memId);
		dv.setMemGb(memGb);
		dv.setFundingId(fundingId);
		DonateVO detaildv = donateService.getDonateDetail(dv);
		
		req.setAttribute("detail도네이트", detaildv);
		req.setAttribute("param", dv);		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/donate/donateList.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}

