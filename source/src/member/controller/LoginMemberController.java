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

@WebServlet("/member/login.do")
public class LoginMemberController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 파라미터 값 조회
		String memId = req.getParameter("memId");
		String memPass = req.getParameter("memPass");
		
		//서비스 객체 생성
		IMemberService memberService = MemberServiceImpl.getInstance();
		
		MemberVO memVo = new MemberVO();
		memVo.setMemId(memId);
		memVo.setMemPass(memPass); 
		
		MemberVO mv = memberService.checkMember(memVo);
		
		if(mv != null) { // 존재하면
			if(mv.getMemStatus().equals("N")) {
			req.getSession().setAttribute("loginUser", mv);
			req.getSession().setAttribute("rst", "ok");	
			
			// JSP에게 포워딩 처리
			req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
			
			}else {
				req.getSession().setAttribute("rst", "no");	
				resp.sendRedirect("/member/LoginForm.jsp");
			}
		}else {
			req.getSession().setAttribute("rst", "no");	
			resp.sendRedirect("/member/LoginForm.jsp");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
