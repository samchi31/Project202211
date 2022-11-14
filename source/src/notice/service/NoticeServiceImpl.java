package notice.service;

import java.util.List;
import java.util.Map;

import notice.dao.INoticeDao;
import notice.dao.NoticeDaoImpl;
import notice.vo.NoticeVO;



public class NoticeServiceImpl implements INoticeService{
	
	//1
	private static INoticeService noticeService;
	
	private INoticeDao noticeDao;
	
	
	
	//2 프라이빗
	private NoticeServiceImpl() {
		noticeDao = NoticeDaoImpl.getInstance();
	}
	
	//3 객체(인스턴스)는 내부에서 생성해서 이 생성된 객체를 반환하기 위한 메서드
	public static INoticeService getInstance() {
		
		if(noticeService == null) {
			noticeService = new NoticeServiceImpl();
		}
		
		return noticeService;
		
	}
	

	
	
	@Override
	public List<NoticeVO> selectAllMember(Map<String,Object> map) {

		List<NoticeVO> noticeList = noticeDao.selectAllMember(map);
		
		return noticeList;
	}

	
	
	//삭제
	@Override
	public int removeNotice(String noticeId) {
		
		int cnt = noticeDao.DeleteNotice(noticeId); //noticeDao.DeleteNotice 메소드의 noticeId값을 cnt에 담음
		
		return cnt;
		
	}

	
	//등록
	@Override
	public int registerNotice(NoticeVO nv) {
		
		int cnt = noticeDao.insertNotice(nv);
		return cnt;
	}


	
	
	//수정 - get
	@Override
	public NoticeVO getNoticeId(String noticeId) {
		
		return noticeDao.getNoticeId(noticeId);
		
	}

	
	
	@Override
	public int modifyNotice(NoticeVO nv) {
		
		int cnt = noticeDao.updateNotice(nv);
		
		return cnt;
	}

	
	
	
	
	
	
	
	
	
	
	
	

}
