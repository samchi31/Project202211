package volunteer.dao;

import java.util.List;
import java.util.Map;

import common.QueryDao;
import volunteer.vo.VolunteerVO;
import volunteer.vo.WishVO;
import volunteer.vo.ReservationVO;
import volunteer.vo.ReviewVO;

public class VolDao extends QueryDao implements IVolDao {

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
	public String getReservId(Map reviewMap) {
		
		return selectOne("volunteer.getReservId", reviewMap);
	}
	
	@Override
	public int canIReview(String reservId) {

		return selectOne("volunteer.canIReview", reservId);
	}
	
	@Override
	public int countMyReview(Map reviewMap) {
		
		return selectOne("volunteer.countMyReview", reviewMap);
	}
	
	@Override
	public int registerReview(ReviewVO reviewVo) {
		
		return insert("volunteer.registerReview", reviewVo);
	}

	@Override
	public int registerVol(VolunteerVO vv) {

		return insert("volunteer.registerVol", vv);
	}

	@Override
	public int reservVol(ReservationVO rv) {

		return insert("volunteer.reservVol", rv);
	}

	@Override
	public ReservationVO getReservDetail(String reservId) {

		return selectOne("volunteer.getReservDetail", reservId);

	}

	@Override
	public List<ReservationVO> getReservList(String memId) {

		return selectList("volunteer.getReservList", memId);

	}

	@Override
	public VolunteerVO getDetailForReserv(String reservId) {

		return selectOne("volunteer.getDetailForReserv", reservId);

	}

	@Override
	public int cancelReserv(ReservationVO rv) {

		return update("volunteer.cancelReserv", rv);

	}

	@Override
	public int deleteVol(String volId) {
		
		return delete("volunteer.deleteVol", volId);
	}

	@Override
	public int updateVol(VolunteerVO vv) {
		
		return update("volunteer.updateVol", vv);
	}

	@Override
	public int updateReserv(ReservationVO rv) {
		
		return update("volunteer.updateReserv", rv);
	}

	@Override
	public int wishVol(WishVO wv) {
		
		return insert("volunteer.wishVol", wv);
	}

	@Override
	public int unWishVol(WishVO wv) {
		
		return delete("volunteer.unWishVol", wv);
	}

	@Override
	public List<WishVO> getWishList() {
		
		return selectList("volunteer.getWishList", null);
	}

	@Override
	public List<ReservationVO> getApproveList(String memId) {
		
		return selectList("volunteer.getApproveList", memId);
	}

	@Override
	public List<VolunteerVO> getListMyVol(String memId) {
		
		return selectList("volunteer.getListMyVol", memId);
	}



}
