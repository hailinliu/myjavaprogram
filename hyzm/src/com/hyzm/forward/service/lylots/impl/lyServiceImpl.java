package com.hyzm.forward.service.lylots.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.hyzm.bean.collection.CollectionListReqBean;
import com.hyzm.bean.collection.CollectionListRespBean;
import com.hyzm.bean.collection.CollectionListRespBean.Collection;
import com.hyzm.forward.service.MessageResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.hyzm.forward.service.lylots.lyService;

@Service
public class lyServiceImpl extends MessageResponse implements lyService{
	private final Logger log = Logger.getLogger(this.getClass());

	public Map<String, Object> addlylots(int specialID,
			String name, String uptime, long userid, String autor, String year,
			String size, String image, String ybprice, String suggest, String state,int userlevel) {
        log.info("上传拍品");
		
		Map<String,String> where =new HashMap<String, String>();
		Map<String,Object> data =new HashMap<String, Object>();
		where.put("specialID", String.valueOf(specialID));
		where.put("userid", String.valueOf(userid));
		where.put("name", name);
		where.put("uptime", uptime);
		where.put("autor", autor);
		where.put("year", year);
		where.put("size", size);
		where.put("image", image);
		where.put("ybprice", ybprice);
		where.put("suggest", suggest);
		//where.put("lynumber", lynumber);
		where.put("state", String.valueOf(state));
		where.put("userlevel", String.valueOf(userlevel));
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(where,"addlylots");
		} catch (Exception e) {
			log.error("报名异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	public Map<String, Object> getMylots(String userid) throws Exception {
		log.info("获取我的上传个数");
		
		Map<String,String> where =new HashMap<String, String>();
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			where.put("userid", String.valueOf(userid));
			data = (Map<String, Object>) getMessageResponsetoMap(where,"getMylots");
		} catch (Exception e) {
			log.error("获取我的上传个数异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;

	}
	@Override
	public Map<String, Object> getLyZc() throws Exception {
		log.info("获取乐园专场");
		Map<String,Object> data =new HashMap<String, Object>();
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(null,"getLyZc");
		} catch (Exception e) {
			log.error("获取乐园专场异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	@Override
	public Map<String, Object> updatemoney(String userid) {
		   log.info("修改余额");
			
			Map<String,String> where =new HashMap<String, String>();
			Map<String,Object> data =new HashMap<String, Object>();
			where.put("userid", String.valueOf(userid));
			try {
				data = (Map<String, Object>) getMessageResponsetoMap(where,"updatemoney");
			} catch (Exception e) {
				log.error("报名异常："+e.getMessage());
				e.printStackTrace();
			}
			return data;
	}
	@Override
	public Map<String, Object> getMylylots(String userid, int currentPage,
			int pageSize) throws Exception {
		log.info("获取我的上传拍品");
		Map<String,Object> data =new HashMap<String, Object>();
		Map<String,String> where =new HashMap<String, String>();
		where.put("userid", String.valueOf(userid));
		where.put("pageno", String.valueOf(currentPage));
		where.put("pagesize",String.valueOf(pageSize));
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(where,"getMylylots");
		} catch (Exception e) {
			log.error("获取我的上传拍品异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	@Override
	public Map<String, Object> getlylots(String specialID, String pricearea,
			String ly, String userid, int currentPage, int pageSize)
			throws Exception {
		log.info("获取拍品列表");
		Map<String,Object> data =new HashMap<String, Object>();
		Map<String,String> where =new HashMap<String, String>();
		where.put("specialID",specialID );
		where.put("pricearea",pricearea );
		where.put("ly",ly );
		where.put("userid", userid);
		where.put("pageno", String.valueOf(currentPage));
		where.put("pagesize",String.valueOf(pageSize));
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(where,"getlylots");
		} catch (Exception e) {
			log.error("获取拍品列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	@Override
	public Map<String, Object> getlylotsById(String id) throws Exception {
		log.info("获取拍品详情");
		Map<String,Object> data =new HashMap<String, Object>();
		Map<String,String> where =new HashMap<String, String>();
		where.put("id",id );
		try {
			data = (Map<String, Object>) getMessageResponsetoMap(where,"getlylotsById");
		} catch (Exception e) {
			log.error("获取拍品详情异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

}
