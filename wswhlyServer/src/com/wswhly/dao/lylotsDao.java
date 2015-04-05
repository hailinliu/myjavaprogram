package com.wswhly.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;



public interface lylotsDao {
	//上传拍品
	public boolean addlylots(Map<String,Object> data) throws SQLException;
	//获取拍品数量
	public int querylotsCount(long userid) throws SQLException;
	//获取上传拍品
	public List<Map<String,Object>>  getMylylots(long userid,int pageno,int pagesize);
	//火球专场
	public List<Map<String,Object>> getLyZc();
	
	public boolean updatemoney(Map<String,Object> where);
	//修改积分
	public boolean addpoint(Map<String,Object> data)throws NumberFormatException, SQLException;
	//修改明细
	public boolean addusermoney(Map<String,Object> data);
	//添加订单
	public boolean addOrder(Map<String,Object> data);
	
	
	//根据条件查询
	public int getlylotsCount(Map<String,Object> data);
	public List<Map<String,Object>> getlylots(Map<String,Object> data);
	//根据id查询详细信息
	public Map<String,Object> getlylotsByid(Map<String,Object> data);
	
	

	
}
