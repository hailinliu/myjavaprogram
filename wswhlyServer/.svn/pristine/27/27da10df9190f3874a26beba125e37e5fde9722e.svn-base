package com.wswhly.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wswhly.dao.BaiBaoImgDao;

/**
 * 百宝街--藏品图片 dao实现类
 * @author xjt
 * @createDate 2014年12月15日 14:20:10
 */
@Repository
public class BaiBaoImgDaoImpl  implements BaiBaoImgDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	/**
	 * 添加图片
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddImg(Map<String, String> map){
		String sql="insert into t_baibao_img(collectionid,imgurl,isthumbnail,state,createdate)values(?,?,?,1,now())";
		int i = jdbcTemplate.update(sql,
					new Object[]{
					map.get("collectionid"),
					map.get("imgurl"),
					map.get("isthumbnail")
					});
			if(i>0){return 1;}else{return 0;}
	}
	
	/**
	 * 删除图片
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int DeleteImg(Map<String, String> map){
		String sql=" update t_baibao_img set state=2 where id="+map.get("id");
		int i = jdbcTemplate.update(sql);
		if(i>0){return 1;}else{return 0;}
	}
	
	/**
	 * 查询图片     根据藏品id 
	 * @param map
	 * @return list
	 */
	public List<Map<String,Object>> getImgForList(Map<String, String> map){
		String sql=" select * from t_baibao_img where state=1 and  collectionid="+map.get("collectionid");
		return jdbcTemplate.queryForList(sql);
	}
}
