package com.hyzm.test;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

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
import com.hyzm.util.ZLibUtil;

public class HttpClientTest {

	public static void main(String[] args) throws IllegalStateException,
			IOException {
		MessageReqBean message = new MessageReqBean();
		//message.setCityid("0371");
		message.setPlat(1);
		//message.setUserid(1l);
		message.setContent(new Gson().toJson(message));
		String post = doPost("http://127.0.0.1:8080/zzBusHttpServer/NewWeather",
				new Gson().toJson(message));
		System.out.println("Post:" + post);
		new Gson().fromJson(post, MessageRespBean.class);
	}

	public static String doPost(String url, String json) {
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
