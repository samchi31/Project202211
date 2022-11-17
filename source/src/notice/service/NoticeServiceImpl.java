package notice.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import notice.dao.INoticeDao;
import notice.dao.NoticeDaoImpl;
import notice.vo.AtchFileVO;
import notice.vo.NoticeVO;

public class NoticeServiceImpl implements INoticeService {

	// 1
	private static INoticeService noticeService;

	private INoticeDao noticeDao;

	// 2 프라이빗
	private NoticeServiceImpl() {
		noticeDao = NoticeDaoImpl.getInstance();
	}

	// 3 객체(인스턴스)는 내부에서 생성해서 이 생성된 객체를 반환하기 위한 메서드
	public static INoticeService getInstance() {

		if (noticeService == null) {
			noticeService = new NoticeServiceImpl();
		}

		return noticeService;

	}

	@Override
	public List<NoticeVO> selectAllMember(Map<String, Object> map) {

		List<NoticeVO> noticeList = noticeDao.selectAllMember(map);

		return noticeList;
	}

	// 삭제
	@Override
	public int removeNotice(String noticeId) {

		int cnt = noticeDao.DeleteNotice(noticeId); // noticeDao.DeleteNotice 메소드의 noticeId값을 cnt에 담음

		return cnt;

	}

	// 등록
	@Override
	public int registerNotice(NoticeVO nv, List<AtchFileVO> atchFileVOList) {
//		// 파일서비스 객체 생성하기
//		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
//
//		// 1) notice 테이블에 insert
//		// before(nv) : {"noticeId":"","memId":"a001"...
//		// after(nv) : {"noticeId":"8","memId":"a001"...
//		int cnt = noticeDao.insertNotice(nv);
//
//		// 2) notice_atch 테이블에 다중 insert
////		List<AtchFileVO> atchFileVOList = nv.getAtchFileVOList();
////		List<AtchFileVO> list = new ArrayList<AtchFileVO>();
//
//		for (int i = 0; i < atchFileVOList.size(); i++) {
//			atchFileVOList.get(i).setAtchId(nv.getNoticeId());
//			atchFileVOList.get(i).setAtchSn(i + 1);
//		}
////		noticeDao.insertAtchFileDetail(list);
//		return fileService.insertNoticeAtch(atchFileVOList);
		
		///////////////////////////////////////////////////////////////////////////////
		int cnt = noticeDao.insertNotice(nv);
		
		if(atchFileVOList!=null) {
			for (int i = 0; i < atchFileVOList.size(); i++) {
				atchFileVOList.get(i).setAtchId(nv.getAtchId());
				atchFileVOList.get(i).setAtchSn(i + 1);
			}
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
//			nv.setAtchId(atchFileVOList.get(0).getAtchId());
//			nv.setAtchId(Integer.toString(fileService.selectAtchId()));
			cnt += fileService.insertNoticeAtch(atchFileVOList);
		}
		return cnt;		
		///////////////////////////////////////////////////////////////////////////////
	}

	// 수정 - get
	@Override
	public NoticeVO selectNotice(String noticeId) {

		return noticeDao.selectNotice(noticeId);

	}

	@Override
	public int modifyNotice(NoticeVO nv, List<AtchFileVO> atchFileVOList) {
		if(atchFileVOList != null) {
			int cnt = noticeDao.updateNoticeAndAtch(nv);
			
			for (int i = 0; i < atchFileVOList.size(); i++) {
				atchFileVOList.get(i).setAtchId(nv.getAtchId());
				atchFileVOList.get(i).setAtchSn(i + 1);
			}
			
			// 파일서비스 객체 생성하기
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			cnt = fileService.insertNoticeAtch(atchFileVOList);
		} else {
			noticeDao.updateNotice(nv);
		}
		
		return 0;
	}

	@Override
	public NoticeVO getNotice(String noticeId) {

		return noticeDao.getNotice(noticeId);

	}

	@Override
	public int countList() {
		return noticeDao.countList();
	}

}
