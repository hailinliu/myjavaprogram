package com.hyzm.admin.dao.sys.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hyzm.admin.dao.sys.SysDao;

@Repository
public class SysDaoImpl implements SysDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final static String getAdminByName = "select t.*, r.rolename from t_user t left join t_role r on t.roleid = r.id where t.ismanager = 1 and t.username = ?";

	public Map<String, Object> getAdminByName(String name) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getAdminByName, new Object[]{name});
		} catch (Exception e) {
			throw new RuntimeException("获取用户信息异常："+e.getMessage());
		}
	}
	
	private final static String getUserById = "select * from t_user where id = ? ";
	
	public Map<String, Object> getUserById(long id) throws Exception {
		try {
			return jdbcTemplate.queryForMap(getUserById, new Object[]{id});
		} catch (Exception e) {
			throw new RuntimeException("获取用户信息异常："+e.getMessage());
		}
	}
	
	public List<Map<String, Object>> getUserinfoList(String id, String username, String mobile, String realname, String idcard,String adminName, String state,String baibaoshopstate,  String money ,String level,int pageSize, int currentPage)
			throws Exception {
		try {
			String sql = "";
			List<Object> list = new ArrayList<Object>();
			list.add("%"+id+"%");
			list.add("%"+username+"%");
			list.add("%"+mobile+"%");
		
			if (!"".equals(realname)) {
				sql += " and u.realname like ?";
				list.add("%"+realname+"%");
			}
			if (!"".equals(idcard)) {
				sql += " and u.idcard like ?";
				list.add("%"+idcard+"%");
			}
			if (!"".equals(adminName)) {
				sql += " and u.adminName like ?";
				list.add("%"+adminName+"%");
			}
				
			if(!"".equals(baibaoshopstate)){
				 sql += " and u.baibaoshopstate like ? ";
				 list.add("%"+baibaoshopstate+"%");
				}
			if(!"".equals(money)){
				if("1".equals(money)){ 
					sql += " and u.money ='0'?";
					list.add("%"+money+"%");
					
				}else{
					sql += " and u.money >'0'";
					//list.add("%"+money+"%");
					
				}	
			}

			if(!"".equals(level)){
				if("5".equals(level)){
					list.add("%"+0+"%");
				}else{
					list.add("%"+level+"%");
				}
			
			}else{
				list.add("%"+level+"%");
			}
			list.add((currentPage-1)*pageSize);
			list.add(pageSize);
			String getUserinfoList = "select u.*,j.name as jobname from t_user u left join t_job j on u.job = j.id  where u.ismanager = 0 and u.id like ? and u.username like ? and u.mobile like ? "+sql+" and u.state like '%"+state+"%'  and u.level like ? order by u.id desc limit ? ,?";
			return jdbcTemplate.queryForList(getUserinfoList, list.toArray());
		} catch (Exception e) {
			throw new RuntimeException("获取用户列表异常："+e.getMessage());
		}
	}
	

	public long getUserinfoListNum(String id, String username, String mobile, String realname, String idcard,String adminName, String state,String baibaoshopstate, String money ,String level)
			throws Exception {
		try {
			String sql = "";
			List<Object> list = new ArrayList<Object>();
			list.add("%"+id+"%");
			list.add("%"+username+"%");
			list.add("%"+mobile+"%");
		
			if (!"".equals(realname)) {
				sql += " and realname like ?";
				list.add("%"+realname+"%");
			}
			if (!"".equals(idcard)) {
				sql += " and idcard like ?";
				list.add("%"+idcard+"%");
			}
			if (!"".equals(adminName)) {
				sql += " and adminName like ?";
				list.add("%"+adminName+"%");
			}	

			if(!"".equals(baibaoshopstate)){
				 sql += " and baibaoshopstate like ? ";
				 list.add("%"+baibaoshopstate+"%");
				}
			if(!"".equals(money)){
				if("1".equals(money)){ 
					sql += " and money ='0'?";
					list.add("%"+money+"%");
					
				}else{
					sql += "and money >'0'";
					//list.add("%"+money+"%");
					
				}	
			}
			
			if(!"".equals(level)){
				if("5".equals(level)){
					list.add("%"+0+"%");
				}else{
					list.add("%"+level+"%");
				}
			
			}else{
				list.add("%"+level+"%");
			}
			String getUserinfoListNum = "select count(id) from t_user  where ismanager = 0 and id like ? and username like ? and mobile like ?"+sql+" and state like '%"+state+"%'  and level like ?";
			return jdbcTemplate.queryForLong(getUserinfoListNum, list.toArray());
		} catch (Exception e) {
			throw new RuntimeException("获取用户数量异常："+e.getMessage());
		}
	}
	
	private final static String getAdminList = "select u.*,r.rolename from t_user u left join t_role r on u.roleid = r.id where u.ismanager = 1 and r.state = 1 and u.username like ? and u.state like ? order by u.id desc limit ? ,?";

	public List<Map<String, Object>> getAdminList(String username,
			String state, int pageSize, int currentPage)
			throws Exception {
		try {
			return jdbcTemplate.queryForList(getAdminList, new Object[]{"%"+username+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取管理员列表异常："+e.getMessage());
		}
	}
	
	private final static String getAdminListNum = "select count(id) from t_user where ismanager = 1 and username like ? and state like ?";

	public long getAdminListNum(String username, String state) throws Exception {
		try {
			return jdbcTemplate.queryForLong(getAdminListNum, new Object[]{"%"+username+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获取管理员数量异常："+e.getMessage());
		}
	}
	
	private final static String getRoleinfoList = "select r.* from t_role r where r.rolename like ? and r.state like ? order by r.id desc limit ?, ?";

	public List<Map<String, Object>> getRoleinfoList(String rolename,
			String state, int pageSize, int currentPage)
			throws Exception {
		try {
			return jdbcTemplate.queryForList(getRoleinfoList, new Object[]{"%"+rolename+"%", "%"+state+"%", (currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获得角色列表异常："+e.getMessage());
		}
	}
	
	private final static String getRoleinfoListNum = "select count(id) from t_role where rolename like ? and state like ?";

	public long getRoleinfoListNum(String rolename, String state)
			throws Exception {
		try {
			return jdbcTemplate.queryForLong(getRoleinfoListNum, new Object[]{"%"+rolename+"%", "%"+state+"%"});
		} catch (Exception e) {
			throw new RuntimeException("获得角色数量异常："+e.getMessage());
		}
	}
	
	private final static String getMenu = "select t1.* from t_role_permission t left join t_permission t1 on t1.id=t.permissionid left join t_role t2 on t2.id=t.roleid where t.roleid = ? and t1.state = 1 and t2.state = 1 and t1.buttonid is null order by t1.id";

	public List<Map<String, Object>> getMenu(long roleid) throws Exception {
		try {
			return jdbcTemplate.queryForList(getMenu, new Object[]{roleid});
		} catch (Exception e) {
			throw new RuntimeException("获得菜单异常："+e.getMessage());
		}
	}
	
	private final static String getPermissionByRoleid = "select t1.* from t_role_permission t left join t_permission t1 on t1.id=t.permissionid left join t_role t2 on t2.id=t.roleid where t.roleid = ? and t1.state = 1 and t2.state = 1 and t1.levels = (select max(levels) from t_permission)";

	public List<Map<String, Object>> getPermissionByRoleid(long roleid)
			throws Exception {
		try {
			return jdbcTemplate.queryForList(getPermissionByRoleid, new Object[]{roleid});
		} catch (Exception e) {
			throw new RuntimeException("获得权限异常："+e.getMessage());
		}
	}
	
	private final static String getPermission = "select * from t_permission where state = 1";

	public List<Map<String, Object>> getPermission() throws Exception {
		try {
			return jdbcTemplate.queryForList(getPermission);
		} catch (Exception e) {
			throw new RuntimeException("获得权限列表异常："+e.getMessage());
		}
	}
	
	private final static String deleteRolePermission = "delete from t_role_permission where roleid = ?";

	public boolean deleteRolePermission(long roleid) throws Exception {
		try {
			jdbcTemplate.update(deleteRolePermission, new Object[]{roleid});
			return true;
		} catch (Exception e) {
			throw new RuntimeException("deleteRolePermission异常："+e.getMessage());
		}
	}
	
	private final static String insertRolePermission = "insert into t_role_permission (roleid,permissionid) values (?,?)";

	public boolean insertRolePermission(long roleid, long permissionid)
			throws Exception {
		try {
			jdbcTemplate.update(insertRolePermission, new Object[]{roleid,permissionid});
			return true;
		} catch (Exception e) {
			throw new RuntimeException("赋权异常："+e.getMessage());
		}
	}
	
	private final static String ifExistsAdmin = "select count(id) from t_user where username = ? and ismanager = 1";
	
	public int ifExistsAdmin(String username) throws Exception {
		try {
			return jdbcTemplate.queryForInt(ifExistsAdmin, new Object[]{username});
		} catch (Exception e) {
			throw new RuntimeException("验证异常："+e.getMessage());
		}
	}
	
	private final static String ifExistsUser = "select count(id) from t_user where username = ? and ismanager = 0";
	
	public int ifExistsUser(String username) throws Exception {
		try {
			return jdbcTemplate.queryForInt(ifExistsUser, new Object[]{username});
		} catch (Exception e) {
			throw new RuntimeException("验证异常："+e.getMessage());
		}
	}
	
	private final static String autoUser = "select username from t_user where ismanager = 0";

	public List<Map<String, Object>> autoUser() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoUser);
		} catch (Exception e) {
			throw new RuntimeException("自动补全异常："+e.getMessage());
		}
	}
	
	private final static String autoMobile = "select mobile from t_user where ismanager = 0";
	
	public List<Map<String, Object>> autoMobile() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoMobile);
		} catch (Exception e) {
			throw new RuntimeException("自动补全手机号码异常："+e.getMessage());
		}
	}
	
	private final static String autoRealname = "select distinct realname from t_user where ismanager = 0 and realname is not null";
	
	public List<Map<String, Object>> autoRealname() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoRealname);
		} catch (Exception e) {
			throw new RuntimeException("自动补全真实姓名异常："+e.getMessage());
		}
	}
	
	private final static String autoIdcard = "select idcard from t_user where ismanager = 0 and idcard is not null";
	
	public List<Map<String, Object>> autoIdcard() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoIdcard);
		} catch (Exception e) {
			throw new RuntimeException("自动补全身份证异常："+e.getMessage());
		}
	}
	private final static String autoAdminName = "select adminName from t_user where ismanager = 0 and adminName is not null";
	public List<Map<String, Object>> autoAdminName() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoAdminName);
		
		} catch (Exception e) {
			throw new RuntimeException("自动补全商务专员异常："+e.getMessage());
		}
	
	}
	
	private final static String autoAdmin = "select username,mobile from t_user where ismanager = 1";

	public List<Map<String, Object>> autoAdmin() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoAdmin);
		} catch (Exception e) {
			throw new RuntimeException("自动补全异常："+e.getMessage());
		}
	}
	
	private final static String autoRole = "select rolename,createdate from t_role";

	public List<Map<String, Object>> autoRole() throws Exception {
		try {
			return jdbcTemplate.queryForList(autoRole);
		} catch (Exception e) {
			throw new RuntimeException("自动补全异常："+e.getMessage());
		}
	}
	
	private final static String isRepeatRole = "select count(id) from t_role where rolename = ? and state = 1";

	public int isRepeatRole(String rolename) throws Exception {
		try {
			return jdbcTemplate.queryForInt(isRepeatRole, new Object[]{rolename});
		} catch (Exception e) {
			throw new RuntimeException("验证异常："+e.getMessage());
		}
	}
	
	private final static String isRepeatMobile = "select count(id) from t_user where mobile = ?";

	public int isRepeatMobile(String mobile) throws Exception {
		try {
			return jdbcTemplate.queryForInt(isRepeatMobile, new Object[]{mobile});
		} catch (Exception e) {
			throw new RuntimeException("验证异常："+e.getMessage());
		}
	}
	
	private final static String getRoleCombox = "select id,rolename from t_role where state = 1";

	public List<Map<String, Object>> getRoleCombox() throws Exception {
		try {
			return jdbcTemplate.queryForList(getRoleCombox);
		} catch (Exception e) {
			throw new RuntimeException("获取角色下拉菜单异常："+e.getMessage());
		}
	}
	
	private final static String freezeUser = "update t_user set state = ? where id = ?";
	
	public boolean freezeUser(long id, String state) throws Exception {
		try {
			int i = jdbcTemplate.update(freezeUser, new Object[]{state, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("冻结/解冻用户失败"+e.getMessage());
		}
	}
	
	private final static String insertAdmin = "insert into t_user (username, password, sex, mobile, createdate, email, realname, idcard, model, roleid, ismanager) values (?,?,?,?,now(),?,?,?,1,?,1)";

	public boolean insertAdmin(String username, String password, int sex,
			String mobile, String email, String realname, String idcard, long roleid)
			throws Exception {
		try {
			int i = jdbcTemplate.update(insertAdmin, new Object[]{username, password, sex, mobile, email, realname, idcard, roleid});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加管理员异常："+e.getMessage());
		}
	}
	
	private final static String insertRole = "insert into t_role (rolename, content, createdate, state) values (?,?,now(),1)";

	public boolean insertRole(String rolename, String note) throws Exception {
		try {
			int i = jdbcTemplate.update(insertRole, new Object[]{rolename,note});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加角色异常："+e.getMessage());
		}
	}
	
	private final static String updateAdmin = "update t_user set sex = ?, mobile = ?, email = ?, realname = ?, idcard = ?, roleid = ?,admin=? where id = ?";

	public boolean updateAdmin(int sex, String mobile, String email, String realname, String idcard, long roleid, long id) throws Exception {
		try {
			int i = jdbcTemplate.update(updateAdmin, new Object[]{sex, mobile, email, realname, idcard, roleid, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改管理员异常："+e.getMessage());
		}
	}
	
	private final static String updateRole = "update t_role set rolename = ?, content = ? where id = ?";

	public boolean updateRole(long id, String rolename, String note)
			throws Exception {
		try {
			int i = jdbcTemplate.update(updateRole, new Object[]{rolename, note, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改角色异常："+e.getMessage());
		}
	}
	
	private final static String modifyPassword = "update t_user set password = ? where id = ?";

	public boolean modifyPassword(long id, String password) throws Exception {
		try {
			int i = jdbcTemplate.update(modifyPassword, new Object[]{password,id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改密码异常："+e.getMessage());
		}
	}
	
	private final static String deleteUser = "update t_user set state = 3 where id = ?";

	public boolean deleteUser(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(deleteUser, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除用户异常："+e.getMessage());
		}
	}
	
	private final static String deleteRole = "update t_role set state = 2 where id = ?";

	public boolean deleteRole(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(deleteRole, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除角色异常："+e.getMessage());
		}
	}
	
	private final static String getButtonid = "select t1.buttonid from t_role_permission t left join t_permission t1 on t1.id = t.permissionid left join t_role t2 on t2.id = t.roleid where t.roleid = ? and t1.state = 1 and t2.state = 1 and t1.buttonid is not null";

	public List<Map<String, Object>> getButtonid(long roleid) throws Exception {
		try {
			return jdbcTemplate.queryForList(getButtonid, new Object[]{roleid});
		} catch (Exception e) {
			throw new RuntimeException("获取按钮列表异常："+e.getMessage());
		}
	}
	
	private final static String isRepeatCardid = "select count(id) from t_user where ismanager = ? and idcard = ?";

	public Integer isRepeatCardid(int ismanager, String cardid) {
		try {
			return jdbcTemplate.queryForInt(isRepeatCardid, new Object[]{ismanager, cardid});
		} catch (Exception e) {
			throw new RuntimeException("验证异常"+e);
		}
	}
	
	private final static String addUser = "insert into t_user (username, password, sex, mobile, createdate, email, realname, idcard, job, address, ismanager,weixin,isgroup,recommend) values (?,?,?,?,now(),?,?,?,?,?,0,?,?,?)";

	public boolean addUser(String username, String password, int sex,
			String mobile, String email, String realname, String idcard,int job, String address,String weixin, int isgroup, String recommend) throws Exception {
		try {
			int i = jdbcTemplate.update(addUser, new Object[]{username, password, sex, mobile, email, realname, idcard, job, address,weixin,isgroup,recommend});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加用户信息异常："+e.getMessage());
		}
	}
	
	private final static String updUser = "update t_user set sex = ?, mobile = ?, email = ?, realname = ?, idcard = ?, job = ?, address = ?,adminName = ?,desction =?,weixin=?,isgroup=?,recommend=? where id = ?";

	public boolean updUser(int sex, String mobile, String email, String realname,
			String idcard, int job, String address,String adminName,String desction, String weixin, int isgroup, String recommend,long id) throws Exception {
		try {
			int i = jdbcTemplate.update(updUser, new Object[]{sex, mobile, email, realname, idcard, job, address,adminName,desction,weixin,isgroup,recommend, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改用户信息异常："+e.getMessage());
		}
	}
	
	private final static String getJobList = "select * from t_job where state = 1 order by id limit ?,?";
	
	public List<Map<String, Object>> getJobList(int currentPage, int pageSize) throws Exception {
		try {
			return jdbcTemplate.queryForList(getJobList, new Object[]{(currentPage-1)*pageSize, pageSize});
		} catch (Exception e) {
			throw new RuntimeException("获取职业列表异常："+e.getMessage());
		}
	}
	
	private final static String getJobListNum = "select count(id) from t_job where state = 1";
	
	public long getJobListNum() throws Exception {
		try {
			return jdbcTemplate.queryForLong(getJobListNum);
		} catch (Exception e) {
			throw new RuntimeException("获取职业数量异常："+e.getMessage());
		}
	}
	
	private final static String addJob = "insert into t_job (name) values (?)";

	public boolean addJob(String name) throws Exception {
		try {
			int i = jdbcTemplate.update(addJob, new Object[]{name});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("添加职业异常："+e.getMessage());
		}
	}
	
	private final static String delJob = "update t_job set state = 2 where id = ?";

	public boolean delJob(long id) throws Exception {
		try {
			int i = jdbcTemplate.update(delJob, new Object[]{id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("删除职业异常："+e.getMessage());
		}
	}
	
	private final static String updJob = "update t_job set name = ? where id = ?";

	public boolean updJob(long id, String name) throws Exception {
		try {
			int i = jdbcTemplate.update(updJob, new Object[]{name, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("修改职业异常："+e.getMessage());
		}
	}
	
	private final static String getJobCombobox = "select id, name from t_job where state = 1";
	
	public List<Map<String, Object>> getJobCombobox() throws Exception {
		try {
			return jdbcTemplate.queryForList(getJobCombobox);
		} catch (Exception e) {
			throw new RuntimeException("获取职业下拉列表异常："+e.getMessage());
		}
	}
	
	private final static String moneyControl = "update t_user set money = money + ? where id = ?";

	public boolean moneyControl(long id, double money) throws Exception {
		try {
			int i = jdbcTemplate.update(moneyControl, new Object[]{money, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("用户余额控制异常："+e.getMessage());
		}
	}
	
	private final static String pointControl = "update t_user set point = point + ? where id = ?";

	public boolean pointControl(long id, int point) throws Exception {
		try {
			int i = jdbcTemplate.update(pointControl, new Object[]{point, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("用户积分控制异常："+e.getMessage());
		}
	}
	
	private final static String levelControl = "update t_user set level = ? , leveltime=now() where id = ?";

	public boolean levelControl(long id, int level) throws Exception {
		try {
			int i = jdbcTemplate.update(levelControl, new Object[]{level, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("等级控制异常："+e.getMessage());
		}
	}

	private final static String stateControl = "update t_user set baibaoshopstate = ?  where id = ?";
	public boolean stateControl(long id, int baibaoshopstate) throws Exception {
		try {
			int i = jdbcTemplate.update(stateControl, new Object[]{baibaoshopstate, id});
			if (i > 0)
				return true;
			throw new RuntimeException();
		} catch (Exception e) {
			throw new RuntimeException("等级控制异常："+e.getMessage());
		}
	}

}
