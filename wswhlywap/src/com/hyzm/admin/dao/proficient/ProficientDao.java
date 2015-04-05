package com.hyzm.admin.dao.proficient;

import java.util.List;
import java.util.Map;

/**
 * 专家管理数据库操作接口
 * @author Administrator
 *
 */
public interface ProficientDao {
	
	/**
	 * 获取专家信息列表
	 * @param name
	 * @param speciality
	 * @param appellation
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getProficientList(String name, String speciality, String appellation, String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取专家信息数量
	 * @param name
	 * @param speciality
	 * @param appellation
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getProficientListNum(String name, String speciality, String appellation, String state) throws Exception;
	
	/**
	 * 添加专家信息
	 * @param name
	 * @param imgurl
	 * @param speciality
	 * @param appellation
	 * @param note
	 * @return
	 * @throws Exception
	 */
	public boolean addProficient(String name, String imgurl, String speciality, String appellation, String note,String orderc,String isbqhx,String hxqh) throws Exception;
	
	/**
	 * 删除专家信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delProficient(long id) throws Exception;
	
	/**
	 * 修改专家信息
	 * @param id
	 * @param name
	 * @param imgurl
	 * @param speciality
	 * @param appellation
	 * @param note
	 * @return
	 * @throws Exception
	 */
	public boolean updProficient(long id, String name, String imgurl, String speciality, String appellation, String note,String orderc,String isbqhx,String hxqh) throws Exception;
	
	/**
	 * 通过id获取专家信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getProficientById(long id) throws Exception;
	
	/**
	 * 自动补全专家名
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoName() throws Exception;
	
	/**
	 * 自动补全称谓
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoAppellation() throws Exception;
	
	/**
	 * 自动补全专长
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoSpeciality() throws Exception;

}
