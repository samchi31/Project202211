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
import volunteer.vo.VolunteerVO;

@WebServlet("/myVolReserv.do")
public class VolReservListController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memId = ((MemberVO)request.getSession().getAttribute("loginUser")).getMemId();
		
		IVolService service = VolService.getInstance();
		
		List<ReservationVO> reservList = service.getReservList(memId);
		request.setAttribute("reservList", reservList);
		
		request.getRequestDispatcher("/WEB-INF/mypage/myVolReservList.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	
	}

}
