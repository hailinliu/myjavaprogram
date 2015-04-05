package com.wswhly.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

	public static String FormatSimpleDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	
	public static String FormatDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}
	
	public static Date parseDate(String str){
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return sdf.parse(str);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static Date parseSimpleDate(String str){
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			return sdf.parse(str);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String addDay(String date,int day){
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal=Calendar.getInstance();
			cal.setTime(sdf.parse(date));
			cal.add(Calendar.DAY_OF_MONTH, day);
			return sdf.format(cal.getTime()); 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String addMinute(String date,int minute){
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Calendar cal=Calendar.getInstance();
			cal.setTime(sdf.parse(date));
			cal.add(Calendar.MINUTE, minute);
			return sdf.format(cal.getTime()); 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String addMinute(int minute){
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Calendar cal=Calendar.getInstance();
			cal.setTime(new Date());
			cal.add(Calendar.MINUTE, minute);
			return sdf.format(cal.getTime()); 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String addyear(int year){
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal=Calendar.getInstance();
			cal.setTime(new Date());
			cal.add(Calendar.YEAR, year);
			return sdf.format(cal.getTime()); 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {
		System.out.println(addyear(-1));
	}
}
