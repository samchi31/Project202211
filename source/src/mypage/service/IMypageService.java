package mypage.service;

import java.util.List;

import donate.vo.DonateVO;
import member.vo.InsVO;
import member.vo.MemberVO;

public interface IMypageService {

	// 회원 수정
	public int updateMember(MemberVO mv);
	
	public int updateIns(InsVO iv);
	
	// 회원 삭제
	public int deleteMember(MemberVO mv);
	
	// 회원 조회
	public MemberVO getMember(String memId);
	
	public InsVO getIns(String memId);
	
	public List<DonateVO> getMyDonate(String memId);
}

