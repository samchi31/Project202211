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

		// �Ķ���� �� ��ȸ(DB�� volId�� � ������ 
		String volId = request.getParameter("volId");
		
		// ���� ��ü ����
		IVolService service = VolService.getInstance();
		
		// ���� ���α׷� ���� ���� ��������
		VolunteerVO vv = service.getDetail(volId);
		
		// �ش� ���� ��� ��������
		List<ReviewVO> reviewList = service.getReviewList(volId);
		
		// ���� �غ� �ϱ�
		request.setAttribute("vv", vv);
		request.setAttribute("reviewList", reviewList);
		
		// jsp���Ͽ� ������
		request.getRequestDispatcher("/volDetail.jsp").forward(request, response);
		
	}	
		
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
