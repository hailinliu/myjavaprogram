package com.hyzm.admin.dao.ad.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.ad.AdDao;

@Repository
public class AdDaoImpl implements AdDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getAdImageList = "select t.* from t_ad_image t";

	public List<Map<String, Object>> getAdImageList() throws Exception {
		try {
			return jdbcTemplate.queryForList(getAdImageList);
		} catch (Exception e) {
			throw new RuntimeException("获取广告位列表"+e.getMessage());
		}
	}
	
	private final static String addAdImage = "insert into t_ad_image (name, imgname, url, state) values (?,?,?,1)";
	
	public boolean addAdImage(String name, String imgname, String url) throws Exception {
		try {
			int i = jdbcTemplate.update(addAdImage, new Object[]{name, imgname, url});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加广告内容异常："+e.getMessage());
		}
	}
	
	private final static String editAdImage = "update t_ad_image set imgname = ?, url = ?, state = ? where id = ?";

	public boolean editAdImage(int id, String imgname, String url, int state)
			throws Exception {
		try {
			int i = jdbcTemplate.update(editAdImage, new Object[]{imgname, url, state, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改广告内容异常："+e.getMessage());
		}
	}
	
	private final static String getAdById = "select t.* from t_ad_image t where t.id = ?";

	public Map<String, Object> getAdById(int id) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getAdById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取广告内容异常："+e.getMessage());
		}
	}

	
	
	  /*****************************************************APP华丽丽分割线*******************************************************/
	private final static String addsql="insert into t_androidAPP(code,type,vs,time) value(?,?,?,NOW())";
	public boolean addAPP(Map<String, String> map) {
		int i = jdbcTemplate.update(addsql,
				new Object[]{
				map.get("code"), 
				map.get("type"),
				map.get("vs"),
				});
		if(i>0){
			return true;
		}
		return false;
	}
	
  
}
