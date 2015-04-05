package com.hyzm.util;

import java.security.MessageDigest;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {

	private static MessageDigest digest = null;

	public static String getRandom() {
		Random random = new Random();
		return String.valueOf(100000 + random.nextInt(899999));
	}

	public static String converString(Object str) {
		if (str == null)
			return "";
		return str.toString();
	}

	public static Integer converInteger(Object str) {
		if (str == null)
			return 0;
		return Integer.valueOf(str.toString());
	}

	public static Double converDouble(Object str) {
		if (str == null)
			return 0.0;
		return Double.valueOf(str.toString());
	}
	
	public static Float converFloat(Object str) {
		if (str == null)
			return 0f;
		return Float.valueOf(str.toString());
	}

	public static Long converLong(Object str) {
		if (str == null)
			return 0l;
		return Long.valueOf(str.toString());
	}

	public static Date converDate(Object str) {
		if (str == null)
			return parseDate("2000-01-01 00:00:00", "yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return parseDate(sdf.format(str), "yyyy-MM-dd HH:mm:ss");
	}

	public static String date2String(Date date, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}

	public static Date parseDate(String source) {
		String format = "yyyy-MM-dd HH:mm:ss";
		return parseDate(source, format);
	}

	public static Date parseDate(String source, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		try {
			return sdf.parse(source);
		} catch (Exception e) {
			return null;
		}
	}

	public static final synchronized String hash(String data) {
		if (digest == null)
			try {
				digest = MessageDigest.getInstance("MD5");
			} catch (Exception e) {}
	    try {
			digest.update(data.getBytes("utf-8"));
		} catch (Exception e) {}
		return encodeHex(digest.digest());
	}
	
	public static final String encodeHex(byte bytes[])
    {
        StringBuffer buf = new StringBuffer(bytes.length * 2);
        for(int i = 0; i < bytes.length; i++)
        {
            if((bytes[i] & 0xff) < 16)
                buf.append("0");
            buf.append(Long.toString(bytes[i] & 0xff, 16));
        }

        return buf.toString();
    }
	
	public static String getKilometer(String num){
		DecimalFormat df = new DecimalFormat("##.#");
		double temp = Double.parseDouble(num);
		double m = 1000;
        double result = temp/m;		
		return df.format(result);
	}
	
	public static String getCollectionnum(String code){
		Random random = new Random();
		int x = random.nextInt(89999999)+10000000;
		return code+x;
	}
	
	public static String getStrings(String[] str){
		StringBuffer sb = new StringBuffer();
		for(String s:str){
			sb.append(s).append(",");
		}
		return sb.toString();
	}
	
}
