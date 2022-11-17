package member.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import member.dao.IMemberDao;
import member.dao.MemberDaoImpl;
import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.InsVO;
import member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {

private static IMemberService memService;
	
	private IMemberDao memDao;
	
	private MemberServiceImpl() {
		memDao = MemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		if (memService == null) {
			memService = new MemberServiceImpl();
		}
		return memService;
	}
	
	@Override
	public int registMember(MemberVO mv) {
		int cnt = memDao.insertMember(mv);
		if (cnt > 0) {
			// 메일발송기능 호출
		}
		return cnt;
	}

	
	@Override
	public int registIns(InsVO iv) {
		int cnt = memDao.insertIns(iv);
		if (cnt > 0) {
		}
		return cnt;
	}
	
	@Override
	public MemberVO checkMember(MemberVO mv) {
		mv = memDao.checkMember(mv);
		return mv;
	}

	@Override
	public int updateMember(MemberVO mv) {
		int cnt = memDao.updateMember(mv);
		return cnt;
	}

	@Override
	public int removeMember(String memId) {
		int cnt = memDao.deleteMember(memId);
		return cnt;
	}

	@Override
	public MemberVO checkId(MemberVO mv) {
		mv = memDao.checkId(mv);
		return mv;
	}

	@Override
	public MemberVO searchId(MemberVO mv) {
		mv = memDao.searchId(mv);
		return mv;
	}
	
	@Override
	public MemberVO searchPw(MemberVO mv) {
		mv = memDao.searchPw(mv);
		return mv;
	}

	
	
}
