package notice.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;


import notice.dao.AtchFileDaoImpl;
import notice.dao.IAtchFileDao;
import notice.vo.AtchFileVO;


public class AtchFileServiceImpl implements IAtchFileService {
	
	private static IAtchFileService fileService;
	
	private IAtchFileDao fileDao;
	
	private static final String UPLOAD_DIR = "upload_files";
	
	private AtchFileServiceImpl() {
		fileDao = AtchFileDaoImpl.getInstance();  //이제 언제든지 어태치파일다오 가져올 수 있다!
	}
	
	public static IAtchFileService getInstance() {
		if(fileService == null) {
			fileService = new AtchFileServiceImpl();
		}
		return fileService;
	}
	

	@Override
	public AtchFileVO saveAtchFileList(HttpServletRequest req) {
		
		//업로드경로 설정하기
		String uploadPath = "d:/D_Other/" + UPLOAD_DIR;
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		AtchFileVO atchFileVO = null;
		
		try {
			
			String fileName = "";
			
			boolean isFirstFile = true; //첫번째 파일 여부
			
			for(Part part : req.getParts()) {
				
				fileName = getFileName(part);
				
				if(fileName != null && !fileName.equals("")) {
					//파일인 경우...
					if(isFirstFile) { //첫번째 파일이 맞다면...
						isFirstFile = false;
						
						
						// 기본파일정보 저장하기 
						atchFileVO = new AtchFileVO();
						
						// 기본파일정보 저장 (VO에 atchFileId가 저장된다.) from 마이바티스
//						fileDao.insertAtchFile(atchFileVO);
						
					}
					
					String orignFileName = fileName; //원본파일명
					long fileSize = part.getSize(); //파일크기
					String saveFileName = ""; //저장파일명
					String saveFilePath = ""; //저장파일경로

					saveFileName = UUID.randomUUID().toString().replace("-", "");
					saveFilePath = uploadPath + File.pathSeparator + saveFileName;
					
					
					//확장자명 추출
					String fileExtension = orignFileName.lastIndexOf(".") < 0 ?
							"" : orignFileName.substring(orignFileName.lastIndexOf(".") + 1);
					
					//업로드 파일(원본파일) 저장
					part.write(saveFilePath);
					
					atchFileVO.setStreFileNm(saveFileName);
					atchFileVO.setFileSize(fileSize);
					atchFileVO.setOrignlFileNm(orignFileName);
					atchFileVO.setFileStreCours(saveFilePath);
					atchFileVO.setFileExtsn(fileExtension);
					
					//파일세부정보 저장
					fileDao.insertAtchFileDetail(atchFileVO);
					
					part.delete(); //임시업로드 파일 삭제하기
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return atchFileVO;
	}

	
	
	
	
	
	/**
	 * Part 객체를 파싱하여 파일이름 추출하기
	 * @param part - 파싱할 part 객체
	 * @return - 파일명: 존재하지 않으면 NULL 리턴함 (폼필드인 경우)
	 */
	private String getFileName(Part part) {
		
		/*
		 *  Content-Disposition 헤더에 대하여
		 *  
		 *    multipart body를 위해 사용되는 경우   ex)파일업로드
		 *    
		 *    Content-Disposition : form-data
		 *    Content-Disposition : form-data; name="fieldName"
		 *    Content-Disposition : form-data; name="fieldName"
		 *    						filename="a.jpg"
		 */
		
		for(String content : part.getHeader("Content-Disposition").split(";")) {
			if(content.trim().startsWith("filename")) {
				return content.substring(content.indexOf("=") + 1).trim().replace("\"", "");
			}
		}
		
		return null; //filename이 없는 경우!(폼필드)
		
	}
	
	
	


	@Override
	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO) {
		
		return fileDao.getAtchFileDetail(atchFileVO);
	}

	
	
	
	
	@Override
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO) {
		
		return fileDao.getAtchFileList(atchFileVO);
	}


}
