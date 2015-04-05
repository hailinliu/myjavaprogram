package com.hyzm.admin.dao.baibao.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.baibao.BaibaoShopBaseInfoDao;

@Repository
public class BaibaoShopBaseInfoDaoImpl implements  BaibaoShopBaseInfoDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getBaibaoBaseinfolist= "select c.*,t.username from t_baibao_shop c left join t_user t on c.userid = t.id  where  t.username like ?  and c.shopname like ?  and c.mobile like ?   and c.state like ? order by c.id desc limit ?, ?";
	/**
	 * 获取旗舰商家下拉列表
	 * @return
	 */

	public List<Map<String, Object>> getBaibaoshopinfoList(Date begindate, Date enddate, String username,String shopname,String mobile,String state, int currentPage, int pageSize) throws Exception {
			try {		
				return jdbcTemplate.queryForList(getBaibaoBaseinfolist, new Object[]{ "%"+username+"%", "%"+shopname+"%",  "%"+mobile+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
			} catch (Exception e) {
				throw new RuntimeException("获取商家列表异常："+e.getMessage());
			}
	}
	private final static String getBaibaoBaseinfolistNum = "select count(c.id) from t_baibao_shop c left join t_user t on c.userid = t.id  where t.username like ?  and c.shopname like ? and c.mobile like ?   and c.state like ?";
	public long getBaibaoshopinfoListNum(Date begindate, Date enddate, String username,String shopname,String mobile,String state)
			throws Exception {
		try {
			return jdbcTemplate.queryForLong(getBaibaoBaseinfolistNum, new Object[]{ "%"+username+"%", "%"+shopname+"%",  "%"+mobile+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取商家数量异常："+e.getMessage());
		}
	}
	
	
	public boolean addBaibaoshopinfo( String shopname, String username,String mainscope, String manifesto,String weixin,String weixinimg,
			String shopaddress,String mobile,String desction, String img, String state) throws Exception {

		try {
			 String addBaibaoinfo= "insert into t_baibao_shop (shopname, mainscope,userid,manifesto,weixin, weixinimg,shopaddress,mobile,desction,img,state,createdate) values('"+shopname+"','"+mainscope+"',"+"( select id from t_user where username = '"+username+"'),'"+manifesto+"','"+weixin+"','"+weixinimg+"','"+shopaddress+"','"+mobile+"','"+desction+"','"+img+"',"+state+",now())";
			 System.out.println(addBaibaoinfo);
			int i = jdbcTemplate.update(addBaibaoinfo);
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加商家异常："+e.getMessage());
		}
	}
	
	private final static String updBaibaoinfo = "update t_baibao_shop set shopname = ? ,manifesto= ? ,mainscope = ? , img = ? , mobile = ? ,weixin = ? , shopaddress = ? , desction = ? where id = ?";
	public boolean updBaibaoshopinfo(long id,String shopname,String mainscope, String manifesto,String weixin,
			String shopaddress,String mobile,String desction, String img)
			throws Exception {
		try {
			int i = jdbcTemplate.update(updBaibaoinfo, new Object[]{ shopname, manifesto , mainscope, img,  mobile, weixin, shopaddress, desction,id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改商家异常："+e.getMessage());
		}
	}
	private final static String getBaibaoinfoById = "select * from t_baibao_shop where id = ?";
	public Map<String, Object> getBaibaoshopinfoById(long id) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getBaibaoinfoById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取商家异常："+e.getMessage());
		}
	}
	
	private final static String delBaibaoinfo = "update t_baibao_shop set state = 3 where id = ?";
	public boolean delBaibaoshopinfo(long id) throws Exception {
		try {
	         int i = jdbcTemplate.update(delBaibaoinfo, new Object[]{id});
			 if (i > 0){
			 String upUserType = "update t_user set baibaoshopstate = null where id =(SELECT userid from t_baibao_shop where id=?)";
			 jdbcTemplate.update(upUserType, new Object[]{id});
			  return true;}
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除商家异常："+e.getMessage());
		}
	}

	private final static String upjoinType = "update t_baibao_shop set state = ? where id = ?";
	public boolean upjoinType(long id, int state)
			throws Exception {
		try {
			
			int i = jdbcTemplate.update(upjoinType, new Object[]{state,id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("合作审批异常："+e.getMessage());
		}
	}



}
