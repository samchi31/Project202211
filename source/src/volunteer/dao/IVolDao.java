package volunteer.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import member.vo.InsVO;
import volunteer.vo.VolunteerVO;
import volunteer.vo.WishVO;
import volunteer.vo.ReservationVO;
import volunteer.vo.ReviewVO;

public interface IVolDao {
	
	public List<VolunteerVO> getVolList();
	public List<VolunteerVO> getList(Map<String,Object> map);
	public VolunteerVO getDetail(String volId);
	public List<ReviewVO> getReviewList(String volId);
	public String getReservId(Map reviewMap);
	public int canIReview(String reservId);
	public int countMyReview(Map reviewMap);
	public int registerReview(ReviewVO reviewVo);
	public int registerVol(VolunteerVO vv);
	public int reservVol(ReservationVO rv);
	public ReservationVO getReservDetail(String reservId);
	public List<ReservationVO> getReservList(String memId);
	public VolunteerVO getDetailForReserv(String reservId);
	public int cancelReserv(String reservId);
	public int deleteVol(String volId);
	public int updateVol(VolunteerVO vv);
	public int updateReserv(ReservationVO rv);
	public int wishVol(WishVO wv);
	public int unWishVol(WishVO wv);
	public List<WishVO> getWishList();
	public List<ReservationVO> getApproveList(String memId);
	public int changeApproveReserv(Map rMap);
	public List<VolunteerVO> getListMyVol(String memId);
	public int isInst(String memId);
	public int updateTotal(String reservId);
	public int updateVolList(String status);
	public int countList() throws SQLException;
}
