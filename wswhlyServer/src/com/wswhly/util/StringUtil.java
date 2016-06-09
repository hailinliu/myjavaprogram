package com.wswhly.util;

import java.io.File;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import sun.misc.BASE64Decoder;

import com.google.gson.Gson;
import com.wswhly.bean.MessageRespBean;


public class StringUtil {


	public static String Error(String errorcode, String errorinfo) {
		MessageRespBean message = new MessageRespBean();
		message.setErrorcode(errorcode);
		message.setErrorinfo(errorinfo);
		return (new Gson()).toJson(message);
	}

	public static String Success(String content) {
		MessageRespBean message = new MessageRespBean();
		message.setErrorcode("0000");
		message.setErrorinfo("");
		message.setContent(content);
		return (new Gson()).toJson(message);
	}
	
	public static boolean isNullOrisEmpty(Object str){
		if(str==null||str==""||str.equals("")){
			return true;
		}else{
			return false;
		}
	}
	
	public static List<String> getMapKey(Map<String, String> map){
		List<String> listkey=new ArrayList<String>();
		Iterator i=map.entrySet().iterator();
		while(i.hasNext()){
		Map.Entry e=(Map.Entry)i.next();
		listkey.add(e.getKey().toString());
		//System.out.println(e.getKey()+"="+e.getValue());
		}
		return listkey;
	}
	
	public static String converString(Object str){
		if(str == null)
			return "";
		return str.toString();
	}

	public static Long converLong(Object str){
		if(str == null)
			return 0l;
		return Long.valueOf(str.toString());
	}

	public static String replaceBlank(String str) {
		String dest = "";
		if (str != null) {
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
			Matcher m = p.matcher(str);
			dest = m.replaceAll("");
		}
		return dest;
	}


	public static String TransactSQLInjection(String sql) {
		if(sql == null || sql.equals(""))
			return "";
		return sql.replaceAll(".*([';]+|(--)+).*", " ");
	}

	public static double DoubleAdd(double dou1, double dou2) {
		return new BigDecimal(Double.toString(dou1)).add(
				new BigDecimal(Double.toString(dou2))).doubleValue();
	}

	public static double DoubleSubtract(double dou1, double dou2) {
		return new BigDecimal(Double.toString(dou1)).subtract(
				new BigDecimal(Double.toString(dou2))).doubleValue();
	}
	
	public static String getOrdernum(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Random random = new Random();  
		int x = random.nextInt(899999)+100000; 
		return sdf.format(new Date())+x;
	}
	
	public static String getEnrollnum(String cycle){
		Random random = new Random();
		int x = random.nextInt(899999)+100000;
		return cycle+"BM"+x;
	}
	
	public static String getVerifyCode(){
		Random random = new Random();
		int x = random.nextInt(899999)+100000;
		return x+"";
	}
	
	public static String getCollectionnum(){
		Random random = new Random();
		int x = random.nextInt(89999999)+10000000;
		return x+"";
	}
	
	public static String getVerifySMS(String verifycode){
		return "������֤����"+verifycode+"��ʱЧ180�롣";
	}//������֤���ǡ���������ʱЧ180�롣
	
	/*public static String getEnrollSMS(int count,double money,String code){
		return "��������"+count+"���ղ�Ʒ��֧����"+money+"Ԫ����������Ϊ"+code+"�������Ʊ��ܴ˶��ţ��ֳ�ƾ�豨���������ȷ�ϡ��������Ļ���԰��";
	}
	
	public static String getEnrollSMS(String str){
		return "������Я���������ղ�Ʒ����"+str+"������ѡ�ֳ����ɴ�������ŶӵȺ�ʱ�䡣�������Ļ���԰��";
	}*/
	
	public static String getEnrollSMS(int count,String code,String validdate){
		return "���ѱ���"+count+"����Ʒ������"+validdate.substring(5)+"׼ʱ��������ͨ����������һ�Ǻ�ѡ�ֳ�ƾ����"+code.substring(code.indexOf("BM")+2)+"��Ʊ������";
		//return "���ѱ���"+count+"����Ʒ������"+validdate.substring(5)+"׼ʱ����ѡ�ֳ���һ¥ƾ����"+code.substring(code.indexOf("BM")+2)+"��Ʊ������";
	}//���ѱ���������������Ʒ�����ڡ�������׼ʱ����ѡ�ֳ���һ¥ƾ���롾��������Ʊ������

	
	public static String getValidDate__s(String date,int count){
		String time = "16:00--17:00";
		int day = 0;
		if(count>0 && count<=40){
			time = " 09:00--10:00";
		}else if(count>40 && count<=90){
			time = " 10:00--11:00";
//		}else if(count>80 && count<=120){
//			//time = " 11:00--12:00";
		}else if(count>90 && count<=140){
			time = " 15:00--16:00";
		}else if(count>140 && count<=190){
			time = " 16:00--17:00";
		}else if(count>190 && count<=230){
			time = " 09:00--10:00";
			day = 1;
		}else if(count>230 && count<=280){
			time = " 10:00--11:00";
			day = 1;
//		}else if(count>280 && count<=320){
//			time = " 11:00--12:00";
//			day = 1;
		}else if(count>280 && count<=330){
			time = " 15:00--16:00";
			day = 1;
		}else if(count>330 && count<=380){
			time = " 16:00--17:00";
			day = 1;
		}
		return DateUtil.addDay(date, day) + time;
	}
	
	public static String getValidDate(String date,int count){
		String time = "16:00--17:00";
		int day = 0;
		if(count>0 && count<=100){
			time = " 09:00--10:00";
		}else if(count>100 && count<=200){
			time = " 10:00--11:00";
//		}else if(count>80 && count<=120){
//			//time = " 11:00--12:00";
		}else if(count>200 && count<=300){
			time = " 15:00--16:00";
		}else if(count>300 && count<=400){
			time = " 16:00--17:00";
		}else if(count>400 && count<=500){
			time = " 09:00--10:00";
			day = 1;
		}else if(count>500 && count<=600){
			time = " 10:00--11:00";
			day = 1;
//		}else if(count>280 && count<=320){
//			time = " 11:00--12:00";
//			day = 1;
		}else if(count>600 && count<=700){
			time = " 15:00--16:00";
			day = 1;
		}else if(count>700 && count<=800){
			time = " 16:00--17:00";
			day = 1;
		}
		return DateUtil.addDay(date, day) + time;
	}
	
	private final static String regxpForHtml = "<([^>]*)>"; // ����������<��ͷ��>��β�ı�ǩ   
	
	public static String filterHtml(String str) {   
        Pattern pattern = Pattern.compile(regxpForHtml);   
        Matcher matcher = pattern.matcher(str);   
        StringBuffer sb = new StringBuffer();   
        boolean result1 = matcher.find();   
        while (result1) {   
            matcher.appendReplacement(sb, "");   
            result1 = matcher.find();   
        }   
        matcher.appendTail(sb);   
        return sb.toString();   
    }
	
	public static void SetImageStr(String base64Code,
			String imgname) throws Exception {
		String path = new PropertiesUtil("config.properties").getProperties("uploadCollection");
		File out = new File(path);
		if (!out.exists()) {
			out.mkdirs();
		}
		String imgpath = path + File.separatorChar + imgname + ".jpg";
		byte[] buffer = new BASE64Decoder().decodeBuffer(base64Code);
		FileOutputStream out1 = new FileOutputStream(imgpath);
		out1.write(buffer);
		out1.close();
		ImageUtil.imageZip(imgname, path, 156, 142);
	}
	
	
  
}
