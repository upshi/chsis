package top.chsis.util;

import java.util.UUID;

public class StringUtil {
	
	public static String getUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	public static void main(String[] args) {
		System.out.println(getUUID());
	}

}
