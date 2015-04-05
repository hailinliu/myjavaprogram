package com.hyzm.admin.service.flagshop;

import java.util.Date;
import java.util.Map;


public interface FlagShopBaseInfoService {
	/**
	 * 获取商家列表
	 * @param begindate
	 * @param enddate
	 * @param type
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public String getFlagshopList(Date begindate, Date enddate, String username,String name,String commissioner, String type, int currentPage, int pageSize);
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
			String addresss,String map,String introduce,String commissioner,String startdate,String enddate, String logo,  String state);
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
			String addresss,String map,String introduce,String commissioner,String startdate,String enddate, String logo,  String state);
	/**
	 * 通过id获取商家
	 * @param id
	 * @return
	 */
	public Map<String, Object> getFlagshopinfoById(long id);
	/**
	 * 删除商家
	 * @param id
	 * @return
	 */
	public boolean delFlagshopinfo(long id);
	/**
	 * 获取商家列表
	 * @return
	 */
	public String  getFlagShopBaseinfoCombobox();
	
	/*
	 * 导出表格
	 * autor:haojk
	 */

	public Map<String, Object> exportCSV(Date begindate, Date enddate, String username,String name,String commissioner, String type, int currentPage, int pageSize);
	/**
	 * 合作审批
	 * autor:haojk
	 * @return
	 * @throws Exception
	 */
	public boolean joinControl(long id,int state,String startdate, String enddate) throws Exception;

	
}
