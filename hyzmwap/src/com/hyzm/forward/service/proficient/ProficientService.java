package com.hyzm.forward.service.proficient;

import java.util.List;
import java.util.Map;

import com.hyzm.bean.proficient.ProficientListRespBean.Proficient;

public interface ProficientService {
	
	/**
	 * 获取专家信息列表
	 * @return
	 * @throws Exception
	 */
	public List<Proficient> getProficientList() throws Exception;
	
	/**
	 * 首页随机获取专家信息列表
	 * @return
	 * @throws Exception
	 */
	public List<Proficient> getProficientListIndex() throws Exception;
	
	/**
	 * 获取专家信息列表（分页）
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Proficient> getProficientList(int currentPage, int pageSize) throws Exception;
	/**
	 * 获取专家信息列表（分页）
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> getProficientListForMap(Map<String,String> where) throws Exception;
	
	/**
	 * 获取单条专家信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Proficient getOneProficient(long id) throws Exception;

}
