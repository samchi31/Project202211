package volunteer.controller;

import java.io.IOException;

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
import member.vo.MemberVO;
import volunteer.service.IVolService;
import volunteer.service.VolService;
import volunteer.vo.ReservationVO;
import volunteer.vo.VolunteerVO;

@MultipartConfig
@WebServlet("/volUpdate.do")
public class VolUpdateController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String volId = request.getParameter("volId");
		
		IVolService service = VolService.getInstance();
		
		VolunteerVO vv = service.getDetail(volId);
		
		
		request.setAttribute("vv", vv);
		
		request.getRequestDispatcher("/WEB-INF/volunteer/volUpdate.jsp").forward(request, response);
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		VolunteerVO vv = new VolunteerVO();
		
	
		// 파라미터 값 가져오기
		String volId = request.getParameter("volId");
		String volTitle = request.getParameter("volTitle");
		String memId = ((MemberVO)request.getSession().getAttribute("loginUser")).getMemId();
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
		String thumbnail = request.getParameter("thumbnail");
		
		// 서비스 객체 생성하기
		IVolService service = VolService.getInstance();
		IFileService fileService = new FileService();
		
		fileService.saveImage(request, vv.getThumbnail());

		vv.setVolId(volId); //시퀀스 사용하여 자동으로 들어감
		vv.setVolTitle(volTitle);
		vv.setMemId(memId); 
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
		
		int cnt = service.updateVol(vv);
		
		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/volDetail.do?volId=" + volId);
	}

}
