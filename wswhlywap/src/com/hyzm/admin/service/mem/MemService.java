package com.hyzm.admin.service.mem;

import java.util.Date;
import java.util.Map;

public interface MemService {
	
  /**
	 * 获取会员列表
	 * @param id
	 * @param username
	 * @param collectage
	 * @param likeoption
	 * @param price
	 */
	public String getMemberList(String userid,String username,String collectage, String likeoption, String price,int currentPage, int pageSize);

	/**
	 * 修改会员
	* @param id
	 * @param username
	 * @param collectage
	 * @param likeoption
	 * @param price
	 * @return
	 */
	public boolean updMember( Long id,String username,String collectage,String likeoption,String target,String service,String channel,String price, String isjoin, String isload);
	/**
	 * 通过id获取会员
	 * @param id
	 * @return
	 */
	public Map<String, Object> getMemberById(long id);
	/**
	 * 自动补全名称
	 * @return
	 */
	public String autoUserName();


	/**
	 * 导出excel
	 * @param id
	 * */
	public Map<String, Object> exportCSV(String userid,String username,String collectage, String likeoption, String price,int currentPage, int pageSize);
}
