package com.hh.ssm.util;

import java.util.UUID;

/**
 * 说明：生成UUID(32位不重复的字符串)
 * 作者：FH Admin Q313596790
 *
 */
public class UuidUtil {

	public static String get32UUID() {
		String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");
		return uuid;
	}

	public static void main(String[] args) {
		System.out.println(get32UUID());
	}
}
