package volunteer.vo;

import common.VolCategory;
import common.VolStatus;

public class VolunteerVO {

	private String volId;
	private String volTitle;
	private String memId;
	private String startDate;
	private String endDate;
	private String startTime;
	private String endTime;
	private int personnel;
	private int total;
	private VolCategory volCtId;
	private String location;
	private VolStatus status;
	private String target;
	private String qualification;
	private String detail;
	private String thumbnail;
	
	private String defaultImage = "images/default/default.jpg";

	public String getDefaultImage() {
		return defaultImage;
	}

	public void setDefaultImage(String defaultImage) {
		this.defaultImage = defaultImage;
	}

	public VolunteerVO() {
		setThumbnail(defaultImage);
	}

	public String getVolId() {
		return volId;
	}

	public void setVolId(String volId) {
		this.volId = volId;
	}

	public String getVolTitle() {
		return volTitle;
	}

	public void setVolTitle(String volTitle) {
		this.volTitle = volTitle;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getStartDate() {
		return startDate.substring(0,10);
	}
	

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate.substring(0,10);
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getPersonnel() {
		return personnel;
	}

	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
////////////////////////////////////////////////////////////////////
//	public String getVolCtId() {
//		return volCtId;
//	}

//	public void setVolCtId(String volCtId) {
//		this.volCtId = volCtId;
//	}
	
	public VolCategory getVolCtId() {
		return volCtId;
	}
	
	public void setVolCtId(VolCategory volCtId) {
		this.volCtId = volCtId;
	}
	
	public void setVolCtId(String volCtId) {
		this.volCtId = VolCategory.valueOf(volCtId);
	}
////////////////////////////////////////////////////////////////////
	

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
////////////////////////////////////////////////////////////////////

//	public String getStatus() {
//		return status;
//	}
//
//	public void setStatus(String status) {
//		this.status = status;
//	}
	
	public VolStatus getStatus() {
		return status;
	}
	
	public void setStatus(VolStatus status) {
		this.status = status;
	}
	
	public void setStatus(String status) {
		this.status = VolStatus.valueOf(status);
	}
////////////////////////////////////////////////////////////////////

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

}
