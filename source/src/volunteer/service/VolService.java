package volunteer.service;

import java.util.List;
import java.util.Map;

import volunteer.dao.IVolDao;
import volunteer.dao.VolDao;
import volunteer.vo.VolunteerVO;
import volunteer.vo.WishVO;
import volunteer.vo.ReservationVO;
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
	public int getReview(Map reviewMap) {
		
		return dao.getReview(reviewMap);
	}
	
	@Override
	public int countMyReview(Map reviewMap) {
		
		return dao.countMyReview(reviewMap);
	}

	@Override
	public int registerReview(ReviewVO reviewVo) {
		
		int cnt = dao.registerReview(reviewVo);
		
		return cnt;
	}

	@Override
	public int registerVol(VolunteerVO vv) {

		int cnt = dao.registerVol(vv);

		return cnt;
	}

	@Override

	public int reservVol(ReservationVO rv) {

		int cnt = dao.reservVol(rv);

		if (cnt > 0) {
		}

		return cnt;
	}

	@Override
	public ReservationVO getReservDetail(String reservId) {

		return dao.getReservDetail(reservId);

	}

	@Override
	public List<ReservationVO> getReservList(String memId) {

		List<ReservationVO> reservList = dao.getReservList(memId);

		return reservList;
	}

	@Override
	public VolunteerVO getDetailForReserv(String reservId) {

		return dao.getDetailForReserv(reservId);

	}

	@Override
	public int cancelReserv(ReservationVO rv) {

		int cnt = dao.cancelReserv(rv);

		return cnt;
	}

	@Override
	public int deleteVol(String volId) {

		int cnt = dao.deleteVol(volId);

		return cnt;
	}

	@Override
	public int updateVol(VolunteerVO vv) {

		int cnt = dao.updateVol(vv);

		return cnt;
	}

	@Override
	public int updateReserv(ReservationVO rv) {

		int cnt = dao.updateReserv(rv);

		return cnt;
	}

	@Override
	public int wishVol(WishVO wv) {

		int cnt = dao.wishVol(wv);

		return cnt;
	}

	@Override
	public int unWishVol(WishVO wv) {

		int cnt = dao.unWishVol(wv);

		return cnt;
	}

	@Override
	public List<WishVO> getWishList() {

		return dao.getWishList();
	}

}
