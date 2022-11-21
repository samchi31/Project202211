package qna.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import member.dao.MemberDaoImpl;
import notice.vo.NoticeVO;
import qna.dao.IQnaDao;
import qna.dao.QnaDaoImpl;
import qna.vo.QnaVO;


public class QnaServiceImpl implements IQnaService{
	
	private static IQnaService adminQnaService;
	private IQnaDao adminQnaDao;
	
	private static QnaServiceImpl service;
	private IQnaDao dao;
	
	
	
	
	// PAGINATION
	public static QnaServiceImpl getService() {
		if(service == null) service = new QnaServiceImpl();
		return service;
	}
//	
//	
	@Override
	public int countList() {
		
		int cnt = 0;
		
		try {
			cnt = dao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	//2 프라이빗
	private QnaServiceImpl() {
		adminQnaDao = QnaDaoImpl.getInstance();
		dao = QnaDaoImpl.getInstance();
	}
	
	
	
	
	
	
	
	
	//3 객체(인스턴스)는 내부에서 생성해서 이 생성된 객체를 반환하기 위한 메서드
	public static IQnaService getInstance() {
		
		if(adminQnaService == null) {
			adminQnaService = new QnaServiceImpl();
		}
		
		return adminQnaService;
		
	}
	

	
	
	
	@Override
	public List<QnaVO> selectAllAdmin(Map<String,Object> map) {

		List<QnaVO> adminQnaList = adminQnaDao.selectAllAdmin(map);
		
		return adminQnaList;
	}
	
	
	
	
	@Override
	public List<QnaVO> selectAllMember(Map<String,Object> map) {
		
		List<QnaVO> adminQnaList = adminQnaDao.selectAllMember(map);
		
		return adminQnaList;
	}
	
	
	@Override
	public QnaVO getAdminQna(String adminQnaId) {
		
		return adminQnaDao.getAdminQna(adminQnaId);
		
	}

	
	
	@Override
	public int updateAnswer(QnaVO qv) {
		
		int cnt = adminQnaDao.updateAnswer(qv);
		return cnt;
	}
	
	
	
	@Override
	public QnaVO getAdminQnaId(String adminQnaId) {
		
		return adminQnaDao.getAdminQnaId(adminQnaId);
		
	}
	
	
	@Override
	public int registerMemberQna(QnaVO qv) {
		
		int cnt = adminQnaDao.registerMemberQna(qv);
		return cnt;
	}
	

}
