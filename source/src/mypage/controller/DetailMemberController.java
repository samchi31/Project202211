package mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.InsVO;
import member.vo.MemberVO;
import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;

@WebServlet("/mypage/memDetail.do")
public class DetailMemberController extends HttpServlet{

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
	  MemberVO memVo = (MemberVO)req.getSession().getAttribute("loginUser");
	   
      String memId = memVo.getMemId();
      
      //서비스 객체 생성
      IMypageService mypgService = MypageServiceImpl.getInstance();
      
      MemberVO mv = mypgService.getMember(memId);
      InsVO iv = mypgService.getIns(memId);
      
      // 기업회원
      if(iv!= null) { // 첨부파일이 존재하면
         
         // 첨부파일 목록 조회
         IMemberService fileService = MemberServiceImpl.getInstance();
         
         InsVO insVO = new InsVO();
         insVO.setMemId(iv.getMemId());
         
         req.setAttribute("iv", iv);
      }
      
      req.setAttribute("mv", mv);
      
      // JSP에게 포워딩 처리
      req.getRequestDispatcher("/WEB-INF/mypage/mem_detail.jsp").forward(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doGet(req, resp);
   }
}