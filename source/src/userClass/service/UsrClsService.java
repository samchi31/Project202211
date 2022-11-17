package userClass.service;

import userClass.dao.UsrClsDao;
import userClass.vo.ReplyVO;
import userClass.vo.UsrClsVO;

import java.util.List;
import java.util.Map;

import userClass.dao.IUsrClsDao;

public class UsrClsService implements IUsrClsService{
	private IUsrClsDao dao;
	private static UsrClsService service;
	private UsrClsService() {
		dao = UsrClsDao.getInstance();
	}
	public static IUsrClsService getInstance() {
		if(service == null) {
			service = new UsrClsService();
		}
		return service;
	}
	
	@Override
	public List<UsrClsVO> selectAllDesc(Map<String, Object> map) {
		return dao.selectAllDesc(map);
	}
	
	@Override
	public int countList() {
		return dao.countList();
	}
	
	@Override
	public UsrClsVO getOneClassDetail(String classId) {
		// 조회수 추가
		updateViews(classId);
		return dao.getOneClassDetail(classId);
	}
	
	@Override
	public int updatePostRemove(String classId) {
		return dao.updatePostRemove(classId);
	}
	
	@Override
	public int updateViews(String classId) {
		return dao.updateViews(classId);
	}
	
	@Override
	public int insertPost(UsrClsVO usrClsVO) {
		return dao.insertPost(usrClsVO);
	}
	
	@Override
	public int updatePost(UsrClsVO usrClsVO) {
		return dao.updatePost(usrClsVO);
	}
	@Override
	public List<ReplyVO> selectReplyAll(String classId) {
		return dao.selectReplyAll(classId);
	}
	
	@Override
	public int insertReply(ReplyVO replyVO) {
		return dao.insertReply(replyVO);
	}
	@Override
	public int updateReplyRemove(String replyId) {
		return dao.updateReplyRemove(replyId);
	}	
	
	
}
