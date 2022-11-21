package mypage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import donate.service.DonateServiceImpl;
import donate.service.IDonateService;
import donate.vo.DonateVO;
import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.InsVO;
import member.vo.MemberVO;
import mypage.service.IMypageService;
import mypage.service.MypageServiceImpl;
import notice.service.INoticeService;
import notice.service.NoticeServiceImpl;
import notice.vo.NoticeVO;
import qna.service.IQnaService;
import qna.service.QnaServiceImpl;
import qna.vo.QnaVO;
import volunteer.service.IVolService;
import volunteer.service.VolService;
import volunteer.vo.ReservationVO;
import volunteer.vo.VolunteerVO;

@WebServlet("/mypageMain.do")
public class MainMemberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemberVO memVo = (MemberVO)request.getSession().getAttribute("loginUser");
		String memId = memVo.getMemId();
		
		//서비스 객체 생성
		IMypageService mypgService = MypageServiceImpl.getInstance();
		IVolService service = VolService.getInstance();
		IDonateService donateService = DonateServiceImpl.getInstance();
		
		// 기간 지난 것 - 모집 상태 : 모집 중 -> 모집 완료 / 예약 상태 : CONFIRMED, EXPIRED 빼고 나머지는 CANCELED로! 
		int isUpdate = service.updateVolList("FINISHED");
		
		MemberVO mv = mypgService.getMember(memId);
		InsVO iv = mypgService.getIns(memId);
		List<ReservationVO> reservList = service.getReservList(memId);
		DonateVO dv = new DonateVO();
		dv.setMemId(memId);
		dv.setPageNo(1);		// donate 페이징 처리 되어서 페이지 넘버 필수
		List<DonateVO> DonateList = donateService.getDonateList(dv);
		
		// 기업회원
		if(iv!= null) { // 첨부파일이 존재하면
			
			// 첨부파일 목록 조회
			IMemberService fileService = MemberServiceImpl.getInstance();
			
			InsVO insVO = new InsVO();
			insVO.setMemId(iv.getMemId());
			
			request.setAttribute("iv", iv);
		}

		
		request.setAttribute("DonateList", DonateList);
		request.setAttribute("reservList", reservList);
		request.setAttribute("mv", mv);
		
		// JSP에게 포워딩 처리
		request.getRequestDispatcher("/WEB-INF/mypage/mypage_main.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
