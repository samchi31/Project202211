package common;

public enum ClsCategory {
	Education("Education","교육"),
	Sports("Sports","체육"),
	Music("Music","음악"),
	Design("Design","디자인"),
	Language("Language","언어");
	
	ClsCategory(String name, String kor){
		this.name = name;
		this.kor = kor;
	}
	String name = "";
	String kor = "";
}
