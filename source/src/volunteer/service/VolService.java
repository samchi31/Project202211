package volunteer.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import volunteer.dao.IVolDao;
import volunteer.dao.VolDao;
import volunteer.vo.VolunteerVO;
import volunteer.vo.ReviewVO;

public class VolService implements IVolService {

	private IVolDao dao;
	private static IVolService service;
	private VolService() {
		dao = VolDao.getInstance();
	}
	public static IVolService getInstance() {
		if (service == null) {
			service = new VolService();
		}
		return service;
	}
	
	@Override
	public List<VolunteerVO> getList() {
		
		List<VolunteerVO> volList = dao.getList();
		
		return volList;
	}
	
	@Override
	public VolunteerVO getDetail(String volId) {
		return dao.getDetail(volId);
	}
	
	@Override
	public List<ReviewVO> getReviewList(String volId) {
		
		List<ReviewVO> reviewList = dao.getReviewList(volId);
		
		return reviewList;
	}
	@Override
	public int registerVol(VolunteerVO vv) {

		int cnt = dao.registerVol(vv);
		
		if (cnt > 0){
		}

		
		return cnt;
	}
	
}
