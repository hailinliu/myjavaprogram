package com.hyzm.admin.dao.baibao.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.baibao.BaibaoCollectionDao;
@Repository
public class BaibaoCollectionDaoImpl implements BaibaoCollectionDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private final static String getBaibaoCollectionList = "select   l.*,u.username,c.typename  from t_baibao_collection l  left join t_user u on l.userid = u.id left join t_collectiontype c on l.type=c.id  where l.uploaddate >=? and l.uploaddate <=? and l.baibaonum like ? and l.name like ?  and u.username like ?  and l.userid like ?   and l.state like ? order by l.id desc limit ?, ?";
	public List<Map<String, Object>> getBaibaoCollectionList(Date begindate, Date enddate, String baibaonum, String name,  String username,String userid, String state, int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getBaibaoCollectionList, new Object[]{begindate,enddate,  "%"+baibaonum+"%", "%"+name+"%",  "%"+username+"%", "%"+userid+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品列表异常："+e.getMessage());
		}
	}

	private final static String getBaibaoCollectionListNum = "select count(l.id)  from t_baibao_collection l  left join t_user u on l.userid = u.id where l.uploaddate >=? and l.uploaddate <=?  and l.baibaonum like ? and l.name like ?  and u.username like ?  and l.userid like ?   and l.state like ? ";
	public long getBaibaoCollectionListNum(Date begindate, Date enddate, String baibaonum, String name,  String username,String userid, String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getBaibaoCollectionListNum, new Object[]{begindate,enddate,"%"+baibaonum+"%", "%"+name+"%",  "%"+username+"%", "%"+userid+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品数量异常："+e.getMessage());
		}
	}
	private final static String updBaibaoCollection = "update t_baibao_collection set  name = ?,  imgurl = ?, price = ?, advertisement = ?, isagree = ?, note = ? where id = ?";
	public boolean updBaibaoCollection(long id,  String name,String imgurl,String price,String advertisement,int isagree,String note) throws Exception {
		try {
			int i = jdbcTemplate.update(updBaibaoCollection, new Object[]{ name,  imgurl, price, advertisement, isagree,note,id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改藏品异常："+e.getMessage());
		}
	}
   
	public boolean addBaibaoCollection(long id,String name,String username,String imgurl,String price,String advertisement,int isagree,int state,String note) throws Exception {
	     String addBaibaoCollection = "insert into t_baibao_collection(name,imgurl,userid,price,advertisement,isagree,state,note,uploaddate)('"+name+"','"+imgurl+"',"+"( select id from t_user where username = '"+username+"'),'"+price+"','"+advertisement+"',"+isagree+","+state+",'"+note+"',now())";
		try {
			int i = jdbcTemplate.update(addBaibaoCollection, new Object[]{name,imgurl,username,price,advertisement,isagree,state,note,id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加藏品异常："+e.getMessage());
		}
	}
	
	public boolean editcollectionsate(long id,int state) throws Exception {
		 String editcollectionsate = "update t_baibao_collection set  state=? where id=?";		

		try {
			int i = jdbcTemplate.update(editcollectionsate, new Object[]{state,id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改状态异常："+e.getMessage());
		}
	}
	private final static String delBaibaoCollection = "update t_baibao_collection set state = 3 where id = ?";
	public boolean delBaibaoCollection(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(delBaibaoCollection, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除藏品异常："+e.getMessage());
		}
	}
	private final static String getBaibaoCollectionById = "select * from t_baibao_collection where id = ?";
	public Map<String, Object> getBaibaoCollectionById(long id) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getBaibaoCollectionById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品异常："+e.getMessage());
		}
	}
	
	private final static String getBaibaoTrabsferList = "select l.*,u.username,us.username as shopusername,s.shopname,c.name from t_baibao_transfer l LEFT JOIN t_baibao_collection c on c.id=l.collectionid LEFT JOIN t_baibao_shop  s on s.userid=l.shopuserid left join t_user u on l.purchaseruserid = u.id left join t_user us on l.shopuserid = us.id  where l.starttime >=? and l.starttime <=? and s.shopname like ? and c.name like ? and u.username like ? and l.state like ? order by l.id desc limit ?, ?";
	public List<Map<String, Object>> getBaibaoTrabsferList(Date begindate, Date enddate, String shopname, String name,  String username,String userid, String state, int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getBaibaoTrabsferList, new Object[]{begindate,enddate,  "%"+shopname+"%", "%"+name+"%",  "%"+username+"%",  "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取交易列表异常："+e.getMessage());
		}
	}

	private final static String getBaibaoTrabsferListNum = "select count(l.id)  from t_baibao_transfer l LEFT JOIN t_baibao_collection c on c.id=l.collectionid LEFT JOIN t_baibao_shop  s on s.userid=l.shopuserid left join t_user u on l.purchaseruserid = u.id left join t_user us on l.shopuserid = us.id where l.starttime >=? and l.starttime <=? and s.shopname like ? and c.name like ? and u.username like ?  and l.state like ? ";
	public long getBaibaoTrabsferListNum(Date begindate, Date enddate, String shopname, String name,  String username,String userid, String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getBaibaoTrabsferListNum, new Object[]{begindate,enddate,"%"+shopname+"%", "%"+name+"%",  "%"+username+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取交易数量异常："+e.getMessage());
		}
	}
	
	public boolean updBaibaoTrabsferstate(long id,int state,String version) throws Exception {
		 String updBaibaoTrabsfer = "update t_baibao_transfer set  state= ?,version=version+1 where id= ? and version = ?";
		try {
			int i = jdbcTemplate.update(updBaibaoTrabsfer, new Object[]{state,id,version});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改交易状态异常："+e.getMessage());
		}
	}
  
	private final static String getBaibaoTrabsferById = "select * from t_baibao_transfer where id = ? and  version =?";
	public Map<String, Object> getBaibaoTrabsferById(long id,String version ) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getBaibaoTrabsferById, new Object[]{id, version });
		} catch (Exception e) {
			throw new RuntimeException("获取交易异常："+e.getMessage());
		}
	}

	private final static String updBaibaoTrabsfer = "update t_baibao_transfer set starttime = ?,paytime = ?,txmjfhtime = ?,dddqtime = ?,deliverytime = ?,wfhtime = ?,kdgs = ?,syspaytime = ?,applyreturntime = ?,thkdgs = ?, thmjqrtime = ?,dkdmftime = ?,couriernumber = ?,consigneemobile= ?,consignee= ?,consigneeaddress= ?,thcouriernumber = ?,thconsigneemobile= ?,thconsignee= ?,thconsigneeaddress= ?,state=?,version=version+1  where id = ? and version =?";
	public boolean updBaibaoTrabsfer(long id,String version ,String couriernumber,String starttime,String paytime,
			String txmjfhtime,String dddqtime,String deliverytime,String wfhtime,String kdgs,
			String syspaytime,String applyreturntime,String thkdgs,String thmjqrtime,String dkdmftime,
			String consigneemobile, String consignee, String consigneeaddress,String thcouriernumber,
			String thconsigneemobile, String thconsignee, String thconsigneeaddress,int state)
			throws Exception {
		try {
			int i = jdbcTemplate.update(updBaibaoTrabsfer, new Object[]{starttime,paytime,txmjfhtime,dddqtime,deliverytime,wfhtime,kdgs,syspaytime,applyreturntime,thkdgs, thmjqrtime,dkdmftime,couriernumber, consigneemobile, consignee, consigneeaddress,thcouriernumber, thconsigneemobile, thconsignee, thconsigneeaddress,state,id,version});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改交易异常："+e.getMessage());
		}
	}


	







}
