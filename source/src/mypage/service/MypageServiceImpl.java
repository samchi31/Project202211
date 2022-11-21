package mypage.service;

import java.util.List;

import donate.vo.DonateVO;
import member.vo.InsVO;
import member.vo.MemberVO;
import mypage.dao.IMypageDao;
import mypage.dao.MypageDaoImpl;

public class MypageServiceImpl implements IMypageService {

	private static IMypageService mypgService;
	
	private IMypageDao mypgDao;
	
	private MypageServiceImpl() {
		mypgDao = MypageDaoImpl.getInstance();
	}
	
	public static IMypageService getInstance() {
		if (mypgService == null) {
			mypgService = new MypageServiceImpl();
		}
		return mypgService;
	}
	
	@Override
	public int updateMember(MemberVO mv) {
		int cnt = mypgDao.updateMember(mv);
		return cnt;
	}

	@Override
	public int deleteMember(MemberVO mv) {
		int cnt = mypgDao.deleteMember(mv);
		return cnt;
	}

	@Override
	public int updateIns(InsVO iv) {
		int cnt = mypgDao.updateIns(iv);
		return cnt;
	}

	@Override
	public MemberVO getMember(String memId) {
		return mypgDao.getMember(memId);
	}

	@Override
	public InsVO getIns(String memId) {
		return mypgDao.getIns(memId);
	}

	@Override
	public List<DonateVO> getMyDonate(String memId) {
		return mypgDao.getMyDonate(memId);
	}
}
