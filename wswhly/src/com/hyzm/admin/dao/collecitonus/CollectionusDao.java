package com.hyzm.admin.dao.collecitonus;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface CollectionusDao {
	
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
	 * @throws Exception
	 */
	public List<Map<String, Object>> getCollectionList(Date begindate, Date enddate, String type,  String style, String name, String serialnum, String username, String state, String pricearea,int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取藏品数量
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param style
	 * @param name
	 * @param username
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getCollectionListNum(Date begindate, Date enddate, String type, String style, String name, String serialnum, String username, String state,String pricearea) throws Exception;
	
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
	 * @throws Exception
	 */
	public boolean addCollection(int type, int style, String name, String serialnum, long userid, String note, String imgurl,String imgurltitle, String tvnum) throws Exception;
	
	/**
	 * 删除藏品
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delCollection(long id) throws Exception;

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
	 * @throws Exception
	 */
	public boolean updCollection(long id, int type, int style, String name, String note, String imgurl,String imgurltitle, String tvnum) throws Exception;
	
	/**
	 * 收藏藏品
	 * @param id
	 * @param iscollection
	 * @return
	 * @throws Exception
	 */
	public boolean collectThing(long id, int iscollection) throws Exception;
	
	/**
	 * 显示/隐藏藏品
	 * @param id
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public boolean collectionShowOrHide(long id, int state) throws Exception;
	
	/**
	 * 通过id获得藏品
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getCollectionById(long id) throws Exception;
	
	/**
	 * 获得藏品类型列表
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getTypeList(int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获得藏品类型数量
	 * @return
	 * @throws Exception
	 */
	public long getTypeListNum() throws Exception;
	
	/**
	 * 添加藏品类型
	 * @param typename
	 * @return
	 * @throws Exception
	 */
	public boolean addType(String typename) throws Exception;
	
	/**
	 * 删除藏品类型
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delType(long id) throws Exception;
	
	/**
	 * 修改藏品类型
	 * @param id
	 * @param typename
	 * @return
	 * @throws Exception
	 */
	public boolean updType(long id, String typename) throws Exception;
	
	/**
	 * 自动补全名称
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoName() throws Exception;
	/**
	 * 自动补全编号
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoserialnum() throws Exception;
	
	/**
	 * 自动补全归属
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoOwner() throws Exception;
	
	/**
	 * 获取藏品大类下拉列表
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getTypeCombobox() throws Exception;
	
	/**
	 * 获取藏品小类下拉列表
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getStyleCombobox(int typeid) throws Exception;
	
	/**
	 * 自动补全上传者
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoUsername() throws Exception;

}
