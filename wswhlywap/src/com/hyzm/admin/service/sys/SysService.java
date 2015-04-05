package com.hyzm.admin.service.sys;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hyzm.bean.MenuTree;
import com.hyzm.bean.UserInfo;

public interface SysService {
	
	/**
	 * 登陆
	 * @param request
	 * @param userinfo
	 * @return
	 */
	public String login(HttpServletRequest request, UserInfo userinfo);
	
	/**
	 * 获取用户信息
	 * @param id
	 * @return
	 */
	public Map<String, Object> getUserById(long id);
	
	/**
	 * 获取用户信息
	 * @param id
	 * @param username
	 * @param mobile
	 * @param realname
	 * @param idcard
	 * @param state
	 * @param pageSize
	 * @param currentPage
	 * @return
	 */
	public String getUserinfoList(String id, String username, String mobile, String realname, String idcard,String adminName,String state,String baibaoshopstate, String money ,String level, int pageSize, int currentPage);
	
	/**
	 * 获取管理员信息
	 * @param username
	 * @param state
	 * @param pageSize
	 * @param currentPage
	 * @return
	 */
	public String getAdminList(String username, String state, Integer pageSize, Integer currentPage);
	
	/**
	 * 通过角色获得菜单
	 * @param roleid
	 * @return
	 */
	public String getMenu(long roleid);
	
	/**
	 * 获取角色信息
	 * @param rolename
	 * @param state
	 * @param pageSize
	 * @param currentPage
	 * @return
	 */
	public String getRoleinfoList(String rolename, String state, Integer pageSize, Integer currentPage);
	
	/**
	 * 通过角色id获得权限
	 * @param roleid
	 * @return
	 */
	public String getPermissionByRoleid(Long roleid);
	
	/**
	 * 赋权
	 * @param roleid
	 * @param permissionid
	 * @return
	 */
	public boolean insertRolePermission(Long roleid, String permissionid);
	
	/**
	 * 获得权限树
	 * @param roleid
	 * @return
	 */
	public List<MenuTree> getMenuList(Long roleid);
	
	/**
	 * 验证登陆
	 * @param username
	 * @param password
	 * @return
	 */
	public boolean checkLogin(String username, String password);
	
	/**
	 * 验证管理员是否重复
	 * @param name
	 * @return
	 */
	public boolean ifExistsAdmin(String name);
	
	/**
	 * 验证用户是否重复
	 * @param name
	 * @return
	 */
	public boolean ifExistsUser(String name);
	
	/**
	 * 自动补全用户
	 * @return
	 */
	public String autoUser();
	
	/**
	 * 自动补全手机号码
	 * @return
	 */
	public String autoMobile();
	
	/**
	 * 自动补全真实姓名
	 * @return
	 */
	public String autoRealname();
	
	/**
	 * 自动补全身份证
	 * @return
	 */
	public String autoIdcard();
	/**
	 * 自动补全商务专员
	 * @return
	 */
	public String autoAdminName();
	
	/**
	 * 自动补全管理员
	 * @return
	 */
	public String autoAdmin();
	
	/**
	 * 自动补全角色
	 * @return
	 */
	public String autoRole();
	
	/**
	 * 验证角色名是否重复
	 * @param rolename
	 * @return
	 */
	public boolean isRepeatRole(String rolename);
	
	/**
	 * 验证手机号是否重复
	 * @param mobile
	 * @return
	 */
	public boolean isRepeatMobile(String mobile);
	
	/**
	 * 获得角色下拉菜单
	 * @return
	 */
	public String getRoleCombox();
	
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
	 */
	public boolean insertAdmin(String username, String password, int sex, String mobile, String email, String realname, String idcard, long roleid);
	
	/**
	 * 添加角色
	 * @param rolename
	 * @param note
	 * @return
	 */
	public boolean insertRole(String rolename, String note);
	
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
	 */
	public boolean updateAdmin(int sex, String mobile, String email, String realname, String idcard, long roleid, long id);
	
	/**
	 * 修改角色
	 * @param id
	 * @param rolename
	 * @param note
	 * @return
	 */
	public boolean updateRole(long id, String rolename, String note);
	
	/**
	 * 修改密码
	 * @param id
	 * @param password
	 * @return
	 */
	public boolean modifyPassword(long id, String password);
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public boolean deleteUser(long id);
	
	/**
	 * 删除角色
	 * @param id
	 * @return
	 */
	public boolean deleteRole(long id);
	
	/**
	 * 冻结/解冻用户
	 * @param id
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public boolean freezeUser(long id, String state);
	
	/**
	 * 验证身份证是否重复
	 * @param ismanager
	 * @param cardid
	 * @return
	 */
	public boolean isRepeatCardid(int ismanager, String cardid);
	
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
	 */
	public boolean addUser(String username, String password, int sex, String mobile, String email, String realname, String idcard, int job, String address,String weixin, int isgroup, String recommend);
	
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
	 */
	public boolean updUser(int sex, String mobile, String email, String realname, String idcard, int job, String address,String adminName,String desction, String weixin, int isgroup, String recommend, long id);
	
	/**
	 * 获取职业列表
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public String getJobList(int currentPage, int pageSize);
	
	/**
	 * 添加职业
	 * @param name
	 * @return
	 */
	public boolean addJob(String name);
	
	/**
	 * 删除职业
	 * @param id
	 * @return
	 */
	public boolean delJob(long id);
	
	/**
	 * 修改职业
	 * @param id
	 * @param name
	 * @return
	 */
	public boolean updJob(long id, String name);
	
	/**
	 * 获得职业下拉列表
	 * @return
	 */
	public String getJobCombobox();
	
	/**
	 * 用户余额控制
	 * @param id
	 * @param money
	 * @return
	 */
	public boolean moneyControl(long id, double money);
	
	/**
	 * 用户积分控制
	 * @param id
	 * @param point
	 * @return
	 */
	public boolean pointControl(long id, int point);
	
	/**
	 * 等级控制
	 * @param id
	 * @param level
	 * @return
	 */
	public boolean levelControl(long id, int level);
	/**
	 * 审核状态控制
	 * @param id
	 * @param baibaoshopstate
	 * @return
	 */
	public boolean stateControl(long id, int baibaoshopstate);
	/**
	 * 导出excel
	 * @param id
	 * @param username
	 * @param mobile
	 * @param realname
	 * @param idcard
	 * @param state
	 * @param money
	 * @param level
	 * @param pageSize
	 * @param currentPage
	 * @return
	 */
	public Map<String, Object> exportCSV(String id, String username, String mobile, String realname, String idcard, String adminName, String state,String baibaoshopstate,String money ,String level, int pageSize, int currentPage);
	
}
