package com.hyzm.forward.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hyzm.forward.service.dg.DaiGouService;
import com.hyzm.util.ComplTosimple;
import com.taobao.api.internal.util.WebUtils;
/**
 * 代购
 * @author Administrator
 *
 */
@Controller
@Transactional
public class DaiGouControl {
	@Autowired
	private DaiGouService daigouservice;
	
	/**
	 * 添加代购
	 */
	@RequestMapping("/DaiGou_AddDaigou")
	public void DaiGou_AddDaigou(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Map<String, String> map=new HashMap<String, String>();
			map.put("name",request.getParameter("name"));
			map.put("sex",request.getParameter("sex"));
			map.put("mobile",request.getParameter("mobile"));
			map.put("weixin",request.getParameter("weixin"));
			map.put("address",request.getParameter("address"));
			map.put("email",request.getParameter("email"));
			map.put("colloctionurl",request.getParameter("colloctionurl"));
			map.put("cjaction",request.getParameter("cjaction"));
			map.put("pmfs",request.getParameter("pmfs"));
			map.put("lotsid",request.getParameter("lotsid"));
			int num=daigouservice.AddDaigou(map);
			if(num==1){
				out.print("0000");
			}else{
				out.print("添加代购失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("添加代购失败！");
		}
	}
	
	
	/**
	 * 获取佳士得信息
	 */
	
	@RequestMapping("/getJSD")
	public void getJSD(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html"); 
		PrintWriter out = null;
		try
		{
			out = response.getWriter();
			String url="http://119.254.110.231:8088/ny/home/index.php/Activity/auction_list/id/"+request.getParameter("zcid")+"/type/1/limit/"+request.getParameter("loadAmount")+"/from/"+request.getParameter("from");
			String s=WebUtils.doPost(url, null, 30000, 30000);
			  s=s.replaceAll("/ny/", "http://119.254.110.231:8088/ny/");
		      s=s.replace("class=\"row row-black-bg\"", "style=\"display:none;\"");
		      s=s.replaceAll("class=\"footer-nav\"", " class=\"footer-nav\" style=\"display: none;\"");
		      s=s.replaceAll("class=\"col-xs-12 footer\"", " class=\"col-xs-12 footer\" style=\"display: none;\"");
		      String path = request.getContextPath();
				String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		      s=s.replace("http://119.254.110.231:8088/ny/home/index.php",basePath+"redirect?p=daigou/JSD2&url=");
			   out.print(new ComplTosimple().complTosimple(s));
		} catch (MalformedURLException e)
		{
			e.printStackTrace();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}
	@RequestMapping("/gotoapmaiyuzhan")
	public String gotoapmaiyuzhan(HttpServletRequest request,HttpServletResponse response){
		return "pmyuzhan/pmyuzhan";
	}
	
	@RequestMapping("/gotojsd")
	public String gotojsd(HttpServletRequest request,HttpServletResponse response){
		return "daigou/JSD";
	}
}
