package com.wswhly.dao;

import java.sql.SQLException;
import java.util.List;

import com.wswhly.bean.forums.ForumsInfoReqBean;
import com.wswhly.bean.forums.ForumsListRespBean;

public interface ForumsDao {

	public int addForumsInfo(ForumsInfoReqBean info) throws Exception;
	
	public List<ForumsListRespBean.Forums> queryForums(long collectionid,int type) throws SQLException;
	
	public boolean updateForumLikeNum(long id,String likenum) throws SQLException;
}
