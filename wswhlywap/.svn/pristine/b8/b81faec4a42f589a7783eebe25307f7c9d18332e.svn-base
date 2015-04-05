package com.hyzm.admin.dao.collecitonus.impl;

import java.sql.DatabaseMetaData;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.collecitonus.CollectionusDao;

@Repository
public class CollectionusDaoImpl implements CollectionusDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	   

	public List<Map<String, Object>>getCollectionList(Date begindate, Date enddate, String type,  String style, String name, String serialnum, String username, String state, String pricearea,int currentPage, int pageSize) 
			throws Exception {
		try {
			String getCollectionList = "select c.*,t.typename ,t1.typename typename1, u.username from t_collection_us c left join t_collectiontype_us t on c.type = t.id left join t_collectiontype_us t1 on c.style = t1.id left join t_user u on c.userid = u.id where c.type like ? and c.style like ? and c.name like ? and c.serialnum like ? and u.username like ? and c.state like ? ";
			if(pricearea.trim()!=""&&!pricearea.trim().equals("")){
				getCollectionList+="and c.pricearea ="+pricearea;
			}
			getCollectionList+="order by c.id desc limit ?, ? ";
			return jdbcTemplate.queryForList(getCollectionList, new Object[]{ "%"+type+"%", "%"+style+"%", "%"+name+"%","%"+serialnum+"%", "%"+username+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品列表异常："+e.getMessage());
		}
	}
	
	  

	public long getCollectionListNum(Date begindate, Date enddate, String type, String style, String name, String serialnum,
			String username, String state,String pricearea) throws Exception {
		try {
			String getCollectionListNum = "select count(c.id) from t_collection_us c left join t_user u on c.userid = u.id where  c.type like ? and c.style like ? and c.name like ?and c.serialnum like ?  and u.username like ? and c.state like ? ";
			if(pricearea.trim()!=""&&!pricearea.trim().equals("")){
				getCollectionListNum+="and c.pricearea ="+pricearea;
			}
			return jdbcTemplate.queryForLong(getCollectionListNum, new Object[]{ "%"+type+"%", "%"+style+"%", "%"+name+"%","%"+serialnum+"%", "%"+username+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品数量异常："+e.getMessage());
		}
	}
	
	private final static String addCollection = "insert into t_collection_us (type, style, name, serialnum, userid, uploaddate, note, imgurl, imgurltitle,tvnum,state) values (?,?,?,?,?,now(),?,?,?,?,1)";

	public boolean addCollection(int type, int style, String name, String serialnum,
			long userid, String note, String imgurl,String imgurltitle, String tvnum) throws Exception {
		try {
			int i = jdbcTemplate.update(addCollection, new Object[]{type, style, name, serialnum, userid, note, imgurl,imgurltitle, tvnum});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加藏品异常："+e.getMessage());
		}
	}
	
	private final static String delCollection = "update t_collection_us set state = 3 where id = ?";

	public boolean delCollection(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(delCollection, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除藏品异常："+e.getMessage());
		}
	}
	
	private final static String updCollection = "update t_collection_us set type = ?, style = ?, name = ?, lastmodifydate = now(), note = ?, imgurl = ?,imgurltitle=?, tvnum = ? where id = ?";

	public boolean updCollection(long id, int type, int style, String name, String note, String imgurl,String imgurltitle, String tvnum) throws Exception {
		try {
			int i = jdbcTemplate.update(updCollection, new Object[]{type, style, name, note, imgurl,imgurltitle, tvnum, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改藏品异常："+e.getMessage());
		}
	}
	
	private final static String collectThing = "update t_collection_us set iscollection = ? where id = ?";

	public boolean collectThing(long id, int iscollection) throws Exception {
		try {
			int i = jdbcTemplate.update(collectThing, new Object[]{iscollection, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("收藏藏品异常："+e.getMessage());
		}
	}
	
	private final static String collectionShowOrHide = "update t_collection_us set state = ? where id = ?";
	
	public boolean collectionShowOrHide(long id, int state) throws Exception {
		try {
			int i = jdbcTemplate.update(collectionShowOrHide, new Object[]{state, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("藏品显示/隐藏异常："+e.getMessage());
		}
	}
	
	private final static String getCollectionById = "select * from t_collection_us where id = ?";

	public Map<String, Object> getCollectionById(long id) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getCollectionById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品异常："+e.getMessage());
		}
	}
	
	private final static String getTypeList = "select * from t_collectiontype_us where state = 1 order by id limit ?, ?";

	public List<Map<String, Object>> getTypeList(int currentPage, int pageSize) throws Exception {
		try {
			System.out.println(currentPage+"*****"+pageSize);
			return jdbcTemplate.queryForList(getTypeList, new Object[]{(currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取类型异常："+e.getMessage());
		}
	}
	
	private final static String getTypeListNum = "select count(id) from t_collectiontype_us where state = 1";
	
	public long getTypeListNum() throws Exception {
		try {
			return jdbcTemplate.queryForLong(getTypeListNum);
		} catch (Exception e) {
			throw new RuntimeException("获取类型数量异常："+e.getMessage());
		}
	}
	
	private final static String addType = "insert into t_collectiontype_us (typename, state) values (?,1)";

	public boolean addType(String typename) throws Exception {
		try {
			int i = jdbcTemplate.update(addType, new Object[]{typename});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加类型异常："+e.getMessage());
		}
	}
	
	private final static String delType = "update t_collectiontype_us set state = 2 where id = ?";

	public boolean delType(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(delType, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除类型异常："+e.getMessage());
		}
	}
	
	private final static String updType = "update t_collectiontype_us set typename = ? where id = ?";

	public boolean updType(long id, String typename) throws Exception {
		try {
			int i = jdbcTemplate.update(updType, new Object[]{typename, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改类型异常："+e.getMessage());
		}
	}
	
	private final static String autoName = "select distinct name from t_collection_us";

	public List<Map<String, Object>> autoName() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoName);
		} catch (Exception e) {
			throw new RuntimeException("自动补全藏品名称异常："+e.getMessage());
		}
	}
	
	private final static String autoserialnum = "select distinct serialnum from t_collection_us";

	public List<Map<String, Object>> autoserialnum() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoserialnum);
		} catch (Exception e) {
			throw new RuntimeException("自动补全藏品编号异常："+e.getMessage());
		}
	}
	private final static String autoOwner = "select distinct owner from t_collection_us";

	public List<Map<String, Object>> autoOwner() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoOwner);
		} catch (Exception e) {
			throw new RuntimeException("自动补全归属异常："+e.getMessage());
		}
	}
	
	private final static String getTypeCombobox = "select id,typename from t_collectiontype_us where parentid is null and state = 1 order by id";

	public List<Map<String, Object>> getTypeCombobox() throws Exception {
		try {
			return jdbcTemplate.queryForList(getTypeCombobox);
		} catch (Exception e) {
			throw new RuntimeException("获取藏品大类下拉列表异常："+e.getMessage());
		}
	}
	
	private final static String getStyleCombobox = "select id,typename from t_collectiontype_us where parentid = ? and state = 1 order by id";
	
	public List<Map<String, Object>> getStyleCombobox(int typeid) throws Exception {
		try {
			return jdbcTemplate.queryForList(getStyleCombobox, new Object[]{typeid});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品小类下拉列表异常："+e.getMessage());
		}
	}
	
	private final static String autoUsername = "select distinct u.username from t_collection_us t left join t_user u on t.userid = u.id where u.username is not null order by u.username";

	public List<Map<String, Object>> autoUsername() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoUsername);
		} catch (Exception e) {
			throw new RuntimeException("自动补全上传者异常："+e.getMessage());
		}
	}
	private final static String priceareaCollection = "update t_collection_us set lastmodifydate = now(),  pricearea = ? where id = ?";
	public boolean priceareaControl(long id, int pricearea) {
		try {
			int i = jdbcTemplate.update(priceareaCollection, pricearea, id);
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改价格区间异常："+e.getMessage());
		}
	}
	private final static String pointpriceCollection = "update t_collection_us set lastmodifydate = now(),  pointprice = ? where id = ?";
	public boolean pointpriceControl(long id, String pointprice) {
		try {
			int i = jdbcTemplate.update(pointpriceCollection, pointprice, id);
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改具体价格异常："+e.getMessage());
		}
	}


}
