package com.hyzm.admin.dao.sys;

import java.util.List;
import java.util.Map;

/**
 * 系统管理数据库操作接口
 * @author Administrator
 *
 */
public interface SysDao {
	
	/**
	 * 根据名字获取用户信息
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getAdminByName(String name) throws Exception;
	
	/**
	 * 获取用户信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getUserById(long id) throws Exception;
	
	
	/**
	 * 获取用户列表
	 * @param id
	 * @param username
	 * @param mobile
	 * @param realname
	 * @param idcard
	 * @param adminName
	 * @param state
	 * @param pageSize
	 * @param currentPage
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getUserinfoList(String id, String username, String mobile, String realname, String idcard,String adminName,String state,String baibaoshopstate, String money ,String level,int pageSize, int currentPage) throws Exception;
	
	/**
	 * 获取用户数量
	 * @param id
	 * @param username
	 * @param mobile
	 * @param realname
	 * @param idcard
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getUserinfoListNum(String id, String username, String mobile, String realname, String idcard,String adminName,String state,String baibaoshopstate, String money ,String level) throws Exception;
	
	/**
	 * 获取管理员列表
	 * @param username
	 * @param state
	 * @param pageSize
	 * @param currentPage
	 * @param adminName
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getAdminList(String username, String state, int pageSize, int currentPage) throws Exception;
	
	/**
	 * 获取管理员数量
	 * @param username
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getAdminListNum(String username, String state) throws Exception;
	
	/**
	 * 获得角色列表
	 * @param rolename
	 * @param state
	 * @param pageSize
	 * @param currentPage
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getRoleinfoList(String rolename, String state, int pageSize, int currentPage) throws Exception;
	
	/**
	 * 获得角色数量
	 * @param rolename
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public long getRoleinfoListNum(String rolename, String state) throws Exception;
	
	/**
	 * 根据角色获得菜单
	 * @param roleid
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> getMenu(long roleid) throws Exception;
	
	/**
	 * 通过角色id获得对应权限
	 * @param roleid
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getPermissionByRoleid(long roleid) throws Exception;
	
	/**
	 * 获取权限列表
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getPermission() throws Exception;
	
	/**
	 * 清除权限
	 * @param roleid
	 * @return
	 * @throws Exception
	 */
	public boolean deleteRolePermission(long roleid) throws Exception;
	
	/**
	 * 赋权
	 * @param roleid
	 * @param permissionid
	 * @return
	 * @throws Exception
	 */
	public boolean insertRolePermission(long roleid, long permissionid) throws Exception;
	
	/**
	 * 验证管理员是否重复
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public int ifExistsAdmin(String username) throws Exception;
	
    /**
     * 验证用户是否重复
     * @param username
     * @return
     * @throws Exception
     */
	public int ifExistsUser(String username) throws Exception;
	
	/**
	 * 自动补全用户
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoUser() throws Exception;
	
	/**
	 * 自动补全手机号码
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoMobile() throws Exception;
	
	/**
	 * 自动补全真实姓名
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoRealname() throws Exception;
	
	/**
	 * 自动补全身份证号
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoIdcard() throws Exception;
	/**
	 * 自动补全商务专员
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoAdminName() throws Exception;
	
	/**
	 * 自动补全管理员
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoAdmin() throws Exception;
	
	/**
	 * 自动补全角色
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> autoRole() throws Exception;
	
	/**
	 * 验证角色名是否重复
	 * @param rolename
	 * @return
	 * @throws Exception
	 */
	public int isRepeatRole(String rolename) throws Exception;
	
	/**
	 * 验证手机号是否重复
	 * @param mobile
	 * @return
	 * @throws Exception
	 */
	public int isRepeatMobile(String mobile) throws Exception;
	
