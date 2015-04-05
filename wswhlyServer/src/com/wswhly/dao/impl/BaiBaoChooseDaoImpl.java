package com.wswhly.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wswhly.dao.BaiBaoChooseDao;
/**
 * 百宝街--打分选项 dao实现类
 * @author xjt
 * @createDate 2014年12月15日 14:06:28
 */
@Repository
public class BaiBaoChooseDaoImpl implements BaiBaoChooseDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * 查询打分选项
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> getChooseForList(Map<String, String> map) {
		String sql=" select * from t_baibao_choose where state=1";
		return jdbcTemplate.queryForList(sql);
	}

}
