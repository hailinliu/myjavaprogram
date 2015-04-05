package com.hyzm.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;


public class DownloadImage {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		// http://img1.artron.net/auction/2014/art505833/d/art5058330601.jpg
		 download("http://www.iteye.com/images/user-logo-thumb.gif?1324994303", "511bi.jpg","c:\\image\\");
	}
	
	public static  int  download(String urlString, String filename,String savePath) {
		try {
			  // 构�?URL
		    URL url = new URL(urlString);
		    // 打开连接
		    URLConnection con = url.openConnection();
		    con.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
		    //设置请求超时�?s
		    con.setConnectTimeout(5*1000);
		    // 输入�?
		    HttpURLConnection httpUrlConnection  =  (HttpURLConnection) con;
		    if(httpUrlConnection.getResponseCode()!=403){
			    InputStream is = con.getInputStream();
			
			    // 1K的数据缓�?
			    byte[] bs = new byte[1024];
			    // 读取到的数据长度
			    int len;
			    // 输出的文件流
			   File sf=new File(savePath);
			   if(!sf.exists()){
				   sf.mkdirs();
			   }
			   OutputStream os = new FileOutputStream(sf.getPath()+"//"+filename);
			    // �?��读取
			    while ((len = is.read(bs)) != -1) {
			      os.write(bs, 0, len);
			    }
			    // 完毕，关闭所有链�?
			    os.close();
			    is.close();
			    return 1;
		    }else{
		    	return 0;
		    }
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	  
//	    return new Integer(httpUrlConnection.getResponseCode());
	} 

}
