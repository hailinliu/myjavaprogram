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

import com.wswhly.bean.enroll.CurrentEnrollRespBean;
import com.wswhly.bean.enroll.EnrollInfoReqBean;
import com.wswhly.bean.enroll.EnrollListRespBean;
import com.wswhly.bean.enroll.EnrollReqBean;
import com.wswhly.dao.EnrollDao;

@Repository
public class EnrollDaoImpl implements EnrollDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String addInvoice = "insert into t_invoice(userid,orderid,invoicename,recipient,mobile,address,code,createdate) values(?,?,?,?,?,?,?,now())";
	public boolean addInvoice(long userid, long orderid, EnrollReqBean.Invoice invoice) throws SQLException{
		int i = jdbcTemplate.update(addInvoice,new Object[]{userid,orderid,invoice.getName(),invoice.getRecipient(),invoice.getMobile(),invoice.getAddress(),invoice.getZipcode()});
		if(i>0)return true;else return false;
	}
	
	private final String addEntoll = "insert into t_bmrecord(bmid,userid,orderid,code,createdate,validdate) values(?,?,?,?,now(),?)";
	public int addEntoll(final long bmid, final long userid, final long orderid, final String code,final String validdate) throws SQLException{
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException{
				PreparedStatement ps = conn.prepareStatement(addEntoll,Statement.RETURN_GENERATED_KEYS);
				ps.setLong(1, bmid);
				ps.setLong(2, userid);
				ps.setLong(3, orderid);
				ps.setString(4, code);
				ps.setString(5, validdate);
				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().intValue();
	}
	
	private final String addEntollCollection = "insert into t_bm_collection(bmrecordid,collectionid) values(?,?)";
	public boolean addEntollCollection(long bmrecordid, long collectionid) throws SQLException{
		int i = jdbcTemplate.update(addEntollCollection,new Object[]{bmrecordid,collectionid});
		if(i>0)return true;else return false;
	}
	
	private final String queryEntollRecordCount = "select count(*) from t_bmrecord where userid = ?";
	public int queryEntollRecordCount(long userid) throws SQLException{
		return jdbcTemplate.queryForInt(queryEntollRecordCount,new Object[]{userid});
	}
	
	private final String queryEntollRecord = "select t.id,t.code,t.createdate,t1.title,t1.cycle,t2.username,t.validdate from t_bmrecord t left join t_bm t1 on t.bmid = t1.id left join t_user t2 on t.userid=t2.id where t.userid = ? order by t.createdate desc limit ?,?";
	public List<EnrollListRespBean.EnrollRecord> queryEntollRecord(int pageno,int pagesize,long userid) throws SQLException{
		return (List<EnrollListRespBean.EnrollRecord>)jdbcTemplate.query(queryEntollRecord,new Object[]{userid,(pageno-1)*pagesize,pagesize}, new EnrollRecordMapper());
	}
	
	private final String queryEntollRecordInfoCount = "select count(*) from t_bm_collection t left join t_bmrecord t1 on t.bmrecordid = t1.id where t1.bmid = ?";
	public int queryEntollRecordInfoCount(long enrollid) throws SQLException{
		return jdbcTemplate.queryForInt(queryEntollRecordInfoCount,new Object[]{enrollid});
	}
	
	private final String queryEntollRecordInfo = "select * from t_bmrecord t left join t_bm t1 on t.bmid = t1.id left join t_user u on u.id=t.userid where t.bmid = ? order by t.createdate desc limit ?,?";
	public List<EnrollListRespBean.EnrollRecord> queryEntollRecordInfo(int pageno,int pagesize,long enrollid) throws SQLException{
		return (List<EnrollListRespBean.EnrollRecord>)jdbcTemplate.query(queryEntollRecordInfo,new Object[]{enrollid,(pageno-1)*pagesize,pagesize}, new EnrollRecordMapper());
	}
	
	protected class EnrollRecordMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			EnrollListRespBean.EnrollRecord enrollrecord = new EnrollListRespBean().new EnrollRecord();
			enrollrecord.setRecordid(rs.getLong("id"));
			enrollrecord.setCycle(rs.getString("cycle"));
			enrollrecord.setTitle(rs.getString("title"));
			enrollrecord.setCode(rs.getString("code"));
		  String createdate = rs.getString("createdate");
			if(createdate != null && createdate.length() > 19)
			enrollrecord.setCreatedate(createdate.substring(0, 19));			
			enrollrecord.setValiddate(rs.getString("validdate"));
			String username = rs.getString("username");
			if(username != null)
				enrollrecord.setUsername(username);
			return enrollrecord;
		}
	}
	
	private final String queryCurrentEntoll = "select * from t_bm where begindate < now() and enddate > now()";
	public List<CurrentEnrollRespBean.Enroll> queryCurrentEntoll() throws SQLException{
		return (List<CurrentEnrollRespBean.Enroll>)jdbcTemplate.query(queryCurrentEntoll, new EnrollMapper());
	}
	
	private final String queryEntoll = "select * from t_bm where id = ?";
	public List<CurrentEnrollRespBean.Enroll> queryEntoll(long enrollid) throws SQLException{
		return (List<CurrentEnrollRespBean.Enroll>)jdbcTemplate.query(queryEntoll,new Object[]{enrollid}, new EnrollMapper());
	}
	
	protected class EnrollMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			CurrentEnrollRespBean.Enroll enroll = new CurrentEnrollRespBean().new Enroll();
			enroll.setId(rs.getLong("id"));
			enroll.setCycle(rs.getString("cycle"));
			enroll.setTitle(rs.getString("title"));
			enroll.setContent(rs.getString("content"));
			enroll.setState(rs.getString("state"));
			
			String begindate = rs.getString("begindate");
			if(begindate != null && begindate.length() > 19)
				enroll.setBegindate(begindate.substring(0, 19));
			
			String enddate = rs.getString("enddate");
			if(enddate != null && enddate.length() > 19)
				enroll.setEnddate(enddate.substring(0, 19));
			
			String validdate = rs.getString("validdate");
			if(validdate != null && validdate.length() > 19)
				enroll.setValiddate(validdate.substring(0, 19));
			
			return enroll;
		}
	}
	
	private final String queryEntollCollection = "select t.collectionid from t_bm_collection t left join t_bmrecord t1 on t.bmrecordid = t1.id left join t_bm t2 on t1.bmid=t2.id where t1.userid = ? and t2.id = ?";
	public List<Long> queryEntollCollection(long userid,long enrollid) throws SQLException{
		return (List<Long>)jdbcTemplate.queryForList(queryEntollCollection,new Object[]{userid,enrollid},Long.class);
	}
	
	private final String queryCurrentEntollCount = "select count(*) from t_bm_collection t left join t_bmrecord t1 on t.bmrecordid = t1.id where t1.bmid = ?";
	public int queryCurrentEntollCount(long enrollid) throws SQLException{
		return jdbcTemplate.queryForInt(queryCurrentEntollCount,new Object[]{enrollid});
	}
	private  final String addBMinfo = "insert into t_bm_info(bm_style,bm_time,name,tel,email,sex,idcard,ipcard,address,visa,useTime,style,lader,joins,description,userid,username,mobile) values(?,now(),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	public int addInfo(final EnrollInfoReqBean info) throws Exception {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException{
				PreparedStatement ps = conn.prepareStatement(addBMinfo,Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, info.getBmStyle());
				ps.setString(2, info.getName());
				ps.setString(3, info.getTel());
				ps.setString(4, info.getEmail());
				ps.setString(5, info.getSex());
				ps.setString(6, info.getIdcard());
				ps.setString(7, info.getIpcard());
				ps.setString(8, info.getAddress());
				ps.setString(9, info.getVisa());
				ps.setString(10, info.getUseTime());		
				ps.setString(11, info.getStyle());
				ps.setString(12, info.getLader());
				ps.setString(13, info.getJoin());
				ps.setString(14, info.getDesc());
				ps.setLong(15, info.getUserid());//20140720ÐÞ¸Ä
				ps.setString(16, info.getUsername());
				ps.setString(17, info.getMobile());
				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().intValue();
	}
	
}
