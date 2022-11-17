package mypage.dao;

import common.QueryDao;
import member.vo.InsVO;
import member.vo.MemberVO;


	public class MypageDaoImpl extends QueryDao implements IMypageDao{

		
		private static IMypageDao mypgDao;
		private MypageDaoImpl() {
			
		}
		
		public static IMypageDao getInstance() {
			if (mypgDao == null) {
				mypgDao = new MypageDaoImpl();
			}
			return mypgDao;
		}
		
		@Override
		public int updateMember(MemberVO mv) {
			return update("member.updateMember", mv);
		}

		@Override
		public int deleteMember(MemberVO mv) {
			return update("member.deleteMember", mv);
		}

		@Override
		public int updateIns(InsVO iv) {
			return update("member.updateIns", iv);
		}

		@Override
		public MemberVO getMember(String memId) {
			return selectOne("member.selectMember", memId);
		}

		@Override
		public InsVO getIns(String memId) {
			return selectOne("member.selectIns", memId);
		}
	}

