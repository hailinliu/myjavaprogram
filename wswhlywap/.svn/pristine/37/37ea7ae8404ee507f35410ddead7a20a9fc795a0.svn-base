
package com.hyzm.admin.dao.taoinfo.Impl;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.taoinfo.taobaoDao;
@Repository
public class taobaoDaoImpl implements taobaoDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private final static String gettaobaoinfoByUrl = "INSERT INTO taobaoinfo (pmname,qpprice,baozhengprice,dangqianprice,jprice,bmnum,sznum,wgnum,jgname,zqtime)VALUES(?,?,?,?,?,?,?,?,?,now())";
	private final static String selecttaobaoinfoByUrl = "SELECT count(pmname) from taobaoinfo where pmname=? ";
	private final static String updatetaobaoinfoByUrl = "UPDATE taobaoinfo SET qpprice = ?,baozhengprice = ?,dangqianprice = ?,jprice = ?,bmnum = ?,sznum = ?,wgnum = ?,zqtime=now() where pmname=?";
	public boolean gettaobaoinfoByUrl(String pmname,String qpprice,String baozhengprice,String dangqianprice,String jprice,String bmnum,String sznum,String wgnum,String jgname) throws Exception {
		try {
			int  k=jdbcTemplate.queryForInt(selecttaobaoinfoByUrl, new Object[]{pmname});
			if(k>0){
	     	int j= jdbcTemplate.update(updatetaobaoinfoByUrl, new Object[]{qpprice,baozhengprice,dangqianprice,jprice,bmnum,sznum,wgnum,pmname});
	     	if (j > 0)
				return true;	
			}else{
				int i = jdbcTemplate.update(gettaobaoinfoByUrl, new Object[]{pmname,qpprice,baozhengprice,dangqianprice,jprice,bmnum,sznum,wgnum,jgname});
				if (i > 0)
					return true;	
			}
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("抓取信息异常："+e.getMessage());
		}
	}
	private final static String gettaobaoinfoList="SELECT * from taobaoinfo  order by id desc limit ?, ?";
	public List<Map<String, Object>> gettaobaoinfoList(int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(gettaobaoinfoList, new Object[]{(currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取拍品列表异常："+e.getMessage());
		}
	}
	private final static String gettaobaoinfoListNum="SELECT count(id) from taobaoinfo ";
	public long gettaobaoinfoListNum()
			throws Exception {
		try {
			return jdbcTemplate.queryForLong(gettaobaoinfoListNum, new Object[]{});
		} catch (Exception e) {
			throw new RuntimeException("获取拍品数量异常："+e.getMessage());
		}
	}
	private final static String deltaobaolist = "DELETE from taobaoinfo where id= ?";
	public boolean deltaobaolist(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(deltaobaolist, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除信息异常："+e.getMessage());
		}
	}
	

	
	}
