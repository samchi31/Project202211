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
import volunteer.vo.VolunteerVO;
import volunteer.vo.WishVO;

@WebServlet("/volList.do")
public class VolListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memId = request.getParameter("memId"); // session
		
		IVolService service = VolService.getInstance();
		List<VolunteerVO> volList = service.getList();
		List<WishVO> wishList = service.getWishList();
		
		request.setAttribute("volList", volList);
		request.setAttribute("wishList", wishList);
		request.setAttribute("memId", memId); // session
		
		request.getRequestDispatcher("/WEB-INF/volunteer/volList.jsp").forward(request, response); // session???
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
