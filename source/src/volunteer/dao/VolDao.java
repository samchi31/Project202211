package volunteer.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import common.QueryDao;
import member.vo.InsVO;
import utils.BatisUtil;
import volunteer.vo.VolunteerVO;
import volunteer.vo.WishVO;
import volunteer.vo.ReservationVO;
import volunteer.vo.ReviewVO;

public class VolDao extends QueryDao implements IVolDao {

	private static IVolDao dao;
	
	private SqlSession sqlSession;

	private VolDao() {
		sqlSession = BatisUtil.getSqlSession();
	}

	public static IVolDao getInstance() {
		if (dao == null) {
			dao = new VolDao();
		}
		return dao;
	}

	@Override
	public List<VolunteerVO> getVolList() {

		return selectList("volunteer.getVolList", null);
	}
	
	@Override
	public List<VolunteerVO> getList(Map<String,Object> map) {

		return selectList("volunteer.getList", map);
	}
	
	@Override
	public int countList() throws SQLException {
		int cnt = sqlSession.selectOne("volunteer.countList");
		return cnt;
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
	public int cancelReserv(String reservId) {

		return update("volunteer.cancelReserv", reservId);

	}

	@Override
	public int deleteVol(String volId) {
		
		return update("volunteer.deleteVol", volId) + update("volunteer.cancelReservVolDeleted", volId);
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
	public int changeApproveReserv(Map rMap) {
		
		return update("volunteer.changeApproveReserv", rMap);
	}

	@Override
	public List<VolunteerVO> getListMyVol(String memId) {
		
		return selectList("volunteer.getListMyVol", memId);
	}

	@Override
	public int isInst(String memId) {
		
		return selectOne("volunteer.isInst", memId);
	}
	
	@Override
	public int updateTotal(String reservId) {

		return update("volunteer.updateTotal", reservId);
	}

	@Override
	public int updateVolList(String status) {

		return update("volunteer.updateVolList1", status) + update("volunteer.updateVolList2", status);
	}

}
