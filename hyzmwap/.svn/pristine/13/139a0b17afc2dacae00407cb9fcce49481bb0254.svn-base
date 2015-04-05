package com.hyzm.forward.service;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Map;
import net.sf.json.JSONObject;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.util.EntityUtils;

import com.google.gson.Gson;
import com.hyzm.bean.MessageReqBean;
import com.hyzm.bean.MessageRespBean;
import com.hyzm.util.PropertiesUtil;
import com.hyzm.util.ZLibUtil;

public abstract class MessageResponse {
	
	public MessageRespBean getMessageResponse(Object req, String url) throws Exception {
		try {
			MessageReqBean message = new MessageReqBean();
			message.setPlat(1);
			if (req != null) {
				message.setContent(new Gson().toJson(req));
			}
			String post = doPost(PropertiesUtil.getPropertiesValue("httpRequestUrl")+"wswhlyServer/" + url, new Gson().toJson(message));
			System.out.println(post);
			MessageRespBean respBean = new Gson().fromJson(post, MessageRespBean.class);
			return respBean;
		} catch (Exception e) {
			throw new RuntimeException("获取数据异常："+e.getMessage());
		}
	}
	
	public Object getMessageResponse(Object req, Object resp, String url) throws Exception {
		try {
			MessageReqBean message = new MessageReqBean();
			message.setPlat(1);
			if (req != null) {
				message.setContent(new Gson().toJson(req));
			}
			String post = doPost(PropertiesUtil.getPropertiesValue("httpRequestUrl")+"wswhlyServer/" + url, new Gson().toJson(message));
			MessageRespBean respBean = new Gson().fromJson(post, MessageRespBean.class);
			if ("0000".equals(respBean.getErrorcode())) {
				resp = new Gson().fromJson(respBean.getContent(), resp.getClass());
			}
			return resp;
		} catch (Exception e) {
			throw new RuntimeException("获取数据异常："+e.getMessage());
		}
	}

	public  Map<String,Object> getMessageResponsetoMap(Object req,String url)throws Exception {
		try {
			MessageReqBean message = new MessageReqBean();
			message.setPlat(1);
			if (req != null) {
				message.setContent(new Gson().toJson(req));
			}
			String post = doPost(PropertiesUtil.getPropertiesValue("httpRequestUrl")+"wswhlyServer/" + url, new Gson().toJson(message));
			MessageRespBean respBean = new Gson().fromJson(post, MessageRespBean.class);
			if ("0000".equals(respBean.getErrorcode())) {
				JSONObject fromObject = JSONObject.fromObject(respBean.getContent());
				
				return fromObject;
			}
		} catch (Exception e) {
			throw new RuntimeException("获取数据异常："+e.getMessage());
		}
		return null;
	}
	/**
	 * 获取服务器数据
	 * @param url
	 * @param json
	 * @return
	 */
	public String doPost(String url, String json) {
		BasicHttpParams httpParameters = new BasicHttpParams();
		HttpConnectionParams.setConnectionTimeout(httpParameters, 30000);
		HttpConnectionParams.setSoTimeout(httpParameters, 30000);
		HttpClient httpClient = new DefaultHttpClient();
		HttpPost httpPost = new HttpPost(url);
		try{
			byte[] b = ZLibUtil.compress(json.getBytes("UTF-8"));
			ByteArrayEntity entity = new ByteArrayEntity(b);
			httpPost.setEntity(entity);
			HttpResponse response = httpClient.execute(httpPost);
			if (response.getStatusLine().getStatusCode() == 200) {
				InputStream is = response.getEntity().getContent();
				try{
					ByteArrayOutputStream out = new ByteArrayOutputStream();
					byte[] c = new byte[1024];
					int i = 0;
					while ((i = is.read(c, 0, 1024)) > 0) {
						out.write(c, 0, i);
					}
			        return new String(ZLibUtil.decompress(out.toByteArray()),"UTF-8");
				}catch (Exception e) {
					return e.getMessage();
				}finally{
					if(is != null){  
	                    is.close();
	                }  
	                EntityUtils.consume(entity);  
				}
			}else { 
                return "HTTP: "+ response.getStatusLine().getStatusCode(); 
            } 
		}catch (Exception e) {
			return e.getMessage();
		}finally{
			httpPost.releaseConnection();
			(httpClient.getConnectionManager()).shutdown();
		}
	}

}
