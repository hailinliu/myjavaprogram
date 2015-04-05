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
import com.wswhly.bean.proficient.ProficientInfoReqBean;
import com.wswhly.bean.proficient.ProficientInfoRespBean;
import com.wswhly.bean.proficient.ProficientListReqBean;
import com.wswhly.bean.proficient.ProficientListRespBean;
import com.wswhly.dao.ProficientDao;
import com.wswhly.util.StringUtil;

@Controller
public class ProficientControl {

	private static final Logger logger = Logger.getLogger(ProficientControl.class);
	
	@Autowired
	private ProficientDao proficientdao;
	
	/**
	 * 获取专家List
	 */
	@RequestMapping("/ProficientList")
	public void ProficientList(HttpServletRequest request,HttpServletResponse response){
		ProficientListReqBean Proficientreq = (new Gson()).fromJson(request.getAttribute("data").toString(), ProficientListReqBean.class);
		ProficientListRespBean Proficientresp = new ProficientListRespBean();
		try{
			Proficientresp.setCount(proficientdao.queryProficientCount());
			Proficientresp.setList(proficientdao.queryProficient(Proficientreq.getPageno(), Proficientreq.getPagesize()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(Proficientresp)));
		}catch (Exception e) {
			logger.error("ProficientList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 获取专家List
	 */
	@RequestMapping("/ProficientListForMap")
	public void ProficientListForMap(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("list", proficientdao.getProficientListForMap(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_getAttentionForList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 获取专家List
	 */
	@RequestMapping("/ProficientListIndex")
	public void ProficientListIndex(HttpServletRequest request,HttpServletResponse response){
		ProficientListReqBean Proficientreq = (new Gson()).fromJson(request.getAttribute("data").toString(), ProficientListReqBean.class);
		ProficientListRespBean Proficientresp = new ProficientListRespBean();
		try{
			Proficientresp.setCount(proficientdao.queryProficientCount());
			Proficientresp.setList(proficientdao.queryProficientIndex(Proficientreq.getPageno(), Proficientreq.getPagesize()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(Proficientresp)));
		}catch (Exception e) {
			logger.error("ProficientList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 获取专家详情
	 */
	@RequestMapping("/ProficientInfo")
	public void ProficientInfo(HttpServletRequest request,HttpServletResponse response){
		ProficientInfoReqBean Proficientreq = (new Gson()).fromJson(request.getAttribute("data").toString(), ProficientInfoReqBean.class);
		ProficientInfoRespBean Proficientresp = new ProficientInfoRespBean();
		try{
			Proficientresp.setProficient(proficientdao.queryProficient(Proficientreq.getId()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(Proficientresp)));
		}catch (Exception e) {
			logger.error("ProficientInfo Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
}
