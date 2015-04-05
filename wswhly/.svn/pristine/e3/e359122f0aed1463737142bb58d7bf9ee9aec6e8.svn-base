package com.hyzm.admin.dao.flagshop;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * 旗舰商家数据库操作接口
 * @author Administrator
 *
 */

public interface FlagShopBaseInfoDao {
	
	/**
	 * 获取商家列表
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getFlagshopinfoList(Date begindate, Date enddate, String username,String name,String commissioner, String type, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取商家数量
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public long getFlagshopinfoListNum(Date begindate, Date enddate, String username,String name,String commissioner, String type) throws Exception;
	
	/**
	 * 添加商家
 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public boolean addFlagshopinfo(int type, String name, String username,String daoyu, String mainscope, String contactname, String contacttel,String qq,String weixin,String sinlwblog,
			String addresss,String map,String introduce,String commissioner,String startdate,String enddate, String logo,  String state) throws Exception;
	/**
	 * 修改商家
 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public boolean updFlagshopinfo(long id,int type, String name,String daoyu, String mainscope, String contactname, String contacttel,String qq,String weixin,String sinlwblog,
			String addresss,String map,String introduce,String commissioner,String startdate,String enddate, String logo,  String state) throws Exception;
	/**
	 * 通过id获得商家
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getFlagshopinfoById(long id) throws Exception;
	/**
	 * 删除商家
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delFlagshopinfo(long id) throws Exception;
	/**
	 * 合作审批
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean upjoinType(long id,int state,String startdate, String enddate) throws Exception;
}
