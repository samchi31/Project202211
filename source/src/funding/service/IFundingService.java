package funding.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import funding.vo.FundingVO;

public interface IFundingService {
	
	/**
	 * 후원글 목록이 조회되기 위한 메서드
	 * @param vo 회원정보를 검색하기 위한 데이터
	 * @return 검색된 결과를 담고 있는 List타입의 객체
	 */
	public List<FundingVO> getFundingList(FundingVO vo);

	/**
	 * 후원글 등록을 하기 위한 메서드
	 * @param fv 등록할 데이터가 저장된 FundingVO객체
	 * @return 글 등록이 성공하면 1 이상의 값이 반환됨
	 */
	public int registFunding(FundingVO fv);

	/**
	 * 펀딩을 취소하기 위한 메서드
	 * @param fv update 할 펀딩정보가 들어있는 FundingVO객체
	 * @return 작업성공 : 1, 작업실패 : 0
	 */
	public int stopFunding(FundingVO fv);
	
	/**
	 * 펀딩글 상세보기 메서드
	 * @param fv update할 펀딩정보가 들어있는 FundingVO객체
	 * @return
	 */
	public FundingVO getFundingDetail(FundingVO fv);
		
	/**
	 * 펀딩글을 수정하기 위한 메서드
	 * @param fv update할 펀딩정보가 들어있는 FundingVO객체
	 * @return
	 */
	public int modifyFunding(FundingVO fv);
	
	/**
	 * 펀딩 모금액 수정하기 위한 메소드
	 * @param fv update할 펀딩정보가 들어있는 FundingVO객체
	 * @return
	 */
	public void modifyRecentAmount(String fundingId);
	
	/**
	 *  세션 구분하는 메소드*/
	public String getMemberGb(String memId);

}
