package volunteer.controller;

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
import volunteer.vo.ReviewVO;
import volunteer.vo.VolunteerVO;

@WebServlet("/volDetail.do")
public class VolDetailController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String memId = ((MemberVO)request.getSession().getAttribute("loginUser")).getMemId();
		String volId = request.getParameter("volId");
		
		Map reviewMap = new HashMap();
		reviewMap.put("memId", memId);
		reviewMap.put("volId", volId);
		
		IVolService service = VolService.getInstance();
		
		VolunteerVO vv = service.getDetail(volId);
		
		List<ReviewVO> reviewList = service.getReviewList(volId);
		
		// 수정하기
		int existNum = service.getReview(reviewMap);
		boolean exist;
		if(existNum == 0) {
			exist = false;
		} else {
			exist = true;
		}
		
		
		request.setAttribute("memId", memId);
		request.setAttribute("vv", vv);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("exist", exist);
		
		request.getRequestDispatcher("/WEB-INF/volunteer/volDetail.jsp").forward(request, response);
		
	}	
		
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
