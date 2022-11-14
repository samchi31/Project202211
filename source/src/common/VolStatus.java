package common;

public enum VolStatus {
	PLANNED("모집 예정"),
	RECRUITING("모집 중"),
	FINISHED("모집 완료");
	
	String kor = "";
	
	VolStatus( String kor){
		this.kor = kor;
	}
	
	public String getKorName() {
		return kor;
	}
	
	public static VolStatus getVolStatusEnum(String fromJsp) {
		VolStatus volStatus = null;
		for (VolStatus volStatusId : VolStatus.values()) {
			if(volStatusId.getKorName().equals(fromJsp)) {
				volStatus = volStatusId;
				break;
			} 
		}
		return volStatus;
	}
	
//	public static String getKorName(String kor) {
//		String temp = "";
//		for (VolStatus volStatus : VolStatus.values()){
//			if (volStatus.getKorName().equals(kor)) {
//				temp = volStatus.getKorName();
//			} else {
//				temp = "잘못된 입력";
//			}
//		}
//		return temp;
//	}
//	
//	public static String getVolStatus(String kor) {
//		for (VolStatus volStatus : VolStatus.values()){
//			if (volStatus.getKorName().equals(kor)) {
//				return volStatus.getKey();
//			} 
//		}
//		return "그럴 리는 없겠지만 얘 모집 현 잘못 넣었음";
//	}
//	
//	public VolStatus getFieldName(String kor) {
//		for (VolStatus volStatus : VolStatus.values()){
//			if (volStatus.getKorName().equals(kor)) {
//				return volStatus;
//			}
//		}
//		return null;
//	}
//
}
