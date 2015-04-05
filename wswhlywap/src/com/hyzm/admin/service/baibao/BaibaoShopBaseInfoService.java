package com.hyzm.admin.service.baibao;

import java.util.Date;
import java.util.Map;


public interface BaibaoShopBaseInfoService {
	/**
	 * 获取商家列表
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public String getBaibaoshopList(Date begindate, Date enddate, String username,String shopname,String mobile,String state, int currentPage, int pageSize);
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
			String shopaddress,String mobile,String desction, String img, String state);
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
			String shopaddress,String mobile,String desction, String img);
	/**
	 * 通过id获取商家
	 * @param id
	 * @return
	 */
	public Map<String, Object> getBaibaoshopinfoById(long id);
	/**
	 * 删除商家
	 * @param id
	 * @return
	 */
	public boolean delBaibaoshopinfo(long id);
	/**
	 * 获取商家列表
	 * @return
	 */
	public String  getBaibaoshopBaseinfoCombobox();
	
/*	
	 * 导出表格
	 * autor:haojk
	 

	public Map<String, Object> exportCSV(Date begindate, Date enddate,
			String username, String shopname, String state,
			int currentPage, int pageSize);*/
	/**
	 * 合作审批
	 * autor:haojk
	 * @return
	 * @throws Exception
	 */
	public boolean joinControl(long id,int state) throws Exception;

	
}
