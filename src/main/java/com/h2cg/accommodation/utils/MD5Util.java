package com.h2cg.accommodation.utils;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

public class MD5Util {
	public String EncoderByMd5(String str) {
		Md5PasswordEncoder encoder = new Md5PasswordEncoder();
		encoder.setEncodeHashAsBase64(true);
		return encoder.encodePassword(str, null);
	}
}
