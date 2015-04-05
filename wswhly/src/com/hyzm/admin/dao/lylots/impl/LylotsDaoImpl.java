package com.hyzm.admin.dao.lylots.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.lylots.LylotsDao;
@Repository
public class LylotsDaoImpl implements LylotsDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private final static String getLylotsList = "select  s.specialname, l.*,u.username  from t_ly_lots l left join t_ly_special s on l.specialID = s.id left join t_user u on l.userid = u.id where l.uptime >=? and l.uptime <=? and l.specialID like ? and l.lynumber like ? and l.name like ?  and u.username like ?  and l.userid like ?   and l.state like ? order by l.id desc limit ?, ?";
	public List<Map<String, Object>> getLylotsList(Date begindate,
			Date enddate, String specialID, String lynumber, String name,
			String username, String userid, String state, int currentPage,
			int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getLylotsList, new Object[]{begindate,enddate, "%"+specialID+"%", "%"+lynumber+"%", "%"+name+"%",  "%"+username+"%", "%"+userid+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取拍品列表异常："+e.getMessage());
		}
	}

	private final static String getLylotsListNum = "select count(l.id)  from t_ly_lots l left join t_ly_special s on l.specialID = s.id left join t_user u on l.userid = u.id where l.uptime >=? and l.uptime <=? and l.specialID like ? and l.lynumber like ? and l.name like ?  and u.username like ?  and l.userid like ?   and l.state like ? ";
	public long getLylotsListNum(Date begindate, Date enddate,String specialID, String lynumber, String name, String username,
			String userid, String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getLylotsListNum, new Object[]{begindate,enddate, "%"+specialID+"%", "%"+lynumber+"%", "%"+name+"%",  "%"+username+"%", "%"+userid+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品数量异常："+e.getMessage());
		}
	}
	private final static String updLylots = "update t_ly_lots set specialID = ?, name = ?,  image = ?, qpprice = ?, pricearea = ?, taobaourl = ?,trialcomments = ?,reviewcomments = ?, cjprice= ?,  adminname = ?, record = ? ,suggest = ? where id = ?";
	public boolean updLylots(long id, int specialID, String name,String image,String qpprice,String pricearea,String taobaourl,String trialcomments,String reviewcomments,
			String cjprice,String adminname, String record, String suggest) throws Exception {
		try {
			int i = jdbcTemplate.update(updLylots, new Object[]{specialID, name,  image, qpprice,pricearea, taobaourl, trialcomments, reviewcomments, cjprice, adminname, record,suggest, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改拍品异常："+e.getMessage());
		}
	}
	private final static String getLylotsById = "select * from t_ly_lots where id = ?";
	public Map<String, Object> getLylotsById(long id) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getLylotsById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取商家异常："+e.getMessage());
		}
	}
	
	public boolean updstate(long id, int state) throws Exception {
		try {
			int i=0;
			if(state==2){ 
				String sql="UPDATE  t_ly_lots  l set l.trialtime=NOW() , l.state=? where  l.id=?";
				 i = jdbcTemplate.update(sql, new Object[]{state,id});
			}else if(state==4){
				String sql="UPDATE  t_ly_lots  l set l.reviewtime=NOW(), l.state=? where  l.id=?";
				 i = jdbcTemplate.update(sql, new Object[]{state,id});
			}else if(state==6){
				String sql="UPDATE  t_ly_lots  l set l.signingtime=NOW() , l.state=? where  l.id=?";
				 i = jdbcTemplate.update(sql, new Object[]{state,id});
			}else if(state==8){
				String sql="UPDATE  t_ly_lots  l set l.dealtime=NOW() , l.state=? where  l.id=?";
				 i = jdbcTemplate.update(sql, new Object[]{state,id});
			}else{
				String sql="UPDATE  t_ly_lots  l set l.state=? where  l.id=?";
				 i = jdbcTemplate.update(sql, new Object[]{state,id});
			}
					if (i > 0)
						
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改状态异常："+e.getMessage());
		}
	}


	public boolean updzjlots(long id, String trialcomments,String sczjid,String trialexperts) throws Exception {
		try {
			String updzjlots = "UPDATE  t_ly_lots  l set l.trialcomments="+"'"+trialcomments+"'"+" ,l.trialexperts=(SELECT p.name from t_proficient p LEFT JOIN t_ly_special s on s.zjid=p.id where s.sczjid="+sczjid+"), l.trialtime=now() where l.id="+id;
			int i = jdbcTemplate.update(updzjlots);
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改专家评论异常："+e.getMessage());
		}
	}
	private final static String getZJlotsList = "select  s.specialname, l.*  from t_ly_lots l left join t_ly_special s on l.specialID = s.id  where l.uptime >=? and l.uptime <=? and l.lynumber like ? and l.name like ?  and s.sczjid like ? order by l.id desc limit ?, ?";
	public List<Map<String, Object>> getZJlotsList(Date begindate,
			Date enddate, String lynumber, String name, String zjid,
			int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getZJlotsList, new Object[]{begindate,enddate,  "%"+lynumber+"%", "%"+name+"%",  "%"+zjid+"%",(currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取专家拍品列表异常："+e.getMessage());
		}
	}
	private final static String getZJlotsListNum = "select count(l.id)  from t_ly_lots l left join t_ly_special s on l.specialID = s.id   where l.uptime >=? and l.uptime <=? and  l.lynumber like ? and l.name like ?   and s.sczjid like ? ";
	public long getZJlotsListNum(Date begindate, Date enddate, String lynumber,
			String name, String zjid) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getZJlotsListNum, new Object[]{begindate,enddate,  "%"+lynumber+"%", "%"+name+"%",  "%"+zjid+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取藏品数量异常："+e.getMessage());
		}
	}





}
