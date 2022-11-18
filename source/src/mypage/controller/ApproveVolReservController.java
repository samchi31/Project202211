package mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.MemberVO;
import volunteer.service.IVolService;
import volunteer.service.VolService;
import volunteer.vo.ReservationVO;

@WebServlet("/approve.do")
public class ApproveVolReservController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memId = ((MemberVO)request.getSession().getAttribute("loginUser")).getMemId();
		
		IVolService service = VolService.getInstance();
		List<ReservationVO> approveList = service.getApproveList(memId);
		request.setAttribute("approveList", approveList);
		
		request.getRequestDispatcher("/WEB-INF/mypage/myVolReservApprove.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
