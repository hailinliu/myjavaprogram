package com.hyzm.admin.dao.member.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.member.MemberDao;
@Repository
public class MemberDaoImpl  implements MemberDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private final static String getMeminfoList = "select t.* from t_survey_info t left join t_user u on t.userid=u.id  where t.userid like ? and  t.username like ? and t.collectage like ? and t.likeoption like ? and t.price like ? order by t.id desc limit ?, ?";

	public List<Map<String, Object>> getMeminfoList(String userid,String username,String collectage, String likeoption, String price,int pageSize, int currentPage) throws Exception {
		try {
			return jdbcTemplate.queryForList(getMeminfoList, new Object[]{ "%"+userid+"%", "%"+username+"%", "%"+collectage+"%", "%"+likeoption+"%", "%"+price+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取会员列表异常："+e.getMessage());
		}
	}

	private final static String getMemberListNum = "select count(t.userid) from t_survey_info t left join t_user u on t.userid=u.id  where  t.userid like ? and t.username like ? and t.collectage like ? and t.likeoption like ? and t.price like ?";
	public long getMeminfoListNum(String userid,String username, String collectage,
			String likeoption, String price) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getMemberListNum, new Object[]{ "%"+userid+"%", "%"+username+"%", "%"+collectage+"%", "%"+likeoption+"%", "%"+price+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取会员数量异常："+e.getMessage());
		}
	}
	
	private final static String updMember = "update t_survey_info set  collectage=?, likeoption=?, target=?, service=?, channel=?, price=?, isjoin = ?, isload = ? where id = ?";
	public boolean updMember( Long id,String username,String collectage,String likeoption,String target,String service,String channel,String price, String isjoin, String isload) throws Exception {
		try {
			int i = jdbcTemplate.update(updMember, new Object[]{collectage, likeoption, target, service, channel, price,  isjoin,  isload,id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改会员信息异常："+e.getMessage());
		}
	}
	
	private final static String autoUserName = "select distinct username from t_survey_info";

	public List<Map<String, Object>> autoUserName() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoUserName);
		} catch (Exception e) {
			throw new RuntimeException("自动补全会员名称异常："+e.getMessage());
		}
	}

	
	
	private final static String gettMemberById = "select * from t_survey_info where id = ?";
	public Map<String, Object> gettMemberById(long id) throws Exception {
		try {
			
			List<Map<String,Object>> list = jdbcTemplate.queryForList(gettMemberById, new Object[]{id});
			if(list!=null&&list.size()>0){
				return list.get(0);
			}
			return null;

		} catch (Exception e) {
			throw new RuntimeException("获取会员异常："+e.getMessage());
		}
	}
	
	private final static String getlikeoptionCombobox = "select id,likeoption from t_survey_info order by id";
	public List<Map<String, Object>> getlikeoptionCombobox() throws Exception {
		try {
			return jdbcTemplate.queryForList(getlikeoptionCombobox);
		} catch (Exception e) {
			throw new RuntimeException("获取收藏类型下拉列表异常："+e.getMessage());
		}
	}

	





	

}
