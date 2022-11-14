package volunteer.vo;

public class ReviewVO {

	private String reservId;
	private int star;
	private String content;
	private String correctionDate;
	private String deleted;

	public String getReservId() {
		return reservId;
	}

	public void setReservId(String reservId) {
		this.reservId = reservId;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCorrectionDate() {
		return correctionDate.substring(0,10);
	}

	public void setCorrectionDate(String correctionDate) {
		this.correctionDate = correctionDate;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

}
