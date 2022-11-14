package member.vo;

public class InsVO {

	private String memId;         // 회원아이디
	private String instName;      // 기관명
	private String instApprove;   // 승인여부
	private String atchCourse;    // 파일확장자명
	
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getInstName() {
		return instName;
	}
	public void setInstName(String instName) {
		this.instName = instName;
	}
	public String getInstApprove() {
		return instApprove;
	}
	public void setInstApprove(String instApprove) {
		this.instApprove = instApprove;
	}
	public String getAtchCourse() {
		return atchCourse;
	}
	public void setAtchCourse(String atchCourse) {
		this.atchCourse = atchCourse;
	}
	
}
