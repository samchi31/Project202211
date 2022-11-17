package notice.vo;

import java.util.List;

public class NoticeVO {

	private String noticeId;
	private String memId;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;	
	private String atchId;
	
//	//1:N
//	private List<AtchFileVO> atchFileVOList;
	
	public String getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getAtchId() {
		return atchId;
	}
	public void setAtchId(String atchId) {
		this.atchId = atchId;
	}
	
	
//	public List<AtchFileVO> getAtchFileVOList() {
//		return atchFileVOList;
//	}
//	public void setAtchFileVOList(List<AtchFileVO> atchFileVOList) {
//		this.atchFileVOList = atchFileVOList;
//	}
	
	

}
