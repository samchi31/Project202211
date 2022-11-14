package common;

import javax.servlet.http.HttpServletRequest;

import userClass.vo.UsrClsVO;

public interface IFileService {
	public void setFileService(String path);
	
	public String getSavePath();
	
	public String getFileName();
	
	public Boolean saveImage(HttpServletRequest req, String defaultPath);
}
