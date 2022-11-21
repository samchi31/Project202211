package funding.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.FileService;
import common.IFileService;
import funding.service.FundingServiceImpl;
import funding.service.IFundingService;
import funding.vo.FundingVO;
import member.vo.MemberVO;

@MultipartConfig
@WebServlet("/funding/Detail.do")
public class DetailFundingController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IFundingService fundingService = FundingServiceImpl.getInstance();

		MemberVO mv = (MemberVO) req.getSession().getAttribute("loginUser");
		String memId = mv.getMemId(); // 로그인 사용자
		String memGb = (String) req.getSession().getAttribute("memGb"); // memGb 세션 불러오기

		if (memGb == null || "".equals(memGb)) { // 세션 내용이 없는 경우
			// 회원구분 일반/관리자/기관 **I* 세션으로 처리 (일반 회원 1, 기관 2, 관리자 99 )
			memGb = fundingService.getMemberGb(memId);
			req.getSession().setAttribute("memGb", memGb);
		}

		String fundingId = req.getParameter("detailFundingId");

		String fundingThumbnail = req.getParameter("fundingThumbnail");
		FundingVO vo = new FundingVO();

		// 세션 정보
		vo.setMemId(memId);
		vo.setMemGb(memGb);
		vo.setFundingId(fundingId);
		FundingVO detailfv = fundingService.getFundingDetail(vo);

		// 기관명 조회
		req.setAttribute("detail", detailfv);
		req.setAttribute("param", vo); // 조회용 내역

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/funding/fundingDetail.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
