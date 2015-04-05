package com.wswhly.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wswhly.dao.BaiBaoGradesDao;
/**
 * 百宝街--打分 dao实现类
 * @author xjt
 * @createDate 2014年12月15日 14:09:29
 */
@Repository
public class BaiBaoGradesDaoImpl implements BaiBaoGradesDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	/**
	 * 添加打分记录
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddGrades(Map<String, String> map){
		String sql=" insert into t_baibao_grades(userid,collectionid,chooseid,createdate) values(?,?,?,now())";
		 int i = jdbcTemplate.update(sql,
					new Object[]{
					map.get("userid"),
					map.get("collectionid"),
					map.get("chooseid")
					});
			if(i>0){return 1;}else{return 0;}
	}
	
	/**
	 * 查询打分记录       暂定该方法用处
	 * @param map
	 * @return
	 */
	public List<Map<String,Object>> getGradesForList(Map<String, String> map){
		return null;
	}

}
