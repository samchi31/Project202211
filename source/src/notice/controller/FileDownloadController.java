package notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.vo.AtchFileVO;

import notice.service.AtchFileServiceImpl;
import notice.service.IAtchFileService;


@WebServlet("/download.do")
public class FileDownloadController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String atchFileId = req.getParameter("atchFileId");
		String fileSn = req.getParameter("fileSn");
		
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		
		AtchFileVO atchFileVO = new AtchFileVO();
		atchFileVO.setAtchFileId(atchFileId);
		atchFileVO.setFileSn(Integer.parseInt(fileSn));
		
		atchFileVO = fileService.getAtchFileDetail(atchFileVO);
		
		
		
		
		
		//파일 다운로드 처리를 위한 응답헤더 정보 설정하기
		resp.setContentType("application/octet-stream");
		
		//URL에는 공백문자를 포함할 수 없다. URLEncoding을 이용하여 인코딩 작업을 하면 
		// 공백은 (+)로 표시되기 때문에 +문자를 공백문자인 %20으로 바꿔준다.
		
		
		resp.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(atchFileVO.getOrignlFileNm(), "UTF-8").replaceAll("\\+", "%20") + "\""); //공백제거
		
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(atchFileVO.getFileStreCours()));
		
		BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
		
		int data = 0;
		while((data = bis.read()) != -1) {
			bos.write(data);
		}
		bis.close();
		bos.close();
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		super.doPost(req, resp);
	}

}
