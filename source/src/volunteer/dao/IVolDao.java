package volunteer.dao;

import java.util.List;

import volunteer.vo.VolunteerVO;
import volunteer.vo.ReviewVO;

public interface IVolDao {
	
	public List<VolunteerVO> getList();
	public VolunteerVO getDetail(String volId);
	public List<ReviewVO> getReviewList(String volId);
	public int registerVol(VolunteerVO vv);
}
