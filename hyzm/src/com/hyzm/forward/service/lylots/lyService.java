package com.hyzm.forward.service.lylots;

import java.sql.SQLException;
import java.util.Map;

import com.hyzm.bean.MessageRespBean;

public interface lyService {
	//查询资讯下一条   where（资讯id 资讯类型）
	public  Map<String, Object> addlylots(int specialID, String name, String uptime, long userid, String autor, String year, String size, 
			String image, String ybprice, String suggest,  String state,int userlevel);
	//获取我的上传数量
	public Map<String, Object> getMylots(String userid)throws Exception;
	//获取专场
	public Map<String, Object>  getLyZc()throws Exception;
	public  Map<String, Object>  updatemoney(String userid);	
	//获取我的上传拍品
	public Map<String, Object> getMylylots(String userid,int currentPage, int pageSize)throws Exception;
	
	//获取拍品
	public Map<String, Object> getlylots(String specialID,String pricearea,String ly,String userid,int currentPage, int pageSize)throws Exception;
	//获取拍品详情
	public Map<String, Object> getlylotsById(String id)throws Exception;
}
