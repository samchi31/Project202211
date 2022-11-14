package member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;

@WebServlet("/member/searchPw.do")
public class SearchPwController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 파라미터 값 조회
		String memId = req.getParameter("memId");
		String mail = req.getParameter("mail");
		
		//서비스 객체 생성
		IMemberService memberService = MemberServiceImpl.getInstance();
		
		MemberVO memVo = new MemberVO();
		memVo.setMemId(memId);
		memVo.setMail(mail);
		
		MemberVO mv = memberService.searchId(memVo);
		
		if(mv != null) { 
			req.getSession().setAttribute("rst", "ok");	
			req.getSession().setAttribute("user", mv.getMail());
		}else {
			req.getSession().setAttribute("rst", "no");	
		}
		
		
		resp.sendRedirect("/member/mail.do");
//		req.getRequestDispatcher("/member/search_pw.jsp").forward(req, resp);
	}	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	

}
