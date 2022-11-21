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
import member.vo.MemberVO;

@WebServlet("/funding/List.do")
public class ListFundingController extends HttpServlet {
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      IFundingService fundingService = FundingServiceImpl.getInstance();
       
      MemberVO mv = (MemberVO) req.getSession().getAttribute("loginUser");
      if( mv == null ){   // 세션 내용이 없는 경우
    	  resp.sendRedirect("/member/LoginForm.jsp");
      } else {
    	  String memId = mv.getMemId(); // 로그인 사용자
    	  String memGb = (String) req.getSession().getAttribute("memGb"); // memGb 세션 불러오기 
    	  
    	  if( memGb == null || "".equals(memGb) ){   // 세션 내용이 없는 경우
    		  // 회원구분  일반/관리자/기관  **I* 세션으로 처리  (일반 회원 1, 기관 2, 관리자 99 )
    		  memGb = fundingService.getMemberGb(memId);
    		  req.getSession().setAttribute("memGb", memGb);
    	  }
    	  
    	  // 조회 조건 
    	  int pageNo = 1;
    	  if( req.getParameter("pageNo") != null && req.getParameter("pageNo") != ""  ) {
    		  pageNo = Integer.parseInt(req.getParameter("pageNo").trim());
    	  }
    	  
    	  FundingVO vo = new FundingVO();
    	  // vo.setFundingDetail(pageNo);
    	  // 세션 정보
    	  vo.setPageNo(pageNo);
    	  vo.setMemId(memId);
    	  vo.setMemGb(memGb);
    	  
    	  List<FundingVO> list = fundingService.getFundingList(vo);
    	  req.setAttribute("list", list);
    	  req.setAttribute("isIns", "true");
    	  req.setAttribute("param", vo);   		// 페이징 내역
    	  RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/funding/fundingList.jsp");
    	  dispatcher.forward(req, resp);
      }
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doGet(req, resp);
   }

}