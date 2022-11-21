package userClass.service;

import java.util.List;
import java.util.Map;

import userClass.vo.ReplyVO;
import userClass.vo.UsrClsVO;

public interface IUsrClsService {
	
	/**
	 * 게시글 페이지에 맞춰 가져오기 최신순으로
	 * @param map 첫과 끝 게시글 인덱스 정보
	 * @return 페이지리스트
	 */
	public List<UsrClsVO> selectAllDesc(Map<String, Object> map);

	/**
	 * 페이지 전체 갯수 세기
	 * @return 
	 */
	public int countList(String category);
	
	/**
	 * 게시물 선택 시 상세정보 가져오기
	 * @param classId 선택한 게시물의 ID
	 * @return
	 */
	public UsrClsVO getOneClassDetail(String classId);
	
	/**
	 * 게시글 삭제 -> delete 속성을 'y'
	 * @param classId update할 게시글 ID
	 * @return
	 */
	public int updatePostRemove(String classId);
	
	/**
	 * 게시글 클릭 시 조회수 1 증가
	 * @param classId
	 * @return
	 */
	public int updateViews(String classId);
	
	/**
	 * 게시글 작성하기
	 * @param usrClsVO
	 * @return
	 */
	public int insertPost(UsrClsVO usrClsVO);
	
	/**
	 * 게시글 수정
	 * @param usrClsVO
	 * @return
	 */
	public int updatePost(UsrClsVO usrClsVO);
	
	/**
	 * 게시글의 댓글 가져오기
	 * @param classId
	 * @return
	 */
	public List<ReplyVO> selectReplyAll(String classId);
	
	/**
	 * 댓글 작성
	 * @param replyVO
	 * @return
	 */
	public int insertReply(ReplyVO replyVO);
	
	/**
	 * 댓글 삭제
	 * @param replyId
	 * @return
	 */
	public int updateReplyRemove(String replyId);
	
	/**
	 * 내가 작성한 모든 게시글
	 * @param memId
	 * @return
	 */
	public List<UsrClsVO> selectMyClassAll(String memId);
}
