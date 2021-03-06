package com.hyzm.admin.service.flagshop;

import java.util.Date;
import java.util.Map;


public interface FlagshopService {
	
	/**
	 * 获取藏品列表
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @param owner
	 * @param username
	 * @param iscollection
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getFlagshopList(Date begindate, Date enddate, 
			 String companyName,String username,String mobile, String style, int currentPage, int pageSize);
	
	/**
	 * 添加藏品
	 * @param type
	 * @param name
	 * @param serialnum
	 * @param userid
	 * @param owner
	 * @param source
	 * @param note
	 * @param imgurl
	 * @return
	 */
	public boolean addCollection(int type, String name, String serialnum, long userid, String owner, String source, String note, String imgurl);
	
	/**
	 * 删除藏品
	 * @param id
	 * @return
	 */
	public boolean delCollection(long id);
	
	/**
	 * 修改藏品
	 * @param id
	 * @param type
	 * @param name
	 * @param owner
	 * @param source
	 * @param note
	 * @param imgurl
	 * @return
	 */
	public boolean updCollection(long id, int type, String name, String owner, String source, String note, String imgurl);
	
	/**
	 * 收藏藏品
	 * @param id
	 * @param iscollection
	 * @return
	 */
	public boolean collectThing(long id, int iscollection);
	
	/**
	 * 显示/隐藏藏品
	 * @param id
	 * @param state
	 * @return
	 */
	public boolean collectionShowOrHide(long id, int state);
	
	/**
	 * 通过id获取藏品
	 * @param id
	 * @return
	 */
	public Map<String, Object> getCollectionById(long id);
	
	/**
	 * 获取类型列表
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getTypeList(int currentPage, int pageSize);
	
	/**
	 * 添加藏品类型
	 * @param typename
	 * @return
	 */
	public boolean addType(String typename);
	
	/**
	 * 删除藏品类型
	 * @param id
	 * @return
	 */
	public boolean delType(long id);
	
	/**
	 * 修改藏品类型
	 * @param id
	 * @param typename
	 * @return
	 */
	public boolean updType(long id, String typename);
	
	/**
	 * 自动补全名称
	 * @return
	 */
	public String autoName();
	
	/**
	 * 自动补全归属
	 * @return
	 */
	public String autoOwner();
	
	/**
	 * 获取藏品类型下拉列表
	 * @return
	 */
	public String getTypeCombobox();
	
	/**
	 * 自动补全上传者
	 * @return
	 */
	public String autoUsername();
	/*
	 * 导出表格
	 * autor:haojk
	 */

	public Map<String, Object> exportCSV(String companyName, String username, String mobile, Date startdate, Date enddate, String style, int pageSize, int currentPage);

}
