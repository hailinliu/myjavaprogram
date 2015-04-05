package com.wswhly.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wswhly.dao.DicDao;
@Repository
public class DicDaoImpl implements DicDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String getdicaddress="select * from t_dic_address where parentcode=?";
	/**
	 *  根据父级id查询 下面的地区
	 */
	public List<Map<String, Object>> getDicaddress(int parentcode) {
		List<Map<String, Object>> list=jdbcTemplate.queryForList(getdicaddress,new Object[]{parentcode});
		return list;
	}

}