	/**
	 * 获得角色下拉菜单
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getRoleCombox() throws Exception;
	
	/**
	 * 冻结/解冻用户
	 * @param id
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public boolean freezeUser(long id, String state) throws Exception;
	
	/**
	 * 添加管理员
	 * @param username
	 * @param password
	 * @param sex
	 * @param mobile
	 * @param email
	 * @param realname
	 * @param idcard
	 * @param roleid
	 * @return
	 * @throws Exception
	 */
	public boolean insertAdmin(String username, String password, int sex, String mobile, String email, String realname, String idcard, long roleid) throws Exception;
	
	/**
	 * 添加角色
	 * @param rolename
	 * @param note
	 * @return
	 * @throws Exception
	 */
	public boolean insertRole(String rolename, String note) throws Exception;
	
	/**
	 * 修改管理员
	 * @param sex
	 * @param mobile
	 * @param email
	 * @param realname
	 * @param idcard
	 * @param roleid
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean updateAdmin(int sex, String mobile, String email, String realname, String idcard, long roleid, long id) throws Exception;
	
	/**
	 * 修改角色
	 * @param id
	 * @param rolename
	 * @param note
	 * @return
	 * @throws Exception
	 */
	public boolean updateRole(long id, String rolename, String note) throws Exception;
	
	/**
	 * 修改密码
	 * @param id
	 * @param password
	 * @return
	 * @throws Exception
	 */
	public boolean modifyPassword(long id, String password) throws Exception;
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean deleteUser(long id) throws Exception;
	
	/**
	 * 删除角色
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean deleteRole(long id) throws Exception;
	
	/**
	 * 获取按钮列表
	 * @param roleid
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getButtonid(long roleid) throws Exception;
	
	/**
	 * 验证身份证是否重复
	 * @param ismanager
	 * @param cardid
	 * @return
	 */
	public Integer isRepeatCardid(int ismanager, String cardid);
	
	/**
	 * 添加用户信息
	 * @param username
	 * @param password
	 * @param sex
	 * @param mobile
	 * @param email
	 * @param realname
	 * @param idcard
	 * @param job
	 * @param address
	 * @return
	 * @throws Exception
	 */
	public boolean addUser(String username, String password, int sex, String mobile, String email, String realname, String idcard, int job, String address,String weixin, int isgroup, String recommend) throws Exception;
	
	/**
	 * 修改用户信息
	 * @param sex
	 * @param mobile
	 * @param email
	 * @param realname
	 * @param idcard
	 * @param job
	 * @param address
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean updUser(int sex, String mobile, String email, String realname, String idcard, int job, String address,String adminName,String desction,String weixin, int isgroup, String recommend, long id) throws Exception;
	
	/**
	 * 获取职业列表
	 * @param currentPage
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getJobList(int currentPage, int pageSize) throws Exception;
	
	/**
	 * 获取职业数量
	 * @return
	 * @throws Exception
	 */
	public long getJobListNum() throws Exception;
	
	/**
	 * 添加职业
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public boolean addJob(String name) throws Exception;
	
	/**
	 * 删除职业
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean delJob(long id) throws Exception;
	
	/**
	 * 修改职业
	 * @param id
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public boolean updJob(long id, String name) throws Exception;
	
	/**
	 * 获取职业下拉列表
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getJobCombobox() throws Exception;
	
	/**
	 * 用户余额控制
	 * @param id
	 * @param money
	 * @return
	 * @throws Exception
	 */
	public boolean moneyControl(long id, double money) throws Exception;
	
	/**
	 * 用户积分控制
	 * @param id
	 * @param point
	 * @return
	 * @throws Exception
	 */
	public boolean pointControl(long id, int point) throws Exception;
	
	/**
	 * 等级控制
	 * @param id
	 * @param level
	 * @return
	 * @throws Exception
	 */
	public boolean levelControl(long id, int level) throws Exception;
	/**
	 * 审核状态控制
	 * @param id
	 * @param baibaoshopstate
	 * @return
	 * @throws Exception
	 */
	
	public boolean stateControl(long id, int baibaoshopstate) throws Exception;

}
