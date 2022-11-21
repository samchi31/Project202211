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
import member.vo.InsVO;
import member.vo.MemberVO;
import mypage.dao.MypageDaoImpl;
import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;

@WebServlet("/funding/InsertView.do")
public class InsertViewFundingController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		IMypageService mypageService = MypageServiceImpl.getInstance();
		IFundingService fundingService = FundingServiceImpl.getInstance();
		
		MemberVO mv = (MemberVO) req.getSession().getAttribute("loginUser");
		String memId =   mv.getMemId(); // 로그인 사용자 
		
		InsVO iv = mypageService.getIns(memId);

		req.setAttribute("insName", iv.getInstName());
		req.getRequestDispatcher("/WEB-INF/funding/fundingInsert.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
