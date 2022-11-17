package member.service;

import java.util.List;

import member.vo.InsVO;
import member.vo.MemberVO;

public interface IMemberService {

	/**
	 * 회원등록하기 위한 메서드
	 * @param mv DB에 등록할 데이터가 저장된 MemberVO객체
	 * @return 회원 등록이 성공하면 1 이상의 값이 반환됨
	 */
	public int registMember(MemberVO mv);
	
	/**
	 * 회원등록하기 위한 메서드
	 * @param iv DB에 등록할 데이터가 저장된 InsVO객체
	 * @return 회원 등록이 성공하면 1 이상의 값이 반환됨
	 */
	public int registIns(InsVO iv);
	
	/**
	 * 주어진 회원 ID가 존재하는지 여부를 알아내기 위한 메서드
	 * @param memId 확인대상 회원ID
	 * @return 해당 회원ID가 있으면 true, 없으면 false
	 */
	public MemberVO checkId(MemberVO mv);
	
	/**
	 * 주어진 이름과 번호와 일치하는 회원의 아이디를 알아내기 위한 메서드
	 * @param memId 확인대상 회원ID
	 * @return 해당 회원ID가 있으면 true, 없으면 false
	 */
	public MemberVO searchId(MemberVO mv);
	
	/**
	 * 주어진 ID와 이메일과 일치하는 회원의 아이디를 알아내기 위한 메서드
	 * @param memId 확인대상 회원ID
	 * @return 해당 회원ID가 있으면 true, 없으면 false
	 */
	public MemberVO searchPw(MemberVO mv);
	
	/**
	 * 주어진 회원이 존재하는지 여부를 알아내기 위한 메서드
	 * @param mv 확인대상 회원ID, PW
	 * @return 해당 조건에 맞는 회원정보
	 */
	public MemberVO checkMember(MemberVO mv);
	
	
	/**
	 * 회원정보를 수정하기 위한 메서드
	 * @param mv update할 회원정보가 들어있는 MemberVO객체
	 * @return 작업성공 : 1, 작업실패 : 0
	 */
	public int updateMember(MemberVO mv);
	
	/**
	 * 회원ID를 매개변수로 받아서 해당 회원 정보를 삭제하는 메서드
	 * @param memId 삭제할 회원ID
	 * @return 작업성공 : 1, 작업실패 : 0
	 */
	public int removeMember(String memId);
	
}

