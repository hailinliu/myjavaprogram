package com.wswhly.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wswhly.dao.BaibaoShopDao;
import com.wswhly.util.StringUtil;
/**
 * 百宝街--店铺 dao实现类
 * @author xjt
 * @createDate 2014年12月12日 09:03:00
 */
@Repository
public class BaibaoShopDaoImpl implements BaibaoShopDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
/******************************************************个人中心********************************************************************/
	
	/**
	* 商家申请
	* @param data
	* @return int  0:失败  1：成功
	*/
	public int AddShop(Map<String, String> map){
		String sql="insert into t_baibao_shop(shopname,userid,mobile,createdate,weixin,addresscode,shopaddress,model,state,desction,weixinimg,img,mainscope,clicknum,manifesto) values (?,?,?,now(),?,?,?,2,1,?,?,?,?,0,?)";
		int i = jdbcTemplate.update(sql,
				new Object[]{
				map.get("shopname"),
				map.get("userid"),
				map.get("mobile"),
				map.get("weixin"),
				map.get("addresscode"),
				map.get("shopaddress"),
				map.get("desction"),
				map.get("weixinimg"),
				map.get("img"),
				map.get("mainscope"),
				map.get("manifesto")
				});
		if(i>0){return 1;}else{return 0;}
	}
	
	
	/**
	* 修改商家信息
	* @param data
	* @return int 0:失败  1：成功
	*/
	public int UpdateShop(Map<String, String> map){
		String sql=" update t_baibao_shop set ";
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
		int i = jdbcTemplate.update(sql+"where id="+id);
		if(i>0){return 1;}else{return 0;}
	}
	
	
	/******************************************************前台展示********************************************************************/
	 
	/**
	 * 根据  经营范围   详细地址   关键字 （商家名称   店铺名称  手机号  微信号）   分页查询         。。。。。。。 条件不确定 
	 * 根据  最新  最热（点击量）    评论排序 评分排序
	 * sumcollection :共上传藏品件数，dscollection：待售中藏品件数，jyzzcollection:交易中转中的藏品件数，yscollection：已售罄藏品件数，cyrsgrades：评分参与人数，zjgrades：评分总计，tsforums:评论条数，cyrsforums:评论参与人数, clicknum：店铺点击量 最热
	 * @param map 
	 * @return List
	 */
	public List<Map<String,Object>> getShopForList(Map<String, String> map){
		
		
		String searchType=map.get("searchtype");
		
		//乐园藏品谁家多
		if(searchType!=null&&(searchType=="lycpsjd"||searchType.equals("lycpsjd"))){
				StringBuffer sql=new StringBuffer();
				sql.append(" select  s.id,s.shopname, ");
				sql.append(" (select u.username from t_user u where u.id=s.userid) as username, ");
				sql.append(" (select count(c.id) from t_baibao_collection c where c.userid=s.userid and c.state<=4) as sumcollection  ");
				sql.append(" from t_baibao_shop s   ");
				//状态
				sql.append(" where  s.state=1");
				sql.append(" order by  "+map.get("ordercolumn")+" desc ");
				if(!StringUtil.isNullOrisEmpty(map.get("pageno"))&&!StringUtil.isNullOrisEmpty(map.get("pagesize"))){
					int pageno=Integer.valueOf(map.get("pageno"));
					int pagesize=Integer.valueOf(map.get("pagesize"));
					sql.append(" limit "+(pageno-1)*pageno+","+pagesize);
				}
				return jdbcTemplate.queryForList(sql.toString());
		}else{
			//先根据条件查询出id
			StringBuffer xsql=new StringBuffer();
			xsql.append(" select id from( ");
			xsql.append(" select   s.id, ");
			xsql.append(" (select u.username from t_user u where u.id=s.userid) as username  ");
			xsql.append(" from t_baibao_shop s   ");
			/**********************************************查询条件**********************************************/
			xsql.append(" where 1=1 ");
			//状态
			xsql.append(" and s.state=1");
			//经营范围
			if(!StringUtil.isNullOrisEmpty(map.get("mainscope"))){
				String mainscope[]=map.get("mainscope").split(",");
				if(mainscope.length>0){
					xsql.append(" and (");
					for(int i=0;i<mainscope.length;i++){
						if(i==0){
							xsql.append(" s.mainscope like '%"+mainscope[i]+"%' ");
						}else{
							xsql.append(" or s.mainscope like '%"+mainscope[i]+"%' ");
						}
					}
					xsql.append(" ) ");
				}
			}
			//卖家地址(省)
			if(!StringUtil.isNullOrisEmpty(map.get("addresscode"))&&map.get("addresscode").indexOf("0000")>=0){
				xsql.append(" and left(s.addresscode,2) in ("); //前两位代表省份
				String [] addresscodelist=map.get("addresscode").split(",");
				for(int i=0;i<addresscodelist.length;i++){
					if(i<addresscodelist.length-1){
						xsql.append(addresscodelist[i].substring(0, 2)+",");
					}else{
						xsql.append(addresscodelist[i].substring(0, 2));
					}
					
				}
				xsql.append(")"); //前两位代表省份
			}
			//商家地址(市)
			if(!StringUtil.isNullOrisEmpty(map.get("addresscode"))&&map.get("addresscode").indexOf("0000")<0&&map.get("addresscode").substring(4, 6)=="00"){
				xsql.append(" and left(s.addresscode,4)="+map.get("addresscode").substring(0, 4)); //前四位代表   省+市
			}
			//关键字(商家名称 店铺名称  微信号   手机号)
			if(!StringUtil.isNullOrisEmpty(map.get("keyword"))){
				xsql.append(" and concat((select u.username from t_user u where u.id=s.userid),'^^',s.shopname,'^^',s.weixin,'^^',s.mobile) like '%"+map.get("keyword")+"%'");
			}
			
			/**********************************************排序条件**********************************************/
			if(!StringUtil.isNullOrisEmpty(map.get("ordercolumn"))&&(map.get("ordercolumn")=="rand"||map.get("ordercolumn").equals("rand"))){//随机
				xsql.append(" order by  rand()");
			}else{
				xsql.append(" order by  s.createdate desc ");
			}
			/**********************************************分页条件**********************************************/
			if(!StringUtil.isNullOrisEmpty(map.get("pageno"))&&!StringUtil.isNullOrisEmpty(map.get("pagesize"))){
				int pageno=Integer.valueOf(map.get("pageno"));
				int pagesize=Integer.valueOf(map.get("pagesize"));
				xsql.append(" limit "+(pageno-1)*pagesize+","+pagesize);
			}
			xsql.append(" ) tm ");
			
			StringBuffer sql=new StringBuffer();
			sql.append(" select * from ( ");
			sql.append(" select   date_format(s.createdate,'%Y-%m-%d') as formatcreatedate,s.*, ");
			sql.append(" (select u.username from t_user u where u.id=s.userid) as username, ");
			sql.append(" (select ad.fullname from t_dic_address ad where ad.`code`=s.addresscode), ");
			sql.append(" (select count(c.id) from t_baibao_collection c where c.userid=s.userid and c.state<=4) as sumcollection , ");
			sql.append(" (select count(c.id) from t_baibao_collection c where c.userid=s.userid and c.state=2) as dscollection, ");
			sql.append(" (select count(c.id) from t_baibao_collection c where c.userid=s.userid and c.state=3) as jyzzcollection, ");
			sql.append(" (select count(c.id) from t_baibao_collection c where c.userid=s.userid and c.state=4) as yscollection , ");
			sql.append(" (select count(distinct gr.userid) from t_baibao_grades gr where gr.collectionid in(select  c.id from  t_baibao_collection c where c.userid=s.userid))as cyrsgrades, ");
			sql.append(" (select sum(ch.grade) from t_baibao_choose ch where ch.id in(select gr.chooseid from t_baibao_grades gr where gr.collectionid in(select  c.id from  t_baibao_collection c where c.userid=s.userid))) as zjgrades, ");
			sql.append(" (select count(f.id) from t_forums f where f.collectionid in(select  c.id from  t_baibao_collection c where c.userid=s.userid) and type=88) as tsforums, ");
			sql.append(" (select count(distinct f.userid) from t_forums f where f.collectionid in(select  c.id from  t_baibao_collection c where c.userid=s.userid) and type=88 ) as cyrsforums ");
			sql.append(" from t_baibao_shop s   ");
			sql.append(" where s.id in ( "+xsql.toString()+")");
			sql.append(" )vi  ");
			
//			
//			/**********************************************排序条件**********************************************/
//			if(!StringUtil.isNullOrisEmpty(map.get("ordercolumn"))){
//				sql.append(" order by  vi."+map.get("ordercolumn"));
//			}else{//默认根据时间
//				sql.append(" order by  vi.createdate ");
//			}
//			//顺序
//			if(!StringUtil.isNullOrisEmpty(map.get("orderdesc"))){
//				sql.append(" desc");
//			}
			return jdbcTemplate.queryForList(sql.toString());
		}
	}
	
	
	/**
	 * 根据  藏品种类   详细地址   关键字 （商家名称   店铺名称  手机号  微信号） 最新  最热（点击量）     查询 总数  。。。。。。。 条件不确定 
	 * @param map
	 * @return int  返回总数
	 */
	public int getShopForCount(Map<String, String> map){
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(vi.id) from t_baibao_shop vi left join t_user u on u.id=vi.userid ");
		/**********************************************查询条件**********************************************/
		sql.append(" where 1=1 ");
		//状态
		sql.append(" and vi.state=1");
		//经营范围
		if(!StringUtil.isNullOrisEmpty(map.get("mainscope"))){
			String mainscope[]=map.get("mainscope").split(",");
			if(mainscope.length>0){
				sql.append(" and (");
				for(int i=0;i<mainscope.length;i++){
					if(i==0){
						sql.append(" vi.mainscope like '%"+mainscope[i]+"%' ");
					}else{
						sql.append(" or vi.mainscope like '%"+mainscope[i]+"%' ");
					}
				}
				sql.append(" ) ");
			}
		}
		//卖家地址(省)
		if(!StringUtil.isNullOrisEmpty(map.get("addresscode"))&&map.get("addresscode").indexOf("0000")>=0){
			sql.append(" and left(vi.addresscode,2) in ("); //前两位代表省份
			String [] addresscodelist=map.get("addresscode").split(",");
			for(int i=0;i<addresscodelist.length;i++){
				if(i<addresscodelist.length-1){
					sql.append(addresscodelist[i].substring(0, 2)+",");
				}else{
					sql.append(addresscodelist[i].substring(0, 2));
				}
				
			}
			sql.append(")"); //前两位代表省份
		}
		//商家地址(市)
		if(!StringUtil.isNullOrisEmpty(map.get("addresscode"))&&map.get("addresscode").indexOf("0000")<0&&map.get("addresscode").substring(4, 6)=="00"){
			sql.append(" and left(vi.addresscode,4)="+map.get("addresscode").substring(0, 4)); //前四位代表   省+市
		}
		//关键字(商家名称 店铺名称  微信号   手机号)
		if(!StringUtil.isNullOrisEmpty(map.get("keyword"))){
			sql.append(" and concat(u.username,'^^',vi.shopname,'^^',vi.weixin,'^^',vi.mobile) like '%"+map.get("keyword")+"%'");
		}
		return jdbcTemplate.queryForInt(sql.toString());
	}
	
	
	
	/******************************************************公共方法********************************************************************/
	
	/**
	 * 根据map 中userid 查询店铺基本信息    或根据店铺id查询基本信息
	 * sumcollection :共上传藏品件数 shcollection:审核中藏品件数 dscollection：待售中藏品件数 jyzzcollection:交易中转中的藏品件数 yscollection：已售罄藏品件数 cyrsgrades：评分参与人数 zjgrades：评分总计 tsforums:评论条数 cyrsforums:评论参与人数 
	 * dszcyrsgrades：待售中评分参与人数 	dszjgrades：待售中评分总计 	dscountforums:待售中评论条数 	dscyrsforums:待售中评论参与人数 	yszcyrsgrades：已售罄评分参与人数 	yszjgrades：已售罄评分总计 	ystsforums:已售罄评论条数 	yscyrsforums:已售罄评论参与人数
	 * @param map
	 * @return map
	 */
	public Map<String,Object> getShop(Map<String, String> map){
		StringBuffer sql=new StringBuffer();
		sql.append(" select  s.*, date_format(s.createdate,'%Y-%m-%d') as formatcreatedate,");
		sql.append(" (select u.realname from t_user u where u.id=s.userid) as realname, "); 
		sql.append(" (select u.username from t_user u where u.id=s.userid) as username, "); 
		sql.append(" (select ad.fullname from t_dic_address ad where ad.`code`=s.addresscode), ");
		sql.append(" (select count(c.id) from t_baibao_collection c where c.userid=s.userid and c.state<=4) as sumcollection , ");
		sql.append(" (select count(c.id) from t_baibao_collection c where c.userid=s.userid and c.state=1) as shcollection, ");
		sql.append(" (select count(c.id) from t_baibao_collection c where c.userid=s.userid and c.state=2) as dscollection, ");
		sql.append(" (select count(c.id) from t_baibao_collection c where c.userid=s.userid and c.state=3) as jyzzcollection, ");
		sql.append(" (select count(c.id) from t_baibao_collection c where c.userid=s.userid and c.state=4) as yscollection , ");
		sql.append(" (select count(distinct gr.userid) from t_baibao_grades gr where gr.collectionid in(select  c.id from  t_baibao_collection c where c.userid=s.userid))as cyrsgrades, ");
		sql.append(" (select sum(ch.grade) from t_baibao_choose ch where ch.id in(select gr.chooseid from t_baibao_grades gr where gr.collectionid in(select  c.id from  t_baibao_collection c where c.userid=s.userid))) as zjgrades, ");
		sql.append(" (select count(f.id) from t_forums f where f.collectionid in(select  c.id from  t_baibao_collection c where c.userid=s.userid) and type=88) as countforums, ");
		sql.append(" (select count(distinct f.userid) from t_forums f where f.collectionid in(select  c.id from  t_baibao_collection c where c.userid=s.userid) and type=88 ) as cyrsforums, ");
		sql.append(" (select count(distinct gr.userid) from t_baibao_grades gr where gr.collectionid in(select  c.id from  t_baibao_collection c where c.userid=s.userid and c.state=2))as dszcyrsgrades, ");
		sql.append(" (select sum(ch.grade) from t_baibao_choose ch where ch.id in(select gr.chooseid from t_baibao_grades gr where gr.collectionid in(select  c.id from  t_baibao_collection c where c.userid=s.userid and c.state=2))) as dszjgrades, ");
		sql.append(" (select count(f.id) from t_forums f where f.collectionid in(select  c.id from  t_baibao_collection c where c.userid=s.userid and c.state=2) and type=88) as dscountforums, ");
		sql.append(" (select count(distinct f.userid) from t_forums f where f.collectionid in(select  c.id from  t_baibao_collection c where c.userid=s.userid and c.state=2) and type=88 ) as dscyrsforums, ");
		sql.append(" (select count(distinct gr.userid) from t_baibao_grades gr where gr.collectionid in(select  c.id from  t_baibao_collection c where c.userid=s.userid and c.state=4))as yszcyrsgrades, ");
		sql.append(" (select sum(ch.grade) from t_baibao_choose ch where ch.id in(select gr.chooseid from t_baibao_grades gr where gr.collectionid in(select  c.id from  t_baibao_collection c where c.userid=s.userid and c.state=4))) as yszjgrades, ");
		sql.append(" (select count(f.id) from t_forums f where f.collectionid in(select  c.id from  t_baibao_collection c where c.userid=s.userid and c.state=4) and type=88) as yscountforums, ");
		sql.append(" (select count(distinct f.userid) from t_forums f where f.collectionid in(select  c.id from  t_baibao_collection c where c.userid=s.userid and c.state=4) and type=88 ) as yscyrsforums ");
		sql.append(" from t_baibao_shop s ");
		sql.append(" where 1=1 ");
		/**********************************************查询条件**********************************************/
		//用户id
		if(!StringUtil.isNullOrisEmpty(map.get("userid"))){
			sql.append(" and s.userid="+map.get("userid"));
			jdbcTemplate.update("update t_baibao_shop set clicknum=clicknum+1 where userid="+map.get("userid") );
		}
		//店铺id
		if(!StringUtil.isNullOrisEmpty(map.get("id"))){
			sql.append(" and s.id="+map.get("id"));
			jdbcTemplate.update("update t_baibao_shop set clicknum=clicknum+1 where id="+map.get("id") );
		}
		return jdbcTemplate.queryForMap(sql.toString());
	}
	
	
}
