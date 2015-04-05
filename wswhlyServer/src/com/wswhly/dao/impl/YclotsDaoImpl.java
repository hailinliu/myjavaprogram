package com.wswhly.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.wswhly.bean.yc.YcCountBean;
import com.wswhly.bean.yc.YcactionRespBean;
import com.wswhly.bean.yc.YcactionRespBean.Ycaction;
import com.wswhly.bean.yc.YcinstitutionsRespBean.Ycinstitutions;
import com.wswhly.bean.yc.YcinstitutionsRespBean;
import com.wswhly.bean.yc.YclotsListRespBean;
import com.wswhly.bean.yc.YcspecialRespBean;
import com.wswhly.dao.YclotsDao;

@Repository
public class YclotsDaoImpl implements YclotsDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	public YclotsListRespBean.Yclots queryYclotsByid(String id) {
		String sql="select l.*,s.specialname,s.time as actiontime,a.auctionname,i.as_name as as_name  from t_yc_lots l  LEFT JOIN  t_yc_special s on l.specialID=s.id LEFT JOIN t_yc_action  a on a.id=s.actionid LEFT JOIN t_yc_institutions i ON i.id=a.ins_id where l.id="+id;
		List<YclotsListRespBean.Yclots> list = (List<YclotsListRespBean.Yclots>)jdbcTemplate.query(sql, new YclotsMapper());
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}

	public List<YclotsListRespBean.Yclots> queryYclotsByspecialID(String specialID, int pageno,
			int pagesize) {
		String sql="select l.*,s.specialname,s.time as actiontime,a.auctionname,i.as_name as as_name  from t_yc_lots l  LEFT JOIN  t_yc_special s on l.specialID=s.id LEFT JOIN t_yc_action  a on a.id=s.actionid LEFT JOIN t_yc_institutions i ON i.id=a.ins_id  where l.specialID="+specialID+" order by id limit ?,?";
		if(specialID=="-1"||specialID.equals("-1")){
			sql="select l.*,s.specialname,s.time as actiontime,a.auctionname,i.as_name as as_name  from t_yc_lots l  LEFT JOIN  t_yc_special s on l.specialID=s.id LEFT JOIN t_yc_action  a on a.id=s.actionid LEFT JOIN t_yc_institutions i ON i.id=a.ins_id   order by RAND() limit ?,?";
		}
		List<YclotsListRespBean.Yclots> list = (List<YclotsListRespBean.Yclots>)jdbcTemplate.query(sql,new Object[]{(pageno-1)*pagesize,pagesize}, new YclotsMapper());
		return list;
	}
	protected class  YclotsMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			YclotsListRespBean.Yclots yclots = new YclotsListRespBean().new Yclots();
			yclots.setId(rs.getString("id"));
			yclots.setAutor(rs.getString("autor"));
			yclots.setClasses(rs.getString("classes"));
			yclots.setImage(rs.getString("image"));
			yclots.setName(rs.getString("name"));
			yclots.setNote(rs.getString("note"));
			yclots.setPrice(rs.getString("price"));
			yclots.setSize(rs.getString("size"));
			yclots.setSpecialID(rs.getString("specialID"));
			yclots.setSuggest(rs.getString("suggest"));
			yclots.setYear(rs.getString("year"));
			yclots.setSpecialname(rs.getString("specialname"));
			yclots.setActiontime(rs.getString("actiontime"));
			yclots.setAs_name(rs.getString("as_name"));
			yclots.setAuctionname(rs.getString("auctionname"));
			yclots.setCjprice(rs.getString("cjprice"));
			yclots.setCjtime(rs.getString("cjtime"));
			return yclots;
		}
	}
	public int queryYclotsByspecialIDCount(String specialID) {
		if(specialID=="-1"||specialID.equals("-1")){
			return 5;
		}
		String sql="select count(*) from t_yc_lots where  specialID="+specialID;
		return jdbcTemplate.queryForInt(sql);
	}

	
	public int queryYcspecialByactionidCount(String actionid) {
		String sql="select count(*) from t_yc_special s   where s.actionid="+actionid;
		return jdbcTemplate.queryForInt(sql);
	}

	
	public List<YcspecialRespBean.Ycspecial> queryYcspecialByactionID(String actionid, int pageno,
			int pagesize) {
		String sql="select s.* ,a.auctionname from t_yc_special s left join t_yc_action a on a.id=s.actionid  where a.state=1 and s.actionid="+actionid+" order by id limit ?,?";
		List<YcspecialRespBean.Ycspecial> list = (List<YcspecialRespBean.Ycspecial>)jdbcTemplate.query(sql,new Object[]{(pageno-1)*pagesize,pagesize}, new YcspecialMapper());
		return list;
	}
	protected class  YcspecialMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			YcspecialRespBean.Ycspecial yspecial = new YcspecialRespBean().new Ycspecial();
			yspecial.setId(rs.getLong("id"));
			yspecial.setSpecialname(rs.getString("specialname"));
			yspecial.setTotalnum(rs.getString("totalnum"));
			return yspecial;
			}
		}

	public int queryYcactionByins_idCount(String ins_id) {
		String sql="select count(*) from t_yc_action a  where a.ins_id="+ins_id;
		return jdbcTemplate.queryForInt(sql);
	}


	public List<Ycaction> queryYcactionByins_id(String ins_id, int pageno,
			int pagesize) {
		String sql="select a.* ,i.ins_name from t_yc_action a left join t_yc_institutions i on i.id=a.ins_id  where  a.ins_id="+ins_id+" order by id limit ?,?";
		List<YcactionRespBean.Ycaction> list = (List<YcactionRespBean.Ycaction>)jdbcTemplate.query(sql,new Object[]{(pageno-1)*pagesize,pagesize}, new YcactionMapper());
		return list;
	}
	protected class  YcactionMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			YcactionRespBean.Ycaction ycaction = new YcactionRespBean().new Ycaction();
			ycaction.setId(rs.getLong("id"));
			ycaction.setActionname(rs.getString("auctionname"));
			return ycaction;
			}
		}
	@Override
	public int queryYcinstitutionsCount() {
		String sql="select count(*) from t_yc_institutions";
		return jdbcTemplate.queryForInt(sql);
	}

	@Override
	public List<Ycinstitutions> queryYcinstitutions() {
		String sql="select * from t_yc_institutions  order by id ";
		List<YcinstitutionsRespBean.Ycinstitutions> list = (List<YcinstitutionsRespBean.Ycinstitutions>)jdbcTemplate.query(sql, new YcinstitutionsMapper());
		return list;
	}
	protected class  YcinstitutionsMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			YcinstitutionsRespBean.Ycinstitutions ycinstitutions = new YcinstitutionsRespBean().new Ycinstitutions();
			ycinstitutions.setId(rs.getLong("id"));
			ycinstitutions.setIns_name(rs.getString("ins_name"));;
			ycinstitutions.setAs_name(rs.getString("as_name"));
	        return ycinstitutions;
			}
		}
	@Override
	public YcCountBean getYcCount() {
		String sql="select (SELECT count(id) from  t_yc_institutions ) as jdcount, (select count(id) from t_yc_action)as pmhcount, (select count(id) from  t_yc_special) as zccount,(select count(id) from  t_yc_lots) as ppcount	from dual";
		List<YcCountBean> list = (List<YcCountBean>)jdbcTemplate.query(sql, new YcCountBeanMapper());
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}
	protected class YcCountBeanMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			YcCountBean ycountBean = new YcCountBean();
			ycountBean.setJdcount(rs.getString("jdcount"));
			ycountBean.setPmhcount(rs.getString("pmhcount"));
			ycountBean.setPpcount(rs.getString("ppcount"));
			ycountBean.setZccount(rs.getString("zccount"));
	        return ycountBean;
			}
		}
}
