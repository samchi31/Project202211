package member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.InsVO;
import member.vo.MemberVO;

@MultipartConfig
@WebServlet("/member/Insert.do")
public class InsertMemberController extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		// 파라미터값 가져오기
		String gbn = req.getParameter("gbn");
		String memId = req.getParameter("memId");
		String memPass = req.getParameter("memPass");
		String memName= req.getParameter("memName");
		String memTel = req.getParameter("memTel");
		String memZip = req.getParameter("memZip");
		String memAddr1 = req.getParameter("memAddr1");
		String memAddr2 = req.getParameter("memAddr2");
		String mail = req.getParameter("mail");
		String joinDate = req.getParameter("joinDate");
		String regno1 = req.getParameter("regno1");
		String regno2 = req.getParameter("regno2");
		String memStatus = req.getParameter("memStatus");
		String admin = req.getParameter("admin");
		
		
		// 서비스 객체 생성하기
		IMemberService memService = MemberServiceImpl.getInstance();
		
		MemberVO mv = new MemberVO();
		mv.setMemZip(memZip);
		mv.setMemId(memId);
		mv.setMemPass(memPass);
		mv.setMemName(memName);
		mv.setMemTel(memTel);
		mv.setMemAddr1(memAddr1);
		mv.setMemAddr2(memAddr2);
		mv.setMail(mail);
		mv.setJoinDate(joinDate);
		mv.setRegno1(regno1);
		mv.setRegno2(regno2);
		mv.setMemStatus(memStatus);
		mv.setAdmin(admin);
		
		int cnt = memService.registMember(mv);
		
		if(gbn.equals("02")) {
			String insName = req.getParameter("insName");
			
			// 업로드 경로 설정하기
			String uploadPath = "D:\\A_TeachingMaterial\\03_HighJava\\workspace\\ON\\WebContent\\upload\\";
			String saveFilePath = "";
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			
			try {
				String fileName = "";

				for (Part part : req.getParts()) {
					// 파일명 추출
					fileName = getFileName(part);

					if (fileName != null && !fileName.equals("")) {

						saveFilePath = uploadPath + fileName;

						// 업로드 파일(원본파일) 저장***중요***
						part.write(saveFilePath);

						part.delete(); // 임시 업로드 파일 삭제하기
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			InsVO iv = new InsVO();
			iv.setMemId(memId);
			iv.setInstName(insName);
			iv.setAtchCourse(saveFilePath);
			
			cnt = memService.registIns(iv);
		}
		
		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		req.getSession().setAttribute("msg", msg);
		if(gbn.equals("02")) {
			req.getRequestDispatcher("join_ins.jsp").forward(req, resp);
		}else {
			req.getRequestDispatcher("join_gen.jsp").forward(req, resp);
		}
	}
	
	
	/**
	 * Part 객체를 파싱하여 파일이름 추출하기
	 * @param part 파싱할 Part객체
	 * @return 파일명 : 존재하지 않으면 NULL 리턴함(폼필드인 경우)
	 */
	private String getFileName(Part part) {

		for (String content : part.getHeader("Content-Disposition").split(";")) {
			if(content.trim().startsWith("filename")){
				return content.substring(content.indexOf("=") + 1).trim().replace("\"", "");
			}
		}
		return null; // filename이 존재하지 않을 경우(폼필드)
	}

}
