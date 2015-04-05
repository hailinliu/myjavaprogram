/**
 * 
 */
/**
 * @author Administrator
 *
 */
package com.hyzm.admin.service.taobao;

import java.util.Map;


public interface taobaoService{
	public boolean gettaobaoinfoByUrl(String pmname,String qpprice,String baozhengprice,String dangqianprice,String jprice,String bmnum,String sznum,String wgnum,String jgname) throws Exception;
	/*
	 * 查询
	 */
	public String gettaobaoinfoList(int currentPage, int pageSize);
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public boolean deltaobaolist(long id);
	/**
	 * 导出
	 * @param begindate
	 * @param enddate
	 * @param lynumber
	 * @param name
	 * @param zjid
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> exportCSV(int currentPage, int pageSize); 

}