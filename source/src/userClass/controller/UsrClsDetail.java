package userClass.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.MemberVO;
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

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		IUsrClsService clsService = UsrClsService.getInstance();
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("loginUser");
		
		ReplyVO replyVO = new ReplyVO();
		replyVO.setReplyContent(request.getParameter("replyContent"));
		replyVO.setMemId(memberVO.getMemId()); //replyVO.setMemId(session.get); //세션 있다 치고
		replyVO.setClassId(request.getParameter("classId"));
		if(request.getParameter("parentId") != null) {
			replyVO.setParentReplyId(request.getParameter("parentId"));
		}
		replyVO.setDepth(Integer.parseInt(request.getParameter("depth")));
		
		int cnt = clsService.insertReply(replyVO);
		
		String msg = "";
		if(cnt>0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
//		request.getSession().setAttribute("msg", msg);
		
		response.sendRedirect(request.getContextPath()+ "/UsrClsDetail.do?classId="+replyVO.getClassId());	
	}
}
