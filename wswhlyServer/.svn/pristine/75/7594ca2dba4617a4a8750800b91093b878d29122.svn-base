package com.wswhly.dao.impl;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wswhly.bean.flagshop.FlagShopBaseInfoListRespBean.FlagShopBaseInfo;
import com.wswhly.bean.news.NewsListRespBean.News;
import com.wswhly.dao.FlagShopBaseInfoDao;
@Repository
public class FlagShopBaseInfoDaoImpl implements FlagShopBaseInfoDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	//查询旗舰商家列表  where    旗舰商家名称      类型  分页
	public List<Map<String, Object>> queryFlagShopBaseInfoList(int pageno,
			int pagesize, String name,String type) {
		String sql="select * from t_flagshopbaseinfo where name like'%"+name+"%' and type like '%"+type+"%' and state=1 order by id   desc limit ?, ? ";
		List<Map<String, Object>> list= jdbcTemplate.queryForList(sql,new Object[]{(pageno-1)*pagesize,pagesize});
		return list;
	}
	public int queryFlagShopBaseInfoListCount(String name,String type) throws SQLException {
		String sql="select count(id) from t_flagshopbaseinfo where name like'%"+name+"%' and type like '%"+type+"%' and state=1 ";
		return jdbcTemplate.queryForInt(sql);
	}
	//根据旗舰商家id查询旗舰商家详细信息
	public Map<String, Object> queryFlagShopBaseInfoById(String id) {
		String sql="select * from t_flagshopbaseinfo where  id ="+id+" and state=1";
		return jdbcTemplate.queryForMap(sql);
	}
	//查询旗舰商家资讯信息列表   where（旗舰商家id    资讯类型     分页）
	public List<Map<String, Object>> queryFlagShopBaseInfoNews(int pageno,
			int pagesize, String flagshopbaseinfoid, String style,String recommend )
			throws SQLException {
		String sql=" select t.*,FROM_UNIXTIME(UNIX_TIMESTAMP(t.createdate), '%Y-%m-%d %H:%i:%s')AS sfcreatedate ,t1.style as stylename from t_news t left join t_newstype t1 on t.style=t1.id where t.state = 1 and t.flagshopbaseinfoid="+flagshopbaseinfoid ;
		if(style!=null&&style.trim()!=""&&!"".equals(style.trim())){
			sql+=" and t.style ="+style;
		}
		if(recommend!=null&&recommend.trim()!=""&&!"".equals(recommend.trim())){
			sql+=" and t.recommend ="+recommend;
		}
		
		sql+=" order by t.id desc limit ?, ?";
		List<Map<String, Object>> list=jdbcTemplate.queryForList(sql,new Object[]{(pageno-1)*pagesize,pagesize});
		return list;
	}
	//查询旗舰商家资讯信息列表   where（旗舰商家id    资讯类型     分页）
	public int queryFlagShopBaseInfoNewsCount(String flagshopbaseinfoid,
			String style,String recommend ) throws SQLException {
		String sql=" select count(id) from t_news t  where state = 1 and flagshopbaseinfoid="+flagshopbaseinfoid ;
		if(style!=null&&style.trim()!=""&&!"".equals(style.trim())){
			sql+=" and style ="+style;
		}
		if(recommend!=null&&recommend.trim()!=""&&!"".equals(recommend.trim())){
			sql+=" and t.recommend ="+recommend;
		}
		return jdbcTemplate.queryForInt(sql);
	}
	//根据资讯id查询详细信息
	public Map<String, Object> queryNews(long id) throws SQLException {
		String sql=" select t.*,t1.style as stylename ,FROM_UNIXTIME(UNIX_TIMESTAMP(t.createdate), '%Y-%m-%d %H:%i:%s')AS sfcreatedate from t_news t left join t_newstype t1 on t.style=t1.id where t.state = 1 and t.id="+id;
		//增加点击量
		updateClicknum(id);
		return jdbcTemplate.queryForMap(sql);
	}
	//查询资讯上一条    where（资讯id 资讯类型）
	public Map<String, Object> queryNextNews(long id, String style)
			throws SQLException {
		String sql = "select t.*,t1.style as stylename ,FROM_UNIXTIME(UNIX_TIMESTAMP(t.createdate), '%Y-%m-%d %H:%i:%s')AS sfcreatedate from t_news t left join t_newstype t1 on t.style=t1.id where t.state = 1 and t.id = (select max(id) from t_news where id < "+id+" and style = "+style+" and state = 1 and (CHAR_LENGTH(flagshopbaseinfoid)>0) and flagshopbaseinfoid=(select n.flagshopbaseinfoid from  t_news n where n.id= "+id+") )";
		return jdbcTemplate.queryForMap(sql);
	}
	//查询资讯下一条   where（资讯id 资讯类型）
	public Map<String, Object> queryPrevNews(long id, String style)
			throws SQLException {
		String sql= "select t.*,t1.style as stylename ,FROM_UNIXTIME(UNIX_TIMESTAMP(t.createdate), '%Y-%m-%d %H:%i:%s')AS sfcreatedate  from t_news t left join t_newstype t1 on t.style=t1.id where t.state = 1 and t.id = (select min(id) from t_news where id > "+id+" and style = "+style+"  and state = 1 and (CHAR_LENGTH(flagshopbaseinfoid)>0 ) and flagshopbaseinfoid=(select n.flagshopbaseinfoid from  t_news n where n.id= "+id+")  )";
		return jdbcTemplate.queryForMap(sql);
	}
	private final String updateClicknum = "update t_news set clicknum = clicknum + 1 where id = ?";
	public boolean updateClicknum(long id) throws SQLException{
		int i = jdbcTemplate.update(updateClicknum,new Object[]{id});
		if(i>0)return true;else return false;
	}
	@Override
	public Map<String, Object> queryFlagShopBaseInfoByuserId(String userid) {
		String sql="select * from t_flagshopbaseinfo where  userid ="+userid+" and state=1";
		Map<String, Object> map= jdbcTemplate.queryForMap(sql);
		return map;
	}

}
