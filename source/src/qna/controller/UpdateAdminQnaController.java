package qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.service.IQnaService;
import qna.service.QnaServiceImpl;
import qna.vo.QnaVO;


@MultipartConfig
@WebServlet("/UpdateAdminQnaController.do")
public class UpdateAdminQnaController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		
		// 파라미터값 조회
		String adminQnaId = req.getParameter("inquiryId");

		// 서비스객체 생성
		IQnaService adminQnaService = QnaServiceImpl.getInstance();
		
		QnaVO qv = adminQnaService.getAdminQnaId(adminQnaId);
		
		req.setAttribute("qv", qv);

		// JSP에게 포워딩 처리
		req.getRequestDispatcher("/WEB-INF/qna/detail.jsp").forward(req, resp);

	}

	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 파라미터값 가져오기
		String inquiryId = req.getParameter("inquiryId");
		String answerContent = req.getParameter("answerContent");
		
		
		IQnaService adminQnaService = QnaServiceImpl.getInstance();
		
		
		QnaVO qv = new QnaVO();
		qv.setInquiryId(inquiryId);
		qv.setAnswerContent(answerContent);
		
		
		int cnt = adminQnaService.updateAnswer(qv); //db에 보내기!
		
		resp.sendRedirect(req.getContextPath() + "/ListQnaController.do"); //방향이 바뀜. insert를 했는데 최종적으로 list.do url로 바뀜!
				
		
	}

}
