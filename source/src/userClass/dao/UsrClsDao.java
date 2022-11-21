package userClass.dao;

import java.util.List;
import java.util.Map;

import common.QueryDao;
import userClass.vo.ReplyVO;
import userClass.vo.UsrClsVO;

public class UsrClsDao extends QueryDao implements IUsrClsDao {
	private static IUsrClsDao dao;
	private UsrClsDao() {	}
	public static IUsrClsDao getInstance() {
		if(dao == null) {
			dao = new UsrClsDao();
		}
		return dao;
	}
	
	@Override
	public List<UsrClsVO> selectAllDesc(Map<String, Object> map) {
		return selectList("userClass.selectAllDesc", map);
	}
	
	@Override
	public int countList(String category) {
		return (int)selectOne("userClass.countList", category);
	}
	
	@Override
	public UsrClsVO getOneClassDetail(String classId) {
		return selectOne("userClass.selectOnePost",classId);
	}
	
	@Override
	public int updatePostRemove(String classId) {
		return update("userClass.updatePostRemove", classId);
	}
	
	@Override
	public int updateViews(String classId) {
		return update("userClass.updateViews", classId);
	}
	
	@Override
	public int insertPost(UsrClsVO usrClsVO) {
		return insert("userClass.insertPost", usrClsVO);
	}
	
	@Override
	public int updatePost(UsrClsVO usrClsVO) {
		return update("userClass.updatePost", usrClsVO);
	}
	
	@Override
	public List<ReplyVO> selectReplyAll(String classId) {
		return selectList("userClass.selectReplyAll",classId);
	}
	@Override
	public int insertReply(ReplyVO replyVO) {
		return insert("userClass.insertReply", replyVO);
	}
	@Override
	public int updateReplyRemove(String replyId) {
		return update("userClass.updateReplyRemove", replyId);
	}
	
	@Override
	public List<UsrClsVO> selectMyClassAll(String memId) {
		return selectList("userClass.selectMyClassAll",memId);
	}
}
