package com.hyzm.forward.service.forums.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.forums.ForumsInfoReqBean;
import com.hyzm.bean.forums.ForumsListReqBean;
import com.hyzm.bean.forums.ForumsListRespBean;
import com.hyzm.bean.forums.ForumsListRespBean.Forums;
import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.forums.ForumsService;

@Service
public class ForumsServiceImpl extends MessageResponse implements ForumsService {
	
	private final Logger log = Logger.getLogger(this.getClass());

	@Override
	public MessageRespBean forumsInfo(ForumsInfoReqBean info)
			throws Exception {
		log.info("新增信息");
		MessageRespBean respBean = new MessageRespBean();
		try {
			respBean = getMessageResponse(info, "ForumsInfo");
		} catch (Exception e) {
			log.error("异常："+e.getMessage());
			e.printStackTrace();
		}
		return respBean;
	}

	@Override
	public List<Forums> getFalgshopInfoList() throws Exception {
		log.info("列表");
		List<Forums> list = null;
		try {
			ForumsListReqBean flagshop = new ForumsListReqBean();
			flagshop.setPageno(1);
			flagshop.setPagesize(7);
			//list = ((ForumsListReqBean)getMessageResponse(flagshop, new ForumsListReqBean(), "ForumsList")).getList();
		} catch (Exception e) {
			log.error("列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<Forums>():list;
	}

	@Override
	public List<Forums> getFlagshopList(long collectionid, String type) throws Exception {
		log.info("获取旗舰商家列表");
		List<Forums> list = null;
		try {
			ForumsListReqBean flagshop = new ForumsListReqBean();
			//flagshop.setUserid(userid);
			flagshop.setCollectionid(collectionid);
			flagshop.setType(type);
			list = ((ForumsListRespBean)getMessageResponse(flagshop, new ForumsListRespBean(), "ForumsList")).getList();
		} catch (Exception e) {
			log.error("获取旗舰商家列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return list==null?new ArrayList<Forums>():list;
	}
	
	@Override
	public MessageRespBean updateForumsInfo(ForumsInfoReqBean info){
	log.info("修改信息");
	MessageRespBean respBean = new MessageRespBean();
	try {
		respBean = getMessageResponse(info, "updateForumsList");
	} catch (Exception e) {
		log.error("报名异常："+e.getMessage());
		e.printStackTrace();
	}
	return respBean;
	}

}
