package funding.service;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import funding.dao.FundingDaoImpl;
import funding.dao.IFundingDao;
import funding.vo.FundingVO;

public class FundingServiceImpl implements IFundingService{
	
	private static IFundingService fundingService;
	
	private IFundingDao fundingDao;
	
	private static final String UPLOAD_DIR = "upload_files";
	
	private FundingServiceImpl() {
		fundingDao = FundingDaoImpl.getInstance();
	}
	
	public static IFundingService getInstance() {
		
		if(fundingService==null) {
			fundingService = new FundingServiceImpl();
		}
		return fundingService;
	}
	
	@Override
	public List<FundingVO> getFundingList(FundingVO vo){
		int totCnt = fundingDao.selectFundingCount(vo);
		vo.setPageTotRowCnt(totCnt);
		return fundingDao.selectFundingList(vo);
	}

	@Override
	public int registFunding(FundingVO fv) {

		int cnt = fundingDao.insertFunding(fv);
		
		if(cnt>0) {
			
		}
		return cnt;
	}

	@Override
	public int stopFunding(FundingVO fv) {
		// int cnt = fundingDao.cancelFunding(fv);
		return fundingDao.stopFunding(fv);
	}
	
	public FundingVO getFundingDetail(FundingVO fv) {
		return fundingDao.selectFundingDetail(fv);
	}
	
	// 펀딩 수정하기 
	public int modifyFunding(FundingVO fv) {
		return fundingDao.updateFunding(fv);
	}
	
	/**
	 * 펀딩 모금액 수정하기 위한 메소드
	 * @param fv update할 펀딩정보가 들어있는 FundingVO객체
	 * @return
	 */
	public void modifyRecentAmount(String fundingId) {
		fundingDao.updateRecentAmount(fundingId);
	}

	/**
	 * 기관구분을 조회할 수 있기위해 쓰는 메소드
	 */
	@Override
	public String getMemberGb(String memId) {
		return fundingDao.getMemberGb(memId);
	}


}
