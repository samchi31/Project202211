package common;

import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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
	String name;
	private final String kor;
	
	public String getKor() {
		return kor;
	}
	
	private static final Map<String, ClsCategory> BY_KOR =
            Stream.of(values()).collect(Collectors.toMap(ClsCategory::getKor, Function.identity()));
    public static ClsCategory valueOfKor(String kor) {
        return BY_KOR.get(kor);
    }

}
