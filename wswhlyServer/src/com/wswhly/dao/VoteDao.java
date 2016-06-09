package com.wswhly.dao;

import java.sql.SQLException;
import java.util.List;

import com.wswhly.bean.vote.ActivityListRespBean;
import com.wswhly.bean.vote.ActivityReqBean;

public interface VoteDao {
	
	public List<String> queryActivityCount(long issue,long userid) throws Exception;
	
	//�ϴ���Ʒ
	public boolean addActivityInfo(ActivityReqBean info) throws Exception;
	
	//�޸Ĳ�Ʒ
	public boolean updActivityInfo(ActivityReqBean info) throws Exception;
	
	//ɾ����Ʒ
	public boolean delActivityInfo(long id) throws Exception;
	
	//ͶƱ
	public boolean addVoteInfo(long userid,long collectionid) throws Exception;
	
	public boolean queryIsVote(long userid,long collectionid) throws Exception;
	
	//��Ʒ����
	public ActivityListRespBean.Activity queryActivity(long collectionid) throws Exception;
	
	//��ȡ�ҵĲ�Ʒ
	public int queryMyActivityListCount(long userid,String type) throws Exception;
	
	public List<ActivityListRespBean.Activity> queryMyActivityList(long userid,String type,int pageno,int pagesize) throws SQLException;
	
	//��Ʒ����
	public boolean updateActivityNote(long id,String note) throws SQLException;
	
	//ͶƱ
	public boolean updateActivityVote(long id) throws SQLException;
	
	//��Ʒ�б�
	public int queryActivityListCount(long issue) throws Exception;
	
	public List<ActivityListRespBean.Activity> queryActivityList(long issue,String order,int pageno,int pagesize) throws SQLException;
	
	public Long queryCurrentActivity(String type) throws SQLException;
	public Long queryActivitycycle(String type) throws SQLException;
	
	public int queryVipActivityListCount() throws Exception;
	
	public List<ActivityListRespBean.Activity> queryVipActivityList(int pageno, int pagesize) throws Exception;
	
	public int queryMyVipListCount(long userid) throws Exception;
	
	public List<ActivityListRespBean.Activity> queryMyVipList(long userid, int pageno, int pagesize) throws Exception;
	
}
