package volunteer.dao;

import java.util.List;
import java.util.Map;

import volunteer.vo.VolunteerVO;
import volunteer.vo.WishVO;
import volunteer.vo.ReservationVO;
import volunteer.vo.ReviewVO;

public interface IVolDao {
	
	public List<VolunteerVO> getList();
	public VolunteerVO getDetail(String volId);
	public List<ReviewVO> getReviewList(String volId);
	public int getReview(Map reviewMap);
	public int countMyReview(Map reviewMap);
	public int registerReview(ReviewVO reviewVo);
	public int registerVol(VolunteerVO vv);
	public int reservVol(ReservationVO rv);
	public ReservationVO getReservDetail(String reservId);
	public List<ReservationVO> getReservList(String memId);
	public VolunteerVO getDetailForReserv(String reservId);
	public int cancelReserv(ReservationVO rv);
	public int deleteVol(String volId);
	public int updateVol(VolunteerVO vv);
	public int updateReserv(ReservationVO rv);
	public int wishVol(WishVO wv);
	public int unWishVol(WishVO wv);
	public List<WishVO> getWishList();

}
