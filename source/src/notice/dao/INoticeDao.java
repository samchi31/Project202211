package notice.dao;

import java.util.List;
import java.util.Map;

import notice.vo.NoticeVO;



public interface INoticeDao {

	public List<NoticeVO> selectAllMember(Map<String,Object> map);

	
	public int DeleteNotice(String noticeId);
	
	public int insertNotice(NoticeVO nv);
	
	public NoticeVO selectNotice(String noticeId);
	
	public int updateNotice(NoticeVO nv);
	
	public NoticeVO getNotice(String noticeId);
	
	public int countList();
	
	public int updateNoticeAndAtch(NoticeVO noticeVO);
	
	public int insertOnlyNotice(NoticeVO noticeVO);
	
}
