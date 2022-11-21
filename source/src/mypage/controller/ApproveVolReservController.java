package mypage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

		String reservId = request.getParameter("reservId");
		String rStId = request.getParameter("rStId");
		
		Map rMap = new HashMap();
		
		rMap.put("reservId", reservId);
		rMap.put("rStId", rStId);
		
		IVolService service = VolService.getInstance();
		
		// 예약 상태를 SUBMITTED에서 CONFIRMED로 바꾸기 
		int cnt = service.changeApproveReserv(rMap);

		int cnt2 = service.updateTotal(reservId);
		
		String msg = "";
		if (cnt > 0) {
			if(cnt2 > 0) {
				msg = "성공";
			} else {
				msg = "확정 성공, 현재인원 최신화 실패";
			}
		} else {
			msg = "실패";
		}
		
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/approve.do");
	
	}

}
