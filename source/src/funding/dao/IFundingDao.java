package funding.dao;

import java.util.List;

import funding.vo.FundingVO;

public interface IFundingDao {
	
	
	public int selectFundingCount(FundingVO vo);
	
	/**
	 * DB에 테이블에 존재하는 전체 후원글을 조회하기 위한 메서드
	 * @return 후원글을 담고있는 List타입의 객체
	 */
	public List<FundingVO> selectFundingList(FundingVO vo);


	/**
	 * FundingVO에 담겨진 데이터를 DB에 insert하는 메서드
	 * @param mv DB에 insert할 데이터가 저장된 FundingVO객체
	 * @return DB작업이 성공하면 1 이상의 값이 반환됨.
	 */
	public int insertFunding(FundingVO fv);

	/**
	 * 하나의 FundingVO객체를 이용하여 DB정보를 cancel하는 메서드
	 * @param mv cancel할 회원정보가 들어있는 FundingVO객체
	 * @return 작업성공 : 1, 작업실패 : 0
	 */
	public int stopFunding(FundingVO fv);
	
	/***
	 * 
	 * @param fv
	 * @return
	 */
	public FundingVO selectFundingDetail (FundingVO fv);
	
	/**
	 * 
	 * @param fv
	 * @return
	 */
	public int updateFunding(FundingVO fv);

	/**
	 * 
	 * @param atchFileVO
	 */
	public int insertAtchFile(FundingVO atchFileVO);
	
	public void updateRecentAmount(String fundingId);
	
	/** 
	 * 기관,회원구분 조회
	 * @param memId
	 * @return
	 */
	public String getMemberGb(String memId);

}
