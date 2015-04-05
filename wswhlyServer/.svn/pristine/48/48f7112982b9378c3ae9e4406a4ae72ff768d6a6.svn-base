package com.wswhly.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Statement;
import com.wswhly.bean.trade.MoneyRecordListRespBean;
import com.wswhly.bean.trade.PointsRecordListRespBean;
import com.wswhly.dao.TradeDao;
import com.wswhly.util.DateUtil;
import com.wswhly.util.StringUtil;

@Repository
public class TradeDaoImpl implements TradeDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;	
	
	private final String addPointsRecord = "insert into t_point(userid,points,tradetype,tradedate,type,note,leftpoints) values (?,?,?,now(),?,?,?)";
	private final String addMoneyRecord = "insert into t_money(userid,money,tradetype,tradedate,type,note,leftmoney,ordernum) values (?,?,?,now(),?,?,?,?)";

	
	
	private final String addPoints = "update t_user set point = point + ? where id = ?";
	synchronized public boolean addPoints(long userid,int tradetype,int points) throws SQLException{
		int nowpoints = this.queryPoints(userid);
		int i = jdbcTemplate.update(addPoints,new Object[]{points,userid});
		if(i == 0)
			return false;
		jdbcTemplate.update(addPointsRecord,new Object[]{userid,points,tradetype,"1","",nowpoints+points});
		if(i == 0)
			return false;
		return true;
	}
	
	private final String minusPoints = "update t_user set point = point - ? where id = ?";
	synchronized public boolean minusPoints(long userid,int tradetype,int points) throws SQLException{
		int nowpoints = this.queryPoints(userid);
		int i = jdbcTemplate.update(minusPoints,new Object[]{points,userid});
		if(i == 0)
			return false;
		jdbcTemplate.update(addPointsRecord,new Object[]{userid,points,tradetype,"2","",nowpoints-points});
		if(i == 0)
			return false;
		return true;
	}
	
	private final String queryPoints = "select point from t_user where id = ?";
	public int queryPoints(long userid) throws SQLException{
		return jdbcTemplate.queryForInt(queryPoints,new Object[]{userid});
	}
	
	private final String addMoney = "update t_user set money = money + ? where id = ?";
	public boolean addMoney(long userid,int tradetype,double money,String ordernum) throws SQLException{
		System.out.println(userid+","+money);
		double nowmoney = this.queryMoney(userid);
		int i = jdbcTemplate.update(addMoney,new Object[]{money,userid});
		if(i == 0)
			return false;
		jdbcTemplate.update(addMoneyRecord,new Object[]{userid,money,tradetype,"1","",StringUtil.DoubleAdd(nowmoney, money),ordernum});
		if(i == 0)
			return false;
		return true;
	}
	
	private final String minusMoney = "update t_user set money = money - ? where id = ?";
	public boolean minusMoney(long userid,int tradetype,double money,String ordernum) throws SQLException{
		double nowmoney = this.queryMoney(userid);
		int i = jdbcTemplate.update(minusMoney,new Object[]{money,userid});
		if(i == 0)
			return false;
		jdbcTemplate.update(addMoneyRecord,new Object[]{userid,money,tradetype,"2","",StringUtil.DoubleSubtract(nowmoney, money),ordernum});
		if(i == 0)
			return false;
		return true;
	}
	
	private final String queryMoney = "select money from t_user where id = ?";
	public double queryMoney(long userid) throws SQLException{
		return jdbcTemplate.queryForObject(queryMoney,new Object[]{userid},Double.class);
	}
	
	private final String queryPointsRecordCount = "select count(*) from t_point where userid = ? and tradedate > ?";
	public int queryPointsRecordCount(long userid,int year) throws SQLException{
		return jdbcTemplate.queryForInt(queryPointsRecordCount,new Object[]{userid,DateUtil.addyear(-year)});
	}
	
	private final String queryPointsRecord = "select * from t_point where userid = ? and tradedate > ? order by tradedate desc limit ?,?";
	public List<PointsRecordListRespBean.PointRecord> queryPointsRecord(int pageno,int pagesize,long userid,int year) throws SQLException{
		return (List<PointsRecordListRespBean.PointRecord>)jdbcTemplate.query(queryPointsRecord,new Object[]{userid,DateUtil.addyear(-year),(pageno-1)*pagesize,pagesize}, new PointRecordMapper());
	}
	
	protected class PointRecordMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			PointsRecordListRespBean.PointRecord pointrecord = new PointsRecordListRespBean().new PointRecord();
			pointrecord.setPoints(rs.getInt("points"));
			String tradedate = rs.getString("tradedate");
			if(tradedate != null && tradedate.length() > 19)
				pointrecord.setTradedate(tradedate.substring(0, 19));
			pointrecord.setTradetype(rs.getString("tradetype"));
			pointrecord.setType(rs.getString("type"));
			pointrecord.setLeftpoints(rs.getInt("leftpoints"));
			pointrecord.setNote(rs.getString("note"));
			return pointrecord;
		}
	}
	
	private final String queryMoneyRecordCount = "select count(*) from t_money where userid = ? and tradedate > ?";
	public int queryMoneyRecordCount(long userid,int year) throws SQLException{
		return jdbcTemplate.queryForInt(queryMoneyRecordCount,new Object[]{userid,DateUtil.addyear(-year)});
	}
	
	private final String queryMoneyRecord = "select * from t_money where userid = ? and tradedate > ? order by tradedate desc limit ?,?";
	public List<MoneyRecordListRespBean.MoneyRecord> queryMoneyRecord(int pageno,int pagesize,long userid,int year) throws SQLException{
		return (List<MoneyRecordListRespBean.MoneyRecord>)jdbcTemplate.query(queryMoneyRecord,new Object[]{userid,DateUtil.addyear(-year),(pageno-1)*pagesize,pagesize}, new MoneyRecordMapper());
	}
	
	protected class MoneyRecordMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			MoneyRecordListRespBean.MoneyRecord pointrecord = new MoneyRecordListRespBean().new MoneyRecord();
			pointrecord.setMoney(rs.getDouble("money"));
			pointrecord.setOrderid(rs.getString("ordernum"));
			
			String tradedate = rs.getString("tradedate");
			if(tradedate != null && tradedate.length() > 19)
				pointrecord.setTradedate(tradedate.substring(0, 19));
			
			pointrecord.setTradetype(rs.getString("tradetype"));
			pointrecord.setType(rs.getString("type"));
			pointrecord.setLeftmoney(rs.getDouble("leftmoney"));
			pointrecord.setNote(rs.getString("note"));
			return pointrecord;
		}
	}
	
	private final String modifyOrder = "update t_order set paytype = ?,paymodel = ?,state = 1,trade_no=?,trade_status=? where ordernum = ?";
	public boolean modifyOrder(String ordernum,String paytype,String paymodel,String trade_no,String trade_status) throws SQLException{
		int i = jdbcTemplate.update(modifyOrder,new Object[]{paytype,paymodel,trade_no,trade_status,ordernum});
		if(i>0)return true;else return false;
	}
	
	private final String addOrder = "insert into t_order(userid,ordernum,money,tradetype,type,createdate,leftmoney) values(?,?,?,?,?,now(),?)";
	public long addOrder(final long userid, final String ordernum, final double money, final String tradetype, final String type,final double leftmoney) throws SQLException{
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException{
				PreparedStatement ps = conn.prepareStatement(addOrder,Statement.RETURN_GENERATED_KEYS);
				ps.setLong(1, userid);
				ps.setString(2, ordernum);
				ps.setDouble(3, money);
				ps.setString(4, tradetype);
				ps.setString(5, type);
				ps.setDouble(6, leftmoney);
				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().longValue();
	}
	
	private final String queryOrder = "select o.*,u.username,u.mobile from t_order o  left join t_user u on o.userid=u.id where  o.ordernum = ?";
	public Map<String,Object> queryOrder(String ordernum) throws SQLException{
		List<Map<String,Object>> list = jdbcTemplate.queryForList(queryOrder,new Object[]{ordernum});
		if(list.size()>0)
			return list.get(0);
		return null;
	}
	
	private final String addOffLineRecharge = "insert into t_offline_recharge(userid,money,imgurl,createdate) values(?,?,?,now())";
	public boolean addOffLineRecharge( long userid, String imgurl, double money) throws SQLException{
		int i = jdbcTemplate.update(addOffLineRecharge,new Object[]{userid,money,imgurl});
		if(i>0)return true;else return false;
	}

}
