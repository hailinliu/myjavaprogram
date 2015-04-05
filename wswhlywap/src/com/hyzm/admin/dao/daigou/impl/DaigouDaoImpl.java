package com.hyzm.admin.dao.daigou.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.daigou.DaigouDao;
import com.hyzm.admin.dao.sys.SysDao;

@Repository
public class DaigouDaoImpl implements DaigouDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
		
	
	private final static String getDaigouById = "select * from t_daigou where id = ? ";
	
	public Map<String, Object> getDaigouById(long id) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getDaigouById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取买家信息异常："+e.getMessage());
		}
	}

	private final static String getDaigouinfoList = "select u.*,t.name as lotsname from t_daigou u left join t_yc_lots t on t.id=u.lotsid where u.buytime >=? and u.buytime <=?  and u.name like ? and u.mobile like ?  and u.state like ? order by u.id desc limit ? ,?";
	public List<Map<String, Object>> getDaigouinfoList(Date begindate, Date enddate, String name,String mobile,String state,int pageSize, int currentPage)
			throws Exception {
		try {
			return jdbcTemplate.queryForList(getDaigouinfoList, new Object[]{begindate,enddate, "%"+name+"%", "%"+mobile+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取买家列表异常："+e.getMessage());
		}
	}
	
	private final static String getDaigouinfoListNum = "select count(u.id) from t_daigou u  where u.buytime >=? and u.buytime <=?  and u.name like ? and u.mobile like ? and u.state like ?"; 
	public long getDaigouinfoListNum(Date begindate, Date enddate,String name, String mobile, String state)
			throws Exception {
		try {
			return jdbcTemplate.queryForLong(getDaigouinfoListNum, new Object[]{begindate,enddate, "%"+name+"%", "%"+mobile+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取买家数量异常："+e.getMessage());
		}
	}
	

	private final static String updDaigou = "update t_daigou set sex = ?, mobile = ?, email = ?, address = ?,weixin=?,state=? where id = ?";

	public boolean updDaigou(int sex,String mobile,String email,String address,String weixin,int state,long id) throws Exception {
		try {
			int i = jdbcTemplate.update(updDaigou, new Object[]{sex, mobile, email,address,weixin,state, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改用户信息异常："+e.getMessage());
		}
	}

	

}
