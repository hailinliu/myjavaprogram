package com.wswhly.dao.impl;

import java.util.List;
import java.util.Map;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.wswhly.dao.BaiBaoCollectionDao;
import com.wswhly.util.StringUtil;
/**
 * 百宝街--藏品 dao实现类
 * @author xjt
 * @createDate 2014年12月15日 11:14:05
 */
@Repository
public class BaiBaoCollectionDaoImpl implements BaiBaoCollectionDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	/******************************************************个人中心********************************************************************/
	/**
	 * 添加藏品
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int AddCollection(Map<String, String> map){
		Random rand = new Random();
		String sql="insert into t_baibao_collection (type,name,baibaonum,userid,uploaddate,note,advertisement,price,imgurl,state,isagree,clicknum,record,opentrade,opentradetime)";
			   sql+=" values(?,?,?,?,now(),?,?,?,?,1,?,0,0,?,now())";
			   int i = jdbcTemplate.update(sql,
						new Object[]{
						map.get("type"),
						map.get("name"),
						"BBJ"+rand.nextInt(90000000),
						map.get("userid"),
						map.get("note"),
						map.get("advertisement"),
						map.get("price"),
						map.get("imgurl"),
						map.get("isagree"),
						map.get("isagree")
						});
				if(i>0){return 1;}else{return 0;}
	}
	
	/**
	 * 修改藏品
	 * @param map
	 * @return 0：失败  1：成功
	 */
	public int UpdateCollection(Map<String, String> map){
		String sql=" update t_baibao_collection set ";
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
		int i = jdbcTemplate.update(sql+",record=record+1 where id="+id);
		if(i>0){return 1;}else{return 0;}
	}
	
	/**
	 * 删除藏品  
	 * @param map  根据id单个删除   或者根据userid 批量删除
	 * @return 0：失败  1：成功
	 */
	public int DeleteCollection(Map<String, String> map){
		String sql=" update t_baibao_collection set state=6 ";
		if(!StringUtil.isNullOrisEmpty(map.get("id"))){//根据id删除
			sql+=" where id="+map.get("id");
		}else if(!StringUtil.isNullOrisEmpty(map.get("userid"))){//根据用户id删除
			sql+=" where userid="+map.get("userid");
		}
		int i = jdbcTemplate.update(sql);
		if(i>0){return 1;}else{return 0;}
	}
	
	
	/******************************************************前台展示********************************************************************/
	
	/**
	 * 专家推荐藏品  
	 * @param map  
	 * @return 0：失败  1：成功
	 */
	public int UpdateCollectionByZj(Map<String, String> map){
		String sql=" update t_baibao_collection set zjid="+map.get("zjid")+" where id="+map.get("id");
		int i = jdbcTemplate.update(sql);
		if(i>0){return 1;}else{return 0;}
	}
	
	/******************************************************公共方法********************************************************************/
	
	/**
	 * 根据藏品id查询藏品详细信息
	 * shopname :店铺名称 fullname：店铺地址 zjname:专家名称 cyrsgrades：评分参与人数 zjgrades：评分总计 tsforums:评论条数 cyrsforums:评论参与人数 
	 * @param map  藏品id
	 * @return map
	 */
	public Map<String,Object> getCollection(Map<String, String> map){
		StringBuffer sql=new StringBuffer();
		sql.append(" select c.*,date_format(c.uploaddate,'%Y-%m-%d') as formatcreatedate,s.shopname,s.id as shopid,a.fullname,u.username as zjname, ");
		sql.append(" (select count(distinct gr.userid) from t_baibao_grades gr where gr.collectionid =c.id)as cyrsgrades, ");
		sql.append(" (select sum(ch.grade) from t_baibao_choose ch where  ch.id in(select gr.chooseid from t_baibao_grades gr where gr.collectionid =c.id)) as zjgrades, ");
		sql.append(" (select count(f.id) from t_forums f where f.collectionid =c.id and type=88) as tsforums, ");
		sql.append(" (select count(distinct f.userid) from t_forums f where f.collectionid=c.id and type=88 ) as cyrsforums ");
		sql.append(" from t_baibao_collection c ");
		sql.append(" left join t_baibao_shop s ");
		sql.append(" on s.userid=c.userid ");
		sql.append(" left join t_dic_address a ");
		sql.append(" on a.`code`=s.addresscode ");
		sql.append(" left join t_user u ");
		sql.append(" on u.id=c.zjid ");
		sql.append(" where c.id=");
		sql.append(map.get("id"));
		  jdbcTemplate.update("update t_baibao_collection set clicknum=clicknum+1 where id="+map.get("id") );
		return jdbcTemplate.queryForMap(sql.toString());
	}
	
	/**
	 * 根据用户id   或者店铺id   或者  藏品种类  、藏品价格区间   交易中转类型  交易中转状态    是否专家推荐  卖家地址   关键字 藏品名称  店铺名称  店主名称  分页查询        。。。。。。。 条件不确定 
	 * shopname :店铺名称 fullname：店铺地址 cyrsgrades：评分参与人数 zjgrades：评分总计 tsforums:评论条数 cyrsforums:评论参与人数
	 * 根据  最新  最热（点击量）    评论排序 评分排序
	 * @param map 
	 * @return List
	 */
	public List<Map<String,Object>> getCollectionForList(Map<String, String> map){
		StringBuffer sql=new StringBuffer();
		sql.append(" select c.* ,u.username as dzusernaem, u.realname as dzrealname, s.shopname,s.id as shopid,a.fullname, ct.typename,date_format(c.uploaddate,'%Y-%m-%d') as formatcreatedate,");
		sql.append(" (select us.username from t_user us  where us.id=c.zjid)as zjname, ");
		sql.append(" (select count(distinct gr.userid) from t_baibao_grades gr where gr.collectionid =c.id)as cyrsgrades, ");
		sql.append(" (select sum(ch.grade) from t_baibao_choose ch where ch.id in(select gr.chooseid from t_baibao_grades gr where gr.collectionid =c.id)) as zjgrades, ");
		sql.append(" (select count(f.id) from t_forums f where f.collectionid =c.id and type=88) as tsforums, ");
		sql.append(" (select count(distinct f.userid) from t_forums f where f.collectionid=c.id and type=88 ) as cyrsforums ");
		sql.append(" from t_baibao_collection c ");
		sql.append(" left join t_baibao_shop s ");
		sql.append(" on s.userid=c.userid ");
		sql.append(" left join t_dic_address a ");
		sql.append(" on a.code=s.addresscode ");
		sql.append(" left join t_user u ");
		sql.append(" on u.id=s.userid ");
		sql.append(" left join t_collectiontype ct on ct.id=c.type");
		/**********************************************查询条件**********************************************/
			sql.append(where(map));
			
		/**********************************************排序条件**********************************************/
		if(!StringUtil.isNullOrisEmpty(map.get("ordercolumn"))&&(map.get("ordercolumn")=="rand"||map.get("ordercolumn").equals("rand"))){//随机
			sql.append(" order by  rand()");
		}else if(!StringUtil.isNullOrisEmpty(map.get("ordercolumn"))){
			sql.append(" order by  "+map.get("ordercolumn"));
		}else{//默认根据上传时间
			sql.append(" order by  uploaddate ");
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
	 * 根据用户id   或者店铺id   或者  藏品种类  、藏品价格区间   交易中转类型  交易中转状态    是否专家推荐  卖家地址  关键字 藏品名称  店铺名称  店主名称   查询总数        。。。。。。。 条件不确定 
	 * @param map 
	 * @return int 总数
	 */
	public int getCollectionForCount(Map<String, String> map){
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(s.id) ");
		sql.append(" from t_baibao_collection c ");
		sql.append(" left join t_baibao_shop s ");
		sql.append(" on s.userid=c.userid ");
		sql.append(" left join t_dic_address a ");
		sql.append(" on a.code=s.addresscode ");
		sql.append(" left join t_user u ");
		sql.append(" on u.id=s.userid ");
		/**********************************************查询条件**********************************************/
		sql.append(where(map));
		return jdbcTemplate.queryForInt(sql.toString());
	}
	
	/**
	 * 生成查询条件
	 * @param map
	 * @return
	 */
	public static String where(Map<String, String> map){
		StringBuffer where=new StringBuffer();
		where.append(" where 1=1 ");
		//用户id
		if(!StringUtil.isNullOrisEmpty(map.get("userid"))){
			where.append(" and c.userid="+map.get("userid"));
		}
		//店铺id
		if(!StringUtil.isNullOrisEmpty(map.get("shopid"))){
			where.append(" and s.id="+map.get("shopid"));
		}
		//藏品种类
		if(!StringUtil.isNullOrisEmpty(map.get("type"))){
			where.append(" and c.type in ("+map.get("type")+")");
		}
		//价格区间
		if(!StringUtil.isNullOrisEmpty(map.get("startprice"))){//开始价格
			where.append(" and c.price  >= ("+map.get("startprice")+")");
		}
		if(!StringUtil.isNullOrisEmpty(map.get("endprice"))){//结束价格
			where.append(" and c.price  <= ("+map.get("endprice")+")");
		}
		//交易中转
		if(!StringUtil.isNullOrisEmpty(map.get("isagree"))){
			where.append(" and c.isagree="+map.get("isagree"));
		}
		//是否专家推荐
		if(!StringUtil.isNullOrisEmpty(map.get("iszj"))){
			if(map.get("iszj")=="yes"||map.get("iszj").equals("yes")){//有专家推荐
				where.append(" and c.zjid is not null");
			}
			if(map.get("iszj")=="no"||map.get("iszj").equals("no")){//没有专家推荐
				where.append(" and c.zjid is  null");
			}
		}
		//卖家地址(省)
		if(!StringUtil.isNullOrisEmpty(map.get("addresscode"))&&map.get("addresscode").indexOf("0000")>=0){
			where.append(" and left(s.addresscode,2) in ("); //前两位代表省份
			String [] addresscodelist=map.get("addresscode").split(",");
			for(int i=0;i<addresscodelist.length;i++){
				if(i<addresscodelist.length-1){
					where.append(addresscodelist[i].substring(0, 2)+",");
				}else{
					where.append(addresscodelist[i].substring(0, 2));
				}
				
			}
			where.append(")"); //前两位代表省份
		}
		//状态
		if(!StringUtil.isNullOrisEmpty(map.get("state"))){
			where.append(" and c.state in("+map.get("state")+")");
		}else{
			where.append(" and c.state in (2,3,4)");
		}
		//店铺状态
		where.append(" and s.state =1");
		
		//关键字（藏品名称  店铺名称  店主名称）
		if(!StringUtil.isNullOrisEmpty(map.get("keyword"))){
			where.append(" and concat(c.name,'^^',s.shopname,'^^',u.username) like '%"+map.get("keyword")+"%' ");
		}
		return where.toString();
	}

}
