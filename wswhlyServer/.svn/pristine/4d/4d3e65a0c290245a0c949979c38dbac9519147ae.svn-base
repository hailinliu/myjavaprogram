package com.wswhly.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wswhly.bean.news.NewsListRespBean;
import com.wswhly.dao.lylotsDao;
import com.wswhly.dao.impl.NewsDaoImpl.NewsMapper;
@Repository
public class lylotsDaoImpl implements lylotsDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String addlylots = "insert into t_ly_lots (specialID, name, uptime, userid, autor, year, size, image, ybprice, suggest, lynumber,state) values (?,?,now(),?,?,?,?,?,?,?,?,1)";
	public boolean addlylots(Map<String,Object> data){
		String lynum="LY"+(int)(89999999*((Math.random()*8)+1));
		int i = jdbcTemplate.update(addlylots,new Object[]{data.get("specialID"),data.get("name"),data.get("userid"),data.get("autor"),data.get("year"),data.get("size"),data.get("image"),data.get("ybprice"),data.get("suggest"),lynum});
		if(i>0){
				return true;
		}
		return false;
	}
	
	private final String querylotsCount = "select count(*) from t_ly_lots where userid = ? and state<>10";
	public int querylotsCount(long userid) throws SQLException{
		return jdbcTemplate.queryForInt(querylotsCount,new Object[]{userid});
	}
	
	public List<Map<String, Object>> getLyZc() {
		String sql="select * from  t_ly_special where state=1";
		List<Map<String, Object>> list=jdbcTemplate.queryForList(sql);
		return list;
	}
	public boolean updatemoney(Map<String,Object> where){
		//修改用户表中余额
		int k=jdbcTemplate.update("update t_user set money=money-100,point=point+100  where id="+where.get("userid"));
		if(k>0){
			return true;
		}
		return false;
		
	}
	private final String addPointsRecord = "insert into t_point(userid,points,tradetype,tradedate,type,note,leftpoints,state) values (?,?,?,now(),1,?,?,1)";
	public boolean addpoint(Map<String,Object> data) throws NumberFormatException, SQLException{
		int nowpoints = this.queryPoints(Long.valueOf(data.get("userid").toString()));
		int k=jdbcTemplate.update(addPointsRecord,new Object[]{data.get("userid"),data.get("points"),data.get("tradetype"),data.get("note"),nowpoints});
		if(k>0){
			return true;
		}
		return false;
		
	}

	private final String addmoneyRecord = "insert into t_money(userid,money,tradetype,tradedate,type,note,leftmoney,ordernum) values (?,?,?,now(),2,?,?,?)";
	public boolean addusermoney(Map<String, Object> data) {
		int k=jdbcTemplate.update(addmoneyRecord,new Object[]{data.get("userid"),data.get("money"),data.get("tradetype"),data.get("note"),data.get("leftmoney"),data.get("ordernum")});
		if(k>0){
			return true;
		}
		return false;
	}
	private final String queryPoints = "select point from t_user where id = ?";
	public int queryPoints(long userid) throws SQLException{
		return jdbcTemplate.queryForInt(queryPoints,new Object[]{userid});
	}
	public List<Map<String, Object>> getMylylots(long userid, int pageno,
			int pagesize) {
		String sql="select l.*,s.specialname as specialname,date_format(l.uptime,'%Y-%m-%d %H:%i:%S' ) as formatuptime from  t_ly_lots l right JOIN t_ly_special s on s.id=l.specialID where l.userid = "+userid +" and l.state<>10 order by l.id desc  limit ?, ? ";
      return (List<Map<String, Object>>)jdbcTemplate.queryForList(sql,new Object[]{(pageno-1)*pagesize,pagesize});
	}

	private final String addOrder = "insert into t_order(userid,ordernum,money,tradetype,type,createdate,leftmoney,state) values(?,?,?,?,2,now(),?,0)";
	public boolean addOrder(Map<String, Object> data) {
		int k=jdbcTemplate.update(addOrder,new Object[]{data.get("userid"),data.get("ordernum"),data.get("money"),data.get("tradetype"),data.get("leftmoney")});
		if(k>0){
			return true;
		}
		return false;
	}

	public List<Map<String, Object>> getlylots(Map<String, Object> data) {
		String sql="select * from t_ly_lots where 1=1 and state<>10 ";
		if(data.get("specialID")!=null&&data.get("specialID")!=""&&!data.get("specialID").equals("")){
			sql+=" and specialID="+data.get("specialID");
		}
		if(data.get("pricearea")!=null&&data.get("pricearea")!=""&&!data.get("pricearea").equals("")){
			sql+=" and pricearea ="+data.get("pricearea");
		}
		int ly=Integer.valueOf(data.get("ly").toString());
		if(ly==1)//乐园自由
		{
			sql+=" and userid="+data.get("userid");
		}else if(ly==2){//用户送拍{
			sql+=" and userid <> "+data.get("userid");
		}
		int pageno=Integer.valueOf(data.get("pageno").toString());
		int pagesize=Integer.valueOf(data.get("pagesize").toString());
		sql+=" order by qpprice  desc  limit "+(pageno-1)*pagesize+","+pagesize;
		return jdbcTemplate.queryForList(sql);
	}

	public Map<String, Object> getlylotsByid(Map<String, Object> data) {
		String sql=" select l.* ,s.specialname,u.username from t_ly_lots l left join t_ly_special s on l.specialID=s.id LEFT JOIN t_user u on l.userid=u.id where l.id="+data.get("id");
		return jdbcTemplate.queryForMap(sql);
	}

	public int getlylotsCount(Map<String, Object> data) {
		String sql="select count(id) from t_ly_lots where 1=1 and state<>10 ";
		if(data.get("specialID")!=null&&data.get("specialID")!=""&&!data.get("specialID").equals("")){
			sql+=" and specialID="+data.get("specialID");
		}
		if(data.get("pricearea")!=null&&data.get("pricearea")!=""&&!data.get("pricearea").equals("")){
			sql+=" and pricearea ="+data.get("pricearea");
		}
		int ly=Integer.valueOf(data.get("ly").toString());
		if(ly==1)//乐园自由
		{
			sql+=" and userid="+data.get("userid");
		}else if(ly==2){//用户送拍{
			sql+=" and userid <> "+data.get("userid");
		}
		return jdbcTemplate.queryForInt(sql);
	}
}
