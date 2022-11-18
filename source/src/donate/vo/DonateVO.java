package donate.vo;

public class DonateVO {
	
	// 조회조건 
	private String memGb;		// 사용자 구분 (기관, 일반, 관리자)
	
	// 페이징 처리라는게 조회 
	private int pageNo;  		// 현재 페이지 번호
	private int pageRowCnt = 5;		// 페이지에 표시되는 글에 수
	private int pageTotRowCnt;		// 전체 카운트
	
	private int perPage = 5;
	private int lastPageNo;		// 마지막 페이지 번호
	private int firstPageNo;	// 시작 페이지 번호
	private int totalPageNo; 		// 전체 페이지 수
	
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
	
	//추가된 다른테이블 컬럼
	private String fundingTitle;
	private String instName;
	
	public String getFundingTitle() {
		return fundingTitle;
	}
	public void setFundingTitle(String fundingTitle) {
		this.fundingTitle = fundingTitle;
	}
	public String getInstName() {
		return instName;
	}
	public void setInstName(String instName) {
		this.instName = instName;
	}
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
	
	/** 페이징 처리 */
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageRowCnt() {
		return pageRowCnt;
	}
	
	public int getFirstPageNo() {
		// 페이지 첫번째 번호
		firstPageNo = ((this.pageNo - 1) / this.perPage * this.perPage) + 1 ; 
		return firstPageNo;
	}
	
	public int getLastPageNo() {
		lastPageNo = getFirstPageNo() + this.perPage - 1;
		if( lastPageNo > getTotalPageNo() ) lastPageNo =  getTotalPageNo();
		return lastPageNo;
	}
	
	public int getTotalPageNo() {
		// 전체 페이지 계산
		totalPageNo = (int)Math.ceil((double)getPageTotRowCnt() / (double)this.pageRowCnt); 
		return totalPageNo;
	}
	
	public int getPageTotRowCnt() {
		return pageTotRowCnt;
	}
	public void setPageTotRowCnt(int pageTotRowCnt) {
		this.pageTotRowCnt = pageTotRowCnt;
	}
	
	

}
