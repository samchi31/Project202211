package volunteer.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.FileService;
import common.IFileService;
import common.VolCategory;
import common.VolStatus;
import volunteer.service.IVolService;
import volunteer.service.VolService;
import volunteer.vo.ReviewVO;
import volunteer.vo.VolunteerVO;

@WebServlet("/volRegisterRewview.do")
public class VolRegisterReviewController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		ReviewVO reviewVo = new ReviewVO();
	
		// 파라미터 값 가져오기
		String reservId = request.getParameter("reservId");
		String volId = request.getParameter("volId");
		int star = Integer.parseInt(request.getParameter("star"));
		String content = request.getParameter("content");
		
		// 서비스 객체 생성하기
		IVolService service = VolService.getInstance();
		
		reviewVo.setReservId(reservId);
		reviewVo.setStar(star);
		reviewVo.setContent(content);
		
		int cnt = service.registerReview(reviewVo);
		
		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/volDetail.do?volId=" + volId);
		
		
	}

}
