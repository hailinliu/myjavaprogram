package com.hyzm.util;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtil {
	
	/**
	 * 以一定的格式获得字符串类型日期
	 * @param date
	 * @param format
	 * @return
	 */
	public static String getDateTime(Date date,String format){
		if(format == null || format.equals("")){
			format = "yyyy-MM-dd HH:mm:ss";
		}
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}
	
	/**
	 * 以一定的格式获得字日期类型日期
	 * @param date
	 * @param format
	 * @return
	 */
	public static Date getDateTime(String date,String format){
		if(format == null || format.equals("")){
			format = "yyyy-MM-dd HH:mm:ss";
		}
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date formatDate = null;
		try {
			formatDate = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return formatDate;
	}
	
	public static Integer isLateOrIsEarly(String date,String compareDate){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat resultsdf = new SimpleDateFormat("HH:mm:ss");
		Date formateDate = null;
		String tempDate = "";
		String resultDate = "";
		try {
			formateDate = sdf.parse(date);
			tempDate = sdf.format(formateDate);
			resultDate = tempDate.substring(11);
			if(resultsdf.parse(resultDate).getTime() < resultsdf.parse(compareDate).getTime()){
				return 1;
			}else{
				return 2;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 将短时间格式字符串转换为时间 yyyy-MM-dd
	 * 
	 * @param strDate
	 * @return
	 */
	public static Date strToDate(String strDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		ParsePosition pos = new ParsePosition(0);
		Date strtodate = formatter.parse(strDate, pos);
		return strtodate;
	}
	
	/**
	 * 判断是否润年
	 * 
	 * @param ddate
	 * @return
	 */
	public static boolean isLeapYear(String ddate) {
		/**
		 * 详细设计： 1.被400整除是闰年，否则： 2.不能被4整除则不是闰年 3.能被4整除同时不能被100整除则是闰年
		 * 3.能被4整除同时能被100整除则不是闰年
		 */
		Date d = strToDate(ddate);
		GregorianCalendar gc = (GregorianCalendar) Calendar.getInstance();
		gc.setTime(d);
		int year = gc.get(Calendar.YEAR);
		if ((year % 400) == 0)
			return true;
		else if ((year % 4) == 0) {
			if ((year % 100) == 0)
				return false;
			else
				return true;
		} else
			return false;
	}
	
	/**
	 * 获取一个月的最后一天
	 * 
	 * @param dat
	 * @return
	 */
	public static int getEndDateOfMonth(String dat) {// yyyy-MM-dd
		String month = dat.substring(5, 7);
		int mon = Integer.parseInt(month);
		if (mon == 1 || mon == 3 || mon == 5 || mon == 7 || mon == 8
				|| mon == 10 || mon == 12) {
			return 31;
		} else if (mon == 4 || mon == 6 || mon == 9 || mon == 11) {
			return 30;
		} else {
			if (isLeapYear(dat)) {
				return 29;
			} else {
				return 28;
			}
		}
	}
	
	public static String buling(Integer day){
		if(Integer.valueOf(day) < 10)
			return "0"+day;
		return day.toString();
	}
	
	public static String[] getAMonthDay(String start){
		String month = start.substring(0,8);
		int num = getEndDateOfMonth(start);
		String[] months = new String[num];
		for(Integer i=0;i<num;i++){
			months[i] = month+buling(i+1);
		}
		return months;
	}
	
	/**
	 * 获取n天前（后）日起
	 * @param day
	 * @return
	 */
	public static String getDate(Integer day){
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, day);
		String date = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
		return date;
	}
	/**
	 * 获取n天前（后）日起
	 * @param day
	 * @return
	 */
	public static String getDatefull(Integer day){
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, day);
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime());
		return date;
	}
	
	public static void main(String[] args) {
		System.out.println(getDatefull(-1));
//		for(int i=0;i<getAMonthDay("2013-05-01").length;i++){
//			System.out.println(getAMonthDay("2013-05-01")[i]);
//		}
	}

}
