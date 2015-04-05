package com.hyzm.admin.dao.yc.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.yc.ActionDao;
@Repository
public class ActionDaoImpl implements ActionDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Map<String, Object>> getActionList(Date begindate,
			Date enddate, String ins_id, String state, int currentPage,
			int pageSize) throws Exception {
		try {
			String sql="select c.*, t.as_name from t_yc_action c left join t_yc_institutions t on c.ins_id = t.id where 1=1   ";
			if(ins_id!=""){
				sql+=" and  c.ins_id="+ins_id;
			}
			sql+=" order by c.id desc limit "+(currentPage-1)*pageSize+","+pageSize;
			return jdbcTemplate.queryForList(sql);
		} catch (Exception e) {
			throw new RuntimeException("获取拍卖会列表异常："+e.getMessage());
		}
	}
	
	public long getActionListNum(Date begindate, Date enddate,
			String ins_id, String state) throws Exception {
		try {
			String sql=" select count(c.id) from t_yc_action c where 1=1 ";
			if(ins_id!=""){
				sql+=" and  c.ins_id="+ins_id;
			}
			return jdbcTemplate.queryForLong(sql);
		} catch (Exception e) {
			throw new RuntimeException("获取拍卖会数量异常："+e.getMessage());
		}
	}
	
	private final static String addAction = "insert into t_yc_action (auctionname, actiontime, ins_id, place, specialnumber, totalnumber, state, previewtime, previewaddress) values (?,?,?,?,?,?,?,?,?)";
	public boolean addAction(String auctionname, String actiontime,
			long ins_id, String place, String specialnumber,
			String totalnumber, int state, String previewtime,
			String previewaddress) throws Exception {
		try {
			int i = jdbcTemplate.update(addAction, new Object[]{auctionname, actiontime, ins_id, place, specialnumber, totalnumber, state, previewtime, previewaddress});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加拍卖会异常："+e.getMessage());
		}
	}
	
	private final static String updAction = "update t_yc_action set auctionname = ?, actiontime = ?, ins_id = ?, place = ?, specialnumber = ?, totalnumber = ?, state = ?, previewtime = ?, previewaddress = ? where id= ?";
	public boolean updAction(long id, String auctionname, String actiontime,
			long ins_id, String place, String specialnumber,
			String totalnumber, int state, String previewtime,
			String previewaddress) throws Exception {
		try {
			int i = jdbcTemplate.update(updAction, new Object[]{auctionname, actiontime, ins_id, place, specialnumber, totalnumber, state, previewtime, previewaddress, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改拍卖会异常："+e.getMessage());
		}
	}
	private final static String getActionById = "select * from t_yc_action where id = ?";
	public Map<String, Object> getActionById(long id) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getActionById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取拍卖会异常："+e.getMessage());
		}
	}

}
