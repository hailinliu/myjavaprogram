package com.hyzm.forward.service.flagshop.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.flagshop.FlagshopInfoReqBean;
import com.hyzm.bean.flagshop.FlagshopListReqBean;
import com.hyzm.bean.flagshop.FlagshopListRespBean;
import com.hyzm.bean.flagshop.FlagshopListRespBean.Flagshop;
import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.flagshop.FlagshopService;

@Service
public class FlagshopServiceImpl extends MessageResponse implements FlagshopService {
	
	private final Logger log = Logger.getLogger(this.getClass());

	@Override
	public MessageRespBean FlagshopInfo(FlagshopInfoReqBean info)
			throws Exception {
		log.info("旗舰商家新增信息");
		MessageRespBean respBean = new MessageRespBean();
		try {
			respBean = getMessageResponse(info, "FlagshopInfo");
		} catch (Exception e) {
			log.error("报名异常："+e.getMessage());
			e.printStackTrace();
		}
		return respBean;
	}

	@Override
	public List<Flagshop> getFalgshopInfoList() throws Exception {
		log.info("获取旗舰商家列表");
		List<Flagshop> list = null;
		try {
			FlagshopListReqBean flagshop = new FlagshopListReqBean();
			flagshop.setPageno(1);
			flagshop.setPagesize(7);
			list = ((FlagshopListRespBean)getMessageResponse(flagshop, new FlagshopListRespBean(), "FlagshopList")).getList();
		} catch (Exception e) {
			log.error("获取旗舰商家列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<Flagshop>():list;
	}

	@Override
	public List<Flagshop> getFlagshopList(long userid) throws Exception {
		log.info("获取旗舰商家列表");
		List<Flagshop> list = null;
		try {
			FlagshopListReqBean flagshop = new FlagshopListReqBean();
			flagshop.setUserid(userid);
			list = ((FlagshopListRespBean)getMessageResponse(flagshop, new FlagshopListRespBean(), "Flagshop")).getList();
		} catch (Exception e) {
			log.error("获取旗舰商家列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<Flagshop>():list;
	}


}
