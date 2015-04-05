package com.hyzm.admin.dao.flagshop;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 藏品数据库操作接口
 * @author Administrator
 *
 */
public interface FlagshopDao {
	
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
	 * @throws Exception
	 */
	public List<Map<String, Object>> getFlagshopList(Date begindate, Date enddate, String companyName,String username,String mobile, String style, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取藏品数量
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @param owner
	 * @param username
	 * @param iscollection
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getFlagshopListNum(Date begindate, Date enddate,String companyName,String username,String mobile, String style) throws Exception;
	
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
	 * @throws Exception
	 */
	public boolean addCollection(int type, String name, String serialnum, long userid, String owner, String source, String note, String imgurl) throws Exception;
	
	/**
	 * 删除藏品
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delCollection(long id) throws Exception;
	
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
	 * @throws Exception
	 */
	public boolean updCollection(long id, int type, String name, String owner, String source, String note, String imgurl) throws Exception;
	
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
	 * 自动补全归属
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoOwner() throws Exception;
	
	/**
	 * 获取藏品类型下拉列表
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getTypeCombobox() throws Exception;
	
	/**
	 * 自动补全上传者
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoUsername() throws Exception;

}
