package volunteer.controller;

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
import volunteer.vo.ReviewVO;
import volunteer.vo.VolunteerVO;

@WebServlet("/volReservation.do")
public class VolReservationController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String volId = request.getParameter("volId");
		
		IVolService service = VolService.getInstance();
		
		VolunteerVO vv = service.getDetail(volId);
		
		List<ReviewVO> reviewList = service.getReviewList(volId);
		
		request.setAttribute("vv", vv);
		request.setAttribute("reviewList", reviewList);
		
		request.getRequestDispatcher("/WEB-INF/volunteer/volReservation.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ReservationVO rv = new ReservationVO();
		
		String volId = request.getParameter("volId");
		String memId = ((MemberVO)request.getSession().getAttribute("loginUser")).getMemId();
		String reservDate = request.getParameter("reservDate");
		String reservTime = request.getParameter("reservTime");
//		String rStId = request.getParameter("rStId");
		String rStId = "SUBMITTED";
		
		IVolService service = VolService.getInstance();
		
		rv.setVolId(volId);
		rv.setMemId(memId);
		rv.setReservDate(reservDate);
		rv.setReservTime(reservTime);
		rv.setrStId(rStId);
		
		int cnt = service.reservVol(rv);
		
		String msg = "";
		if (cnt > 0) {
			msg = "성공";
			
		List<ReservationVO> reservList = service.getReservList(memId);
		request.setAttribute("rv", rv);
		request.setAttribute("reservList", reservList);
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/myVolReserv.do");
			
			
		} else {
			msg = "실패";
		}
	}

}
