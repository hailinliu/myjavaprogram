package com.wswhly.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wswhly.dao.BaiBaoImgDao;

/**
 * �ٱ���--��ƷͼƬ daoʵ����
 * @author xjt
 * @createDate 2014��12��15�� 14:20:10
 */
@Repository
public class BaiBaoImgDaoImpl  implements BaiBaoImgDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	/**
	 * ���ͼƬ
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
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
	 * ɾ��ͼƬ
	 * @param map
	 * @return 0��ʧ��  1���ɹ�
	 */
	public int DeleteImg(Map<String, String> map){
		String sql=" update t_baibao_img set state=2 where id="+map.get("id");
		int i = jdbcTemplate.update(sql);
		if(i>0){return 1;}else{return 0;}
	}
	
	/**
	 * ��ѯͼƬ     ���ݲ�Ʒid 
	 * @param map
	 * @return list
	 */
	public List<Map<String,Object>> getImgForList(Map<String, String> map){
		String sql=" select * from t_baibao_img where state=1 and  collectionid="+map.get("collectionid");
		return jdbcTemplate.queryForList(sql);
	}
}
