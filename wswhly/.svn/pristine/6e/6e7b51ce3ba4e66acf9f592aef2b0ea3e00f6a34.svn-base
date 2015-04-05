package com.hyzm.admin.dao.onlinepic;

import java.util.List;
import java.util.Map;

/**
 * 图片鉴定
 * @author Administrator
 *2015年4月13日 12:51:30
 */
public interface OnlinePicDao {
	/***********************************************************以下为藏品方法*******************************************************************************/
	//修改藏品
	public int UpdateOnlinePicColl(Map<String, String> map);
	//查询单个藏品
	public Map<String, Object>  getOnlinePicCollForMap(Map<String, String> map);
	//查询藏品个数
	public int getOnlinePicCollForCount(Map<String, String> map);
	//查询藏品列表
	public List<Map<String, Object>>  getOnlinePicCollForList(Map<String, String> map);
	 
	/***********************************************************以下为图片鉴定藏品类型方法*******************************************************************************/
	//获取藏品类型
	public List<Map<String, Object>> getOnlinePicType(Map<String, String> map);
	
	//添加
	public int AddOnlinePicType(Map<String, String> map);
	//修改
	public int UpdateOnlinePicType(Map<String, String> map);
	
	/***********************************************************以下为图片鉴定专家方法*******************************************************************************/
	//获取专家
	public List<Map<String, Object>> getOnlinePicProf(Map<String, String> map);
	//添加
	public int AddOnlinePicProf(Map<String, String> map);
	//修改
	public int UpdateOnlinePicProf(Map<String, String> map);
	

}
