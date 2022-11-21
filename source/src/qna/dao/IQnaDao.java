package qna.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import notice.vo.NoticeVO;
import qna.vo.QnaVO;



public interface IQnaDao {
	
	/**
	 * 관리자 페이지에 나오는 목록 - 아이디 상관없이 모든 게시글이 나옴
	 * @param map
	 * @return
	 */
	public List<QnaVO> selectAllAdmin(Map<String,Object> map);
	
	/**
	 * 회원 페이지에 나오는 목록 - 회원이 작성한 게시글만 나옴
	 * @param map
	 * @return
	 */
	public List<QnaVO> selectAllMember(Map<String,Object> map);

	/**
	 * 상세페이지에서 내용 가져오기
	 * @param adminQnaId
	 * @return
	 */
	public QnaVO getAdminQna(String adminQnaId);
	
	/**
	 * 답변 등록 시 anwser부분 업데이트됨
	 * @param qv
	 * @return
	 */
	public int updateAnswer(QnaVO qv);
	
	/**
	 * 아이디 가져오기
	 * @param adminQnaId
	 * @return
	 */
	public QnaVO getAdminQnaId(String adminQnaId);
	
	/**
	 * QNA 등록하기
	 * @param qv
	 * @return
	 */
	public int registerMemberQna(QnaVO qv);
	
	
	
//	//PAGINATION
	public int countList() throws SQLException;
//	//PAGINATION
	
	
	
//	public int DeleteNotice(String noticeId);
//	
//	
//	
//	public int updateNotice(NoticeVO nv);
//	

	

	
}
