package donate.dao;

import java.util.List;

import donate.vo.DonateVO;

public interface IDonateDao {
	
	/**
	 * 기부내역 갯수를 페이징처리하기 위한 메서드
	 * @param dv
	 * @return
	 */
	public int selectDonateCount(DonateVO dv);
	
	/**
	 * DB에 테이블에 존재하는 전체 기부내역을 조회하기 위한 메서드
	 * @return 후원글을 담고있는 List타입의 객체
	 */
	public List<DonateVO> selectDonateList(DonateVO dv);

	/**
	 * DonateVO에 담겨진 데이터를 DB에 insert하는 메서드
	 * @param bv DB에 insert할 데이터가 저장된 FundingVO객체
	 * @return DB작업이 성공하면 1 이상의 값이 반환됨.
	 */
	public int insertDonate(DonateVO dv);

	/**
	 * DonateVO에 담겨진 데이터를 DB에 update하는 메서드
	 * @param bv DB에 insert할 데이터가 저장된 FundingVO객체
	 * @return DB작업이 성공하면 1 이상의 값이 반환됨.
	 */
	public int updateCancelDonate(DonateVO dv);

	public DonateVO selectDonateDetail(DonateVO dv);
	
}
