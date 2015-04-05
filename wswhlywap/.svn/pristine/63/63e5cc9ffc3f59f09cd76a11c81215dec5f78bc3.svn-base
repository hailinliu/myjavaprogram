package com.hyzm.admin.service.collectionus;

import java.util.Date;
import java.util.Map;

public interface CollectionusService {
	
	/**
	 * 获取藏品列表
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param style
	 * @param name
	 * @param username
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getCollectionList(Date begindate, Date enddate, String type, String style, String name,String serialnum, String username, String state,String pricearea,int currentPage, int pageSize);
	
	/**
	 * 添加藏品
	 * @param type
	 * @param style
	 * @param name
	 * @param serialnum
	 * @param userid
	 * @param note
	 * @param imgurl
	 * @param tvnum
	 * @return
	 */
	public boolean addCollection(int type, int style, String name, String serialnum, long userid, String note, String imgurl,String imgurltitle, String tvnum);
	
	/**
	 * 删除藏品
	 * @param id
	 * @return
	 */
	public boolean delCollection(long id);
	
	/**
	 * 修改藏品价格区间
	 * @param id
	 * @return
	 */
	public boolean priceareaControl(long id,int pricearea);
	/**
	 * 修改藏品具体价格
	 * @param id
	 * @return
	 */
	public boolean pointpriceControl(long id,String pricearea);
	
	/**
	 * 修改藏品
	 * @param id
	 * @param type
	 * @param style
	 * @param name
	 * @param note
	 * @param imgurl
	 * @param tvnum
	 * @return
	 */
	public boolean updCollection(long id, int type, int style, String name, String note, String imgurl,String imgurltitle, String tvnum);
	
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
	 * 自动补全编号
	 * @return
	 */
	public String autoserialnum();
	
	/**
	 * 自动补全归属
	 * @return
	 */
	public String autoOwner();
	
	/**
	 * 获取藏品大类下拉列表
	 * @return
	 */
	public String getTypeCombobox();
	
	/**
	 * 获取藏品小类下拉列表
	 * @return
	 */
	public String getStyleCombobox(int typeid);
	
	/**
	 * 自动补全上传者
	 * @return
	 */
	public String autoUsername();
	/**
	 * 导出
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param serialnum
	 * @param name
	 * @param owner
	 * @param userid
	 * @param username
	 * @param iscollection
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public  Map<String, Object> exportCSV(Date begindate, Date enddate, String type, String style, String name,String serialnum, String username, String state,String pricearea,int currentPage, int pageSize);

}
