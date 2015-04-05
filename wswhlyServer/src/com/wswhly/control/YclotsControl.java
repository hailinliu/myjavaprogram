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
import com.wswhly.bean.yc.YcCountBean;
import com.wswhly.bean.yc.YcactionReqBean;
import com.wswhly.bean.yc.YcactionRespBean;
import com.wswhly.bean.yc.YcinstitutionsRespBean;
import com.wswhly.bean.yc.YclotsListReqBean;
import com.wswhly.bean.yc.YclotsListRespBean;
import com.wswhly.bean.yc.YclotsReqBean;
import com.wswhly.bean.yc.YclotsRespBean;
import com.wswhly.bean.yc.YcspecialReqBean;
import com.wswhly.bean.yc.YcspecialRespBean;
import com.wswhly.dao.YclotsDao;
import com.wswhly.util.StringUtil;

@Controller
public class YclotsControl {
	
	private static final Logger logger = Logger.getLogger(CollenctionControl.class);

	@Autowired
	private YclotsDao yclotsdao;
	
	@RequestMapping("/YclotsListByspecialID")
	public void YclotsListByspecialID(HttpServletRequest request,HttpServletResponse response){
		YclotsListReqBean yclotsreq = (new Gson()).fromJson(request.getAttribute("data").toString(), YclotsListReqBean.class);
		YclotsListRespBean yclotsresp=new YclotsListRespBean();
		try {
			yclotsresp.setCount(yclotsdao.queryYclotsByspecialIDCount(yclotsreq.getSpecialID()));
			yclotsresp.setList(yclotsdao.queryYclotsByspecialID(yclotsreq.getSpecialID(), yclotsreq.getPageno(), yclotsreq.getPagesize()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(yclotsresp)));
		} catch (Exception e) {
			logger.error("YclotsList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "Î´Öª´íÎó"));
		}
	}
	@RequestMapping("/YclotsByid")
	public void YclotsListByid(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
//		YclotsReqBean yclotsreq = (new Gson()).fromJson(request.getAttribute("data").toString(), YclotsReqBean.class);
		YclotsRespBean yclotsresp=new YclotsRespBean();
		try {
			yclotsresp.setYclots(yclotsdao.queryYclotsByid(where.get("id")));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(yclotsresp)));
		} catch (Exception e) {
			logger.error("YclotsList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "Î´Öª´íÎó"));
		}
	}
	@RequestMapping("/YcspecialByactionID")
	public void YcspecialByactionID(HttpServletRequest request,HttpServletResponse response){
		YcspecialReqBean ycspecialreq = (new Gson()).fromJson(request.getAttribute("data").toString(), YcspecialReqBean.class);
		YcspecialRespBean ycspecialresp=new YcspecialRespBean();
		try {
			ycspecialresp.setCount(yclotsdao.queryYcspecialByactionidCount(ycspecialreq.getActionid()));
			ycspecialresp.setList(yclotsdao.queryYcspecialByactionID(ycspecialreq.getActionid(),  ycspecialreq.getPageno(), ycspecialreq.getPagesize()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(ycspecialresp)));
		} catch (Exception e) {
			logger.error("CollectionList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "Î´Öª´íÎó"));
		}
	}
	@RequestMapping("/YcactionByins_id")
	public void YcactionByins_id(HttpServletRequest request,HttpServletResponse response){
		YcactionReqBean ycactionreq = (new Gson()).fromJson(request.getAttribute("data").toString(), YcactionReqBean.class);
		YcactionRespBean ycactionresp=new YcactionRespBean();
		try {
			ycactionresp.setCount(yclotsdao.queryYcactionByins_idCount(ycactionreq.getIns_id()));
			ycactionresp.setList(yclotsdao.queryYcactionByins_id(ycactionreq.getIns_id(),  ycactionreq.getPageno(), ycactionreq.getPagesize()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(ycactionresp)));
		} catch (Exception e) {
			logger.error("CollectionList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "Î´Öª´íÎó"));
		}
	}
	@RequestMapping("/Ycinstitutions")
	public void Ycinstitutions(HttpServletRequest request,HttpServletResponse response){
		YcinstitutionsRespBean ycinstitutions=new YcinstitutionsRespBean();
		try {
			ycinstitutions.setCount(yclotsdao.queryYcinstitutionsCount());
			ycinstitutions.setList(yclotsdao.queryYcinstitutions());
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(ycinstitutions)));
		} catch (Exception e) {
			logger.error("CollectionList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "Î´Öª´íÎó"));
		}
	}
	@RequestMapping("/Yccount")
	public void Yccount(HttpServletRequest request,HttpServletResponse response){
		YcCountBean ycount = yclotsdao.getYcCount();
		try {
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(ycount)));;  

		} catch (Exception e) {
			logger.error("CollectionList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "Î´Öª´íÎó"));
		}
	}
}
