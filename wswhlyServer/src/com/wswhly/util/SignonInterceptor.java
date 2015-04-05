package com.wswhly.util;

import java.io.ByteArrayOutputStream;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.http.entity.ContentType;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.google.gson.Gson;
import com.wswhly.bean.MessageReqBean;



public class SignonInterceptor extends HandlerInterceptorAdapter {
	
	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) {
		try{
			request.setAttribute("starttime", System.currentTimeMillis());
			ServletInputStream servletInputStream = request.getInputStream();
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			byte[] b = new byte[1024];
			int i = 0;
			while ((i = servletInputStream.read(b, 0, 1024)) > 0) {
				out.write(b, 0, i);
			}
	        byte[] req = out.toByteArray();
			String data = new String(ZLibUtil.decompress(req),"UTF-8");
			MessageReqBean message = new Gson().fromJson(data, MessageReqBean.class);
			request.setAttribute("plat", message.getPlat());
			request.setAttribute("userid", message.getUserid());
			request.setAttribute("data", message.getContent());
			return true;
		}catch (Exception e) {
			logger.error("ERROR"+e.getMessage());
			returnmsg(request, response, StringUtil.Error("9999", "程序异常"));
		}
		return false;
	}
	
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) throws Exception {
		//String requesturl = request.getRequestURI();
		if(ex != null){
			logger.info("异常----"+ex.getMessage());
			returnmsg(request, response, StringUtil.Error("9999", "处理失败"));
		}else{
			returnmsg(request, response, (String)request.getAttribute("resultjson"));
		}
		
	}
	
	private void returnmsg(HttpServletRequest request,HttpServletResponse response,String msg){
		try{
			response.setHeader("Content-Encoding", "gzip");
			byte[] b = ZLibUtil.compress(msg.getBytes("UTF-8"));
			response.getOutputStream().write(b);
		}catch (Exception e) {
			e.printStackTrace();
		}
		/*logger.info("返回数据----"+msg);
		long starttime = Long.valueOf(request.getAttribute("starttime").toString());
		long usetime = System.currentTimeMillis()-starttime;
		logger.info("总耗时----"+usetime+"ms");*/
	}
}