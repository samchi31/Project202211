package common;

public enum VolCategory {
	CONVENIENCE("생활편의지원"),
	RESIENTIAL("주거환경"),
	COUNSEL("상담"),
	EDUCATION("교육"),
	MEDICAL("보건의료"),
	RURAL("농어촌"),
	CULTURE("문화행사"),
	ENVIRONMENT("환경보호"),
	ADMINISTRATION("행정보조"),
	SATETYTRAINING("안전훈련"),
	PUBLIC("공익"),
	GLOBAL("국제협력,해외"),
	MENTORING("멘토링"),
	ETC("기타"),
	Messing("골탕 먹이기 키킼ㅋ킼ㅋ"),
	Disaster("볼드모트가 쳐들어와요");
	
	String kor = "";
	
	VolCategory(String kor){
		this.kor = kor;
	}
	
	public String getKorName() {
		return kor;
	}

	public static VolCategory getVolCategoryEnum(String fromJsp) {
		VolCategory volCategory = null;
		for (VolCategory volCtId : VolCategory.values()) {
			if(volCtId.getKorName().equals(fromJsp)) {
				volCategory = volCtId;
				break;
			} 
		}
		return volCategory;
	}
	
//	public static String getKorName(String kor) {
//		for (VolCategory volCategory : VolCategory.values()) {
//			if(volCategory.getKorName().equals(kor)) {
//				return volCategory.getKorName();
//			}
//		}
//		return "DB에 잘못된 값이 입력되었다.";
//	}
//	
//	// setAttribute 시 사용하는 메서드 
//	public static String getVolCategory(String kor) {
//		for (VolCategory volCategory : VolCategory.values()){
//			if (volCategory.getKorName().equals(kor)) {
//				return volCategory.getKey();
//			} 
//		}
//		return "그럴 리는 없지만 애 카테고리 잘못 넣었다";
//	}
//	
//	public VolCategory getFieldName(String kor) {
//		for (VolCategory volCategory : VolCategory.values()){
//			if (volCategory.getKorName().equals(kor)) {
//				return volCategory;
//			}
//		}
//		return null;
//	}
}

