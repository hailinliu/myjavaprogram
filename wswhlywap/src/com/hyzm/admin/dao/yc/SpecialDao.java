package com.hyzm.admin.dao.yc;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface SpecialDao {
	/**
	 * 获取专场列表
	 * @param begindate
	 * @param enddate
	 * @param state
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getSpecialList(Date begindate,Date enddate,String specialname,String actionid,int currentPage,int pageSize) throws Exception;
	
	/**
	 * 获取专场数量
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @param owner
	 * @param username
	 * @param isSpecial
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getSpecialListNum(Date begindate,Date enddate,String specialname,String actionid) throws Exception;
	
	/**
	 * 添加专场
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
	public boolean addSpecial(String specialname,String time,int actionid,String address,String totalnum) throws Exception;
	

	
	/**
	 * 修改专场
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
	public boolean updSpecial(long id,String specialname,String time,int actionid,String address,String totalnum) throws Exception;
	
	/**
	 * 通过id获得专场
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getSpecialById(long id) throws Exception;
	/**
	 * 获取下拉列表
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getSpecialCombobox() throws Exception;
	
	/**
	 * 自动补全
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoSpecialname() throws Exception;
	
}
