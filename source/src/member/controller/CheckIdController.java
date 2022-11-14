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

@WebServlet("/member/loginchk.do")
public class CheckIdController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 파라미터 값 조회
		String memId = req.getParameter("memId");
		
		//서비스 객체 생성
		IMemberService memberService = MemberServiceImpl.getInstance();
		
		MemberVO memVo = new MemberVO();
		memVo.setMemId(memId);
		
		MemberVO mv = memberService.checkId(memVo);
		
		if(mv == null) { 
			req.setAttribute("rst", "ok");	
		}else {
			req.setAttribute("rst", "no");	
		}
		
		req.getRequestDispatcher("/member/idCheck.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
