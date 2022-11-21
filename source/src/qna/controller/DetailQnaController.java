package qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.MemberVO;
import notice.service.INoticeService;
import notice.service.NoticeServiceImpl;
import notice.vo.NoticeVO;
import qna.service.IQnaService;
import qna.service.QnaServiceImpl;
import qna.vo.QnaVO;


@WebServlet("/DetailQnaController.do")

public class DetailQnaController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		//파라미터값 조회
		String inquiryId = req.getParameter("inquiryId");
		
		//서비스객체 생성
		IQnaService adminQnaService = QnaServiceImpl.getInstance();
		
		QnaVO qv = adminQnaService.getAdminQna(inquiryId);
		
		
		req.setAttribute("qv", qv);
		
		
		
		
		// 추가함
		MemberVO memVo = (MemberVO)req.getSession().getAttribute("loginUser");
		
		String viewPage = "/WEB-INF/qnaMember/memberDetail.jsp";  //회원
		if(memVo != null && memVo.getAdmin().equals("Y")) {
			viewPage = "/WEB-INF/qna/detail.jsp";  // 관리자
		}
		
		//회원목록 화면 처리하기
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
		
		dispatcher.forward(req, resp); //jsp에게 전달
		// 추가함		
		
		
		
		//JSP에게 포워딩 처리
//		req.getRequestDispatcher("/WEB-INF/qna/detail.jsp").forward(req, resp);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
