package notice.vo;

import java.util.Date;

public class AtchFileVO {
	
	 private String atchId;   // 첨부파일 ID
	 private int atchSn;		 // 파일순번
     private String atchName;      // 저장파일명
     
     
	public String getAtchId() {
		return atchId;
	}
	public void setAtchId(String atchId) {
		this.atchId = atchId;
	}
	public int getAtchSn() {
		return atchSn;
	}
	public void setAtchSn(int atchSn) {
		this.atchSn = atchSn;
	}
	public String getAtchName() {
		return atchName;
	}
	public void setAtchName(String atchName) {
		this.atchName = atchName;
	} 

}
