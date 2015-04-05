package com.wswhly.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.wswhly.bean.collection.CollectionListRespBean;
import com.wswhly.bean.collection.CollectionTypeRespBean;
import com.wswhly.bean.collection.CollectionListRespBean.Collection;
import com.wswhly.bean.collection.CollectionTypeRespBean.Type;
import com.wswhly.bean.collectionus.CollectionusListRespBean;
import com.wswhly.bean.collectionus.CollectionusStyleRespBean;
import com.wswhly.bean.collectionus.CollectionusTypeRespBean;
import com.wswhly.dao.CollectionDao;
import com.wswhly.dao.CollectionusDao;
import com.wswhly.dao.impl.CollectionDaoImpl.CollectionMapper;
import com.wswhly.dao.impl.CollectionDaoImpl.CollectionTypeMapper;

@Repository
public class CollectionusDaoImpl implements CollectionusDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String queryCollectionusType = "select * from t_collectiontype_us where state = 1 order by id";
	public List<CollectionusTypeRespBean.Type> queryCollectionusType() throws SQLException{
		return (List<CollectionusTypeRespBean.Type>)jdbcTemplate.query(queryCollectionusType, new CollectionusTypeMapper());
	}

	protected class CollectionusTypeMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			CollectionusTypeRespBean.Type type = new CollectionusTypeRespBean().new Type();
			type.setId(rs.getLong("id"));
			type.setName(rs.getString("typename"));
			type.setNote(rs.getString("note"));
			return type;
		}
	}
	
	private final String queryCollectionusStyle = "select * from t_collectiontype_us where state = 1 and parentid=? order by id";
	public List<CollectionusStyleRespBean.Style> queryCollectionusStyle(long typeid) throws SQLException{
		return (List<CollectionusStyleRespBean.Style>)jdbcTemplate.query(queryCollectionusStyle, new Object[]{typeid}, new CollectionusStyleMapper());
	}
	
	protected class CollectionusStyleMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			CollectionusStyleRespBean.Style style = new CollectionusStyleRespBean().new Style();
			style.setId(rs.getLong("id"));
			style.setName(rs.getString("typename"));
			return style;
		}
	}
	
	public int queryCollectionusCount(long typeid,long styleid,int pricearea) throws SQLException{
		StringBuffer sb = new StringBuffer("select count(*) from t_collection_us where state = 1 and type=? ");
		if(styleid != 0l)
			sb.append(" and style=").append(styleid);
		if(pricearea !=-1)
			sb.append(" and pricearea=").append(pricearea);
		return jdbcTemplate.queryForInt(sb.toString(),new Object[]{typeid});
	}
	
	public List<CollectionusListRespBean.Collectionus> queryCollectionus(int pageno,int pagesize,long typeid,long styleid,int pricearea) throws SQLException{
		StringBuffer sb = new StringBuffer("select t.*,t1.typename as typename,t2.typename as stylename,t3.username as username from t_collection_us t left join t_collectiontype_us t1 on t.type=t1.id left join t_collectiontype_us t2 on t.style=t1.id left join t_user t3 on t.userid=t3.id where t.state = 1 and t.type=? ");
		if(styleid != 0l)
			sb.append(" and t.style=").append(styleid);
		if(pricearea != -1)
			sb.append(" and t.pricearea=").append(pricearea);
		sb.append(" order by t.uploaddate desc limit ?,?");
		return (List<CollectionusListRespBean.Collectionus>)jdbcTemplate.query(sb.toString(), new Object[]{typeid,(pageno-1)*pagesize,pagesize}, new CollectionusMapper());
	}
	//index
	private final String queryCollectionusIndex = "select t.*,t1.typename as typename,t2.typename as stylename,t3.username as username from t_collection_us t left join t_collectiontype_us t1 on t.type=t1.id left join t_collectiontype_us t2 on t.style=t1.id left join t_user t3 on t.userid=t3.id where t.state = 1 and t.type=? ORDER BY rand() limit ?,?";
	public List<CollectionusListRespBean.Collectionus> queryCollectionusIndex(int pageno,int pagesize,long typeid) throws SQLException{
		return (List<CollectionusListRespBean.Collectionus>)jdbcTemplate.query(queryCollectionusIndex, new Object[]{typeid,(pageno-1)*pagesize,pagesize}, new CollectionusMapper());
	}
	
	
	private final String queryCollectionusCount1 = "select count(*) from t_collection_us where state = 1 and type=? order by id";
	public int queryCollectionusCount(long typeid) throws SQLException{
		return jdbcTemplate.queryForInt(queryCollectionusCount1,new Object[]{typeid});
	}
	
	private final String queryCollectionus1 = "select t.*,t1.typename as typename,t.style,t2.typename as stylename,t3.username as username from t_collection_us t left join t_collectiontype_us t1 on t.type=t1.id left join t_collectiontype_us t2 on t.style=t1.id left join t_user t3 on t.userid=t3.id where t.state = 1 and t.type=? order by t.uploaddate desc limit ?,?";
	public List<CollectionusListRespBean.Collectionus> queryCollectionus(int pageno,int pagesize,long typeid) throws SQLException{
		return (List<CollectionusListRespBean.Collectionus>)jdbcTemplate.query(queryCollectionus1, new Object[]{typeid,(pageno-1)*pagesize,pagesize}, new CollectionusMapper());
	}
	
	protected class CollectionusMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			CollectionusListRespBean.Collectionus collection = new CollectionusListRespBean().new Collectionus();
			collection.setId(rs.getLong("id"));
			collection.setName(rs.getString("name"));
			collection.setSerialnum(rs.getString("serialnum"));
			collection.setType(rs.getLong("type"));
			collection.setStyle(rs.getLong("style"));
			collection.setTypename(rs.getString("typename"));
			collection.setStylename(rs.getString("stylename"));
			String uploaddate = rs.getString("uploaddate");
			if(uploaddate != null && uploaddate.length() > 19)
				collection.setUploaddate(uploaddate.substring(0, 19));
			String lastmodifydate = rs.getString("lastmodifydate");
			if(lastmodifydate != null && lastmodifydate.length() > 19)
				collection.setLastmodifydate(lastmodifydate.substring(0, 19));
			
			collection.setImgurl(rs.getString("imgurl"));
			collection.setNote(rs.getString("note"));
			collection.setUploadusername(rs.getString("username"));
			collection.setClicknum(rs.getInt("clicknum"));
			collection.setTvnum(rs.getString("tvnum"));
			collection.setImgurltitle(rs.getString("imgurltitle"));
			return collection;
		}
	}
	
	private final String queryCollectionusInfo = "select t.*,t1.typename as typename,t2.typename as stylename,t3.username as username from t_collection_us t left join t_collectiontype_us t1 on t.type=t1.id left join t_collectiontype_us t2 on t.style=t1.id left join t_user t3 on t.userid=t3.id where  t.id=?";
	public CollectionusListRespBean.Collectionus queryCollectionusInfo(long id) throws SQLException{
		List<CollectionusListRespBean.Collectionus> list = (List<CollectionusListRespBean.Collectionus>)jdbcTemplate.query(queryCollectionusInfo,new Object[]{id}, new CollectionusMapper());
		if(list.size()>0)
			return list.get(0);
		return null;
	}
	
	private final String updateClicknum = "update t_collection_us set clicknum = clicknum + 1 where id = ?";
	public boolean updateClicknum(long id) throws SQLException{
		int i = jdbcTemplate.update(updateClicknum,new Object[]{id});
		if(i>0)
			return true;
		else
			return false;
	}
}
