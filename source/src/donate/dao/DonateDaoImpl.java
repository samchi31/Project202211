package donate.dao;

import java.util.List;

import batis.MyBatisDao;
import donate.vo.DonateVO;

public class DonateDaoImpl extends MyBatisDao implements IDonateDao{
	
	private static IDonateDao donateDao;
	
	public DonateDaoImpl() {
	}
	
	public static IDonateDao getInstance() {
		if(donateDao==null) {
			donateDao = new DonateDaoImpl();
		}
		return donateDao;
	}

	@Override
	public List<DonateVO> selectDonateList(DonateVO dv) {
		return selectList("donate.selectDonateList",dv);
	}
	
	@Override
	public int insertDonate(DonateVO dv) {
		return insert("donate.insertDonate",dv);
	}

	@Override
	public int updateCancelDonate(DonateVO dv) {
		return update("donate.updateCancelDonate",dv);
	}

	@Override
	public DonateVO selectDonateDetail(DonateVO dv) {
		return selectOne("donate.selectDonateDetail", dv);
	}


}
