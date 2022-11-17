package userClass.dao;

import java.util.List;
import java.util.Map;

import userClass.vo.ReplyVO;
import userClass.vo.UsrClsVO;

public interface IUsrClsDao {
	public List<UsrClsVO> selectAllDesc(Map<String, Object> map);
	
	public int countList();
	
	public UsrClsVO getOneClassDetail(String classId);
	
	public int updatePostRemove(String classId);
	
	public int updateViews(String classId);
	
	public int insertPost(UsrClsVO usrClsVO);
	
	public int updatePost(UsrClsVO usrClsVO);
	
	public List<ReplyVO> selectReplyAll(String classId); 
	
	public int insertReply(ReplyVO replyVO);
	
	public int updateReplyRemove(String replyId);
}
