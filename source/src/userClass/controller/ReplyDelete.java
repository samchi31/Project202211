package userClass.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import userClass.service.IUsrClsService;
import userClass.service.UsrClsService;

@WebServlet("/ReplyDelete.do")
public class ReplyDelete extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IUsrClsService clsService = UsrClsService.getInstance();
		
		clsService.updateReplyRemove(request.getParameter("deleteRpId"));
		
		response.sendRedirect(request.getContextPath()+ "/UsrClsDetail.do?classId="+request.getParameter("classId"));	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
