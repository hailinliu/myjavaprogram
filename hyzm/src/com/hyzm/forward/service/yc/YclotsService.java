package com.hyzm.forward.service.yc;

import java.util.List;
import java.util.Map;

import com.hyzm.bean.yc.YcCountBean;
import com.hyzm.bean.yc.YclotsListRespBean;


public interface YclotsService {
	//根据专场specialID查询拍品信息
	public Map<String, Object> queryYclotsByspecialID(String specialID,int pageno,int pagesize);
	//根据拍品id查询拍品详情
	public YclotsListRespBean.Yclots queryYclotsByid(String id);
	//根据拍卖会id查询专场
	public Map<String, Object> queryYcspecialByactionID(String actionid,int pageno,int pagesize);
	//根据公司id查询拍卖会
		public Map<String, Object> queryYcactionByins_id(String ins_id,int pageno,int pagesize);
		//查询拍卖公司
		public Map<String, Object> queryYcinstitutions();
		//查询数量
		public YcCountBean  queryYccount();
}
