package com.hyzm.admin.dao.collection.impl;

import java.sql.DatabaseMetaData;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.collection.CollectionDao;

@Repository
public class CollectionDaoImpl implements CollectionDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getCollectionList = "select c.*,t.typename, u.username from t_collection c left join t_collectiontype t on c.type = t.id left join t_user u on c.userid = u.id where c.uploaddate >= ? and c.uploaddate <= ? and c.type like ? and c.serialnum like ? and c.name like ?  and c.owner like ? and c.userid like ?   and u.username like ? and c.iscollection like ? and c.state like ? order by c.id desc limit ?, ?";

	public List<Map<String, Object>> getCollectionList(Date begindate, Date enddate, 
			String type,String serialnum, String name,String owner, String userid, String username, String iscollection, String state, 
			int currentPage, int pageSize)
			throws Exception {
		try {
			return jdbcTemplate.queryForList(getCollectionList, new Object[]{begindate, enddate, "%"+type+"%", "%"+serialnum+"%", "%"+name+"%",  "%"+owner+"%", "%"+userid+"%",  "%"+username+"%", "%"+iscollection+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品列表异常："+e.getMessage());
		}
	}
	
	private final static String getCollectionListNum = "select count(c.id) from t_collection c left join t_collectiontype t on c.type = t.id left join t_user u on c.userid = u.id where  c.type like ? and c.serialnum like ? and c.name like ?  and c.owner like ? and c.userid like ?  and u.username like ? and c.iscollection like ? and c.state like ?";

	public long getCollectionListNum(Date begindate, Date enddate, String type,String serialnum, String name,
			String owner,String username, String userid, String iscollection, String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getCollectionListNum, new Object[]{  "%"+type+"%", "%"+serialnum+"%", "%"+name+"%",  "%"+owner+"%", "%"+userid+"%", "%"+username+"%", "%"+iscollection+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品数量异常："+e.getMessage());
		}
	}
	
	private final static String addCollection = "insert into t_collection (type, name, serialnum, userid, owner, source, uploaddate, opermodel, iscollection, note, imgurl,state) values (?,?,?,?,?,?,now(),1,0,?,?,1)";

	public boolean addCollection(int type, String name, String serialnum,
			long userid, String owner, String source, String note, String imgurl) throws Exception {
		try {
			int i = jdbcTemplate.update(addCollection, new Object[]{type, name, serialnum, userid, owner, source, note, imgurl});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加藏品异常："+e.getMessage());
		}
	}
	
	private final static String delCollection = "update t_collection set state = 3 where id = ?";

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
	
	private final static String updCollection = "update t_collection set type = ?, name = ?, owner = ?, source = ?, lastmodifydate = now(), note = ?, imgurl = ? where id = ?";

	public boolean updCollection(long id, int type, String name, String owner,
			String source, String note, String imgurl) throws Exception {
		try {
			int i = jdbcTemplate.update(updCollection, new Object[]{type, name, owner, source, note, imgurl, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改藏品异常："+e.getMessage());
		}
	}
	
	private final static String collectThing = "update t_collection set iscollection = ? where id = ?";

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
	
	private final static String collectionShowOrHide = "update t_collection set state = ? where id = ?";
	
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
	
	private final static String getCollectionById = "select * from t_collection where id = ?";

	public Map<String, Object> getCollectionById(long id) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getCollectionById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品异常："+e.getMessage());
		}
	}
	
	private final static String getTypeList = "select * from t_collectiontype where state = 1 order by id limit ?, ?";

	public List<Map<String, Object>> getTypeList(int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getTypeList, new Object[]{(currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取类型异常："+e.getMessage());
		}
	}
	
	private final static String getTypeListNum = "select count(id) from t_collectiontype where state = 1";
	
	public long getTypeListNum() throws Exception {
		try {
			return jdbcTemplate.queryForLong(getTypeListNum);
		} catch (Exception e) {
			throw new RuntimeException("获取类型数量异常："+e.getMessage());
		}
	}
	
	private final static String addType = "insert into t_collectiontype (typename, state) values (?,1)";

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
	
	private final static String delType = "update t_collectiontype set state = 2 where id = ?";

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
	
	private final static String updType = "update t_collectiontype set typename = ? where id = ?";

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
	
	private final static String autoName = "select distinct name from t_collection";

	public List<Map<String, Object>> autoName() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoName);
		} catch (Exception e) {
			throw new RuntimeException("自动补全藏品名称异常："+e.getMessage());
		}
	}
	private final static String autoserialnum = "select distinct serialnum from t_collection";

	public List<Map<String, Object>> autoserialnum() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoserialnum);
		} catch (Exception e) {
			throw new RuntimeException("自动补全藏品编号异常："+e.getMessage());
		}
	}
	
	private final static String autoOwner = "select distinct owner from t_collection";

	public List<Map<String, Object>> autoOwner() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoOwner);
		} catch (Exception e) {
			throw new RuntimeException("自动补全归属异常："+e.getMessage());
		}
	}
	
	private final static String getTypeCombobox = "select id,typename from t_collectiontype where state = 1 order by id";

	public List<Map<String, Object>> getTypeCombobox() throws Exception {
		try {
			return jdbcTemplate.queryForList(getTypeCombobox);
		} catch (Exception e) {
			throw new RuntimeException("获取藏品类型下拉列表异常："+e.getMessage());
		}
	}
	
	private final static String autoUsername = "select distinct u.username from t_collection t left join t_user u on t.userid = u.id where u.username is not null order by u.username";

	public List<Map<String, Object>> autoUsername() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoUsername);
		} catch (Exception e) {
			throw new RuntimeException("自动补全上传者异常："+e.getMessage());
		}
	}
	
	private final static String upjoinType = "update t_flagShop set state = ?,begintime = ?,endtime  = ? where id = ?";

	public boolean upjoinType(long id,int state,Date begintime, Date endtime) throws Exception {
		try {
			int i = jdbcTemplate.update(upjoinType, new Object[]{state,begintime,endtime,id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("合作审批异常："+e.getMessage());
		}
	}

}
