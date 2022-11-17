package volunteer.vo;

public class ReservationVO {

	private String reservId;
	private String volId;
	private String memId;
	private String reservDate;
	private String reservTime;
	private String applyDate;
	private String cancelDate;
	private String rStId;

	public String getReservId() {
		return reservId;
	}

	public void setReservId(String reservId) {
		this.reservId = reservId;
	}

	public String getVolId() {
		return volId;
	}

	public void setVolId(String volId) {
		this.volId = volId;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getReservDate() {
		return reservDate.substring(0,10);
	}

	public void setReservDate(String reservDate) {
		this.reservDate = reservDate;
	}

	public String getReservTime() {
		return reservTime;
	}

	public void setReservTime(String reservTime) {
		this.reservTime = reservTime;
	}

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public String getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}

	public String getrStId() {
		return rStId;
	}

	public void setrStId(String rStId) {
		this.rStId = rStId;
	}

}
