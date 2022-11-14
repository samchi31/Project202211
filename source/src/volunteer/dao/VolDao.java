package volunteer.dao;

import java.util.List;

import common.QueryDao;
import volunteer.vo.VolunteerVO;
import volunteer.vo.ReviewVO;

public class VolDao extends QueryDao implements IVolDao{
	
	private static IVolDao dao;
	private VolDao() {
	}
	public static IVolDao getInstance() {
		if (dao == null) {
			dao = new VolDao();
		}
		return dao;
	}
	
	@Override
	public List<VolunteerVO> getList() {
		
		return selectList("volunteer.getList", null);
	}
	
	@Override
	public VolunteerVO getDetail(String volId) {
		return selectOne("volunteer.getDetail", volId);
	}

	@Override
	public List<ReviewVO> getReviewList(String volId) {
		
		return selectList("volunteer.getReviewList", volId);
	}
	
	@Override
	public int registerVol(VolunteerVO vv) {
		
		return insert("volunteer.registerVol", vv);
	}
	
}
