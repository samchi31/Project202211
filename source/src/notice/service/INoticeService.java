package notice.service;

import java.util.List;
import java.util.Map;

import notice.vo.NoticeVO;



public interface INoticeService {
	

	public List<notice.vo.NoticeVO> selectAllMember(Map<String,Object> map);
//	public List<NoticeVO> selectAllMember(Map<String,String> map);
	
	
	public int removeNotice(String noticeId);
	
	
	public int registerNotice (NoticeVO nv);
	
	
	
	public NoticeVO getNoticeId(String noticeId);
	
	
	public int modifyNotice(NoticeVO nv);
	
	
	

	
	
	
}
	

