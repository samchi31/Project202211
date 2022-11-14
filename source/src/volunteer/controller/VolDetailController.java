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
import volunteer.vo.ReviewVO;
import volunteer.vo.VolunteerVO;

@WebServlet("/volDetail.do")
public class VolDetailController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 파라미터 값 조회(DB에 volId를 어떤 값으로 
		String volId = request.getParameter("volId");
		
		// 서비스 객체 생성
		IVolService service = VolService.getInstance();
		
		// 봉사 프로그램 세부 내용 가져오기
		VolunteerVO vv = service.getDetail(volId);
		
		// 해당 리뷰 목록 가져오기
		List<ReviewVO> reviewList = service.getReviewList(volId);
		
		// 보낼 준비 하기
		request.setAttribute("vv", vv);
		request.setAttribute("reviewList", reviewList);
		
		// jsp파일에 보내기
		request.getRequestDispatcher("/volDetail.jsp").forward(request, response);
		
	}	
		
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
