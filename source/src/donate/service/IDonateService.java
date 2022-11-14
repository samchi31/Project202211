package donate.service;

import java.util.List;

import donate.vo.DonateVO;

public interface IDonateService {
	
	/**
	 * 기부 내역이 조회되기 위한 메서드
	 * @param dv 회원정보를 검색하기 위한 데이터
	 * @return 검색된 결과를 담고 있는 List타입의 객체
	 */
	public List<DonateVO> getDonateList(DonateVO dv);
	
	/**
	 * 후원을 하는 메서드
	 * @param bv 등록할 데이터가 저장된 DonateVO객체
	 * @return 글 등록이 성공하면 1 이상의 값이 반환됨
	 */
	public int setDonate(DonateVO dv);

	public int cancelDonate(DonateVO dv);

	/**
	 * 기부내역 상세보기
	 * @param dv
	 * @return
	 */
	public DonateVO getDonateDetail(DonateVO dv);


}
