package donate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import donate.vo.DonateVO;
import donate.service.DonateServiceImpl;
import donate.service.IDonateService;

@WebServlet("/donate/Cancel.do")
public class CancelDonateController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/*
		 * 펀딩 글 기준으로  후원 내역 전체  취소 
		 * 펀딩 목록 > 후원취소 버튼 (일반사용자) 
		 **/
		
		System.out.println(" cancel ");
		// 파라미터값 가져오기
		String fundingId = req.getParameter("cancelFundingId");  // 취소 할 해당 펀딩글Id
		String memId ="b001";		// 사용자ID  세션 처리
		String memGb = "2";			// 사용자 구분  세선 처리
		
		IDonateService donateService = DonateServiceImpl.getInstance();
		
		DonateVO dv = new DonateVO();
		dv.setFundingId(fundingId);
		dv.setMemId(memId);
		
		int cnt = donateService.cancelDonate(dv);
		
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
