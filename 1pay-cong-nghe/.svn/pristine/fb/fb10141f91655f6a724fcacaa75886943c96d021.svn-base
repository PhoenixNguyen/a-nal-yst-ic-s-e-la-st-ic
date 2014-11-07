package vn.onepay.dev.api;

import java.io.File;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;

class Test {
	public static void main(String[] args) throws Exception {
		File f = new File("/home/thuannh/Desktop/1PAY_Tong_hop_thanh_toan-30_1-8_2014.xls");
		String x = new String(Base64.encodeBase64(FileUtils.readFileToByteArray(f)), "UTF-8");
		System.out.println(x);
		
		String y = new String(Base64.decodeBase64(x), "UTF-8");
		System.out.println(y);;
	}
}