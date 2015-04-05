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

import com.wswhly.bean.flagshop.FlagshopInfoReqBean;
import com.wswhly.bean.flagshop.FlagshopListRespBean;
import com.wswhly.bean.flagshop.FlagshopListRespBean.Flagshop;
import com.wswhly.dao.FlagshopDao;

@Repository
public class FlagshopDaoImpl implements FlagshopDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private  final String flagshopinfo = "insert into t_flagshop" +
			"(" +
			"userid," +
			"companyName," +
			"com_abb," +
			"code," +
			"scan," +
			"com_code," +
			"com_scan," +
			"address," +
			"money," +
			"f_id_scan," +
			"f_id_code," +
			"name," +
			"id_card," +
			"id_scan," +
			"mobile," +
			"email," +
			"manage," +
			"com_area," +		
			"upload_img," +
			"imageUrl," +
			"logo," +
			"thumbnail," +
			"mapPath," +
			"applicationtime," +
			//"begintime," +
			//"endtime," +
			"state," +
			"display," +
			"style," +
			"desction" +
			") " +
			"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?)";
	private  final String addBMinfo="insert into t_flagshop(userid,companyName,com_abb,code,scan,com_code,com_scan,address,money,f_id_scan,f_id_code,name,id_card,id_scan,mobile,email,manage, com_area,com_areaupload_img,imageUrl,logo,thumbnail,mapPath,applicationtime,begintime,endtime,state,display,styledesction) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?,?,?)";
	public int addFlagshopInfo(final FlagshopInfoReqBean info) throws Exception {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException{
				PreparedStatement ps = conn.prepareStatement(flagshopinfo,Statement.RETURN_GENERATED_KEYS);
				ps.setLong(1, info.getUserid());
				ps.setString(2, info.getCompanyName());
				ps.setString(3, info.getComabb());
				ps.setString(4, info.getCode());
				ps.setString(5, info.getScan());
				ps.setString(6, info.getComcode());
				ps.setString(7, info.getComscan());
				ps.setString(8, info.getAddress());
				ps.setString(9, info.getMoney());
				ps.setString(10, info.getIdscan());		
				ps.setString(11, info.getFidcode());
				ps.setString(12, info.getName());
				ps.setString(13, info.getIdcard());
				ps.setString(14, info.getIdscan());
				ps.setString(15, info.getMobile());
				ps.setString(16, info.getEmail());
				ps.setString(17, info.getManage());
								
				ps.setString(18, info.getComarea());
				ps.setString(19, info.getUploadimg());
				ps.setString(20, info.getImageUrl());
				ps.setString(21, info.getLogo());
				ps.setString(22, info.getThumbnail());
				ps.setString(23, info.getMapPath());
				//ps.setString(24, info.getApplicationtime());
				//ps.setString(24, info.getBegintime());
				//ps.setString(25, info.getEndtime());
				ps.setString(24, info.getState());	
				ps.setString(25, info.getDisplay());
				ps.setString(26, info.getStyle());
				ps.setString(27, info.getDesction());
				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().intValue();
	}
	
	private final String queryFlagshopList = "select f.* from t_flagshop f ORDER BY f.id desc limit ?,? ";
	@SuppressWarnings("unchecked")
	public List<Flagshop> queryFlagshopList(int pageno,int pagesize) throws SQLException {
		return (List<Flagshop>)jdbcTemplate.query(queryFlagshopList,new Object[]{(pageno-1)*pagesize,pagesize}, new FlagshopRecordMapper());
	}
	private final String queryFlagshop = "select f.id,f.userid,f.companyName,f.mobile from t_flagshop f where f.userid = ? ";
	public List<Flagshop> queryFlagshop(long userid) throws SQLException {
		return (List<Flagshop>)jdbcTemplate.query(queryFlagshop,new Object[]{userid}, new FlagshopMapper());
	}
	
	
	@SuppressWarnings("unchecked")
	protected class FlagshopRecordMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			FlagshopListRespBean.Flagshop falgshop = new FlagshopListRespBean().new Flagshop();
			falgshop.setId(rs.getLong("id"));
			falgshop.setUserid(rs.getLong("userid"));
			falgshop.setCompanyName(rs.getString("companyName"));
		   //falgshop.setComabb(rs.getString("com_abb"));
			falgshop.setCode(rs.getString("code"));
			falgshop.setScan(rs.getString("scan"));
			falgshop.setComcode(rs.getString("com_code"));
			falgshop.setComscan(rs.getString("com_scan"));
			falgshop.setAddress(rs.getString("address"));
			falgshop.setMoney(rs.getString("money"));
			falgshop.setFname(rs.getString("f_name"));
			falgshop.setFidcode(rs.getString("f_id_code"));
			falgshop.setFscan(rs.getString("f_id_scan"));
			falgshop.setName(rs.getString("name"));
			falgshop.setIdcard(rs.getString("id_card"));
			falgshop.setMobile(rs.getString("mobile"));
			falgshop.setEmail(rs.getString("email"));
			falgshop.setManage(rs.getString("manage"));
			falgshop.setComarea(rs.getString("com_area"));	
			falgshop.setImageUrl(rs.getString("imageUrl"));
			falgshop.setLogo(rs.getString("logo"));
			falgshop.setThumbnail(rs.getString("thumbnail"));
			falgshop.setMapPath(rs.getString("mapPath"));
			falgshop.setApplicationtime(rs.getString("applicationtime"));
			falgshop.setBegintime(rs.getString("begintime"));
			falgshop.setEndtime(rs.getString("endtime"));
			falgshop.setDisplay(rs.getString("display"));
			falgshop.setStyle(rs.getString("style"));	
			falgshop.setDesction(rs.getString("desction"));

			return falgshop;
		}
	}

	@SuppressWarnings("unchecked")
	protected class FlagshopMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			FlagshopListRespBean.Flagshop falgshop = new FlagshopListRespBean().new Flagshop();
			falgshop.setId(rs.getLong("id"));
			falgshop.setUserid(rs.getLong("userid"));
			falgshop.setCompanyName(rs.getString("companyName"));   
		return falgshop;
		}
	}
	
}
