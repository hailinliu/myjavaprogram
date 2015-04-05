package com.hyzm.admin.dao.proficient.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.proficient.ProficientDao;

@Repository
public class ProficientDaoImpl implements ProficientDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getProficientList = "select p.* from t_proficient p where p.name like ? and p.speciality like ? and p.appellation like ? and p.state like ? order by p.orderc limit ?, ?";

	public List<Map<String, Object>> getProficientList(String name,
			String speciality, String appellation, String state,
			int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getProficientList, new Object[]{"%"+name+"%", "%"+speciality+"%", "%"+appellation+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取专家信息列表异常："+e.getMessage());
		}
	}
	
	private final static String getProficientListNum = "select count(id) from t_proficient where name like ? and speciality like ? and appellation like ? and state like ?";

	public long getProficientListNum(String name, String speciality,
			String appellation, String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getProficientListNum, new Object[]{"%"+name+"%", "%"+speciality+"%", "%"+appellation+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取专家信息数量异常："+e.getMessage());
		}
	}
	
	private final static String addProficient = "insert into t_proficient (name, imgurl, speciality, appellation, note, createdate, state,orderc,isbqhx,hxqh) values (?,?,?,?,?,now(),1,?,?,?)";

	public boolean addProficient(String name, String imgurl, String speciality,
			String appellation, String note,String orderc,String isbqhx,String hxqh) throws Exception {
		try {
			int i = jdbcTemplate.update(addProficient, new Object[]{name, imgurl, speciality, appellation, note,orderc,isbqhx,hxqh});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加专家信息异常："+e.getMessage());
		}
	}
	
	private final static String delProficient = "update t_proficient set state = 2 where id = ?";

	public boolean delProficient(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(delProficient, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除专家信息异常："+e.getMessage());
		}
	}
	
	private final static String updProficient = "update t_proficient set name = ?, imgurl = ?, speciality = ?, appellation = ?, note = ?,orderc=?,isbqhx=?,hxqh=? where id = ?";

	public boolean updProficient(long id, String name, String imgurl,
			String speciality, String appellation, String note,String orderc,String isbqhx,String hxqh)
			throws Exception {
		try {
			int i = jdbcTemplate.update(updProficient, new Object[]{name, imgurl, speciality, appellation, note,orderc,isbqhx,hxqh, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改专家信息异常："+e.getMessage());
		}
	}
	
	private final static String getProficientById = "select * from t_proficient where id = ?";

	public Map<String, Object> getProficientById(long id) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getProficientById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取专家信息异常："+e.getMessage());
		}
	}
	
	private final static String autoName = "select distinct name from t_proficient";

	public List<Map<String, Object>> autoName() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoName);
		} catch (Exception e) {
			throw new RuntimeException("自动补全专家名异常："+e.getMessage());
		}
	}
	
	private final static String autoAppellation = "select distinct appellation from t_proficient";

	public List<Map<String, Object>> autoAppellation() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoAppellation);
		} catch (Exception e) {
			throw new RuntimeException("自动补全称谓异常："+e.getMessage());
		}
	}
	
	private final static String autoSpeciality = "select distinct speciality from t_proficient";

	public List<Map<String, Object>> autoSpeciality() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoSpeciality);
		} catch (Exception e) {
			throw new RuntimeException("自动补全专长异常："+e.getMessage());
		}
	}

}
