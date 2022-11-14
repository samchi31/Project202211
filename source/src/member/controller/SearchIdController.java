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

@WebServlet("/member/searchId.do")
public class SearchIdController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 파라미터 값 조회
		String memName = req.getParameter("memName");
		String memTel = req.getParameter("memTel");
		
		//서비스 객체 생성
		IMemberService memberService = MemberServiceImpl.getInstance();
		
		MemberVO memVo = new MemberVO();
		memVo.setMemName(memName);
		memVo.setMemTel(memTel);
		
		MemberVO mv = memberService.searchId(memVo);
		
		if(mv != null) { 
			req.getSession().setAttribute("rst", "ok");	
			req.getSession().setAttribute("user", mv.getMemId());
		}else {
			req.getSession().setAttribute("rst", "no");	
		}
		req.getRequestDispatcher("/member/search_id.jsp").forward(req, resp);
	}	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	

}
