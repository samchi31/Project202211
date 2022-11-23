package volunteer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import volunteer.service.IVolService;
import volunteer.service.VolService;
import volunteer.vo.ReservationVO;
import volunteer.vo.VolunteerVO;

@MultipartConfig
@WebServlet("/volReservUpdate.do")
public class VolReservUpdateController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String reservId = request.getParameter("reservId");
		
		IVolService service = VolService.getInstance();
		
		VolunteerVO vv = service.getDetailForReserv(reservId);
		ReservationVO rv = service.getReservDetail(reservId);
		
		request.setAttribute("vv", vv);
		request.setAttribute("rv", rv);
		
		request.getRequestDispatcher("/WEB-INF/volunteer/volReservUpdate.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ReservationVO rv = new ReservationVO();
		
		String reservId = request.getParameter("reservId"); // 시퀀스로(쿼리에서)
		String reservDate = request.getParameter("reservDate");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String reservTime = startTime + " ~ " + endTime;
		
		IVolService service = VolService.getInstance();
		
		rv.setReservId(reservId);
		rv.setReservDate(reservDate);
		rv.setReservTime(reservTime);
		
		int cnt = service.updateReserv(rv);
		
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
