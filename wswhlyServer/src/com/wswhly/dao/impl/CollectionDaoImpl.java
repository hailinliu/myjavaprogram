package com.wswhly.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.wswhly.bean.collection.CollectionListRespBean;
import com.wswhly.bean.collection.CollectionOrderListRespBean;
import com.wswhly.bean.collection.CollectionOrderReqBean;
import com.wswhly.bean.collection.CollectionTypeRespBean;
import com.wswhly.dao.CollectionDao;

@Repository
public class CollectionDaoImpl implements CollectionDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String queryCollectionByTypeCount = "select count(*) from t_collection where state = 1 and type = ? and right(imgurl,1)<>'.'  and imgurl<>'' order by uploaddate desc";
	private final String queryCollectionByTypeUNIdCount = "select count(*) from t_collection where state = 1 and id <> ? and type = ?  and right(imgurl,1)<>'.'  and imgurl<>'' order by uploaddate desc";
	public int queryCollectionByTypeCount(String type,String id) throws SQLException{
		if(id == null || id.equals(""))
			return jdbcTemplate.queryForInt(queryCollectionByTypeCount,new Object[]{type});
		return jdbcTemplate.queryForInt(queryCollectionByTypeUNIdCount,new Object[]{id,type});
	}

	private final String queryCollectionCount = "select count(*) from t_collection where state = 1  and right(imgurl,1)<>'.'  and imgurl<>''  order by uploaddate desc";
	public int queryCollectionCount() throws SQLException{
		return jdbcTemplate.queryForInt(queryCollectionCount);
	}
	
	private final String queryMyCollectionCount = "select count(*) from t_collection where state = 1 and userid = ?  order by uploaddate desc";
	public int queryMyCollectionCount(String userid) throws SQLException{
		return jdbcTemplate.queryForInt(queryMyCollectionCount,new Object[]{userid});
	}
	
	//------------------lizhan
	private final String queryCollectionIndex = "select t.*,t1.typename,t2.username from t_collection t left join t_collectiontype t1 on t.type = t1.id left join t_user t2 on t.userid = t2.id where t.state = 1  and right(t.imgurl,1)<>'.'  and t.imgurl<>''   ORDER BY rand() limit ?,?";
	@SuppressWarnings("unchecked")
	public List<CollectionListRespBean.Collection> queryCollectionIndex(int pageno,int pagesize) throws SQLException{
		return (List<CollectionListRespBean.Collection>)jdbcTemplate.query(queryCollectionIndex,new Object[]{(pageno-1)*pagesize,pagesize}, new CollectionMapper());
	}
	
	private final String queryCollectionByType = "select t.*,t1.typename,t2.username from t_collection t left join t_collectiontype t1 on t.type = t1.id left join t_user t2 on t.userid = t2.id where t.state = 1 and t.type = ? and right(t.imgurl,1)<>'.'  and t.imgurl<>'' order by t.uploaddate desc limit ?,?";
	private final String queryCollectionByUNIdType = "select t.*,t1.typename,t2.username from t_collection t left join t_collectiontype t1 on t.type = t1.id left join t_user t2 on t.userid = t2.id where t.state = 1 and t.id <> ? and t.type = ?  and right(t.imgurl,1)<>'.'  and t.imgurl<>'' order by t.uploaddate desc limit ?,?";
	public List<CollectionListRespBean.Collection> queryCollectionByType(int pageno,int pagesize,String type,String id) throws SQLException{
		if(id == null || id.equals(""))
			return (List<CollectionListRespBean.Collection>)jdbcTemplate.query(queryCollectionByType,new Object[]{type,(pageno-1)*pagesize,pagesize}, new CollectionMapper());
		return (List<CollectionListRespBean.Collection>)jdbcTemplate.query(queryCollectionByUNIdType,new Object[]{id,type,(pageno-1)*pagesize,pagesize}, new CollectionMapper());
	}

	private final String queryCollection = "select t.*,t1.typename,t2.username from t_collection t left join t_collectiontype t1 on t.type = t1.id left join t_user t2 on t.userid = t2.id where t.state = 1 and right(t.imgurl,1)<>'.'  and t.imgurl<>'' order by t.uploaddate desc limit ?,?";
	public List<CollectionListRespBean.Collection> queryCollection(int pageno,int pagesize) throws SQLException{
		return (List<CollectionListRespBean.Collection>)jdbcTemplate.query(queryCollection,new Object[]{(pageno-1)*pagesize,pagesize}, new CollectionMapper());
	}
	
	private final String queryMyCollection = "select t.*,t1.typename,t2.username from t_collection t left join t_collectiontype t1 on t.type = t1.id left join t_user t2 on t.userid = t2.id where t.state = 1 and t.userid = ? order by uploaddate desc limit ?,?";
	public List<CollectionListRespBean.Collection> queryMyCollection(int pageno,int pagesize,String userid) throws SQLException{
		return (List<CollectionListRespBean.Collection>)jdbcTemplate.query(queryMyCollection,new Object[]{userid,(pageno-1)*pagesize,pagesize}, new CollectionMapper());
	}

	protected class CollectionMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			CollectionListRespBean.Collection collection = new CollectionListRespBean().new Collection();
			collection.setId(rs.getLong("id"));
			collection.setName(rs.getString("name"));
			collection.setSerialnum(rs.getString("serialnum"));
			collection.setType(rs.getString("type"));
			
			String uploaddate = rs.getString("uploaddate");
			if(uploaddate != null && uploaddate.length() > 19)
				collection.setUploaddate(uploaddate.substring(0, 19));
			String lastmodifydate = rs.getString("lastmodifydate");
			if(lastmodifydate != null && lastmodifydate.length() > 19)
				collection.setLastmodifydate(lastmodifydate.substring(0, 19));
			
			collection.setOwner(rs.getString("owner"));
			collection.setSource(rs.getString("source"));
			collection.setUploaduser(rs.getString("userid"));
			collection.setIscollection(rs.getInt("iscollection"));
			collection.setImgurl(rs.getString("imgurl"));
			collection.setNote(rs.getString("note"));
			collection.setUploadusername(rs.getString("username"));
			collection.setTypename(rs.getString("typename"));
			collection.setClicknum(rs.getInt("clicknum"));
			collection.setCollectnum(rs.getInt("collectnum"));
			return collection;
		}
	}
	
	private final String queryMyCollectCount = "select count(*) from t_user_collection where userid = ?";
	public int queryMyCollectCount(String userid) throws SQLException{
		return jdbcTemplate.queryForInt(queryMyCollectCount,new Object[]{userid});
	}
	
	private final String queryMyCollect = "select t1.*,t.collectdate from t_user_collection t left join t_collection t1 on t.collectionid = t1.id where t.userid = ? order by t.collectdate desc limit ?,?";
	public List<CollectionListRespBean.Collection> queryMyCollect(int pageno,int pagesize,String userid) throws SQLException{
		return (List<CollectionListRespBean.Collection>)jdbcTemplate.query(queryMyCollect,new Object[]{userid,(pageno-1)*pagesize,pagesize}, new MyCollectMapper());
	}
	
	protected class MyCollectMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			CollectionListRespBean.Collection collection = new CollectionListRespBean().new Collection();
			collection.setId(rs.getLong("id"));
			collection.setName(rs.getString("name"));
			collection.setSerialnum(rs.getString("serialnum"));
			collection.setType(rs.getString("type"));
			   
			String uploaddate = rs.getString("uploaddate");
			if(uploaddate != null && uploaddate.length() > 19)
				collection.setUploaddate(uploaddate.substring(0, 19));
			String lastmodifydate = rs.getString("lastmodifydate");
			if(lastmodifydate != null && lastmodifydate.length() > 19)
				collection.setLastmodifydate(lastmodifydate.substring(0, 19));
			
			collection.setOwner(rs.getString("owner"));
			collection.setSource(rs.getString("source"));
			collection.setUploaduser(rs.getString("userid"));
			collection.setIscollection(rs.getInt("iscollection"));
			collection.setImgurl(rs.getString("imgurl"));
			
			String collectdate = rs.getString("collectdate");
			if(collectdate != null && collectdate.length() > 19)
				collection.setCollectdate(collectdate.substring(0, 19));
			
			collection.setUploaduser(rs.getString("userid"));
			collection.setNote(rs.getString("note"));
			collection.setClicknum(rs.getInt("clicknum"));
			collection.setCollectnum(rs.getInt("collectnum"));
			collection.setState(rs.getString("state"));
			return collection;
		}
	}
	
	private  String queryCollectionOne = "select t.*,t1.typename,t2.username from t_collection t left join t_collectiontype t1 on t.type = t1.id left join t_user t2 on t.userid = t2.id where t.state = 1 and t.id = ?";
	public CollectionListRespBean.Collection queryCollection(long id) throws SQLException {
		List<CollectionListRespBean.Collection> list = (List<CollectionListRespBean.Collection>)jdbcTemplate.query(queryCollectionOne,new Object[]{id}, new CollectionMapper());
		if(list.size()>0){
			//System.out.println(list.get(0).getNote());
			String note=new String(list.get(0).getNote());
			String regex = "\\d*";
	        Pattern p = Pattern.compile(regex);
	        Matcher m = p.matcher(note);
	        List<String> rep=new ArrayList<String>();
	        while(m.find()) {
	            if(!"".equals(m.group()))
	            	if(isMobileNO(m.group())||isTelephone(m.group())){
	            		System.out.println(m.group());
	            		rep.add(m.group());
	            	}
	        }
	        for(int i=0;i<rep.size();i++){
	        	System.out.println(rep.get(i).toString());
	        	list.get(0).setNote(list.get(0).getNote().replaceAll(rep.get(i).toString(), "*****"));
	        }
			return list.get(0);
		}
		return null;
	}
	
	
	 // 判断电话
    public static boolean isTelephone(String phonenumber) {
        String phone = "\\d{7,8}";
        Pattern p = Pattern.compile(phone);
        Matcher m = p.matcher(phonenumber);
        return m.matches();
    }

    // 判断手机号
    public static boolean isMobileNO(String mobiles) {
        Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
        Matcher m = p.matcher(mobiles);
        return m.matches();
    }
    
    
	private final String addCollect = "insert into t_user_collection(userid, collectionid, collectdate) VALUES(?,?,now())";
	public boolean addCollect(long userid, long collectionid) throws SQLException {
		int i = jdbcTemplate.update(addCollect,new Object[]{userid,collectionid});
		if(i>0)return true;else return false;
	}
	
	private final String queryUserIsCollect = "select count(*) from t_user_collection where userid = ? and collectionid = ?";
	public boolean queryUserIsCollect(long userid, long collectionid) throws SQLException{
		int i = jdbcTemplate.queryForInt(queryUserIsCollect,new Object[]{userid,collectionid});
		if(i>0)return true;else return false;
	}
	
	private final String queryCollectionType = "select * from t_collectiontype where state =1 order by id";
	public List<CollectionTypeRespBean.Type> queryCollectionType() throws SQLException{
		return (List<CollectionTypeRespBean.Type>)jdbcTemplate.query(queryCollectionType, new CollectionTypeMapper());
	}
	
	protected class CollectionTypeMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			CollectionTypeRespBean.Type type = new CollectionTypeRespBean().new Type();
			type.setId(rs.getLong("id"));
			type.setName(rs.getString("typename"));
			return type;
		}
	}
	
	private final String updateClicknum = "update t_collection set clicknum = clicknum + 1 where id = ?";
	public boolean updateClicknum(long id) throws SQLException{
		int i = jdbcTemplate.update(updateClicknum,new Object[]{id});
		if(i>0)return true;else return false;
	}
	
	private final String updateCollectnum = "update t_collection set collectnum = collectnum + 1 where id = ?";
	public boolean updateCollectnum(long id) throws SQLException{
		int i = jdbcTemplate.update(updateCollectnum,new Object[]{id});
		if(i>0)return true;else return false;
	}
	
	private final String deleteMyCollection = "delete from t_user_collection where userid = ? and collectionid = ?";
	public boolean deleteMyCollection(long userid,long collectionid) throws SQLException{
		int i = jdbcTemplate.update(deleteMyCollection,new Object[]{userid,collectionid});
		if(i>0)return true;else return false;
	}
	
	private final String addCollection = "insert into t_collection(type, name, serialnum, userid, owner, source, uploaddate, opermodel, state, imgurl, note) VALUES(?,?,?,?,?,?,now(),1,1,?,?)";
	public boolean addCollection(int type,String name,String serialnum,long userid,String owner,String source,String imgurl,String memo) throws SQLException{
		int i = jdbcTemplate.update(addCollection,new Object[]{type,name,serialnum,userid,owner,source,imgurl,memo});
		if(i>0)return true;else return false;
	}
	
	private final String updateCollection = "update t_collection set type=?, name=?, owner=?, source=?, lastmodifydate=now(), imgurl=?, note=? where id = ?";
	public boolean updateCollection(long id,int type,String name,String owner,String source,String imgurl,String memo) throws SQLException{
		int i = jdbcTemplate.update(updateCollection,new Object[]{type,name,owner,source,imgurl,memo,id});
		if(i>0)return true;else return false;
	}
	
	private final String deleteCollection = "update t_collection set state = 3, lastmodifydate=now() where id = ?";
	public boolean deleteCollection(long id) throws SQLException{
		int i = jdbcTemplate.update(deleteCollection,new Object[]{id});
		if(i>0)return true;else return false;
	}
	
	private  final String addCollectionOrder = "insert into t_collection_order(userid,username,usermobile,collectionid,collectionname,collectiontime,collectionstate) values(?,?,?,?,?,now(),?)";
	public int addCollectionOrder(final CollectionOrderReqBean order) throws Exception {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException{
				PreparedStatement ps = conn.prepareStatement(addCollectionOrder,Statement.RETURN_GENERATED_KEYS);
				ps.setLong(1,order.getUserid());
				ps.setString(2, order.getUsername());
				ps.setString(3, order.getUsermobile());
				ps.setLong(4, order.getCollectionid());
				ps.setString(5, order.getCollectionname());
				//ps.setString(6, order.getCollectiontime());
				ps.setString(6, order.getCollectionstate());
				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().intValue();
	}
	private final String queryCollectionOrder = "select * from t_collection_order t where userid = ? and collectionid = ?";
	public List<CollectionOrderListRespBean.CollectionOrder> queryCollectionOrder(long userid, long collectionid) throws SQLException{
		return (List<CollectionOrderListRespBean.CollectionOrder>)jdbcTemplate.query(queryCollectionOrder,new Object[]{userid,collectionid}, new CollectionOrdeMapper());
	}
	
	protected class CollectionOrdeMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			CollectionOrderListRespBean.CollectionOrder collection = new CollectionOrderListRespBean().new CollectionOrder();
			collection.setId(rs.getLong("id"));
			collection.setUserid(rs.getLong("userid"));
			collection.setUsername(rs.getString("username"));
			collection.setUsermobile(rs.getString("usermobile"));
			collection.setCollectionid(rs.getLong("collectionid"));
			collection.setCollectionname(rs.getString("collectionname"));
			collection.setCollectiontime(rs.getString("collectiontime"));
			collection.setCollectionstate(rs.getString("collectionstate"));
			collection.setDesction(rs.getString("desction"));
			return collection;
		}
	}
}
