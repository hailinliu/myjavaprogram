package com.wswhly.util.sendsmsl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

public class SendSmsL {
	public static void main(String[] args) {
		SendSMS("13261356132,13261356132","鐢ㄦ埛ID:213鍏呭�浜�00");
	}
	public  static  Map<String, String> SendSMS(String mobiles,String con) {
		try {
			HttpClient client = new HttpClient();

			client.getParams().setParameter(
					HttpMethodParams.HTTP_CONTENT_CHARSET, "utf-8");

			PostMethod post = new PostMethod(
					"http://115.29.44.189:8080/sms/smsInterface.do");

			NameValuePair username = new NameValuePair("username", "鐫夸汉閫氱煡");
			NameValuePair password = new NameValuePair("password", "123456");
			NameValuePair mobile = new NameValuePair("mobile",mobiles);
			NameValuePair content = new NameValuePair("content",con+"銆愬崼瑙嗘枃鍖栦箰鍥�");
			Map<String, String> resultmap = new LinkedHashMap<String, String>();
			post.setRequestBody(new NameValuePair[] { username, password,
					mobile, content });
			client.executeMethod(post);
			String result =post.getResponseBodyAsString();
			post.releaseConnection();
			if(result.indexOf("<resultcode>0</resultcode>")>=0||result.indexOf("鎴愬姛")>=0||result.indexOf("鍖呭惈灞�)>=0){
				resultmap.put("errorcode", "0");
			}else{
				resultmap.put("errorcode", "1");
			}
			SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			resultmap.put("time",sf.format(new Date()) );
			resultmap.put("errordescription", con);
			resultmap.put("msgcount", "0");
			return resultmap;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
