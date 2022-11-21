package notice.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import notice.vo.AtchFileVO;
import notice.vo.NoticeVO;



/**
 * 첨부파일 저장을 위한 공통 서비스용 인터페이스
 */
public interface IAtchFileService {
	
	/**
	 * 첨부파일 목록 경로 저장한 리스트
	 * @param req - Part객체를 꺼내기 위한 요청객체
	 * @return
	 */
	public int saveAtchFileList(HttpServletRequest req,NoticeVO noticeVO);
	

	
	
	/**
	 * 첨부파일 세부정보 조회하기
	 * @param atchFileVO
	 * @return
	 */
	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO);
	
	
	
	/**
	 * 첨부파일 목록 조회하기
	 * @param atchFileVO
	 * @return
	 */
	public List<AtchFileVO> getAtchFileList(String noticeId);
	
//	
//	/**
//	 * 파일 저장
//	 * @param atchFileVOList
//	 * @return
//	 */
//	public int insertNoticeAtch(List<AtchFileVO> atchFileVOList);
	
	/**
	 * 가장 최근 저장 첨부파일 가져오기
	 * @return
	 */
	public int selectAtchId();
	
	public NoticeVO updateNoticeNAtchFileList(HttpServletRequest req, NoticeVO noticeVO);
	
}
