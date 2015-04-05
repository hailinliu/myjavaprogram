package com.wswhly.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.wswhly.dao.FlagShopBaseInfoDao;
import com.wswhly.util.StringUtil;

@Controller
public class FlagShopBaseInfoControl {
	private static final Logger logger = Logger.getLogger(CollenctionControl.class);

	@Autowired
	private FlagShopBaseInfoDao dao;
	@RequestMapping("/getFlagShopBaseInfoList")
	public void getFlagShopBaseInfoList(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("count", dao.queryFlagShopBaseInfoListCount(where.get("name").toString(), where.get("type").toString()));
			data.put("list", dao.queryFlagShopBaseInfoList(Integer.valueOf(where.get("pageno").toString()), Integer.valueOf(where.get("pagesize").toString()),where.get("name").toString(), where.get("type").toString()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("FlagShopBaseInfoDaoList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "Î´Öª ´íÎó"));
		}
	}
	@RequestMapping("/getFlagShopBaseInfoNews")
	public void getFlagShopBaseInfoNews(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("count", dao.queryFlagShopBaseInfoNewsCount(where.get("flagshopbaseinfoid").toString(), where.get("style").toString(), where.get("recommend").toString()));
			data.put("list", dao.queryFlagShopBaseInfoNews(Integer.valueOf(where.get("pageno").toString()), Integer.valueOf(where.get("pagesize").toString()),where.get("flagshopbaseinfoid").toString(), where.get("style").toString(), where.get("recommend").toString()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getFlagShopBaseInfoNews Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "Î´Öª´íÎó"));
		}
	}
	@RequestMapping("/getFlagShopBaseInfoById")
	public void getFlagShopBaseInfoById(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data=dao.queryFlagShopBaseInfoById(where.get("id").toString());
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getFlagShopBaseInfoById Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "Î´Öª´íÎó"));
		}
	}
	@RequestMapping("/getNews")
	public void getNews(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data=dao.queryNews(Long.valueOf(where.get("id").toString()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getNews Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "Î´Öª´íÎó"));
		}
	}
	@RequestMapping("/getNextNews")
	public void getNextNews(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data=dao.queryNextNews(Long.valueOf(where.get("id").toString()),where.get("style").toString());
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getNextNews Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "Î´Öª´íÎó"));
		}
	}
	@RequestMapping("/getPrevNews")
	public void getPrevNews(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data=dao.queryPrevNews(Long.valueOf(where.get("id").toString()),where.get("style").toString());
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("queryPrevNews Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "Î´Öª´íÎó"));
		}
	}
	@RequestMapping("/getFlagShopBaseInfoByuserId")
	public void getFlagShopBaseInfoByuserId(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data=dao.queryFlagShopBaseInfoByuserId(where.get("userid").toString());
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getFlagShopBaseInfoByuserId Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "Î´Öª´íÎó"));
		}
	}
}
