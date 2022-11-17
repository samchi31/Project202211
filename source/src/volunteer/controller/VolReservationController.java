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
		
//		String reservId = request.getParameter("reservId"); // 시퀀스로(쿼리에서)
		String volId = request.getParameter("volId"); // 받아온 값으로(밑에)
//		String memId = request.getParameter("memId");
		String memId = "asdf";
		String reservDate = request.getParameter("reservDate");
		String reservTime = request.getParameter("reservTime");
//		String applyDate; // SYSDATE
//		String cancelDate = null; // Cancel 눌렀을 때(controller 하나 더 만들기)
//		String rStId = request.getParameter("rStId");
		String rStId = "SUBMITTED";
		
		IVolService service = VolService.getInstance();
		
		rv.setVolId(volId);
		rv.setMemId(memId); // 나중에 세션 받아서
		rv.setReservDate(reservDate);
		rv.setReservTime(reservTime);
		rv.setrStId(rStId);
		
		int cnt = service.reservVol(rv);
		
		String msg = "";
		if (cnt > 0) {
			msg = "성공";
			
//		// 방금 예약한 봉사 프로그램 뭔지 보여주기
//		VolunteerVO vv = service.getDetail(volId);
			
			// 리스트로 다 불러와서
			List<ReservationVO> reservList = service.getReservList(memId);
			
//		// 골라낸 객체를 담을 객체 선언
//		ReservationVO rr = new ReservationVO();
//		
//		// volId, reservDate, reservTime, rStId가 다 같은 것만 골라내기
//		for (ReservationVO temp : reservList) {
//			if (temp.getVolId().equals(volId) && temp.getReservDate().equals(reservDate) && temp.getReservTime().equals(reservTime) && temp.getrStId().equals(rStId)) {
//				rr = temp;
//			}
//		}
			
			// 요청으로 보내기
			request.setAttribute("rv", rv);
//		request.setAttribute("vv", vv);
//		request.setAttribute("rr", rr);
			request.setAttribute("reservList", reservList);
			request.getSession().setAttribute("msg", msg);
			response.sendRedirect(request.getContextPath() + "/volReservList.do?memId=" + rv.getMemId());//rv.getMemId() = memId = reqeust.getMemId("memId") "memId"는 세션에서 가져오기
			
			
		} else {
			msg = "실패";
		}
	}

}
