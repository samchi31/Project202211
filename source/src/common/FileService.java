package common;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import utils.PathSetting;


public class FileService implements IFileService{
//	private String path = "D:\\A_TeachingMaterial\\03_HighJAVA\\workspace\\ONProject\\WebContent";
//	private String path = "C:\\Users\\PC-07\\eclipse-workspace\\HighJava\\ONProject\\WebContent";
	private String path = PathSetting.getPathSetting();
	//private String path = "";
	private static final String SAVE_DIR = "\\images\\thumbnail";
		
	private File file;
	
	public FileService() {
//		file = new File();
	}
	
	public FileService(String path) {
		file = new File(path);
	}
	
	@Override
	public void setFileService(String path) {
		file = new File(path);
	}
	
	/**
	 * 파일 전체 경로 반환
	 */
	@Override
	public String getSavePath() {
		if(file != null) {
			return file.getPath();
		}
		return "/images/default/default.jpg";
	}
	
	/**
	 * 파일의 이름 반환
	 */
	@Override
	public String getFileName() {
		return file.getName();
	}

	/**
	 * 파일 저장
	 * success 썸네일 새로운 파일
	 * false 기본 썸네일
	 */
	@Override
	public Boolean saveImage(HttpServletRequest req, String defaultPath) {
		Boolean isSuccess = false;
		try {
			String fileName = "";
			boolean isFirstFile = true; // 첫번째 파일여부
			for (Part part : req.getParts()) {
				fileName = getFileName(part);
				if (fileName != null && getFieldName(part)) {
					if(!fileName.equals("")) {
					// 파일인 경우..
					if (isFirstFile) { // 첫번째 파일이 맞다면
						isFirstFile = false;
					}

//					String saveFilePath = this.path + SAVE_DIR + File.separator + fileName;
					
					// 업로드 파일(원본파일) 저장
					part.write(this.path + SAVE_DIR + File.separator + fileName);
					setFileService(SAVE_DIR + File.separator + fileName);
					
					part.delete(); 	// 임시 업로드 파일 삭제하기
					
					isSuccess = true;
					} else {
//						String saveFilePath = this.path + SAVE_DIR + File.separator + defaultPath;
						setFileService(defaultPath);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		return isSuccess;
	}
	
	/**
	 * 멀티파트에서 파트가 파일인 경우 파일의 이름 반환 아니면 null 반환
	 */
	private String getFileName(Part part) {
		/*
		 * Content-Disposition 헤더에 대하여...
		 * 
		 * multipart body를 위해 사용되는 경우 ex)파일 업로드
		 * 
		 * Content-Disposition: form-data Content-Disposition: form-data;
		 * name="fieldName" Content-Disposition: form-data; name="fieldName";
		 * filename="a.jpg"
		 */
		for (String content : part.getHeader("Content-Disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf("=") + 1).trim().replace("\"", "");
			}
		}

		// filename이 존재하지 않을 경우...(폼필드)
		return null;
	}
	
	/**
	 * name이 thumbnail인지 확인
	 * @param part
	 * @return
	 */
	private Boolean getFieldName(Part part) {
		for (String content : part.getHeader("Content-Disposition").split(";")) {
			if (content.trim().startsWith("name=\"thumbnail\"")) {
				return true;
			}
		}
		return false;
	}
		
}
