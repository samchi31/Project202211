package mypage.controller;

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
import member.vo.MemberVO;
import volunteer.service.IVolService;
import volunteer.service.VolService;
import volunteer.vo.ReservationVO;

@WebServlet("/myDonate.do")
public class DonateMemberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		MemberVO memVo = (MemberVO)request.getSession().getAttribute("loginUser");
		String memId = memVo.getMemId(); // session
		
		IFundingService fundingService = FundingServiceImpl.getInstance();
		 
		String memGb = "99"; // 회원구분  일반/관리자/기관  **I* 세션으로 처리  (일반 회원 1, 기관 2, 관리자 99 )
		
		// 조회 조건 
		int pageNo = 1;
		if( request.getParameter("pageNo") != null && request.getParameter("pageNo") != ""  ) {
			pageNo = Integer.parseInt(request.getParameter("pageNo").trim());
		}
		
		FundingVO vo = new FundingVO();
		// vo.setFundingDetail(pageNo);
		// 세션 정보
		vo.setPageNo(pageNo);
		vo.setMemId(memId);
		vo.setMemGb(memGb);
		
		System.out.println();
		
		List<FundingVO> list = fundingService.getFundingList(vo);
		request.setAttribute("list", list);
		/* for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getFundingThumbnail());
		}*/
		
		request.setAttribute("param", vo);	// 조회용 내역
		request.getRequestDispatcher("/WEB-INF/mypage/myDonateList.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
