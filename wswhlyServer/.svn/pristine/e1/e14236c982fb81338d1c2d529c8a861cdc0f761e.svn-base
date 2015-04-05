package com.wswhly.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.wswhly.bean.forums.ForumsInfoReqBean;
import com.wswhly.bean.forums.ForumsListRespBean;
import com.wswhly.bean.forums.ForumsListRespBean.Forums;
import com.wswhly.dao.ForumsDao;

@Repository
public class ForumsDaoImpl implements ForumsDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private  final String addForumsInfo = "insert into t_forums" +
			"(" +
			"userid," +
			"collectionid," +
			"collectionnum," +
			"content," +
			"countnum," +
			"likenum," +
			"forumtime," +	
			"desction," +	
			"type" +	
			") " +
			"values(?,?,?,?,?,?,now(),?,?)";
		public int addForumsInfo(final ForumsInfoReqBean info) throws Exception {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException{
				PreparedStatement ps = conn.prepareStatement(addForumsInfo,Statement.RETURN_GENERATED_KEYS);
				ps.setLong(1, info.getUserid());
				ps.setLong(2, info.getCollectionid());
				ps.setString(3, info.getCollectionnum());
				ps.setString(4, info.getContent());
				ps.setString(5, info.getCountnum());
				ps.setString(6, info.getLikenum());
				ps.setString(7, info.getDesction());
				ps.setString(8, info.getType());
				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().intValue();
	}
		private final String queryForums = "select f.*,b.username,b.`level`from t_forums f, t_user b where f.userid=b.id and f.collectionid = ? and type = ? ORDER BY f.id desc ";
		public List<Forums> queryForums(long collectionid,int type)
				throws SQLException {
			return (List<Forums>)jdbcTemplate.query(queryForums,new Object[]{collectionid,type}, new ForumsRecordMapper());
		}
		
		@SuppressWarnings("unchecked")
		protected class ForumsRecordMapper implements RowMapper {
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				ForumsListRespBean.Forums forums = new ForumsListRespBean().new Forums();
				forums.setId(rs.getLong("id"));
				forums.setUserid(rs.getLong("userid"));
				forums.setCollectionid(rs.getLong("collectionid"));
				forums.setCollectionnum(rs.getString("collectionnum"));
				forums.setContent(rs.getString("content"));
				forums.setCountnum(rs.getString("countnum"));
				forums.setLikenum(rs.getString("likenum"));
				forums.setForumtime(rs.getString("forumtime"));
				forums.setDesction(rs.getString("desction"));
				forums.setUsername(rs.getString("username"));
				forums.setLevel(rs.getString("level"));
				return forums;
			}
		}

		private final String updateLikenum = "update t_forums set likenum = ? where id = ?";
		public boolean updateForumLikeNum(long id, String likenum)
				throws SQLException {
			int i = jdbcTemplate.update(updateLikenum,new Object[]{likenum,id});
			if(i>0)return true;else return false;
		}
		
}
