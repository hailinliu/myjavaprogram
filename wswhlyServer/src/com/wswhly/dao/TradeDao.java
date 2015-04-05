package com.wswhly.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.wswhly.bean.trade.MoneyRecordListRespBean;
import com.wswhly.bean.trade.PointsRecordListRespBean;

public interface TradeDao {

	public boolean addPoints(long userid,int tradetype,int points) throws SQLException;
	
	public boolean minusPoints(long userid,int tradetype,int points) throws SQLException;
	
	public int queryPoints(long userid) throws SQLException;
	
	public boolean addMoney(long userid,int tradetype,double money,String ordernum) throws SQLException;
	
	public boolean minusMoney(long userid,int tradetype,double money,String ordernum) throws SQLException;
	
	public double queryMoney(long userid) throws SQLException;
	
	public int queryPointsRecordCount(long userid,int year) throws SQLException;
	
	public List<PointsRecordListRespBean.PointRecord> queryPointsRecord(int pageno,int pagesize,long userid,int year) throws SQLException;
	
	public int queryMoneyRecordCount(long userid,int year) throws SQLException;
	
	public List<MoneyRecordListRespBean.MoneyRecord> queryMoneyRecord(int pageno,int pagesize,long userid,int year) throws SQLException;

	public long addOrder(final long userid, final String ordernum, final double money, final String tradetype, final String type,final double leftmoney) throws SQLException;
	
	public boolean modifyOrder(String ordernum,String paytype,String paymodel,String trade_no,String trade_status) throws SQLException;
	
	public Map<String,Object> queryOrder(String ordernum) throws SQLException;
	
	public boolean addOffLineRecharge( long userid, String imgurl, double money) throws SQLException;
}
