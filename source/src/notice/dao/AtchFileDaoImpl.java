package notice.dao;

import java.util.List;

import common.QueryDao;
import notice.vo.AtchFileVO;



public class AtchFileDaoImpl extends QueryDao implements IAtchFileDao {

	private static IAtchFileDao atchFileDao;
	
	private AtchFileDaoImpl() {
		
	}
	
	public static IAtchFileDao getInstance() {
		if(atchFileDao == null) {
			atchFileDao = new AtchFileDaoImpl();
		}
		return atchFileDao;
	}
	
	
//	@Override
//	public int insertAtchFile(AtchFileVO atchFileVO) {
//
//		return insert("notice.insertNotice", atchFileVO); //atchFile.xml의 id와 파라미터 입력함
//	}
	
	
	

	@Override
	public List<AtchFileVO> getAtchFileList(String noticeId) {
		
		return selectList("notice.getAtchFileList", noticeId);
	}
	
	
	@Override
	public int insertAtchFileDetail(List<AtchFileVO> atchFileVO) {

		return insert("notice.insertAtchFileDetail", atchFileVO);
	}

	
	@Override
	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO) {
		
		return selectOne("notice.getAtchFileDetail", atchFileVO); 
	}

	@Override
	public int selectAtchId() {
		return countList("notice.selectAtchId");
	}

}
