package volunteer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.FileService;
import common.IFileService;
import common.VolCategory;
import common.VolStatus;
import volunteer.service.IVolService;
import volunteer.service.VolService;
import volunteer.vo.ReservationVO;
import volunteer.vo.VolunteerVO;

@MultipartConfig
@WebServlet("/volRegister.do")
public class VolRegisterController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/volunteer/volRegister.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		VolunteerVO vv = new VolunteerVO();
		
	
		// 파라미터 값 가져오기
//		String volId = request.getParameter("volId"); // 시퀀스 사용하여 자동으로 들어감
		String volTitle = request.getParameter("volTitle");
		String memId = request.getParameter("memId"); // 바꿔줘야 함
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		int personnel = Integer.parseInt(request.getParameter("personnel"));
		int total = Integer.parseInt(request.getParameter("total"));
		String volCtId = request.getParameter("category");
		String location = request.getParameter("location");
		String status = request.getParameter("status");
		String target = request.getParameter("target");
		String qualification = request.getParameter("qualification");
		String detail = request.getParameter("detail");
//		String thumbnail = request.getParameter("thumbnail");
		
		// 서비스 객체 생성하기
		IVolService service = VolService.getInstance();
		IFileService fileService = new FileService();
		
		fileService.saveImage(request, vv.getThumbnail());

//		vv.setVolId(volId); //시퀀스 사용하여 자동으로 들어감
		vv.setVolTitle(volTitle);
		vv.setMemId("a001"); // 세션에서 아이디값 받아와서 바꿔주기 
		vv.setStartDate(startDate);
		vv.setEndDate(endDate);
		vv.setStartTime(startTime);
		vv.setEndTime(endTime);
		vv.setPersonnel(personnel);
		vv.setTotal(total);
		vv.setVolCtId(VolCategory.getVolCategoryEnum(volCtId));
		vv.setLocation(location);
		vv.setStatus(VolStatus.getVolStatusEnum(status));
		vv.setTarget(target);
		vv.setQualification(qualification);
		vv.setDetail(detail);
		vv.setThumbnail(fileService.getSavePath());
		
		int cnt = service.registerVol(vv);
		
		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/volList.do?memId="+memId);
		
	}
	
}
