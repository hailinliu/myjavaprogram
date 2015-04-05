package com.hyzm.admin.dao.vote.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.vote.VoteDao;

@Repository
public class VoteDaoImpl implements VoteDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getCollectionById = "select * from t_collection_activity where id = ?";
	
	public Map<String, Object> getCollectionById(long id) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getCollectionById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品信息异常："+e.getMessage());
		}
	}
	
	private final static String getVoteCollectionList = "select t.*, p.typename, u.username, b.title from t_collection_activity t left join t_bm_activity b on t.issue = b.cycle left join t_collectiontype p on t.type = p.id left join t_user u on t.userid = u.id where t.uploaddate >= ? and t.uploaddate <= ? and t.type like ? and t.serialnum like ? and t.name like ?  and u.username like ? and t.userid like ? and t.issue like ? and b.type like ? and t.state like ? and b.state = 1 order by t.id desc limit ?, ?";
	
	public List<Map<String, Object>> getVoteCollectionList(Date begindate, Date enddate, String type,String serialnum,
			String name,String username,String userid, String issue, String issuetype, String state, int currentPage, int pageSize)
			throws Exception {
		try {
			return jdbcTemplate.queryForList(getVoteCollectionList, new Object[]{begindate, enddate, "%"+type+"%", "%"+serialnum+"%", "%"+name+"%","%"+username+"%", "%"+userid+"%", "%"+issue+"%", "%"+issuetype+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品列表异常："+e.getMessage());
		}
	}
	
	private final static String getVoteCollectionListNum = "select count(t.id) from t_collection_activity t left join t_bm_activity b on t.issue = b.cycle left join t_collectiontype p on t.type = p.id left join t_user u on t.userid = u.id where t.uploaddate >= ? and t.uploaddate <= ? and t.type like ? and t.serialnum like ? and t.name like ?  and u.username like ? and t.userid like ? and t.issue like ? and b.type like ? and t.state like ? and b.state = 1";
	
	public long getVoteCollectionListNum(Date begindate, Date enddate, String type,String serialnum, String name,String username,String userid, String issue, String issuetype, String state)
			throws Exception {
		try {
			return jdbcTemplate.queryForLong(getVoteCollectionListNum, new Object[]{begindate, enddate, "%"+type+"%","%"+serialnum+"%","%"+name+"%","%"+username+"%","%"+userid+"%", "%"+issue+"%", "%"+issuetype+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品数量异常："+e.getMessage());
		}
	}
	
	private final static String getVipCollectionList = "select t.*, p.typename, u.username from t_collection_activity t left join t_collectiontype p on t.type = p.id left join t_user u on t.userid = u.id where t.issue = 0 and t.uploaddate >= ? and t.uploaddate <= ? and t.type like ?  and t.serialnum like ? and t.name like ?  and u.username like ?  and t.userid like ?  and t.state like ? order by t.id desc limit ?, ?";

	public List<Map<String, Object>> getVipCollectionList(Date begindate,
			Date enddate, String type,String serialnum, String name,String username,String userid, String state, int currentPage,
			int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getVipCollectionList, new Object[]{begindate, enddate, "%"+type+"%","%"+serialnum+"%", "%"+name+"%","%"+username+"%","%"+userid+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品数量异常："+e.getMessage());
		}
	}
	
	private final static String getVipCollectionListNum = "select count(t.id) from t_collection_activity t left join t_bm_activity b on t.issue = b.cycle left join t_collectiontype p on t.type = p.id left join t_user u on t.userid = u.id where t.issue = 0 and t.uploaddate >= ? and t.uploaddate <= ? and t.type like ?  and t.serialnum like ? and t.name like ? and u.username like ? and t.userid like ?  and t.state like ?";

	public long getVipCollectionListNum(Date begindate, Date enddate,
			String type,String serialnum, String name,String username,String userid, String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getVipCollectionListNum, new Object[]{begindate, enddate, "%"+type+"%","%"+serialnum+"%", "%"+userid+"%","%"+name+"%","%"+username+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品数量异常："+e.getMessage());
		}
	}
	
	private final static String addVoteCollection = "insert into t_collection_activity (type, name, serialnum, userid, uploaddate, note, imgurl, state, issue) values (?,?,?,?,now(),?,?,1,?)";
	
	public boolean addVoteCollection(int type, String name, String serialnum, long userid, String note, String imgurl, String issue) throws Exception {
		try {
			int i = jdbcTemplate.update(addVoteCollection, new Object[]{type, name, serialnum, userid, note, imgurl, issue});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加藏品信息异常："+e.getMessage());
		}
	}
	
	private final static String delVoteCollection = "update t_collection_activity set state = ? where id = ?";
	
	public boolean delVoteCollection(long id, int state) throws Exception{
		try {
			int i = jdbcTemplate.update(delVoteCollection, new Object[]{state, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除藏品信息异常："+e.getMessage());
		}
	}
	
	private final static String updVoteCollection = "update t_collection_activity set type = ?, name = ?, note = ?, imgurl = ?, issue = ? where id = ?";

	public boolean updVoteCollection(long id, int type, String name,
			String note, String imgurl, String issue) throws Exception {
		try {
			int i = jdbcTemplate.update(updVoteCollection, new Object[]{type, name, note, imgurl, issue, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改藏品信息异常："+e.getMessage());
		}
	}

	private final static String getActivityBmList = "select t.* from t_bm_activity t where t.createdate >= ? and t.createdate <= ? and t.cycle like ? and t.title like ? and t.type like ?  and t.state like ? order by t.id limit ?, ?";

	public List<Map<String, Object>> getActivityBmList(String cycle,
			String title, Date begindate, Date enddate, String type,
			String state, int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getActivityBmList, new Object[]{begindate, enddate, "%"+cycle+"%", "%"+title+"%", "%"+type+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取活动报名列表异常："+e.getMessage());
		}
	}
	
	private final static String getActivityBmListNum = "select count(t.id) from t_bm_activity t where t.createdate >= ? and t.createdate <= ? and t.cycle like ? and t.title like ? and t.type like ? and t.state like ?";

	public long getActivityBmListNum(String cycle, String title, Date begindate,
			Date enddate, String type, String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getActivityBmListNum, new Object[]{begindate, enddate, "%"+cycle+"%", "%"+title+"%", "%"+type+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取活动报名数量异常："+e.getMessage());
		}
	}
	
	private final static String addBm = "insert into t_bm_activity (cycle, title, content, begindate, enddate, state, createdate, type) values (?,?,?,?,?,1,now(),?)";

	public boolean addBm(long cycle, String title, String content,
			Date begindate, Date enddate, int type) throws Exception {
		try {
			int i = jdbcTemplate.update(addBm, new Object[]{cycle, title, content, begindate, enddate, type});
			if(i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加活动报名异常："+e.getMessage());
		}
	}
	
	private final static String delBm = "update t_bm_activity set state = ? where id = ?";

	public boolean delBm(long id, int state) throws Exception {
		try {
			int i = jdbcTemplate.update(delBm, new Object[]{state, id});
			if(i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除活动报名异常："+e.getMessage());
		}
	}
	
	private final static String updBm = "update t_bm_activity set cycle = ?, title = ?, content = ?, begindate = ?, enddate = ? where id = ?";

	public boolean updBm(long id, long cycle, String title, String content, Date begindate, Date enddate)
			throws Exception {
		try {
			int i = jdbcTemplate.update(updBm, new Object[]{cycle, title, content, begindate, enddate, id});
			if(i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改活动报名异常："+e.getMessage());
		}
	}

}
