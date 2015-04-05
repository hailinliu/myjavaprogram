package com.wswhly.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.wswhly.bean.flagshop.FlagShopBaseInfoListRespBean;
import com.wswhly.bean.news.NewsListRespBean;

public interface FlagShopBaseInfoDao {
	
	
	//查询旗舰商家列表  where    旗舰商家名称      分页
	public int queryFlagShopBaseInfoListCount(String name,String type) throws SQLException;
	public List<Map<String, Object>> queryFlagShopBaseInfoList(int pageno,int pagesize,String name,String type);
	//根据旗舰商家id查询旗舰商家详细信息
	public Map<String, Object> queryFlagShopBaseInfoById(String id);
	//查询旗舰商家资讯信息列表   where（旗舰商家id    资讯类型     分页）
	public int queryFlagShopBaseInfoNewsCount(String flagshopbaseinfoid,String style,String recommend ) throws SQLException;
	public List<Map<String, Object>> queryFlagShopBaseInfoNews(int pageno,int pagesize,String flagshopbaseinfoid,String style,String recommend ) throws SQLException;
	
	//根据资讯id查询详细信息
	public Map<String, Object> queryNews(long id) throws SQLException;
	
	//查询资讯上一条    where（资讯id 资讯类型）
	public Map<String, Object> queryPrevNews(long id,String style) throws SQLException;

	//查询资讯下一条   where（资讯id 资讯类型）
	public Map<String, Object> queryNextNews(long id,String style) throws SQLException;

	//根据旗舰商家用户id查询旗舰商家详细信息
		public Map<String, Object> queryFlagShopBaseInfoByuserId(String userid);
}
