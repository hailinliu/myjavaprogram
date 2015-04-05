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
import com.wswhly.dao.DicDao;
import com.wswhly.util.StringUtil;

@Controller
@Transactional
public class DicControl {
	private static final Logger logger = Logger.getLogger(LylotsControl.class);
	@Autowired
	private DicDao dicdao;
	
	
	//根据父级id查询 下面的地区
	@RequestMapping("/getDicaddress")
	public void getDicaddress(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("list", dicdao.getDicaddress(Integer.valueOf(where.get("parentcode").toString())));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getDicaddress Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
}
