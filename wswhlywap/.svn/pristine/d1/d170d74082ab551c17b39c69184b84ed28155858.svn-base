package com.hyzm.admin.service.proficient;

import java.util.Map;


public interface ProficientService {
	
	/**
	 * 获取专家信息列表
	 * @param name
	 * @param speciality
	 * @param appellation
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getProficientList(String name, String speciality, String appellation, String state, int currentPage, int pageSize);
	
	/**
	 * 添加专家信息
	 * @param name
	 * @param imgurl
	 * @param speciality
	 * @param appellation
	 * @param note
	 * @return
	 */
	public boolean addProficient(String name, String imgurl, String speciality, String appellation, String note,String orderc,String isbqhx,String hxqh);
	
	/**
	 * 删除专家信息
	 * @param id
	 * @return
	 */
	public boolean delProficient(long id);
	
	/**
	 * 修改专家信息
	 * @param id
	 * @param name
	 * @param imgurl
	 * @param speciality
	 * @param appellation
	 * @param note
	 * @return
	 */
	public boolean updProficient(long id, String name, String imgurl, String speciality, String appellation, String note,String orderc,String isbqhx,String hxqh);
	
	/**
	 * 通过id获取专家信息
	 * @param id
	 * @return
	 */
	public Map<String, Object> getProficientById(long id);
	
	/**
	 * 自动补全专家名
	 * @return
	 */
	public String autoName();
	
	/**
	 * 自动补全称谓
	 * @return
	 */
	public String autoAppellation();
	
	/**
	 * 自动补全专长
	 * @return
	 */
	public String autoSpeciality();

}
