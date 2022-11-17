package funding.vo;

public class FundingVO {
	
	// 조회조건 
	private String memGb;		// 사용자 구분 (기관, 일반, 관리자)
	private String donateYn;	// 펀딩에 기부 여부
	
	// 페이징 처리라는게 조회 
	private int pageNo;  		// 현재 페이지 번호
	private int pageRowCnt = 5;		// 페이지에 표시되는 글에 수
	private int pageTotRowCnt;		// 전체 카운트
	
	private int perPage = 5;
	private int lastPageNo;		// 마지막 페이지 번호
	private int firstPageNo;	// 시작 페이지 번호
	private int totalPageNo; 		// 전체 페이지 수
	
	// 펀딩 테이블 컬럼 
	private String fundingId;
	private String fundingTitle;
	private String memId;
	private int targetAmount;
	private int recentAmount;
	private String fundingStartDate;
	private String fundingEndDate;
	private String fundingAccount;
	private String fundingAccountHolder;
	private String fundingBankName;
	private String fundingDetail;
	private String fundingStop;
	private String instName;
	
	private String defaultImage = "images/default/basic.jpg";
	
	// 펀딩테이블썸네일컬럼
	private String fundingThumbnail;
	
	private String fileName;
	private String filePath;
	
	
	public FundingVO() {
		// setFundingThumbnail(defaultImage);
	}
	
	public String getDefaultImage() {
		return defaultImage;
	}

	public void setDefaultImage(String defaultImage) {
		this.defaultImage = defaultImage;
	}
	
	public String getFundingThumbnail() {
		return fundingThumbnail;
	}
	public void setFundingThumbnail(String fundingThumbnail) {
		this.fundingThumbnail = fundingThumbnail;
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
	public String getFundingTitle() {
		return fundingTitle;
	}
	public void setFundingTitle(String fundingTitle) {
		this.fundingTitle = fundingTitle;
	}
	public int getTargetAmount() {
		return targetAmount;
	}
	public void setTargetAmount(int targetAmount) {
		this.targetAmount = targetAmount;
	}
	public int getRecentAmount() {
		return recentAmount;
	}
	public void setRecentAmount(int recentAmount) {
		this.recentAmount = recentAmount;
	}
	public String getFundingAccount() {
		return fundingAccount;
	}
	public void setFundingAccount(String fundingAccount) {
		this.fundingAccount = fundingAccount;
	}
	public String getFundingAccountHolder() {
		return fundingAccountHolder;
	}
	public void setFundingAccountHolder(String fundingAccountHolder) {
		this.fundingAccountHolder = fundingAccountHolder;
	}
	public String getFundingBankName() {
		return fundingBankName;
	}
	public void setFundingBankName(String fundingBankName) {
		this.fundingBankName = fundingBankName;
	}
	public String getFundingDetail() {
		return fundingDetail;
	}
	public void setFundingDetail(String fundingDetail) {
		this.fundingDetail = fundingDetail;
	}
	
	public String getFundingStartDate() {
		return fundingStartDate;
	}
	public void setFundingStartDate(String fundingStartDate) {
		this.fundingStartDate = fundingStartDate;
	}
	public String getFundingEndDate() {
		return fundingEndDate;
	}
	public void setFundingEndDate(String fundingEndDate) {
		this.fundingEndDate = fundingEndDate;
	}
	public String getFundingStop() {
		return fundingStop;
	}
	public void setFundingStop(String fundingStop) {
		this.fundingStop = fundingStop;
	}

	@Override
	public String toString() {
		
		String msg = "toString:: fundingId =" + this.fundingId + 
				 ", fundingTitle=" + this.fundingTitle + 
				 ", memId=" + this.memId +
				 ", targetAmount=" + this.targetAmount + 
				 ", recentAmount=" + this.recentAmount + 
				 ", fundingStartDate=" + this.fundingStartDate + 
				 ", fundingEndDate=" + this.fundingEndDate + 
				 ", fundingAccount=" + this.fundingAccount + 
				 ", fundingAccountHolder=" + this.fundingAccountHolder + 
				 ", fundingBankName=" + this.fundingBankName + 
				 ", fundingDetail=" + this.fundingDetail + 
				 ", fundingStop=" + this.fundingStop +
				 ", fundingThumbnail= " + this.fundingThumbnail 
				 ;
		return msg;
	}
	public String getMemGb() {
		return memGb;
	}
	public void setMemGb(String memGb) {
		this.memGb = memGb;
	}
	public String getDonateYn() {
		return donateYn;
	}
	public void setDonateYn(String donateYn) {
		this.donateYn = donateYn;
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

	public String getInstName() {
		return instName;
	}

	public void setInstName(String instName) {
		this.instName = instName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}
