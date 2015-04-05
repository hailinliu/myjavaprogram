package com.hyzm.admin.dao.business.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.business.BusinessDao;

@Repository
public class BusinessDaoImpl implements BusinessDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getInvoiceList = "select i.*,u.username,o.ordernum from t_invoice i left join t_user u on i.userid = u.id left join t_order o on i.orderid = o.id where i.createdate >= ? and i.createdate <= ? and i.userid like ? and u.username like ?  and i.issend like ? order by i.id desc limit ?, ?";

	public List<Map<String, Object>> getInvoiceList(Date begindate,
			Date enddate,String userid, String username, String issend, int currentPage, int pageSize)
			throws Exception {
		try {
			return jdbcTemplate.queryForList(getInvoiceList, new Object[]{begindate, enddate, "%"+userid+"%", "%"+username+"%", "%"+issend+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取发票列表异常："+e.getMessage());
		}
	}
	
	private final static String getInvoiceListNum = "select count(i.id) from t_invoice i left join t_user u on i.userid = u.id where i.createdate >= ? and i.createdate <= ? and i.userid like ? and u.username like ? and i.issend like ?";

	public long getInvoiceListNum(Date begindate, Date enddate,String userid, String username, String issend)
			throws Exception {
		try {
			return jdbcTemplate.queryForLong(getInvoiceListNum, new Object[]{begindate, enddate, "%"+userid+"%", "%"+username+"%", "%"+issend+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取发票数量异常："+e.getMessage());
		}
	}
	
	private final static String updateState = "update t_invoice set issend = ? where id = ?";

	public boolean updateState(int issend, long id) throws Exception {
		try {
			int i = jdbcTemplate.update(updateState, new Object[]{issend, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改发票状态异常："+e.getMessage());
		}
	}
	
	public List<Map<String, Object>> getOrderList(String userid,String username, String money, String tradetype, String ordernum, String orderno, String paytype, int currentPage, int pageSize) throws Exception {
		try {
			String sql = "";
			List<Object> list = new ArrayList<Object>();
			list.add("%"+userid+"%");
			list.add("%"+username+"%");
			list.add("%"+money+"%");
			list.add("%"+tradetype+"%");
			list.add("%"+ordernum+"%");
			if (!"".equals(orderno)) {
				sql = " and o.trade_no like ? ";
				list.add("%"+orderno+"%");
			}
			list.add("%"+paytype+"%");
			list.add((currentPage-1)*pageSize);
			list.add(pageSize);
			String getOrderList = "select o.*, u.username from t_order o left join t_user u on o.userid = u.id where o.userid like? and u.username like ? and o.money like ? and o.type like ? and o.ordernum like ? "+sql+" and o.paytype like ? order by o.id desc limit ?, ?";
			return jdbcTemplate.queryForList(getOrderList, list.toArray());
		} catch (Exception e) {
			throw new RuntimeException("获取订单列表异常："+e.getMessage());
		}
	}
	
	public long getOrderListNum(String userid,String username, String money, String tradetype, String ordernum, String orderno, String paytype) throws Exception {
		try {
			String sql = "";
			List<Object> list = new ArrayList<Object>();
			list.add("%"+userid+"%");
			list.add("%"+username+"%");
			list.add("%"+money+"%");
			list.add("%"+tradetype+"%");
			list.add("%"+ordernum+"%");
			if (!"".equals(orderno)) {
				sql = " and o.trade_no like ?";
				list.add("%"+orderno+"%");
			}
			list.add("%"+paytype+"%");
			String getOrderListNum = "select count(o.id) from t_order o left join t_user u on o.userid = u.id where o.userid like? and  u.username like ? and o.money like ? and o.type like ? and o.ordernum like ? "+sql+" and o.paytype like ?";
			return jdbcTemplate.queryForLong(getOrderListNum, list.toArray());
		} catch (Exception e) {
			throw new RuntimeException("获取订单数量异常："+e.getMessage());
		}
	}
	
	private final static String delOrder = "update t_order set state = 2 where id = ?";
	
	public boolean delOrder(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(delOrder, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除订单异常："+e.getMessage());
		}
	}
	
	private final static String getPointList = "select p.*, u.username from t_point p left join t_user u on p.userid = u.id where p.tradedate >= ? and p.tradedate <= ? and p.userid like ? and u.username like ? and p.state like ? order by p.id desc limit ?, ?";

	public List<Map<String, Object>> getPointList(Date begindate, Date enddate,String userid,
			String username, String state, int currentPage, int pageSize)
			throws Exception {
		try {
			return jdbcTemplate.queryForList(getPointList, new Object[]{begindate, enddate, "%"+userid+"%", "%"+username+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取积分明细列表异常："+e.getMessage());
		}
	}
	
	private final static String getPointListNum = "select count(p.id) from t_point p left join t_user u on p.userid = u.id where p.tradedate >= ? and p.tradedate <= ? and p.userid like ? and u.username like ? and p.state like ?";

	public long getPointListNum(Date begindate, Date enddate, String userid,String username, String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getPointListNum, new Object[]{begindate, enddate,"%"+userid+"%", "%"+username+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取积分明细数量异常："+e.getMessage());
		}
	}
	
	private final static String delPoint = "update t_point set state = 2 where id = ?";
	
	public boolean delPoint(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(delPoint, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除积分明细异常："+e.getMessage());
		}
	}
	
	private final static String getMoneyList = "select m.*, u.username from t_money m left join t_user u on m.userid = u.id where m.tradedate >= ? and m.tradedate <= ? and  m.userid like ? and u.username like ?  and m.tradetype like ?  and m.state like ? order by m.id desc limit ?, ?";

	public List<Map<String, Object>> getMoneyList(Date begindate, Date enddate,String userid,
			String username,String tradetype, String state, int currentPage, int pageSize)
			throws Exception {
		try {
			return jdbcTemplate.queryForList(getMoneyList, new Object[]{begindate, enddate, "%"+userid+"%", "%"+username+"%", "%"+tradetype+"%",  "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取收支明细列表异常："+e.getMessage());
		}
	}
	
	private final static String getMoneyListNum = "select count(m.id) from t_money m left join t_user u on m.userid = u.id where m.tradedate >= ? and m.tradedate <= ? and  m.userid like ? and u.username like ? and m.tradetype like ? and m.state like ?";

	public long getMoneyListNum(Date begindate, Date enddate,String userid, String username,String tradetype, String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getMoneyListNum, new Object[]{begindate, enddate,"%"+userid+"%", "%"+username+"%", "%"+tradetype+"%",  "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取收支明细数量异常："+e.getMessage());
		}
	}
	
	private final static String delMoney = "update t_money set state = 2 where id = ?";
	
	public boolean delMoney(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(delMoney, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除收支明细异常："+e.getMessage());
		}
	}
	
	private final static String getOffLinePayList = "select t.*, u.id as userid, u.username from t_offline_recharge t left join t_user u on t.userid = u.id where t.createdate >= ? and t.createdate <= ?  and  t.userid  like ? and u.username like ? and t.state like ? order by t.id desc limit ?, ?";

	public List<Map<String, Object>> getOffLinePayList(Date begindate,
			Date enddate,String userid, String username, String state, int currentPage,
			int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getOffLinePayList, new Object[]{begindate, enddate,"%"+userid+"%", "%"+username+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取线下支付明细列表异常："+e.getMessage());
		}
	}
	
	private final static String getOffLinePayListNum = "select count(t.id) from t_offline_recharge t left join t_user u on t.userid = u.id where t.createdate >= ? and t.createdate <= ? and  t.userid  like ? and u.username like ? and t.state like ?";

	public long getOffLinePayListNum(Date begindate, Date enddate,
			String userid,String username, String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getOffLinePayListNum, new Object[]{begindate, enddate,"%"+userid+"%", "%"+username+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取线下支付明细数量异常："+e.getMessage());
		}
	}
	
	private final static String dealOffLine = "update t_user set money = money + ? where id = ?";
	
	public boolean dealOffLine(long userid, double money) throws Exception {
		try {
			int i = jdbcTemplate.update(dealOffLine, new Object[]{money, userid});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("线下支付处理异常："+e.getMessage());
		}
	}
	
	private final static String changeState = "update t_offline_recharge set state = ? where id = ?";

	public boolean changeState(long id, int state) throws Exception {
		try {
			int i = jdbcTemplate.update(changeState, new Object[]{state, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("改变处理状态异常："+e.getMessage());
		}
	}
	
	private final static String addPoints = "insert into t_point (userid,points,tradetype,tradedate,type,note,leftpoints,state) values (?,?,?,now(),?,?,?,1)";

	public boolean addPoints(long userid, int points,int tradetype,  int type, String note,
			int leftpoints) throws Exception {
		try {
			int i = jdbcTemplate.update(addPoints, new Object[]{userid, points,tradetype, type, note, leftpoints});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加用户积分明细异常："+e.getMessage());
		}
	}
	
	private final static String addMoney = "insert into t_money (userid,money,tradetype,tradedate,type,note,leftmoney,state) values (?,?,?,now(),?,?,?,1)";

	public boolean addMoney(long userid, double money,int tradetype, int type, String note,
			double leftmoney) throws Exception {
		try {
			int i = jdbcTemplate.update(addMoney, new Object[]{userid, money,tradetype, type, note, leftmoney});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加用户收支明细异常："+e.getMessage());
		}
	}



}
