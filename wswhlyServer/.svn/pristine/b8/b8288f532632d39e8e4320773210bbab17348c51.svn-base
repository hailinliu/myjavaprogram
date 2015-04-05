package com.wswhly.dao.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wswhly.dao.DaiGouDao;

/**
 * 代购实现类
 * @author Administrator
 *
 */
@Repository
public class DaiGouDaoImpl implements DaiGouDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public int AddDaigou(Map<String, String> map) {
		if(map.get("smsrecord")!=null){
			String sql=" insert into  t_daigou(name,sex,mobile,weixin,address,email,colloctionurl,buytime,state,cjaction,pmfs,lotsid,smsrecord) values(?,?,?,?,?,?,?,now(),1,?,?,?,?)";
			  int i = jdbcTemplate.update(sql,
						new Object[]{
						map.get("name"),
						map.get("sex"),
						map.get("mobile"),
						map.get("weixin"),
						map.get("address"),
						map.get("email"),
						map.get("colloctionurl"),
						map.get("cjaction"),
						map.get("pmfs"),
						map.get("lotsid"),
						map.get("smsrecord")
						});
				if(i>0){return 1;}else{return 0;}
		}
		String sql=" insert into  t_daigou(name,sex,mobile,weixin,address,email,colloctionurl,buytime,state,cjaction,pmfs,lotsid) values(?,?,?,?,?,?,?,now(),1,?,?,?)";
		  int i = jdbcTemplate.update(sql,
					new Object[]{
					map.get("name"),
					map.get("sex"),
					map.get("mobile"),
					map.get("weixin"),
					map.get("address"),
					map.get("email"),
					map.get("colloctionurl"),
					map.get("cjaction"),
					map.get("pmfs"),
					map.get("lotsid")
					});
			if(i>0){return 1;}else{return 0;}
	}

}
