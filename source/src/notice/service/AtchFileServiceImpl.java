package notice.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;


import notice.dao.AtchFileDaoImpl;
import notice.dao.IAtchFileDao;
import notice.vo.AtchFileVO;


public class AtchFileServiceImpl implements IAtchFileService {
	private String path = "C:\\Users\\PC-07\\eclipse-workspace\\MidTeamProject\\MidTeamProject\\WebContent";
	private static final String SAVE_DIR = "/atchfile";
	
	private static IAtchFileService fileService;
	
	private IAtchFileDao fileDao;	
	
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
	public List<AtchFileVO> saveAtchFileList(HttpServletRequest req) {
		File uploadDir = new File(path+SAVE_DIR);
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		List<AtchFileVO> list = null;
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
						list = new ArrayList<AtchFileVO>();	
					}			
					String saveFilePath = path+SAVE_DIR + File.separator + fileName;
					
					
					//업로드 파일(원본파일) 저장
					part.write(saveFilePath);
					
					atchFileVO = new AtchFileVO();
					atchFileVO.setAtchName(saveFilePath);
					list.add(atchFileVO);
					
//					//파일세부정보 저장
//					int cnt = fileDao.insertAtchFileDetail(atchFileVO);		
					part.delete(); //임시업로드 파일 삭제하기
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}	
	
	/**
	 * 파일 저장
	 * @param atchFileVOList
	 * @return
	 */
	public int insertNoticeAtch(List<AtchFileVO> atchFileVOList) {
		return fileDao.insertAtchFileDetail(atchFileVOList);
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
	public List<AtchFileVO> getAtchFileList(String noticeId) {
		
		return fileDao.getAtchFileList(noticeId);
	}

	@Override
	public int selectAtchId() {
		return fileDao.selectAtchId();
	}


}
