package volunteer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.MemberVO;
import sun.print.resources.serviceui_pt_BR;
import volunteer.service.IVolService;
import volunteer.service.VolService;
import volunteer.vo.VolunteerVO;
import volunteer.vo.WishVO;

@WebServlet("/volWish.do")
public class volWishController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memId = ((MemberVO)request.getSession().getAttribute("loginUser")).getMemId();
		
		IVolService service = VolService.getInstance();
		List<WishVO> wishList = service.getWishList();
		List<VolunteerVO> volList = service.getVolList();
		
		request.setAttribute("wishList", wishList);
		request.setAttribute("volList", volList);
		
		request.getRequestDispatcher("/WEB-INF/mypage/myWishVol.jsp").forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		

		String memId = ((MemberVO)request.getSession().getAttribute("loginUser")).getMemId();
		String volId = request.getParameter("volId");
		String isWished = request.getParameter("isWished");
		String page = request.getParameter("page");
		
		IVolService service = VolService.getInstance();
		
		WishVO wv = new WishVO();
		
		wv.setMemId(memId);
		wv.setVolId(volId);
		
		String yesOrNo = "";
		if(isWished.equals("n")) {
			service.wishVol(wv);
			yesOrNo = "y";
		} else if(isWished.equals("y")) {
			service.unWishVol(wv);
			yesOrNo ="n";
		} else {
			yesOrNo = "하트가 제대로 안 눌려요..";
		}
		
		request.setAttribute("yesOrNo", yesOrNo);
		
		if(page.equals("volList")) {
			request.getRequestDispatcher("/volList.do").forward(request, response);
		} else if(page.equals("mypage")) {
			request.getRequestDispatcher("/WEB-INF/mypage/mypage_main.jsp").forward(request, response);
		}
		
		
		
	}

}
