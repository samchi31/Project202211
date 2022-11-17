package notice.service;

import java.util.List;
import java.util.Map;

import notice.vo.AtchFileVO;
import notice.vo.NoticeVO;



public interface INoticeService {
	

	public List<notice.vo.NoticeVO> selectAllMember(Map<String,Object> map);
//	public List<NoticeVO> selectAllMember(Map<String,String> map);
	
	
	public int removeNotice(String noticeId);
	
	
//	public int registerNotice (NoticeVO nv);
	
	
	
	public NoticeVO selectNotice(String noticeId);
	
	
	public int modifyNotice(NoticeVO nv, List<AtchFileVO> atchFileVOList);
	
	
	public NoticeVO getNotice(String noticeId);

	/**
	 * notice 전체 갯수 select
	 * @return
	 */
	public int countList();


	public int registerNotice(NoticeVO nv, List<AtchFileVO> atchFileVOList);
	
	
}
	

