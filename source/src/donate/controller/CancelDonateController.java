package donate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import donate.vo.DonateVO;
import funding.service.FundingServiceImpl;
import funding.service.IFundingService;
import member.vo.MemberVO;
import donate.service.DonateServiceImpl;
import donate.service.IDonateService;

@WebServlet("/donate/Cancel.do")
public class CancelDonateController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		/*
		 * 펀딩 글 기준으로 후원 내역 전체 취소 펀딩 목록 > 후원취소 버튼 (일반사용자)
		 **/

		System.out.println(" cancel ");

		MemberVO mv = (MemberVO) req.getSession().getAttribute("loginUser");

		IDonateService donateService = DonateServiceImpl.getInstance();
		IFundingService fundingService = FundingServiceImpl.getInstance();
		
		// 파라미터값 가져오기
		String fundingId = req.getParameter("cancelFundingId"); // 취소 할 해당 펀딩글Id
		String memId = mv.getMemId(); // 로그인 사용자
		String memGb = (String) req.getSession().getAttribute("memGb"); // memGb 세션 불러오기
		if (memGb == null || "".equals(memGb)) { // 세션 내용이 없는 경우
			// 회원구분 일반/관리자/기관 **I* 세션으로 처리 (일반 회원 1, 기관 2, 관리자 99 )
			memGb = fundingService.getMemberGb(memId);
			req.getSession().setAttribute("memGb", memGb);
		}

		DonateVO dv = new DonateVO();
		dv.setFundingId(fundingId);
		dv.setMemId(memId);

		int cnt = donateService.cancelDonate(dv);
		fundingService.modifyRecentAmount(fundingId);

		String msg = "";

		if (cnt > 0) {
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
