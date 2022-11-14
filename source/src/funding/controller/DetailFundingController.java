package funding.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import funding.service.FundingServiceImpl;
import funding.service.IFundingService;
import funding.vo.FundingVO;

@WebServlet("/funding/Detail.do")
public class DetailFundingController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("detail");
		IFundingService fundingService = FundingServiceImpl.getInstance();
		
		String memId = "b001"; // 로그인 사용자   *** 세션으로 처리 
		String memGb = "1"; // 회원구분  일반/관리자/기관  **I* 세션으로 처리  (일반 회원 1, 기관 2, 관리자 99 )
		String fundingId = req.getParameter("detailFundingId");
		FundingVO vo = new FundingVO();
		// 세션 정보
		vo.setMemId(memId);
		vo.setMemGb(memGb);
		vo.setFundingId(fundingId);
		FundingVO detailfv = fundingService.getFundingDetail(vo);
		
		
		System.out.println("memId:" + memId);
		System.out.println("memGb:" + memGb);
		System.out.println("fundingId:" + fundingId);
		// 기관명 조회 
		
		req.setAttribute("detail", detailfv);
		req.setAttribute("param", vo);	// 조회용 내역
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/funding/fundingDetail.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
