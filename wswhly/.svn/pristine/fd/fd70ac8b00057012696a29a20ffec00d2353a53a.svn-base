
package com.hyzm.admin.dao.taoinfo;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface taobaoDao{
	public boolean gettaobaoinfoByUrl(String pmname,String qpprice,String baozhengprice,String dangqianprice,String jprice,String bmnum,String sznum,String wgnum,String jgname) throws Exception;
	/*
	 * 查询
	 */
	public List<Map<String, Object>> gettaobaoinfoList( int currentPage, int pageSize) throws Exception;
	/*
	 * 数量
	 */
	public long gettaobaoinfoListNum() throws Exception;
	/**
	 * 删除信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean deltaobaolist(long id) throws Exception;
}