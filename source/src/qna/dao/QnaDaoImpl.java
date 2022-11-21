package qna.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import common.QueryDao;
import notice.vo.NoticeVO;
import qna.vo.QnaVO;
import utils.BatisUtil;


public class QnaDaoImpl extends QueryDao implements IQnaDao{

	//PAGINATION
	private static IQnaDao adminQnaDao;
	private SqlSession sqlSession;
	
	private QnaDaoImpl() {
		
		sqlSession = BatisUtil.getSqlSession();
	}
	
	
	public static IQnaDao getInstance() {
		if(adminQnaDao == null) {
			adminQnaDao = new QnaDaoImpl();
		}
		return adminQnaDao;
	}
	
	

	
	@Override
	public List<QnaVO> selectAllAdmin(Map<String,Object> map) {
		
		return selectList("qna.selectAllAdmin", map);
	}
	
	
	@Override
	public List<QnaVO> selectAllMember(Map<String,Object> map) {
		
		return selectList("qna.selectAllMember", map);
	}
	
	
	
	@Override
	public QnaVO getAdminQna(String adminQnaId) {

		return selectOne("qna.selectAdminQna", adminQnaId);
		
	}
	
	
	@Override
	public int updateAnswer(QnaVO qv) {
		
		return update("qna.updateAnswer", qv);
		
	}
	
	
	//수정
	@Override
	public QnaVO getAdminQnaId(String adminQnaId) {
		
		return selectOne("qna.getAdminQnaId", adminQnaId);
	}
	

	@Override
	public int registerMemberQna(QnaVO qv) {

		return insert("qna.registerMemberQna", qv);
		
	}
	
	
	
//	//PAGINATION
	@Override
	public int countList() throws SQLException {
		int cnt = sqlSession.selectOne("qna.countList");
		return cnt;
	}
//	//PAGINATION

}
