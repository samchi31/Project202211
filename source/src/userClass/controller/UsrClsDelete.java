package userClass.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import userClass.service.IUsrClsService;
import userClass.service.UsrClsService;

@WebServlet("/UsrClsDelete.do")
public class UsrClsDelete extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IUsrClsService clsService = UsrClsService.getInstance();
		
		clsService.updatePostRemove((String)request.getParameter("classId"));
		
		
		// foward는 request를 jsp 페이지에 처리해줘야 할 때 사용 + 경로에 .jsp 가 온다
		// redirect는 현재페이지에서 일이 끝낫을때? + 경로에 서블릿이 온다 아닐때도 있음
//		request.getRequestDispatcher("/UsrClsListController.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath()+"/UsrClsList.do");
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}

}
