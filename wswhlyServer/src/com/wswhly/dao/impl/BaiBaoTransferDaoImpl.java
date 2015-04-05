package com.wswhly.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.wswhly.dao.BaiBaoTransferDao;
import com.wswhly.util.StringUtil;
/**
 * 百宝街--交易中转 dao实现类
 * @author xjt
 * @createDate 2014年12月15日 14:43:00
 */
@Repository
public class BaiBaoTransferDaoImpl implements BaiBaoTransferDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/**
	 * 添加交易中转信息
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddTransfer(Map<String, String> map){
		Random rand = new Random();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String sql="insert into t_baibao_transfer (ordernumber,purchaseruserid,shopuserid,starttime,txmjfhtime,dddqtime,collectionid,state,version)value(?,?,?,now(),date_add(now(), INTERVAL 12 hour),date_add(now(), INTERVAL 1 day),?,1,0)";
		 int i = jdbcTemplate.update(sql,
					new Object[]{
				 	"BBX"+sdf.format(new Date()).toString()+rand.nextInt(90000000),
					map.get("purchaseruserid"),
					map.get("shopuserid"),
					map.get("collectionid")
					});
			if(i>0){return 1;}else{return 0;}
	}
	
	/**
	 * 修改交易中转信息
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int UpdateTransfer(Map<String, String> map){
		String sql=" update t_baibao_transfer set ";
		String id=map.get("id");
		String version=map.get("version");
		map.remove("id");
		map.remove("version");
		List<String> listkey=StringUtil.getMapKey(map);//获取map中所有的key
		for(int i=0;i<listkey.size();i++){
			String key=listkey.get(i);
			if(map.get(key)!=null){//判断是否为空
				if(map.get(key).indexOf("now")>=0||map.get(key).indexOf("day")>=0){
					sql+=key+"= "+map.get(key)+" ";//拼接sql
				}else{
					sql+=key+"='"+map.get(key)+"'";//拼接sql
				}
				
				sql+=",";
			}
		}
		sql+=" version=version+1";
		sql+=" where id="+id;
		if(!StringUtil.isNullOrisEmpty(version)){
			sql+=" and version="+version;
		}
		int i = jdbcTemplate.update(sql);
		if(i>0){return 1;}else{return 0;}
	}
	
	/**
	 * 删除交易中转信息
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int DeleteTransfer(Map<String, String> map){
		String sql=" update t_baibao_transfer set state=6 where id="+map.get("id")+" and version="+map.get("version");
		int i = jdbcTemplate.update(sql);
		if(i>0){return 1;}else{return 0;}
	}
	
	/**
	 * 根据买方id  或者卖方id  等 查询交易中转   分页查询
	 * @param map
	 * @return list
	 */
	public List<Map<String,Object>> getTransferForList(Map<String, String> map){
		StringBuffer sql=new StringBuffer();
		sql.append(" select  date_format(t.starttime,'%Y-%m-%d %H:%i') as sfstarttime, date_format(t.paytime,'%Y-%m-%d %H:%i')as sfpaytime,date_format(t.txmjfhtime,'%Y-%m-%d %H:%i')as sftxmjfhtime,date_format(t.dddqtime,'%Y-%m-%d %H:%i')as sfdddqtime,");
		sql.append(" date_format(t.deliverytime,'%Y-%m-%d %H:%i')as sfdeliverytime,date_format(t.wfhtime,'%Y-%m-%d %H:%i')as sfwfhtime,date_format(t.receivetime,'%Y-%m-%d %H:%i')as sfreceivetime,date_format(t.syspaytime,'%Y-%m-%d %H:%i')as sfsyspaytime,");
		sql.append(" date_format(t.applyreturntime,'%Y-%m-%d %H:%i')as sfapplyreturntime,date_format(t.shopconfirmtime,'%Y-%m-%d %H:%i')as sfshopconfirmtime,date_format(t.thfhtime,'%Y-%m-%d %H:%i')as sfthfhtime, ");
		sql.append(" date_format(t.thmjqrtime,'%Y-%m-%d %H:%i')as sfthmjqrtime,date_format(t.dkdmftime,'%Y-%m-%d %H:%i')as sfdkdmftime, t.* ,c.id as collid,c.name,c.baibaonum,c.imgurl,c.price ,up.username as purchname,up.mobile as purchmobile,u.username as shopusername,u.mobile as shopmobile ,date_format(now(),'%Y-%m-%d %H:%i')as sfnowtime");
		sql.append(" from t_baibao_transfer t ");
		sql.append(" left join t_baibao_collection c ");
		sql.append(" on c.id=t.collectionid ");
		sql.append(" left join t_user u on t.shopuserid=u.id left join t_user up on t.purchaseruserid=up.id"); 
		sql.append(" where 1=1 ");
		/**********************************************查询条件**********************************************/
		//购买人id
		if(!StringUtil.isNullOrisEmpty(map.get("purchaseruserid"))){
			sql.append(" and t.purchaseruserid="+map.get("purchaseruserid"));
		}
		//卖方id
		if(!StringUtil.isNullOrisEmpty(map.get("shopuserid"))){
			sql.append(" and t.shopuserid="+map.get("shopuserid"));
		}
		//藏品id
		if(!StringUtil.isNullOrisEmpty(map.get("collectionid"))){
			sql.append(" and t.collectionid="+map.get("collectionid"));
		}
		//状态                                                            
		if(!StringUtil.isNullOrisEmpty(map.get("state"))){
			sql.append(" and t.state in ("+map.get("state")+")");
		}
		
		
		
		/**********************************************排序条件**********************************************/
		if(!StringUtil.isNullOrisEmpty(map.get("ordercolumn"))){
			sql.append(" order by  "+map.get("ordercolumn"));
		}else{//默认
			sql.append(" order by starttime  ");
		}
		//顺序
		if(!StringUtil.isNullOrisEmpty(map.get("orderdesc"))){
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
	 * 根据买方id  或者卖方id  等 查询交易中转   总数
	 * @param map
	 * @return int  总数
	 */
	public int getTransferForCount(Map<String, String> map){
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(t.id) ");
		sql.append(" from t_baibao_transfer t ");
		sql.append(" left join t_baibao_collection c ");
		sql.append(" on c.id=t.collectionid ");
		sql.append(" where  1=1 ");
		/**********************************************查询条件**********************************************/
		//购买人id
		if(!StringUtil.isNullOrisEmpty(map.get("purchaseruserid"))){
			sql.append(" and t.purchaseruserid="+map.get("purchaseruserid"));
		}
		//卖方id
		if(!StringUtil.isNullOrisEmpty(map.get("shopuserid"))){
			sql.append(" and t.shopuserid="+map.get("shopuserid"));
		}
		//藏品id
		if(!StringUtil.isNullOrisEmpty(map.get("collectionid"))){
			sql.append(" and t.collectionid="+map.get("collectionid"));
		}
		//状态
		if(!StringUtil.isNullOrisEmpty(map.get("state"))){
			sql.append(" and t.state in ("+map.get("state")+")");
		}
		return jdbcTemplate.queryForInt(sql.toString());
	}
	
	/**
	 * 查询单个结果
	 * @param map
	 * @return
	 */
	public Map<String,Object>getTransfer(Map<String, String> map){
		StringBuffer sql=new StringBuffer();
		sql.append(" select date_format(t.starttime,'%Y-%m-%d %H:%i') as sfstarttime, date_format(t.paytime,'%Y-%m-%d %H:%i')as sfpaytime,date_format(t.txmjfhtime,'%Y-%m-%d %H:%i')as sftxmjfhtime,date_format(t.dddqtime,'%Y-%m-%d %H:%i')as sfdddqtime,");
		sql.append(" date_format(t.deliverytime,'%Y-%m-%d %H:%i')as sfdeliverytime,date_format(t.wfhtime,'%Y-%m-%d %H:%i')as sfwfhtime,date_format(t.receivetime,'%Y-%m-%d %H:%i')as sfreceivetime,date_format(t.syspaytime,'%Y-%m-%d %H:%i')as sfsyspaytime,");
		sql.append(" date_format(t.applyreturntime,'%Y-%m-%d %H:%i')as sfapplyreturntime,date_format(t.shopconfirmtime,'%Y-%m-%d %H:%i')as sfshopconfirmtime,date_format(t.thfhtime,'%Y-%m-%d %H:%i')as sfthfhtime, ");
		sql.append(" date_format(t.thmjqrtime,'%Y-%m-%d %H:%i')as sfthmjqrtime,date_format(t.dkdmftime,'%Y-%m-%d %H:%i')as sfdkdmftime, t.* ,s.shopname,s.mobile,s.id as shopid,c.id as collid,c.name,c.baibaonum,c.imgurl,c.price ,up.username as purchname,u.username as shopusername,date_format(now(),'%Y-%m-%d %H:%i')as sfnowtime ,now() as nowtime ");
		sql.append(" from t_baibao_transfer t ");
		sql.append(" left join t_baibao_collection c ");
		sql.append(" on c.id=t.collectionid ");
		sql.append(" left join t_user u on t.shopuserid=u.id left join t_user up on t.purchaseruserid=up.id left join t_baibao_shop s  on s.userid=u.id "); 
		sql.append(" where t.id="+map.get("id"));
		return jdbcTemplate.queryForMap(sql.toString());
	}
	
	
	
	
	
	
	
	/********************************************************以下为支付**************************************************************/
	
	/**
	 * 修改用户余额
	 */
	public int updatemoney(Map<String,Object> where){
		//修改用户表中余额
		int k=jdbcTemplate.update("update t_user set money=money-"+where.get("money")+",point=point+"+where.get("point")+"  where id="+where.get("userid"));
		if(k>0){
			return 1;
		}
		return 0;
		
	}
	
	private final String addPointsRecord = "insert into t_point(userid,points,tradetype,tradedate,type,note,leftpoints,state) values (?,?,?,now(),1,?,?,1)";
	public int addpoint(Map<String,Object> data) {
		int nowpoints = this.queryPoints(Long.valueOf(data.get("userid").toString()));
		int k=jdbcTemplate.update(addPointsRecord,new Object[]{data.get("userid"),data.get("points"),data.get("tradetype"),data.get("note"),nowpoints});
		if(k>0){
			return 1;
		}
		return 0;
		
	}

	private final String addmoneyRecord = "insert into t_money(userid,money,tradetype,tradedate,type,note,leftmoney,ordernum) values (?,?,?,now(),2,?,?,?)";
	public int addusermoney(Map<String, Object> data) {
		int k=jdbcTemplate.update(addmoneyRecord,new Object[]{data.get("userid"),data.get("money"),data.get("tradetype"),data.get("note"),data.get("leftmoney"),data.get("ordernum")});
		if(k>0){
			return 1;
		}
		return 0;
	}
	
	private final String addOrder = "insert into t_order(userid,ordernum,money,tradetype,type,createdate,leftmoney,state) values(?,?,?,?,2,now(),?,0)";
	public int addOrder(Map<String, Object> data) {
		int k=jdbcTemplate.update(addOrder,new Object[]{data.get("userid"),data.get("ordernum"),data.get("money"),data.get("tradetype"),data.get("leftmoney")});
		if(k>0){
			return 1;
		}
		return 0;
	}
	private final String queryPoints = "select point from t_user where id = ?";
	public int queryPoints(long userid){
		return jdbcTemplate.queryForInt(queryPoints,new Object[]{userid});
	}

	private final String queryMoney = "select money from t_user where id = ?";
	public double queryMoney(long userid){
		return jdbcTemplate.queryForObject(queryMoney,new Object[]{userid},Double.class);
	}
}
