package com.hyzm.admin.dao.yc.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.yc.LotsDao;
@Repository
public class LotsDaoImpl implements LotsDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private final static String addsql="insert into t_yc_lots(name,image,autor,size,classes,year,price,specialID,suggest,note) value(?,?,?,?,?,?,?,?,?,?)";
	public boolean addLots(Map<String, String> map) {
		int i = jdbcTemplate.update(addsql,
				new Object[]{
				map.get("name"), 
				map.get("image"),
				map.get("autor"),
				map.get("size"),
				map.get("classes"),
				map.get("year"),
				map.get("price"),
				map.get("specialID"),
				map.get("suggest"),
				map.get("note")
				});
		if(i>0){
			return true;
		}
		return false;
	}

	
	public Map<String, Object> getLots(Map<String, String> map) {
		 String getLots = "select i.as_name,i.id as insid,a.auctionname,a.id as actid, s.specialname, s.id as specid ,l.* from  t_yc_lots l ";
	      getLots+=" LEFT JOIN t_yc_special  s on s.id=l.specialID left join t_yc_action  a on a.id=s.actionid ";
	      getLots+=" left join t_yc_institutions i on i.id=a.ins_id ";
	      getLots+=" where s.id=l.specialID and l.id=? ";
		try {
			return jdbcTemplate.queryForMap(getLots, new Object[]{map.get("id")});
		} catch (Exception e) {
			throw new RuntimeException("获取拍品异常："+e.getMessage());
		}
	}
	
	public List<Map<String, Object>> getLotsList(Map<String, String> map) {
		 try {
			 String sql=" select t.* from t_yc_lots t where 1=1";
				 if(map!=null){
					 if(map.get("specialID")!=""&&!map.get("specialID").equals("")){
						 sql+=" and t.specialID="+map.get("specialID");
					 }
					 if(map.get("name")!=""&&!map.get("name").equals("")){
						 sql+=" and t.name like '%"+map.get("name")+"%'";	
					 }
					 if(map.get("id")!=""&&!map.get("id").equals("")){
						 sql+=" and t.id="+map.get("id");
					 }	
				 }
				 sql+=" order by t.id desc limit "+(Integer.valueOf(map.get("currentPage"))-1)*Integer.valueOf(map.get("pageSize"))+", "+map.get("pageSize");
				return jdbcTemplate.queryForList(sql);
			} catch (Exception e) {
				throw new RuntimeException("获取拍品列表异常："+e.getMessage());
			}
	}
	
	private final static String updsql="update t_yc_lots set name=?,image=?,autor=?,size=?,classes=?,year=?,price=?,specialID=?,suggest=?,note=?,cjprice=?,cjtime=? where id=?";
	public boolean upaLots(Map<String, String> map) {
		int i = jdbcTemplate.update(updsql,
				new Object[]{
				map.get("name"), 
				map.get("image"),
				map.get("autor"),
				map.get("size"),
				map.get("classes"),
				map.get("year"),
				map.get("price"),
				map.get("specialID"),
				map.get("suggest"),
				map.get("note"),
				map.get("cjprice"),
				map.get("cjtime"),
				map.get("id")
				});
		if(i>0){
			return true;
		}
		return false;
	}

	public long getlotsListNum(Map<String, String> map) {
		 try {
			 String sql=" select count(t.id)  from t_yc_lots t where 1=1";
				 if(map!=null){
					 if(map.get("specialID")!=""&&!map.get("specialID").equals("")){
						 sql+=" and t.specialID="+map.get("specialID");
					 }
					 if(map.get("name")!=""&&!map.get("name").equals("")){
						 sql+=" and t.name like '%"+map.get("name")+"%'";
					 }	
					 if(map.get("id")!=""&&!map.get("id").equals("")){
						 sql+=" and t.id="+map.get("id");
					 }	
				 }
				return jdbcTemplate.queryForLong(sql);
			} catch (Exception e) {
				throw new RuntimeException("获取拍品列表异常："+e.getMessage());
			}
	}

}
