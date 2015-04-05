package com.wswhly.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import org.springframework.stereotype.Repository;

import com.wswhly.bean.collection.CollectionListRespBean;
import com.wswhly.bean.proficient.ProficientListRespBean;
import com.wswhly.bean.video.VideoListRespBean;
import com.wswhly.dao.ProficientDao;
import com.wswhly.dao.impl.CollectionDaoImpl.CollectionMapper;
import com.wswhly.dao.impl.VideoDaoImpl.VideoMapper;
import com.wswhly.util.StringUtil;

@Repository
public class ProficientDaoImpl implements ProficientDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String queryProficientCount = "select count(*) from t_proficient where state = 1";
	public int queryProficientCount() throws SQLException{
		return jdbcTemplate.queryForInt(queryProficientCount);
	}
	
	private final String queryProficient = "select * from t_proficient where state = 1 order by type asc limit ?,?";
	public List<ProficientListRespBean.Proficient> queryProficient(int pageno,int pagesize) throws SQLException{
		return (List<ProficientListRespBean.Proficient>)jdbcTemplate.query(queryProficient,new Object[]{(pageno-1)*pagesize,pagesize}, new ProficientMapper());
	}

	
	private final String queryProficientIndex = "select * from t_proficient where state = 1 ORDER BY rand() limit ?,?";
	public List<ProficientListRespBean.Proficient> queryProficientIndex(int pageno,int pagesize) throws SQLException{
		return (List<ProficientListRespBean.Proficient>)jdbcTemplate.query(queryProficientIndex,new Object[]{(pageno-1)*pagesize,pagesize}, new ProficientMapper());
	}
	
	protected class ProficientMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			ProficientListRespBean.Proficient proficient = new ProficientListRespBean().new Proficient();
			proficient.setId(rs.getLong("id"));
			proficient.setName(rs.getString("name"));
			proficient.setSpeciality(rs.getString("speciality"));
			proficient.setAppellation(rs.getString("appellation"));
			proficient.setNote(rs.getString("note"));
			String createdate = rs.getString("createdate");
			if(createdate != null && createdate.length() > 19)
				proficient.setCreatedate(createdate.substring(0, 19));
			proficient.setImgurl(rs.getString("imgurl"));
			return proficient;
		}
	}
	
	private final String queryProficientOne = "select * from t_proficient where state = 1 and id = ?";
	public ProficientListRespBean.Proficient queryProficient(long id) throws SQLException{
		List<ProficientListRespBean.Proficient> list = (List<ProficientListRespBean.Proficient>)jdbcTemplate.query(queryProficientOne,new Object[]{id}, new ProficientMapper());
		if(list.size()>0)
			return list.get(0);
		return null;
	}
	public List<Map<String, Object>> getProficientListForMap(Map<String, String> map) throws SQLException {
		String sql=" select * from t_proficient where state=1  ";
		//查询本期专家
		if(!StringUtil.isNullOrisEmpty(map.get("isbqhx"))){
			sql+=" and isbqhx="+map.get("isbqhx");
		}
		sql+=" order by orderc";
		return jdbcTemplate.queryForList(sql);
	}
}
