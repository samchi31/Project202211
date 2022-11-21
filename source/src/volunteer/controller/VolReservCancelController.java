package volunteer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import volunteer.service.IVolService;
import volunteer.service.VolService;
import volunteer.vo.ReservationVO;
import volunteer.vo.ReviewVO;
import volunteer.vo.VolunteerVO;

@WebServlet("/volReservCancel.do")
public class VolReservCancelController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String reservId = request.getParameter("reservId");
		
		IVolService service = VolService.getInstance();
		
		VolunteerVO vv = service.getDetailForReserv(reservId);
		ReservationVO rv = service.getReservDetail(reservId);
		List<ReviewVO> reviewList = service.getReviewList(vv.getVolId());

		
		request.setAttribute("vv", vv);
		request.setAttribute("rv", rv);
		request.setAttribute("reviewList", reviewList);

		
		request.getRequestDispatcher("/WEB-INF/volunteer/volReservCancel.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		String reservId = request.getParameter("reservId");
		
		IVolService service = VolService.getInstance();
		
		int cnt = service.cancelReserv(reservId);
		
		String msg = "";
		if (cnt > 0) {
			msg = "성공";
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath() + "/myVolReserv.do");
		} else {
			msg = "실패";
		}
	}

}
