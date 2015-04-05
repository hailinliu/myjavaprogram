package com.hyzm.forward.service.lylots;

import java.util.Map;

public interface lyService {

	
	//获取拍品
	public Map<String, Object> getlylots(String specialID,String pricearea,String ly,String userid,int currentPage, int pageSize)throws Exception;
	//获取拍品详情
	public Map<String, Object> getlylotsById(String id)throws Exception;
}
