package com.hb.Frank;

import javax.servlet.http.HttpServletRequest;

public class Devices {
	public static String info(HttpServletRequest request){
		String userAgent = (String) request.getHeader("User-Agent");
		String browser = "";		
		
		if (userAgent.indexOf("Trident") > 0 || userAgent.indexOf("MSIE") > 0) {
		 browser = "IE";
		} else if (userAgent.indexOf("Opera") > 0) {
		 browser = "Opera";
		} else if (userAgent.indexOf("Firefox") > 0) {
		 browser = "Firefox";
		} else if (userAgent.indexOf("Safari") > 0) {
		 if (userAgent.indexOf("Chrome") > 0) {
		  browser = "Chrome";
		 } else {
		  browser = "Safari";
		 }
		}
		
		return "접속됨 : "+browser;
	}
}
