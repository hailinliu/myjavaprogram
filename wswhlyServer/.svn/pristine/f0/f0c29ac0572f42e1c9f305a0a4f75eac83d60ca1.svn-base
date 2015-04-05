package com.wswhly.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wswhly.dao.OnlinePicDao;
import com.wswhly.util.StringUtil;
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
	//增加藏品
	public int AddOnlinePicColl(Map<String, String> map){
		Random rand = new Random();
		String sql=" insert into t_online_piccoll (bh,userid,name,pic,typeid,size,money,note,zjuserid,uploaddate,yjresultsdate,thcs,isjs,state) values ";
			   sql+=" (?,?,?,?,?,?,?,?,?,?,?,0,1,1)";
			   int i = jdbcTemplate.update(sql,
						new Object[]{
					   "TPJD"+rand.nextInt(90000000),
						map.get("userid"),
						map.get("name"),
						map.get("pic"),
						map.get("typeid"),
						map.get("size"),
						map.get("money"),
						map.get("note"),
						map.get("zjuserid"),
						map.get("uploaddate"),
						map.get("yjresultsdate")
						});
				if(i>0){return 1;}else{return 0;}
	}
	//修改藏品
	public int UpdateOnlinePicColl(Map<String, String> map){
		String sql=" update t_online_piccoll set ";
		String id=map.get("id");
		map.remove("id");
		List<String> listkey=StringUtil.getMapKey(map);//获取map中所有的key
		for(int i=0;i<listkey.size();i++){
			String key=listkey.get(i);
			if(map.get(key)!=null){//判断是否为空
				if(map.get(key)!="null"&&!map.get(key).equals("null")){
					sql+=key+"='"+map.get(key)+"'";//拼接sql
				}else{
					sql+=key+"="+map.get(key);//拼接sql
				}
				if(i<listkey.size()-1){//最后一个不加
					sql+=",";
				}
			}
		}
		int i = jdbcTemplate.update(sql+" where id="+id);
		if(i>0){return 1;}else{return 0;}
	}
	//删除藏品
	public int DeleteOnlinePicColl(Map<String, String> map){
		return -1;
	}
	//查询单个藏品
	public Map<String, Object>  getOnlinePicCollForMap(Map<String, String> map){
		String sql=" select u.level, t.*,date_format(t.uploaddate,'%Y-%m-%d %H:%i:%s')as sfuploaddate,date_format(t.yjresultsdate,'%Y-%m-%d %H:%i:%s')as sfyjresultsdate,date_format(t.resultsdate,'%Y-%m-%d %H:%i:%s')as sfresultsdate ,p.name as zjname,e.name as typename from t_online_piccoll t left join t_online_picprof p on p.userid=t.zjuserid left join t_online_pictype e on e.id=t.typeid left join t_user u on u.id=t.userid  where 1=1";
		if(!StringUtil.isNullOrisEmpty(map.get("id"))){
			sql+=" and t.id="+map.get("id");
		}
		return jdbcTemplate.queryForMap(sql);
	}
	//查询藏品个数
	public int getOnlinePicCollForCount(Map<String, String> map){
		String sql="  select count(t.id) from t_online_piccoll t where 1=1 ";
		if(!StringUtil.isNullOrisEmpty(map.get("userid"))){
			sql+=" and t.userid="+map.get("userid");
		}
		if(!StringUtil.isNullOrisEmpty(map.get("state"))){
			sql+=" and t.state="+map.get("state");
		}
		if(!StringUtil.isNullOrisEmpty(map.get("isshangpai"))){
			sql+=" and t.isshangpai ="+map.get("isshangpai");
		}
		if(!StringUtil.isNullOrisEmpty(map.get("typeid"))){
			sql+=" and t.typeid ="+map.get("typeid");
		}
		if(!StringUtil.isNullOrisEmpty(map.get("money"))){
			sql+=" and t.money ="+map.get("money");
		}
		
		return jdbcTemplate.queryForInt(sql);
	}
	//查询藏品列表
	public List<Map<String, Object>>  getOnlinePicCollForList(Map<String, String> map){
		String sql="  select u.level, t.* ,date_format(t.uploaddate,'%Y-%m-%d %H:%i')as sfuploaddate,date_format(t.yjresultsdate,'%m-%d %H:%i')as sfyjresultsdate,date_format(t.resultsdate,'%m-%d %H:%i')as sfresultsdate ,p.name as zjname,e.name as typename from t_online_piccoll t left join t_online_picprof p on p.userid=t.zjuserid left join t_online_pictype e on e.id=t.typeid left join t_user u on u.id=t.userid  where 1=1 ";
		if(!StringUtil.isNullOrisEmpty(map.get("userid"))){
			sql+=" and t.userid="+map.get("userid");
		}
		if(!StringUtil.isNullOrisEmpty(map.get("state"))){
			sql+=" and t.state="+map.get("state");
		}
		if(!StringUtil.isNullOrisEmpty(map.get("isshangpai"))){
			sql+=" and t.isshangpai ="+map.get("isshangpai");
		}
		if(!StringUtil.isNullOrisEmpty(map.get("typeid"))){
			sql+=" and t.typeid ="+map.get("typeid");
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
		return jdbcTemplate.queryForList(sql);
	}
	
	
	//修改用户余额
	public boolean UpdateMoney(Map<String,Object> map){
		//修改用户表中余额
		int k=jdbcTemplate.update("update t_user set money=money-"+map.get("money")+",point=point+"+map.get("money")+ " where id="+map.get("userid"));
		if(k>0){
			return true;
		}
		return false;
	}
	//修改积分
	private final String addPointsRecord = "insert into t_point(userid,points,tradetype,tradedate,type,note,leftpoints,state) values (?,?,?,now(),1,?,?,1)";
	public boolean AddPoint(Map<String,Object> map){
		int nowpoints = this.queryPoints(Long.valueOf(map.get("userid").toString()));
		int k=jdbcTemplate.update(addPointsRecord,new Object[]{map.get("userid"),map.get("points"),map.get("tradetype"),map.get("note"),nowpoints});
		if(k>0){
			return true;
		}
		return false;
	}
	private final String queryPoints = "select point from t_user where id = ?";
	public int queryPoints(long userid){
		return jdbcTemplate.queryForInt(queryPoints,new Object[]{userid});
	}
	
	//修改明细
	private final String addmoneyRecord = "insert into t_money(userid,money,tradetype,tradedate,type,note,leftmoney,ordernum) values (?,?,?,now(),2,?,?,?)";
	public boolean AddUserMoney(Map<String,Object> map){
		int k=jdbcTemplate.update(addmoneyRecord,new Object[]{map.get("userid"),map.get("money"),map.get("tradetype"),map.get("note"),map.get("leftmoney"),map.get("ordernum")});
		if(k>0){
			return true;
		}
		return false;
	}
	//添加订单
	private final String addOrder = "insert into t_order(userid,ordernum,money,tradetype,type,createdate,leftmoney,state) values(?,?,?,?,2,now(),?,0)";
	public boolean AddOrder(Map<String, Object> data) {
		int k=jdbcTemplate.update(addOrder,new Object[]{data.get("userid"),data.get("ordernum"),data.get("money"),data.get("tradetype"),data.get("leftmoney")});
		if(k>0){
			return true;
		}
		return false;
	}
	
	/***********************************************************以下为图片鉴定藏品类型方法*******************************************************************************/
	//获取藏品类型
	private final String getPicType=" select * from t_online_pictype where state=1";
	public List<Map<String, Object>> getOnlinePicType(Map<String, String> map){
		return jdbcTemplate.queryForList(getPicType);
	}
	
	
	/***********************************************************以下为图片鉴定专家方法*******************************************************************************/
	//获取专家
	public List<Map<String, Object>> getOnlinePicProf(Map<String, String> map){
		String sql=" select  p.*,(select count(c.id) from t_online_piccoll c where c.zjuserid=p.userid) as countcoll from t_online_picprof p where p.state<>3    ";
		if(!StringUtil.isNullOrisEmpty(map.get("typeid"))){
			sql+=" and p.typeid like '%"+map.get("typeid")+",%'";
		}
		if(!StringUtil.isNullOrisEmpty(map.get("state"))){
			sql+=" and p.state ="+map.get("state");
		}
		sql+=" order by  countcoll asc";
		return jdbcTemplate.queryForList(sql);
	}
}
