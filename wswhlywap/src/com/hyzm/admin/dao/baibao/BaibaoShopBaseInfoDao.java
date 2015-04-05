package com.hyzm.admin.dao.baibao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

/**
 * 旗舰商家数据库操作接口
 * @author Administrator
 *
 */

public interface BaibaoShopBaseInfoDao {
	
	/**
	 * 获取商家列表
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getBaibaoshopinfoList(Date begindate, Date enddate, String username,String shopname,String mobile,String state, int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取商家数量
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public long getBaibaoshopinfoListNum(Date begindate, Date enddate, String username,String shopname,String mobile, String state) throws Exception;
	
	/**
	 * 添加商家
 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public boolean addBaibaoshopinfo( String shopname, String username,String mainscope, String manifesto,String weixin,String weixinimg,
			String shopaddress,String mobile,String desction, String img, String state) throws Exception;
	/**
	 * 修改商家
 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public boolean updBaibaoshopinfo(long id,String shopname,String mainscope, String manifesto,String weixin,
			String shopaddress,String mobile,String desction, String img) throws Exception;
	/**
	 * 通过id获得商家
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getBaibaoshopinfoById(long id) throws Exception;
	/**
	 * 删除商家
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delBaibaoshopinfo(long id) throws Exception;
	/**
	 * 合作审批
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean upjoinType(long id,int state) throws Exception;
}
