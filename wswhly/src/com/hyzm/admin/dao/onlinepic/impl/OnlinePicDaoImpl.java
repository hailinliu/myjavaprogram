package com.hyzm.admin.dao.onlinepic.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.onlinepic.OnlinePicDao;
import com.hyzm.util.StringUtil;

/**
 * 图片鉴定
 * @author Administrator
 * 2015年4月13日 13:07:21
 */
@Repository
public class OnlinePicDaoImpl implements OnlinePicDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	/***********************************************************以下为藏品方法*******************************************************************************/
	//修改藏品
	public int UpdateOnlinePicColl(Map<String, String> map){
		String sql=" update t_online_piccoll set ";
		String id=map.get("id");
		map.remove("id");
		List<String> listkey=StringUtil.getMapKey(map);//获取map中所有的key
		for(int i=0;i<listkey.size();i++){
			String key=listkey.get(i);
			if(map.get(key)!=null){//判断是否为空
				sql+=key+"='"+map.get(key)+"'";//拼接sql
				if(i<listkey.size()-1){//最后一个不加
					sql+=",";
				}
			}
		}
		String ends=sql.substring(sql.length()-1, sql.length());
		if(ends.equals(",")||ends==","){
			sql=sql.substring(0, sql.length()-1);
		}
		int i = jdbcTemplate.update(sql+" where id="+id);
		if(i>0){return 1;}else{return 0;}
	}
	//查询单个藏品
	public Map<String, Object>  getOnlinePicCollForMap(Map<String, String> map){
		try {
			String sql=" select u.username,u.level,u.mobile,p.name as zjname,e.name as typename,   t.* from t_online_piccoll t left join t_user u on u.id=t.userid left join t_online_picprof p on p.userid=t.zjuserid left join t_online_pictype e on e.id=t.typeid where 1=1";
			if(!StringUtil.isNullOrisEmpty(map.get("id"))){
				sql+=" and t.id="+map.get("id");
			}
			return jdbcTemplate.queryForMap(sql);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	//查询藏品个数
	public int getOnlinePicCollForCount(Map<String, String> map){
		try {
			String sql="  select count(t.id) from t_online_piccoll t left join t_user u on u.id=t.userid left join t_online_picprof p on p.userid=t.zjuserid left join t_online_pictype e on e.id=t.typeid where 1=1 ";
			if(!StringUtil.isNullOrisEmpty(map.get("username"))){
				sql+=" and u.username like '%"+map.get("username")+"%'";
			}
			if(!StringUtil.isNullOrisEmpty(map.get("mobile"))){
				sql+=" and u.mobile like '%"+map.get("mobile")+"%'";
			}
			if(!StringUtil.isNullOrisEmpty(map.get("name"))){
				sql+=" and t.name like '%"+map.get("name")+"%'";
			}
			if(!StringUtil.isNullOrisEmpty(map.get("userid"))){
				sql+=" and t.userid="+map.get("userid");
			}
			if(!StringUtil.isNullOrisEmpty(map.get("state"))){
				sql+=" and t.state="+map.get("state");
			}
			if(!StringUtil.isNullOrisEmpty(map.get("typeid"))&&map.get("typeid").indexOf(",")<0){
				sql+=" and t.typeid="+map.get("typeid");
			}
			if(!StringUtil.isNullOrisEmpty(map.get("typeid"))&&map.get("typeid").indexOf(",")>=0){
				sql+=" and t.typeid in("+map.get("typeid")+") ";
			}
			if(!StringUtil.isNullOrisEmpty(map.get("zjuserid"))){
				sql+=" and t.zjuserid="+map.get("zjuserid");
			}
			if(!StringUtil.isNullOrisEmpty(map.get("isshangpai"))){
				sql+=" and t.isshangpai="+map.get("isshangpai");
			}
			if(!StringUtil.isNullOrisEmpty(map.get("zhpg"))){
				sql+=" and t.zhpg="+map.get("zhpg");
			}
			if(!StringUtil.isNullOrisEmpty(map.get("level"))){
				sql+=" and u.level="+map.get("level");
			}
			System.out.println(sql);
			return jdbcTemplate.queryForInt(sql);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	//查询藏品列表
	public List<Map<String, Object>>  getOnlinePicCollForList(Map<String, String> map){
		try {
			String sql=" select u.username, u.level, u.mobile,p.name as zjname,e.name as typename,   t.* from t_online_piccoll t left join t_user u on u.id=t.userid left join t_online_picprof p on p.userid=t.zjuserid left join t_online_pictype e on e.id=t.typeid  where 1=1 ";
			if(!StringUtil.isNullOrisEmpty(map.get("username"))){
				sql+=" and u.username like '%"+map.get("username")+"%'";
			}
			if(!StringUtil.isNullOrisEmpty(map.get("mobile"))){
				sql+=" and u.mobile like '%"+map.get("mobile")+"%'";
			}
			if(!StringUtil.isNullOrisEmpty(map.get("name"))){
				sql+=" and t.name like '%"+map.get("name")+"%'";
			}
			if(!StringUtil.isNullOrisEmpty(map.get("userid"))){
				sql+=" and t.userid="+map.get("userid");
			}
			if(!StringUtil.isNullOrisEmpty(map.get("state"))){
				sql+=" and t.state="+map.get("state");
			}
			if(!StringUtil.isNullOrisEmpty(map.get("typeid"))&&map.get("typeid").indexOf(",")<0){
				sql+=" and t.typeid="+map.get("typeid");
			}
			if(!StringUtil.isNullOrisEmpty(map.get("typeid"))&&map.get("typeid").indexOf(",")>=0){
				sql+=" and t.typeid in("+map.get("typeid")+") ";
			}
			if(!StringUtil.isNullOrisEmpty(map.get("zjuserid"))){
				sql+=" and t.zjuserid="+map.get("zjuserid");
			}
			if(!StringUtil.isNullOrisEmpty(map.get("isshangpai"))){
				sql+=" and t.isshangpai="+map.get("isshangpai");
			}
			if(!StringUtil.isNullOrisEmpty(map.get("zhpg"))){
				sql+=" and t.zhpg="+map.get("zhpg");
			}
			if(!StringUtil.isNullOrisEmpty(map.get("level"))){
				sql+=" and u.level="+map.get("level");
			}
			/**********************************************排序条件**********************************************/
			if(!StringUtil.isNullOrisEmpty(map.get("ordercolumn"))&&(map.get("ordercolumn")=="rand"||map.get("ordercolumn").equals("rand"))){//随机
				sql+=" order by  rand()";
			}else if(!StringUtil.isNullOrisEmpty(map.get("ordercolumn"))){
				sql+=" order by  "+map.get("ordercolumn");
			}else{//默认根据上传时间 
				sql+=" order by  uploaddate ";
			}
			//顺序
			if(!StringUtil.isNullOrisEmpty(map.get("orderdesc"))){
				sql+=" desc";
			}
			
			/**********************************************分页条件**********************************************/
			if(!StringUtil.isNullOrisEmpty(map.get("pageno"))&&!StringUtil.isNullOrisEmpty(map.get("pagesize"))){
				int pageno=Integer.valueOf(map.get("pageno"));
				int pagesize=Integer.valueOf(map.get("pagesize"));
				sql+=" limit "+(pageno-1)*pagesize+","+pagesize;
			}
			System.out.println(sql);
			return jdbcTemplate.queryForList(sql);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/***********************************************************以下为图片鉴定藏品类型方法*******************************************************************************/
	//获取藏品类型
	private final String getPicType=" select * from t_online_pictype ";
	public List<Map<String, Object>> getOnlinePicType(Map<String, String> map){
		return jdbcTemplate.queryForList(getPicType);
	}
	
	public int AddOnlinePicType(Map<String, String> map) {
		String sql=" insert into t_online_pictype (name,state) values(?,1)";
		 int i = jdbcTemplate.update(sql,new Object[]{map.get("name")});
			if(i>0){return 1;}else{return 0;}
	}
	public int UpdateOnlinePicType(Map<String, String> map) {
		String sql=" update t_online_pictype set ";
		String id=map.get("id");
		map.remove("id");
		List<String> listkey=StringUtil.getMapKey(map);//获取map中所有的key
		for(int i=0;i<listkey.size();i++){
			String key=listkey.get(i);
			if(map.get(key)!=null){//判断是否为空
				sql+=key+"='"+map.get(key)+"'";//拼接sql
				if(i<listkey.size()-1){//最后一个不加
					sql+=",";
				}
			}
		}
		String ends=sql.substring(sql.length()-1, sql.length());
		if(ends.equals(",")||ends==","){
			sql=sql.substring(0, sql.length()-1);
		}
		int i = jdbcTemplate.update(sql+" where id="+id);
		if(i>0){return 1;}else{return 0;}
	}
	/***********************************************************以下为图片鉴定专家方法*******************************************************************************/
	//获取专家
	private final String getPicProf=" select * from t_online_picprof ";
	public List<Map<String, Object>> getOnlinePicProf(Map<String, String> map){
		return jdbcTemplate.queryForList(getPicProf);
	}
	public int AddOnlinePicProf(Map<String, String> map) {
		String sql=" insert into t_online_picprof (name,typeid,userid,mobile,state) values(?,?,?,?,1)";
		 int i = jdbcTemplate.update(sql,new Object[]{map.get("name"),map.get("typeid"),map.get("userid"),map.get("mobile")});
			if(i>0){return 1;}else{return 0;}
	}
	
	public int UpdateOnlinePicProf(Map<String, String> map) {
		String sql=" update t_online_picprof set ";
		String id=map.get("id");
		map.remove("id");
		List<String> listkey=StringUtil.getMapKey(map);//获取map中所有的key
		for(int i=0;i<listkey.size();i++){
			String key=listkey.get(i);
			if(map.get(key)!=null){//判断是否为空
				sql+=key+"='"+map.get(key)+"'";//拼接sql
				if(i<listkey.size()-1){//最后一个不加
					sql+=",";
				}
			}
		}
		String ends=sql.substring(sql.length()-1, sql.length());
		if(ends.equals(",")||ends==","){
			sql=sql.substring(0, sql.length()-1);
		}
		int i = jdbcTemplate.update(sql+" where id="+id);
		if(i>0){return 1;}else{return 0;}
	}
	
}