package com.hyzm.admin.dao.yc.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.yc.SpecialDao;
@Repository
public class SpecialDaoImpl  implements SpecialDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private final static String getSpecialList = "select c.*, t.auctionname from t_yc_special c left join t_yc_action t on c.actionid = t.id where     c.specialname like ? and c.actionid = ? order by c.id desc limit ?, ?";
	public List<Map<String, Object>> getSpecialList(Date begindate,
			Date enddate, String specialname, String Specialid, int currentPage,
			int pageSize) throws Exception {
		try {
			String sql="select c.*, t.auctionname from t_yc_special c left join t_yc_action t on c.actionid = t.id where     c.specialname like '%"+specialname+"%'" ;
			if(Specialid!=""){
				sql+=" and c.actionid="+Specialid;
			}
			sql+=" order by c.id desc limit "+((currentPage-1)*pageSize)+","+pageSize;
			return jdbcTemplate.queryForList(sql);
		} catch (Exception e) {
			throw new RuntimeException("获取拍卖会列表异常："+e.getMessage());
		}
	}

	public long getSpecialListNum(Date begindate, Date enddate,
			String specialname, String Specialid) throws Exception {
		try {
			String sql="select count(c.id) from t_yc_special c where 1=1";
			if(Specialid!=""){
				sql+=" and c.actionid="+Specialid;
			}
			return jdbcTemplate.queryForLong(sql);
		} catch (Exception e) {
			throw new RuntimeException("获取拍卖会数量异常："+e.getMessage());
		}
	}

	private final static String addSpecial = "insert into t_yc_special (specialname, time, actionid, address, totalnum) values (?,?,?,?,?)";
	public boolean addSpecial(String specialname, String time, int Specialid,
			String address, String totalnum) throws Exception {
		try {
			int i = jdbcTemplate.update(addSpecial, new Object[]{specialname, time, Specialid, address, totalnum});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加拍卖会异常："+e.getMessage());
		}
	}

	private final static String updSpecial = "update t_yc_special set specialname = ?, time = ?, Specialid = ?, address = ?, totalnum = ? where id= ?";
	public boolean updSpecial(long id, String specialname, String time,
			int Specialid, String address, String totalnum) throws Exception {
		try {
			int i = jdbcTemplate.update(updSpecial, new Object[]{specialname, time, Specialid, address, totalnum,id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改拍卖会异常："+e.getMessage());
		}
	}
	private final static String getSpecialById = "select * from t_yc_special where id = ?";
	public Map<String, Object> getSpecialById(long id) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getSpecialById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取拍卖会异常："+e.getMessage());
		}
	}
	
	private final static String getSpecialCombobox = "select id,auctionname from t_yc_Special  order by id";
	public List<Map<String, Object>> getSpecialCombobox() throws Exception {
		try {
			return jdbcTemplate.queryForList(getSpecialCombobox);
		} catch (Exception e) {
			throw new RuntimeException("获取下拉列表异常："+e.getMessage());
		}
	}
	
	private final static String autoSpecialname = "select distinct specialname from t_yc_special";

	public List<Map<String, Object>> autoSpecialname() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoSpecialname);
		} catch (Exception e) {
			throw new RuntimeException("自动补全异常："+e.getMessage());
		}
	}



}
