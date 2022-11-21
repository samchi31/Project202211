package qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import notice.service.AtchFileServiceImpl;
import notice.service.IAtchFileService;
import notice.service.INoticeService;
import notice.service.NoticeServiceImpl;
import notice.vo.AtchFileVO;
import notice.vo.NoticeVO;
import qna.service.IQnaService;
import qna.service.QnaServiceImpl;
import qna.vo.QnaVO;


@MultipartConfig 
@WebServlet("/InsertMemberQnaController.do")


public class InsertMemberQnaController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/qnaMember/memberInsertForm.jsp").forward(req, resp);
		
	}
	
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		// 파라미터값 가져오기
		String inquiryId = req.getParameter("inquiryId");
		String memId = req.getParameter("memId");
		String inquiryTitle = req.getParameter("inquiryTitle");
		String inquiryContent = req.getParameter("inquiryContent");
		String inquiryDate = req.getParameter("inquiryDate");
		String answerContent = req.getParameter("answerContent");
		String answerDate = req.getParameter("answerDate");
		
		// 서비스 객체 생성하기
		IQnaService qnaService = QnaServiceImpl.getInstance();
		
		QnaVO qv = new QnaVO();
		qv.setInquiryId(inquiryId);
		qv.setMemId(memId);
		qv.setInquiryTitle(inquiryTitle);
		qv.setInquiryContent(inquiryContent);
		qv.setInquiryDate(inquiryDate);
		qv.setAnswerContent(answerContent);
		qv.setAnswerDate(answerDate);
		
		int cnt = qnaService.registerMemberQna(qv);
		
		String msg="";
		if(cnt > 0) {
			msg = "성공";
			//성공
		} else {
			msg = "실패";
			//실패
		}
		
		
		req.getSession().setAttribute("msg", msg);
		
		
		
		//sendRedirect : 방향이 바뀜. insert를 했는데 최종적으로 url이 list.do으로 바뀜!
		resp.sendRedirect(req.getContextPath() + "/ListQnaController.do"); //방향이 바뀜. insert를 했는데 최종적으로 list.do url로 바뀜!
		
	}

}
