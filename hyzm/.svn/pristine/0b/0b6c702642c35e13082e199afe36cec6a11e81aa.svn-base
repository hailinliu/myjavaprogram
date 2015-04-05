package com.hyzm.forward.control;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.forward.service.dic.DicService;
import com.hyzm.util.IpUtil;
import com.hyzm.util.ZLibUtil;

@Controller
@Transactional
public class DicControl {
	@Autowired
	DicService dicservice;
	
	/**
	 * 获取地区
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getDicaddress")
	public void getDicaddress(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> map;
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html"); 
		PrintWriter out = null;
		try {
			out = response.getWriter();
			map = dicservice.getDicaddress(Integer.valueOf(request.getParameter("parentcode").toString()));
			List<Map<String, Object>> list=(List<Map<String, Object>>) map.get("list");
			String result=JSONArray.fromObject(list).toString();
			out.print(result);
		} catch (NumberFormatException e) {
			out.print("程序异常");
			e.printStackTrace();
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据ip查询所在区域
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getAddressByIp")
	public void getAddressByIp(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html"); 
		PrintWriter out = null;
		try {
			out = response.getWriter();
			   String res="";
			   String str = IpUtil.getJsonContent("http://ip.taobao.com/service/getIpInfo.php?ip=140.240.32.153");//+IpUtil.getIp(request));
		       JSONObject obj = JSONObject.fromObject(str);
		       JSONObject obj2 =  (JSONObject) obj.get("data");
		       Integer  code = (Integer ) obj.get("code");
		       if(code.equals(0)){
		    	   if(obj2.get("county_id")!=""&&obj2.get("county_id")!="-1"&&!obj2.get("county_id").equals("-1")){
		    		   res= obj2.get("county_id").toString();
		    	   }else if(obj2.get("city_id")!=""&&obj2.get("city_id")!="-1"&&!obj2.get("city_id").equals("-1")){
		    		   res=  obj2.get("city_id").toString();
		    	   }else if(obj2.get("region_id")!=""&&obj2.get("region_id")!="-1"&&!obj2.get("region_id").equals("-1")){
		    		   res=  obj2.get("county_id").toString();
		    	   }
		       }else{
		    	   res =  "9999";
		       }
		       out.print(res);
		} catch (Exception e) {
			out.print("9999");
			e.printStackTrace();
		}
	}
	/**
	 * 查询快递
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getCourier")
	public void getCourier(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html"); 
		PrintWriter out = null;
		try
		{
			out = response.getWriter();
			String sturl="http://api.kuaidi100.com/api?id=92f4ab1489720db0&com="+request.getParameter("com")+"&nu="+request.getParameter("nu")+"&show="+request.getParameter("show")+"&muti="+request.getParameter("muti")+"&order="+request.getParameter("order");
			URL url= new URL(sturl);
			URLConnection con=url.openConnection();
			 con.setAllowUserInteraction(false);
			   InputStream urlStream = url.openStream();
			   String type = con.guessContentTypeFromStream(urlStream);
			   String charSet=null;
			   if (type == null)
			    type = con.getContentType();

			   if (type == null || type.trim().length() == 0 || type.trim().indexOf("text/html") < 0)
			    return ;
			   if(type.indexOf("charset=") > 0)
			    charSet = type.substring(type.indexOf("charset=") + 8);
			   byte b[] = new byte[10000];
			   int numRead = urlStream.read(b);
			  String content = new String(b, 0, numRead);
			   while (numRead != -1) {
			    numRead = urlStream.read(b);
			    if (numRead != -1) {
			     //String newContent = new String(b, 0, numRead);
			     String newContent = new String(b, 0, numRead, charSet);
			     content += newContent;
			    }
			   }
			   urlStream.close();
			   out.print(content);
		} catch (MalformedURLException e)
		{
			out.print("9999");
			e.printStackTrace();
		} catch (IOException e)
		{
			out.print("9999");
			e.printStackTrace();
		}
	}
	
}
