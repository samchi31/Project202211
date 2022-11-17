package volunteer.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import volunteer.service.IVolService;
import volunteer.service.VolService;
import volunteer.vo.WishVO;

@WebServlet("/volWish.do")
public class volWishController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
	
	}
      
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String memId = request.getParameter("memId"); // session
		String volId = request.getParameter("volId");
		String isWished = request.getParameter("isWished");
		
		IVolService service = VolService.getInstance();
		
		WishVO wv = new WishVO();
		
		wv.setMemId("b005"); // session
		wv.setVolId(volId);
		
		String msg = "";
		if(isWished.equals("n")) {
			service.wishVol(wv);
			msg = "y";
		} else if(isWished.equals("y")) {
			service.unWishVol(wv);
			msg ="n";
		} else {
			msg = "하트가 제대로 안 눌려요..";
		}
		
		request.setAttribute("memId", memId);  // session
		request.setAttribute("msg", msg);
		
		response.sendRedirect(request.getContextPath() + "/volList.do?memId=" + memId);  // session
		
	}

}
