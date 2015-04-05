package com.wswhly.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wswhly.dao.BaiBaoAttentionDao;
import com.wswhly.util.StringUtil;
/**
 * 百宝街--关注 dao实现类
 * @author xjt
 * @createDate 2014年12月15日 13:38:31
 */
@Repository
public class BaiBaoAttentionDaoImpl implements BaiBaoAttentionDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

/******************************************************个人中心********************************************************************/
	
	/**
	 * 添加关注
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddAttention(Map<String, String> map){
		String sql=" insert into  t_baibao_attention(userid,collectionid,attentiondate,state) values(?,?,now(),1)";
		  int i = jdbcTemplate.update(sql,
					new Object[]{
					map.get("userid"),
					map.get("collectionid")
					});
			if(i>0){return 1;}else{return 0;}
	}
	
	/**
	 * 取消关注
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int DeleteAttention(Map<String, String> map){
		String sql="update t_baibao_attention set state=2 where id="+map.get("id");
		int i = jdbcTemplate.update(sql);
		if(i>0){return 1;}else{return 0;}
	}
	
	
	
	/******************************************************前台展示********************************************************************/
	
	
	/******************************************************公共方法********************************************************************/
	
	/**
	 * 根据用户id   或藏品id  。。。。等 分页查询
	 * @param map
	 * @return List
	 */
	public List<Map<String,Object>> getAttentionForList(Map<String, String> map){
		StringBuffer sql=new StringBuffer();
		sql.append(" select a.* ,c.name,c.imgurl ");
		sql.append(" from t_baibao_attention a ");
		sql.append(" left join t_baibao_collection c ");
		sql.append(" on a.collectionid=c.id ");
		sql.append(" where 1=1 and a.state=1 ");
		/**********************************************查询条件**********************************************/
		//根据用户id查询
		if(!StringUtil.isNullOrisEmpty(map.get("userid"))){
			sql.append(" and a.userid="+map.get("userid"));
		}
		//根据藏品id查询
		if(!StringUtil.isNullOrisEmpty(map.get("collectionid"))){
			sql.append(" and a.collectionid="+map.get("collectionid"));
		}
		/**********************************************排序条件**********************************************/
		if(!StringUtil.isNullOrisEmpty(map.get(map.get("ordercolumn")))){
			sql.append(" order by  "+map.get("ordercolumn"));
		}else{//默认
			sql.append(" order by attentiondate  ");
		}
		//顺序
		if(!StringUtil.isNullOrisEmpty(map.get(map.get("orderdesc")))){
			sql.append(" desc");
		}
		/**********************************************分页条件**********************************************/
		if(!StringUtil.isNullOrisEmpty(map.get("pageno"))&&!StringUtil.isNullOrisEmpty(map.get("pagesize"))){
			int pageno=Integer.valueOf(map.get("pageno"));
			int pagesize=Integer.valueOf(map.get("pagesize"));
			sql.append(" limit "+(pageno-1)*pagesize+","+pagesize);
		}
		return jdbcTemplate.queryForList(sql.toString());
	}
	
	/**
	 * 根据用户id   或藏品id  。。。。等 查询总数
	 * @param map
	 * @return 总数
	 */
	public int getAttentionForCount(Map<String, String> map){
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(a.id) ");
		sql.append(" from t_baibao_attention a ");
		sql.append(" where 1=1  and a.state=1");
		/**********************************************查询条件**********************************************/
		//根据用户id查询
		if(!StringUtil.isNullOrisEmpty(map.get("userid"))){
			sql.append(" and a.userid="+map.get("userid"));
		}
		//根据藏品id查询
		if(!StringUtil.isNullOrisEmpty(map.get("collectionid"))){
			sql.append(" and a.collectionid="+map.get("collectionid"));
		}
		return jdbcTemplate.queryForInt(sql.toString());
	}

}
