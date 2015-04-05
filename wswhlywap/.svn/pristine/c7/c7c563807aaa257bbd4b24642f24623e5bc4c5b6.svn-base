package com.hyzm.util;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

public class SendSmsL {
	/**
	 * 短信发送接口
	 */
	public  static  Map<String, String> SendSMS(String mobiles,String con) {
		try {
			HttpClient client = new HttpClient();

			client.getParams().setParameter(
					HttpMethodParams.HTTP_CONTENT_CHARSET, "utf-8");

			PostMethod post = new PostMethod(
					"http://115.29.44.189:8080/sms/smsInterface.do");

			NameValuePair username = new NameValuePair("username", "睿人文化传媒");
			NameValuePair password = new NameValuePair("password", "111111");
			NameValuePair mobile = new NameValuePair("mobile",mobiles);
			NameValuePair content = new NameValuePair("content",con+"【卫视文化乐园】");
			Map<String, String> resultmap = new LinkedHashMap<String, String>();
			post.setRequestBody(new NameValuePair[] { username, password,
					mobile, content });
			client.executeMethod(post);
			String result =post.getResponseBodyAsString();//"发送成功！";// 
			post.releaseConnection();
			if(result.indexOf("成功")>=0){
				resultmap.put("errorcode", "0");
			}else{
				resultmap.put("errorcode", "1");
			}
			resultmap.put("time",StringUtil.date2String(new Date(),"yyyy-MM-dd HH:mm:ss") );
			resultmap.put("errordescription", con);
			resultmap.put("msgcount", "0");
			return resultmap;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
