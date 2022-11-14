package userClass.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.RequestWrapper;

import userClass.service.IUsrClsService;
import userClass.service.UsrClsService;
import userClass.vo.UsrClsVO;


/**
 * 특정 글 상세 페이지
 */
@WebServlet("/UsrClsDetail.do")
public class UsrClsDetail extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		IUsrClsService clsService = UsrClsService.getInstance();
		
//		request.getParameter("classId")
		UsrClsVO usrClsVO = clsService.getOneClassDetail(request.getParameter("classId"));
		
		request.setAttribute("usrClsVO", usrClsVO);


		request.getRequestDispatcher("/userClass/usrClsDetail.jsp").forward(request, response);
		
	}

	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//	}
}
