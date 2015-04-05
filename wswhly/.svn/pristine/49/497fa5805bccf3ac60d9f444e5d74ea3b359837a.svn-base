package com.hyzm.admin.dao.member;

import java.util.List;
import java.util.Map;

public interface MemberDao {

	/**
	 * 获取会员列表
	 * @param id
	 * @param username
	 * @param collectage
	 * @param likeoption
	 * @param price
	 */
	public List<Map<String, Object>> getMeminfoList(String userid,String username,String collectage, String likeoption, String price,int pageSize, int currentPage) throws Exception;
	/**
	 * 获取会员数量
	 * @param id
	 * @param username
	 * @param collectage
	 * @param likeoption
	 * @param price
	 * @return
	 * @throws Exception
	 */
	public long getMeminfoListNum(String userid,String username,String collectage, String likeoption, String price) throws Exception;

	/**
	 * 修改会员
	 * @param username
	 * @param collectage
	 * @param likeoption
	 * @param price
	 * @return
	 * @throws Exception
	 */
	public boolean updMember( Long id,String username,String collectage,String likeoption,String target,String service,String channel,String price, String isjoin, String isload) throws Exception;
	/**
	 * 自动补全会员名称
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoUserName() throws Exception;
	/**
	 * 获取收藏品类下拉列表
	 * @return
	 * @throws Exception
	 */
	
	
	
	/**
	 * 通过id获得藏品
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> gettMemberById(long id) throws Exception;
	
}
