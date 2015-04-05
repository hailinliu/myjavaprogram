package com.hyzm.admin.dao.ad;

import java.util.List;
import java.util.Map;

public interface AdDao {
	
	/**
	 * 获取广告位列表
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getAdImageList() throws Exception;
	
	/**
	 * 添加广告内容
	 * @param name
	 * @param imgname
	 * @param url
	 * @return
	 * @throws Exception
	 */
	public boolean addAdImage(String name, String imgname, String url) throws Exception;
	
	/**
	 * 修改广告内容
	 * @param id
	 * @param imgname
	 * @param url
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public boolean editAdImage(int id, String imgname, String url, int state) throws Exception;
	
	/**
	 * 获取广告内容
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getAdById(int id) throws Exception;
	
	
	               
	        /*****************************************************APP华丽丽分割线*******************************************************/
	
	
	public boolean addAPP(Map<String, String> map);
}
