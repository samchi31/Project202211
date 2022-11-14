package volunteer;

import common.VolCategory;

public class Test {
	public static void main(String[] args) {
		int star = 2;
		String contentment = "☆☆☆☆☆";
		for (int k = 0; k < star; k++) {
			contentment = contentment.replaceFirst("☆", "★");
		}
		System.out.println(contentment);
		
		for(VolCategory volCategory : VolCategory.values()) {
			System.out.println(volCategory);
		}
	}
}
