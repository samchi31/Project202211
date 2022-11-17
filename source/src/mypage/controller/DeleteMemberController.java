package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;
import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;

@WebServlet("/mypage/memDelete.do")
public class DeleteMemberController extends HttpServlet{

	 @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memId = req.getParameter("memId");
		 
		IMypageService mypgService = MypageServiceImpl.getInstance();
		
		MemberVO mv = new MemberVO();
		mv.setMemId(memId);
		
		int cnt = mypgService.deleteMember(mv);
		 
		String msg = "";
		if (cnt > 0) {
			msg = "ok";
		}else {
			msg = "no";
		}
		
		req.setAttribute("rst", msg);
		req.getRequestDispatcher("/member/idCheck.jsp").forward(req, resp);
	 }
	 
	 @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 doGet(req, resp);
	 }
}
