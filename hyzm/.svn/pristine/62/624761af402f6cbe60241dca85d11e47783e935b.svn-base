package com.hyzm.forward.service.proficient.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.bean.proficient.ProficientInfoReqBean;
import com.hyzm.bean.proficient.ProficientInfoRespBean;
import com.hyzm.bean.proficient.ProficientListReqBean;
import com.hyzm.bean.proficient.ProficientListRespBean;
import com.hyzm.bean.proficient.ProficientListRespBean.Proficient;
import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.proficient.ProficientService;

@Service
public class ProficientServiceImpl extends MessageResponse implements ProficientService {
	
	private final Logger log = Logger.getLogger(this.getClass());

	public List<Proficient> getProficientList() throws Exception {
		log.info("获取专家信息列表");
		List<Proficient> list = null;
		try {
			ProficientListReqBean proficient = new ProficientListReqBean();
			proficient.setPageno(1);
			proficient.setPagesize(4);
			list = ((ProficientListRespBean) getMessageResponse(proficient, new ProficientListRespBean(), "ProficientList")).getList();
		} catch (Exception e) {
			log.error("获取专家列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<Proficient>():list;
	}
	
	public List<Proficient> getProficientListIndex() throws Exception {
		log.info("获取专家信息列表");
		List<Proficient> list = null;
		try {
			ProficientListReqBean proficient = new ProficientListReqBean();
			proficient.setPageno(1);
			proficient.setPagesize(4);
			list = ((ProficientListRespBean) getMessageResponse(proficient, new ProficientListRespBean(), "ProficientListIndex")).getList();
		} catch (Exception e) {
			log.error("获取专家列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<Proficient>():list;
	}

	public List<Proficient> getProficientList(int currentPage, int pageSize)
			throws Exception {
		log.info("获取专家信息列表");
		List<Proficient> list = null;
		try {
			ProficientListReqBean proficient = new ProficientListReqBean();
			proficient.setPageno(currentPage);
			proficient.setPagesize(pageSize);
			list = ((ProficientListRespBean) getMessageResponse(proficient, new ProficientListRespBean(), "ProficientList")).getList();
		} catch (Exception e) {
			log.error("获取专家列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<Proficient>():list;
	}

	public Proficient getOneProficient(long id) throws Exception {
		log.info("获取单条专家");
		Proficient pro = null;
		try {
			ProficientInfoReqBean proficient = new ProficientInfoReqBean();
			proficient.setId(id);
			pro = ((ProficientInfoRespBean)getMessageResponse(proficient, new ProficientInfoRespBean(), "ProficientInfo")).getProficient();
		} catch (Exception e) {
			log.error("获取单条专家异常："+e.getMessage());
			e.printStackTrace();
		}
		return pro;
	}

	public Map<String,Object> getProficientListForMap(Map<String,String> where) throws Exception {
		log.info("获取专家信息列表");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(where,"ProficientListForMap");
			return data;
		} catch (Exception e) {
			log.error("查询专家异常："+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

}
