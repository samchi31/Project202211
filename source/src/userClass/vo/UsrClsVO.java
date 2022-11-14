package userClass.vo;

import java.util.Map;

import common.ClsCategory;
import common.ClsStatus;


public class UsrClsVO {
	private String classId;                               // 재능기부ID
	private String memId;                                 // 회원ID
	private String classTitle;                            // 재능기부제목
	private String classContent;                          // 재능기부내용
	private String classDate;                             // 작성날짜
//	private String classDelete;                           // 
	private ClsStatus classDelete;				          // 삭제여부
	private ClsCategory clsCtId;                               // 카테고리ID
	private String classViews;                            // 조회수
	private String classThumbnail;	                      // 썸네일경로
	
	private String defaultImage = "/images/default/wallpaper.jpg";
	
	public UsrClsVO() {
		classDelete = ClsStatus.POST; 
		setClassThumbnail(defaultImage);
	}
	
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getClassTitle() {
		return classTitle;
	}
	public void setClassTitle(String classTitle) {
		this.classTitle = classTitle;
	}
	public String getClassContent() {
		return classContent;
	}
	public void setClassContent(String classContent) {
		this.classContent = classContent;
	}
	public String getClassDate() {
		return classDate;
	}
//	public void setClassDate(String classDate) {
//		this.classDate = classDate;
//	}
//	public String getClassDelete() {
//		return classDelete;
//	}
//	public void setClassDelete(String classDelete) {
//		this.classDelete = classDelete;
//	}
	public String getClsCtId() {
		return this.clsCtId.name();
	}
	public void setClsCtId(String clsCtId) {
		this.clsCtId = ClsCategory.valueOf(clsCtId);
	}
	public String getClassViews() {
		return classViews;
	}
	public void setClassViews(String classViews) {
		this.classViews = classViews;
	}	
	
	public ClsStatus getClassDelete() {
		return classDelete;
	}
	public void setClassDelete(char status) {
		if(status == 'N') {
			this.classDelete = ClsStatus.POST;
		} else {
			this.classDelete = ClsStatus.DELETE;
		}
	}
	
	public String getClassThumbnail() {
		return classThumbnail;
	}
	public void setClassThumbnail(String classThumbnail) {
		this.classThumbnail = classThumbnail;
	}
}
