package com.wswhly.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.wswhly.bean.vote.ActivityListRespBean;
import com.wswhly.bean.vote.ActivityReqBean;
import com.wswhly.bean.vote.ActivityListRespBean.Activity;
import com.wswhly.dao.VoteDao;

@Repository
public class VoteDaoImpl implements VoteDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String queryActivityCount = "select t1.type from t_collection_activity t left join t_bm_activity t1 on t.issue=t1.cycle where t.issue = ? and t.userid = ?";
	public List<String> queryActivityCount(long issue,long userid) throws Exception{
		return jdbcTemplate.queryForList(queryActivityCount,new Object[]{issue,userid},String.class);
	}
	
	private  final String addActivityInfo = "insert into t_collection_activity(type,name,serialnum,userid,uploaddate,note,imgurl,issue) values(?,?,?,?,now(),?,?,?)";
		
	public boolean addActivityInfo(final ActivityReqBean info) throws Exception {
		int i = jdbcTemplate.update(addActivityInfo,new Object[]{info.getType(),info.getName(),info.getSerialnum(),info.getUserid(),info.getNote(),info.getImgurl(),info.getIssue()});
		if(i>0)return true;else return false;
	}
	
	private final String updActivityInfo = "update t_collection_activity set type = ?, name = ?, note = ?, imgurl = ? where id = ?";
	
	public boolean updActivityInfo(ActivityReqBean info) throws Exception {
		int i = jdbcTemplate.update(updActivityInfo, new Object[]{info.getType(), info.getName(), info.getNote(), info.getImgurl(), info.getId()});
		if(i>0)return true;else return false;
	}
	
	private final String delActivityInfo = "delete from t_collection_activity where id = ?";
	
	public boolean delActivityInfo(long id) throws Exception {
		int i = jdbcTemplate.update(delActivityInfo, new Object[]{id});
		if(i>0)return true;else return false;
	}
	
	private final String addVoteInfo = "insert into t_collection_vote (userid,collectionid,votetime) values(?,?,now())";
	public boolean addVoteInfo(long userid,long collectionid) throws Exception {
		int i = jdbcTemplate.update(addVoteInfo,new Object[]{userid,collectionid});
		if(i>0)return true;else return false;
	}
	
	private final String queryIsVote = "select count(*) from t_collection_vote where userid = ? and collectionid = ?";
	public boolean queryIsVote(long userid,long collectionid) throws Exception {
		int i = jdbcTemplate.queryForInt(queryIsVote,new Object[]{userid,collectionid});
		if(i>0)return true;else return false;
	}
	
	private final String queryActivityListCount = "select count(*) from t_collection_activity t where t.state = 1 and t.issue = ?";
	public int queryActivityListCount(long issue) throws Exception{
		return jdbcTemplate.queryForInt(queryActivityListCount,new Object[]{issue});
	}
	
	private final String queryActivityList1 = "select t.*,t1.typename,t2.username from t_collection_activity t left join t_collectiontype t1 on t.type = t1.id left join t_user t2 on t.userid = t2.id where t.state=1 and t.issue = ? ORDER BY t.uploaddate desc limit ?,?";
	private final String queryActivityList2 = "select t.*,t1.typename,t2.username from t_collection_activity t left join t_collectiontype t1 on t.type = t1.id left join t_user t2 on t.userid = t2.id where t.state=1 and t.issue = ? ORDER BY t.votenum desc limit ?,?";
	
	
	public List<Activity> queryActivityList(long issue,String order,int pageno, int pagesize)
			throws SQLException {
		if(order.equals("1")){
			return (List<ActivityListRespBean.Activity>)jdbcTemplate.query(queryActivityList1,new Object[]{issue,(pageno-1)*pagesize,pagesize}, new ActivityRecordMapper());
		}else if(order.equals("2")){
			return (List<ActivityListRespBean.Activity>)jdbcTemplate.query(queryActivityList2,new Object[]{issue,(pageno-1)*pagesize,pagesize}, new ActivityRecordMapper());
		}
		return null;	
	}

	private final String queryMyActivityListCount = "select count(t.id) from t_collection_activity t left join t_bm_activity t1 on t.issue=t1.cycle where t.userid = ? and t1.type = ?";
	public int queryMyActivityListCount(long userid,String type) throws Exception{
		return jdbcTemplate.queryForInt(queryMyActivityListCount,new Object[]{userid,type});
	}
	
	private final String queryMyActivityList = "select t.*,t1.typename,t3.username from t_collection_activity t left join t_collectiontype t1 on t.type = t1.id left join t_bm_activity t2 on t.issue=t2.cycle left join t_user t3 on t.userid = t3.id where t.userid=? and t2.type = ? order by t.id desc limit ?,?";
	public List<ActivityListRespBean.Activity> queryMyActivityList(long userid,String type,int pageno,int pagesize) throws SQLException{
		return (List<ActivityListRespBean.Activity>)jdbcTemplate.query(queryMyActivityList,new Object[]{userid,type,(pageno-1)*pagesize,pagesize}, new ActivityRecordMapper());
	}
	
	private final String queryActivity = "select t.*,t1.typename,t2.username from t_collection_activity t left join t_collectiontype t1 on t.type = t1.id left join t_user t2 on t.userid = t2.id where t.id=?";
	public ActivityListRespBean.Activity queryActivity(long collectionid) throws Exception {
		List<ActivityListRespBean.Activity> list = (List<ActivityListRespBean.Activity>)jdbcTemplate.query(queryActivity,new Object[]{collectionid}, new ActivityRecordMapper());
		if(list.size() > 0)
			return list.get(0);
		return null;
	}
	
	private final String updateActivityNote = "update t_collection_activity set note = CONCAT(ifnull(note,''),CONCAT('#',?)),updatenum=updatenum+1 where id = ?";
	public boolean updateActivityNote(long id,String note)
			throws SQLException {
		int i = jdbcTemplate.update(updateActivityNote,new Object[]{note,id});
		if(i>0)return true;else return false;
	}	
	
	private final String updateActivityVote = "update t_collection_activity set votenum = votenum + 1 where id = ?";
	public boolean updateActivityVote(long id)
			throws SQLException {
		int i = jdbcTemplate.update(updateActivityVote,new Object[]{id});
		if(i>0)return true;else return false;
	}	
	
	private final String queryCurrentActivity = "select cycle from t_bm_activity where begindate < now() and enddate > now() and state = 1 and type = ?";
	public Long queryCurrentActivity(String type) throws SQLException{
		List<Long> list = (List<Long>)jdbcTemplate.queryForList(queryCurrentActivity, new Object[]{type}, Long.class);
		if(list.size() > 0)
			return list.get(0);
		return null;
	}
	private final String queryActivitycycle = "select cycle from t_bm_activity where   type = ? order by cycle desc";
	public Long queryActivitycycle(String type) throws SQLException{
		List<Long> list = (List<Long>)jdbcTemplate.queryForList(queryActivitycycle, new Object[]{type}, Long.class);
		if(list.size() > 1)
			return list.get(1);
		return null;
	}

	private final String queryVipActivityListCount = "select count(t.id) from t_collection_activity t where t.issue = 0 and t.state = 1";
	
	@Override
	public int queryVipActivityListCount() throws Exception {
		return jdbcTemplate.queryForInt(queryVipActivityListCount);
	}
	
	private final String queryVipActivityList = "select t.*, t1.typename, t2.username from t_collection_activity t left join t_collectiontype t1 on t.type = t1.id left join t_user t2 on t.userid = t2.id where t.issue = 0 and t.state = 1 order by t.id desc limit ?, ?";
	private final String queryActivityListsj = "select t.*, t1.typename, t2.username from t_collection_activity t left join t_collectiontype t1 on t.type = t1.id left join t_user t2 on t.userid = t2.id where t.issue = 0 and t.state = 1 order by RAND()  desc limit ?, ?";
	@Override
	public List<Activity> queryVipActivityList(int pageno, int pagesize)
			throws Exception {
		 if(pagesize==3){
			 pagesize=5;
			return (List<ActivityListRespBean.Activity>)jdbcTemplate.query(queryActivityListsj,new Object[]{(pageno-1)*pagesize,5}, new ActivityRecordMapper());
		 }
		return jdbcTemplate.query(queryVipActivityList, new Object[]{(pageno-1)*pagesize,pagesize}, new ActivityRecordMapper());
	}
	
	private final String queryMyVipListCount = "select count(t.id) from t_collection_activity t where t.userid = ? and t.issue = 0 and t.state = 1";
	
	@Override
	public int queryMyVipListCount(long userid) throws Exception {
		return jdbcTemplate.queryForInt(queryMyVipListCount, new Object[]{userid});
	}
	
	private final String queryMyVipList = "select t.*, t1.typename, t2.username from t_collection_activity t left join t_collectiontype t1 on t.type = t1.id left join t_user t2 on t.userid = t2.id where t.userid = ? and t.issue = 0 and t.state = 1 order by t.id desc limit ?, ?";
	
	@Override
	public List<ActivityListRespBean.Activity> queryMyVipList(long userid, int pageno, int pagesize) throws Exception {
		return jdbcTemplate.query(queryMyVipList, new Object[]{userid, (pageno-1)*pagesize, pagesize}, new ActivityRecordMapper());
	}

	
	@SuppressWarnings("unchecked")
	protected class ActivityRecordMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			ActivityListRespBean.Activity activity = new ActivityListRespBean().new Activity();
			activity.setId(rs.getLong("id"));
			activity.setType(rs.getInt("type"));
			activity.setName(rs.getString("name"));
			activity.setSerialnum(rs.getString("serialnum"));
			activity.setTypename(rs.getString("typename"));
			activity.setUploaddate(rs.getString("uploaddate"));
			activity.setUpdatenum(rs.getString("updatenum"));
			activity.setNote(rs.getString("note"));
			activity.setImgurl(rs.getString("imgurl"));
			activity.setVotenum(rs.getInt("votenum"));
			activity.setIssue(rs.getLong("issue"));
			activity.setUploadusername(rs.getString("username"));
			activity.setState(rs.getInt("state"));
			return activity;
		}
	}


}
