package com.wswhly.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.wswhly.dao.DaiGouDao;
import com.wswhly.util.StringUtil;
import com.wswhly.util.sendmail.SendMail;
/**
 * 代购
 * @author Administrator
 *
 */
@Controller
@Transactional
public class DaiGouControl {
	private static final Logger logger = Logger.getLogger(BaiBaoControl.class);
	@Autowired
	private DaiGouDao daigoudao;
	private String kfemail[]=new String[]{"529887775@qq.com","372901428@qq.com","3158656058@qq.com"};
	/**
	 * 添加代购
	 */
	@RequestMapping("/DaiGou_AddDaigou")
	public void DaiGou_AddDaigou(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", daigoudao.AddDaigou(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("DaiGou_AddDaigou Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	 
}
