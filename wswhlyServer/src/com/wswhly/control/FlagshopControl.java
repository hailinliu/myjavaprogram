package com.wswhly.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.wswhly.bean.flagshop.FlagshopInfoReqBean;
import com.wswhly.bean.flagshop.FlagshopListReqBean;
import com.wswhly.bean.flagshop.FlagshopListRespBean;
import com.wswhly.dao.FlagshopDao;
import com.wswhly.util.StringUtil;

@Controller
@Transactional
public class FlagshopControl{

	private static final Logger logger = Logger.getLogger(FlagshopControl.class);
	
	@Autowired
	private FlagshopDao flagshopDao;//注入报名DAO
	/**
	 * 旗舰商家信息
	 */
	@RequestMapping("/FlagshopInfo")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void flagshopInfo(HttpServletRequest request,HttpServletResponse response){
		FlagshopInfoReqBean flagshopreq = (new Gson()).fromJson(request.getAttribute("data").toString(), FlagshopInfoReqBean.class);
		try{
			int count = flagshopDao.addFlagshopInfo(flagshopreq);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(count)));
		}catch (Exception e) {
			logger.error("flagshop Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 旗舰商家
	 */
	@RequestMapping("/FlagshopList")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void FlagshopList(HttpServletRequest request,HttpServletResponse response){
		FlagshopListReqBean flagshopreq = (new Gson()).fromJson(request.getAttribute("data").toString(), FlagshopListReqBean.class);
		FlagshopListRespBean flagshopListRespBean  =new FlagshopListRespBean();
		try{
			List<FlagshopListRespBean.Flagshop> list = flagshopDao.queryFlagshopList(flagshopreq.getPageno(), flagshopreq.getPagesize());
			if(list.size()>0){
				flagshopListRespBean.setList(list);
			}
		
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(flagshopListRespBean)));
		}catch (Exception e) {
			logger.error("FlagshopList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 *旗舰商家
	 */
	@RequestMapping("/Flagshop")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void Flagshop(HttpServletRequest request,HttpServletResponse response){
		FlagshopListReqBean flagshopreq = (new Gson()).fromJson(request.getAttribute("data").toString(), FlagshopListReqBean.class);
		FlagshopListRespBean flagshopListRespBean  =new FlagshopListRespBean();
		try{
			List<FlagshopListRespBean.Flagshop> list = flagshopDao.queryFlagshop(flagshopreq.getUserid());
			if(list.size()>0){
				flagshopListRespBean.setList(list);
			}
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(flagshopListRespBean)));
		}catch (Exception e) {
			logger.error("CurrentEnroll Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}

}
