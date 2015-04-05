package com.hyzm.forward.service.yc.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.bean.yc.YcCountBean;
import com.hyzm.bean.yc.YcactionReqBean;
import com.hyzm.bean.yc.YcactionRespBean;
import com.hyzm.bean.yc.YcactionRespBean.Ycaction;
import com.hyzm.bean.yc.YcinstitutionsRespBean;
import com.hyzm.bean.yc.YcinstitutionsRespBean.Ycinstitutions;
import com.hyzm.bean.yc.YclotsListReqBean;
import com.hyzm.bean.yc.YclotsListRespBean;
import com.hyzm.bean.yc.YclotsReqBean;
import com.hyzm.bean.yc.YclotsRespBean;
import com.hyzm.bean.yc.YclotsListRespBean.Yclots;
import com.hyzm.bean.yc.YcspecialReqBean;
import com.hyzm.bean.yc.YcspecialRespBean;
import com.hyzm.bean.yc.YcspecialRespBean.Ycspecial;
import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.yc.YclotsService;
@Service
public class YclotsServiceImpl extends MessageResponse implements YclotsService {
	private final Logger log = Logger.getLogger(this.getClass());
	public Yclots queryYclotsByid(String id) {
		log.info("获取拍品");
		Yclots col = null;
		try {
			YclotsReqBean yclots = new YclotsReqBean();
			yclots.setId(id);
			YclotsRespBean respBean = (YclotsRespBean) getMessageResponse(
					yclots, new YclotsRespBean(), "YclotsByid");
			col = respBean.getYclots();
		} catch (Exception e) {
			log.error("获取拍品异常：" + e.getMessage());
			e.printStackTrace();
		}
		return col == null ? new YclotsListRespBean().new Yclots(): col;
	}

	@Override
	public Map<String, Object> queryYclotsByspecialID(String specialID, int pageno,
			int pagesize) {
		log.info("获取专场下拍品列表");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Yclots> list = null;
		int count = 0;
		try {
			YclotsListReqBean yclots = new YclotsListReqBean();
			yclots.setPageno(pageno);
			yclots.setPagesize(pagesize);
			yclots.setSpecialID(specialID);
			YclotsListRespBean respBean = (YclotsListRespBean)getMessageResponse(yclots, new YclotsListRespBean(), "YclotsListByspecialID");
			count = respBean.getCount();
			list = respBean.getList();
			map.put("count", count);
			map.put("list", list==null?new ArrayList<Yclots>():list);
		} catch (Exception e) {
			log.error("获取专场下拍品列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public Map<String, Object> queryYcspecialByactionID(String actionid,
			int pageno, int pagesize) {
		log.info("获取拍卖会下专场列表");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Ycspecial> list = null;
		int count = 0;
		try {
			YcspecialReqBean ycspecial = new YcspecialReqBean();
			ycspecial.setActionid(actionid);
			ycspecial.setPageno(pageno);
			ycspecial.setPagesize(pagesize);
			YcspecialRespBean respBean = (YcspecialRespBean)getMessageResponse(ycspecial, new YcspecialRespBean(), "YcspecialByactionID");
			count = respBean.getCount();
			list = respBean.getList();
			map.put("count", count);
			map.put("list", list==null?new ArrayList<Ycspecial>():list);
		} catch (Exception e) {
			log.error("获取拍卖会下专场列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public Map<String, Object> queryYcactionByins_id(String ins_id, int pageno,
			int pagesize) {
		log.info("获取拍卖机构下拍卖会列表列表");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Ycaction> list = null;
		int count = 0;
		try {
			YcactionReqBean ycaction = new YcactionReqBean();
			ycaction.setIns_id(ins_id);
			ycaction.setPageno(pageno);
			ycaction.setPagesize(pagesize);
			YcactionRespBean respBean = (YcactionRespBean)getMessageResponse(ycaction, new YcactionRespBean(), "YcactionByins_id");
			count = respBean.getCount();
			list = respBean.getList();
			map.put("count", count);
			map.put("list", list==null?new ArrayList<Ycaction>():list);
		} catch (Exception e) {
			log.error("获取拍卖机构下拍卖会列表列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public Map<String, Object> queryYcinstitutions() {
		log.info("获取拍卖机构下拍卖会列表列表");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Ycinstitutions> list = null;
		int count = 0;
		try {
			YcinstitutionsRespBean respBean = (YcinstitutionsRespBean)getMessageResponse("",new YcinstitutionsRespBean(),"Ycinstitutions");
			count = respBean.getCount();
			list = respBean.getList();
			map.put("count", count);
			map.put("list", list==null?new ArrayList<Ycinstitutions>():list);
		} catch (Exception e) {
			log.error("获取拍卖机构下拍卖会列表列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public YcCountBean queryYccount() {
		log.info("获取数量");
		YcCountBean resp = null;
		try {
			 resp = (YcCountBean) getMessageResponse(
					"", new YcCountBean(), "Yccount");
		} catch (Exception e) {
			log.error("获取数量异常：" + e.getMessage());
			e.printStackTrace();
		}
		return resp ;
	}


}
