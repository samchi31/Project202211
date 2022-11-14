package notice.controller;

import java.io.IOException;
import java.util.List;

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


@MultipartConfig
@WebServlet("/UpdateNoticeController.do")
public class UpdateNoticeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		
		// 파라미터값 조회
		String noticeId = req.getParameter("noticeId");

		// 서비스객체 생성
		INoticeService noticeService = NoticeServiceImpl.getInstance();

		NoticeVO nv = noticeService.getNoticeId(noticeId);
		
		
		
		//첨부파일!! 
		if(nv.getAtchId() != null ) { //첨부파일이 존재하면...
			
			// 첨부파일 목록 조회
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			
			notice.vo.AtchFileVO atchFileVO = new AtchFileVO();
			atchFileVO.setAtchFileId(nv.getAtchId());
			
			List<AtchFileVO> atchFileList = fileService.getAtchFileList(atchFileVO);
			
			
			req.setAttribute("atchFileList", atchFileList); //저장~~
			
		}
		
		
		

		req.setAttribute("nv", nv);

		// JSP에게 포워딩 처리
		req.getRequestDispatcher("/WEB-INF/adminNotice/updateForm.jsp").forward(req, resp);

	}

	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 파라미터값 가져오기
		String noticeId = req.getParameter("noticeId");
		String memId = req.getParameter("memId");
		String noticeDate = req.getParameter("noticeDate");
		String noticeTitle = req.getParameter("noticeTitle");
		String noticeContent = req.getParameter("noticeContent");
		String atchFileId = req.getParameter("atchFileId");
		
		
		
		// 서비스 객체 생성하기
//		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
				
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		AtchFileVO atchFileVO = new AtchFileVO();
		
		
//		//첨부파일 목록 저장하기 (공통기능)
//		atchFileVO = fileService.saveAtchFileList(req);		
		
		NoticeVO nv = new NoticeVO();
		nv.setMemId(memId);
		nv.setNoticeId(noticeId);
		nv.setNoticeDate(noticeDate);
		nv.setNoticeTitle(noticeTitle);
		nv.setNoticeContent(noticeContent);
		
		
		if(atchFileVO == null) { //첨부파일 없을 경우
			nv.setAtchId(atchFileId);
		} else {
			nv.setAtchId(atchFileVO.getAtchFileId()); //새로운 atchfile에 세팅하겠다.
		}
		
		
		int cnt = noticeService.modifyNotice(nv); //db에 보내기!
		
		resp.sendRedirect(req.getContextPath() + "/ListNoticeController.do"); //방향이 바뀜. insert를 했는데 최종적으로 list.do url로 바뀜!
				
		
	}

}
