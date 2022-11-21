package funding.dao;

import java.util.List;

import funding.vo.FundingVO;
import common.QueryDao;

public class FundingDaoImpl extends QueryDao implements IFundingDao {

	private static IFundingDao fundingDao;
	
	private FundingDaoImpl() {
		
	}
	
	public static IFundingDao getInstance() {
		if(fundingDao==null) {
			fundingDao = new FundingDaoImpl();
		}
		return fundingDao;
	}
	
	@Override
	public int selectFundingCount(FundingVO vo){
		return selectOne("funding.selectFundingCount", vo) ;
	}
	
	@Override
	// 조회조건이 필요하기 떄문에 FundingVO에 조회조건 넣을 것
	public List<FundingVO> selectFundingList(FundingVO vo){
		return selectList("funding.selectFundingList", vo) ;
	}

	@Override
	public int insertFunding(FundingVO fv) {
		return insert("funding.insertFunding", fv) ;
	}

	@Override
	public int stopFunding(FundingVO fv) {
		return update("funding.stopFunding",fv);
	}
	
	@Override
	public FundingVO selectFundingDetail(FundingVO fv) {
		return selectOne("funding.selectFundingDetail", fv);
	}
	
	@Override
	public int updateFunding(FundingVO fv) {
		return update("funding.updateFunding",fv);
	}

	@Override
	public int insertAtchFile(FundingVO atchFileVO) {
		return insert("atchFile.insertAtchFile", atchFileVO);
	}
	
	public void updateRecentAmount(String fundingId) {
		update("funding.updateRecentAmount", fundingId);
	}

	@Override
	public String getMemberGb(String memId) {
		return selectOne("funding.getMemberGb",memId);
	}

}
