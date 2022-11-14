package donate.vo;

public class DonateVO {
	
	// 조회조건 
	private String memGb;		// 사용자 구분 (기관, 일반, 관리자)
	
	//페이징 처리하는 조회
	//
	//
	
	public String getMemGb() {
		return memGb;
	}
	public void setMemGb(String memGb) {
		this.memGb = memGb;
	}

	// 도네이트 테이블 컬럼
	private String donateId; //후원코드
	private String memId; //회원아이디
	private String fundingId; //펀딩코드
	private int donateAmount; //기부금액
	private String donateDate; //기부날짜 
	private String refund; //기부취소
	private String donateAccount; 
	private String donateAccountHolder;
	private String donateBankName;
	public String getDonateId() {
		return donateId;
	}
	public void setDonateId(String donateId) {
		this.donateId = donateId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getFundingId() {
		return fundingId;
	}
	public void setFundingId(String fundingId) {
		this.fundingId = fundingId;
	}
	public int getDonateAmount() {
		return donateAmount;
	}
	public void setDonateAmount(int donateAmount) {
		this.donateAmount = donateAmount;
	}
	public String getDonateDate() {
		return donateDate;
	}
	public void setDonateDate(String donateDate) {
		this.donateDate = donateDate;
	}
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
	public String getDonateAccount() {
		return donateAccount;
	}
	public void setDonateAccount(String donateAccount) {
		this.donateAccount = donateAccount;
	}
	public String getDonateAccountHolder() {
		return donateAccountHolder;
	}
	public void setDonateAccountHolder(String donateAccountHolder) {
		this.donateAccountHolder = donateAccountHolder;
	}
	public String getDonateBankName() {
		return donateBankName;
	}
	public void setDonateBankName(String donateBankName) {
		this.donateBankName = donateBankName;
	}
	
	@Override
	public String toString() {
		return "DonateVO [donateId=" + donateId + ", memId=" + memId + ", fundingId=" + fundingId + ", donateAmount="
				+ donateAmount + ", donateDate=" + donateDate + ", refund=" + refund + ", donateAccount="
				+ donateAccount + ", donateAccountHolder=" + donateAccountHolder + ", donateBankName=" + donateBankName
				+ "]";
	}
	
	
	

}
