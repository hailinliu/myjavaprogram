package com.hyzm.forward.service.dic;

import java.util.Map;

public interface DicService {
	//	根据父级id查询 下面的地区
	public Map<String, Object> getDicaddress(int parentcode)throws Exception;
	
}
