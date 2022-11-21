package volunteer.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.MemberVO;
import volunteer.service.IVolService;
import volunteer.service.VolService;

@WebServlet("/volDelete.do")
public class VolDeleteController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String memId = ((MemberVO)request.getSession().getAttribute("loginUser")).getMemId();
		String volId = request.getParameter("volId");
		
		IVolService service = VolService.getInstance();
		
		int cnt = service.deleteVol(volId);

		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}

		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/volList.do");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
