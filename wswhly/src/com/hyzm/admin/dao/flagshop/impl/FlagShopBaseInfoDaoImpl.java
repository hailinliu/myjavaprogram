package com.hyzm.admin.dao.flagshop.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.flagshop.FlagShopBaseInfoDao;
@Repository
public class FlagShopBaseInfoDaoImpl implements FlagShopBaseInfoDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getFlagShopBaseinfolist= "select c.*,t.username from t_flagshopbaseinfo c left join t_user t on c.userid = t.id  where  t.username like ?  and c.name like ? and c.commissioner like ? and c.type like ? order by c.id desc limit ?, ?";
	/**
	 * 获取旗舰商家下拉列表
	 * @return
	 */

	public List<Map<String, Object>> getFlagshopinfoList(Date begindate,
			Date enddate, String username, String name, String commissioner,
			String type, int currentPage, int pageSize) throws Exception {
			try {		
				return jdbcTemplate.queryForList(getFlagShopBaseinfolist, new Object[]{ "%"+username+"%", "%"+name+"%", "%"+commissioner+"%", "%"+type+"%", (currentPage-1)*pageSize, pageSize});
			} catch (Exception e) {
				throw new RuntimeException("获取商家列表异常："+e.getMessage());
			}
	}
	private final static String getFlagShopBaseinfolistNum = "select count(c.id) from t_flagshopbaseinfo c left join t_user t on c.userid = t.id  where t.username like ?  and c.name like ? and c.commissioner like ? and c.type like ?";
	public long getFlagshopinfoListNum(Date begindate, Date enddate,
			String username, String name, String commissioner, String type)
			throws Exception {
		try {
			return jdbcTemplate.queryForLong(getFlagShopBaseinfolistNum, new Object[]{ "%"+username+"%", "%"+name+"%", "%"+commissioner+"%", "%"+type+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取商家数量异常："+e.getMessage());
		}
	}
	
	
	public boolean addFlagshopinfo(int type, String name, String username,
			String daoyu, String mainscope, String contactname, String contacttel,String qq,String weixin,String sinlwblog,
			String addresss,String map,String introduce,String commissioner,String startdate,String enddate, String logo,  String state) throws Exception {

		try {
			 String addFlagshopinfo= "insert into t_flagshopbaseinfo (type, name,daoyu, userid, mainscope,contactname,logo, contacttel,qq,weixin,sinlwblog, addresss, map, introduce,commissioner,startdate,enddate,state) values("+type+",'"+name+"','"+daoyu+"',"+"( select id from t_user where username = '"+username+"'),'"+mainscope+"','"+contactname+"','"+logo+"','"+contacttel+"','"+qq+"','"+weixin+"','"+sinlwblog+"','"+addresss+"','"+map+"','"+introduce+"','"+commissioner+"','"+startdate+"','"+enddate+"',"+state+")";
			 System.out.println(addFlagshopinfo);
			int i = jdbcTemplate.update(addFlagshopinfo);
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加商家异常："+e.getMessage());
		}
	}
	
	private final static String updFlagshopinfo = "update t_flagshopbaseinfo set type = ?, name = ? ,daoyu= ? ,mainscope = ? , logo = ? , contactname = ? , contacttel = ? ,qq = ? ,weixin = ? ,sinlwblog = ? , addresss = ? , map = ? , introduce = ? ,commissioner= ?, startdate = ?  , enddate = ? ,state = ? where id = ?";
	public boolean updFlagshopinfo(long id,int type, String name, 
			String daoyu, String mainscope, String contactname, String contacttel,String qq,String weixin,String sinlwblog,
			String addresss,String map,String introduce,String commissioner,String startdate,String enddate, String logo,  String state)
			throws Exception {
		try {
			int i = jdbcTemplate.update(updFlagshopinfo, new Object[]{type, name, daoyu , mainscope, logo, contactname, contacttel, qq, weixin, sinlwblog, addresss, map, introduce,commissioner, startdate, enddate,state,id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改商家异常："+e.getMessage());
		}
	}
	private final static String getFlagshopinfoById = "select * from t_flagshopbaseinfo where id = ?";
	public Map<String, Object> getFlagshopinfoById(long id) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getFlagshopinfoById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取商家异常："+e.getMessage());
		}
	}
	
	private final static String delFlagshopinfo = "update t_flagshopbaseinfo set state = 3 where id = ?";
	public boolean delFlagshopinfo(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(delFlagshopinfo, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除商家异常："+e.getMessage());
		}
	}

	private final static String upjoinType = "update t_flagshopbaseinfo set state = ?,startdate = ?,enddate  = ? where id = ?";
	public boolean upjoinType(long id, int state, String startdate, String enddate)
			throws Exception {
		try {
			int i = jdbcTemplate.update(upjoinType, new Object[]{state,startdate,enddate,id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("合作审批异常："+e.getMessage());
		}
	}


}
