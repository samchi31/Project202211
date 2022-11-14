package donate.service;

import java.util.List;

import donate.dao.DonateDaoImpl;
import donate.dao.IDonateDao;
import donate.vo.DonateVO;

public class DonateServiceImpl implements IDonateService {
	
	private static IDonateService donateService;
	
	private IDonateDao donateDao;
	
	private DonateServiceImpl() {
		donateDao = DonateDaoImpl.getInstance();
	}
	
	public static IDonateService getInstance() {
		if(donateService == null) {
			donateService = new DonateServiceImpl();
		}
		return donateService;
	}
	
	@Override
	public List<DonateVO> getDonateList(DonateVO dv) {
		return donateDao.selectDonateList(dv);
	}
	
	@Override
	public int setDonate(DonateVO dv) {
		return donateDao.insertDonate(dv);
	}

	@Override
	public int cancelDonate(DonateVO dv) {
		return donateDao.updateCancelDonate(dv);
	}

	
	@Override
	public DonateVO getDonateDetail(DonateVO dv) {
		return donateDao.selectDonateDetail(dv);
	}


}
