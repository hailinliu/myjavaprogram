package com.hyzm.admin.service.ad;

import java.util.Map;


public interface AdService {
	
	/**
	 * 获取广告位列表
	 * @return
	 */
	public String getAdImageList();
	
	/**
	 * 添加广告内容
	 * @param name
	 * @param imgname
	 * @param url
	 * @return
	 */
	public boolean addAdImage(String name, String imgname, String url);
	
	/**
	 * 修改广告内容
	 * @param id
	 * @param imgname
	 * @param url
	 * @param state
	 * @return
	 */
	public boolean editAdImage(int id, String imgname, String url, int state);
	
	/**
	 * 获取广告内容
	 * @param id
	 * @return
	 */
	public Map<String, Object> getAdById(int id);
	
	
	
	 /*****************************************************APP华丽丽分割线*******************************************************/
	/**
	 * APP
	 * @return
	 */
	public boolean addAPP(Map<String,String> map);

}
