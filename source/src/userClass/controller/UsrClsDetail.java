package userClass.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import userClass.service.IUsrClsService;
import userClass.service.UsrClsService;
import userClass.vo.ReplyVO;
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
		List<ReplyVO> replyVOList = clsService.selectReplyAll(request.getParameter("classId"));
		
		request.setAttribute("usrClsVO", usrClsVO);
		request.setAttribute("replyList", replyVOList);


		request.getRequestDispatcher("/userClass/usrClsDetail.jsp").forward(request, response);
		
	}

	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//	}
}
