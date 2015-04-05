package com.wswhly.util.sendsmsv;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

import org.dom4j.Document;   
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;   
import org.dom4j.Element;   

import com.wswhly.util.CommonUtil;

public class SendSmsV {
	
	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	
	private static String username = "cf_ruiren123";
	
	private static String password = "ruiren123";
	
	public static Map<String, String> SendSMS(String mobile,String content) {
		
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url); 
			
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");


		NameValuePair[] data = {//提交短信
			    new NameValuePair("account", username), 
			    new NameValuePair("password", CommonUtil.hash(password)),
			    new NameValuePair("mobile", mobile), 
			    new NameValuePair("content", content),
		};
		method.setRequestBody(data);		
		Map<String, String> result = new LinkedHashMap<String, String>();
		try {
			SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			client.executeMethod(method);	
			
			String SubmitResult = method.getResponseBodyAsString();
					
			System.out.println(SubmitResult);
			if(SubmitResult!=null&&(SubmitResult.trim()=="连接失败"||"连接失败".equals(SubmitResult.trim()))){
				result.put("errorcode", "-1");
				result.put("time",sf.format(new Date()) );
				result.put("errordescription", "链接失败");
				result.put("msgcount", "0");
				return result;
			}
			Document doc = DocumentHelper.parseText(SubmitResult); 
			Element root = doc.getRootElement();

			String code = root.elementText("code");	
			String msg = root.elementText("msg");	
			String smsid = root.elementText("smsid");	
			
			if(code.equals("2")){
				result.put("errorcode", "0");
			}else{
				result.put("errorcode", code);
			}
			result.put("time",sf.format(new Date()) );
			result.put("errordescription", msg);
			result.put("msgcount", smsid);
			return result;
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return result;
	}
	
	public static void main(String[] args) {
		Map<String, String> map = SendSmsV.SendSMS("13261356132", "您的验证码是999999，时效180秒。");
		Iterator<Entry<String, String>> it = map.entrySet().iterator();
		while(it.hasNext()){
			System.out.println(it.next());
		}
	}
	
}