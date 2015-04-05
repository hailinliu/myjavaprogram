package com.hyzm.admin.service.sys.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyzm.admin.dao.sys.SysDao;
import com.hyzm.admin.service.sys.SysService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.bean.MenuTree;
import com.hyzm.bean.UserInfo;
import com.hyzm.util.DateJsonValueProcessor;
import com.hyzm.util.StringUtil;

@Service
public class SysServiceImpl implements SysService {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private SysDao dao;

	public String login(HttpServletRequest request, UserInfo userinfo) {
		log.info("用户登录，登录名："+userinfo.getUsername());
		try {
			String username = userinfo.getUsername();
			String password = userinfo.getPassword();
			if(username == null || password == null){
				return "请输入用户名和密码";
			}
			Map<String, Object> map = dao.getAdminByName(username);
			if(!StringUtil.converString(map.get("password")).equals(StringUtil.hash(password))){
				return "密码错误";
			}
			
			CurrentSession currentSession = new CurrentSession();
			userinfo.setId(StringUtil.converLong(map.get("id")));
			userinfo.setUsername(StringUtil.converString(map.get("username")));
			userinfo.setPassword(StringUtil.converString(map.get("password")));
			userinfo.setSex(StringUtil.converInteger(map.get("sex")));
			userinfo.setMobile(StringUtil.converString(map.get("mobile")));
			userinfo.setCreatedate(StringUtil.converDate(map.get("createdate")));
			userinfo.setEmail(StringUtil.converString(map.get("email")));
			userinfo.setRealname(StringUtil.converString(map.get("realname")));
			userinfo.setIdcard(StringUtil.converString(map.get("idcard")));
			userinfo.setAdminName(StringUtil.converString(map.get("adminName")));
			userinfo.setJob(StringUtil.converLong(map.get("job")));
			userinfo.setAddress(StringUtil.converString(map.get("address")));
			userinfo.setPoint(StringUtil.converInteger(map.get("point")));
			userinfo.setRoleid(StringUtil.converLong(map.get("roleid")));
			userinfo.setRolename(StringUtil.converString(map.get("rolename")));
			userinfo.setState(StringUtil.converInteger(map.get("state")));
			currentSession.setUserinfo(userinfo);
			List<Map<String, Object>> buttonlist = dao.getButtonid(StringUtil.converLong(map.get("roleid")));
			String buttonid = "";
			for (Map<String, Object> buttonmap : buttonlist) {
				buttonid += StringUtil.converString(buttonmap.get("buttonid"))+",";
			}
			currentSession.setButtonid(buttonid);
			request.getSession().setAttribute("CurrentSession", currentSession);
			log.info("登录成功");
			return "success";
		} catch (Exception e) {
			log.error("登录异常："+e.getMessage());
			e.printStackTrace();
		}
		return "登录失败";
	}
	
	public Map<String, Object> getUserById(long id) {
		log.info("获取用户信息");
		Map<String, Object> map = null;
		try {
			map = dao.getUserById(id);
		} catch (Exception e) {
			log.error("获取用户信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return map==null?new HashMap<String, Object>():map;
	}

	public String getUserinfoList(String id, String username, String mobile, String realname, String idcard,String adminName, String state,String baibaoshopstate,String money,String level, int pageSize, int currentPage) {
		log.info("获取用户信息，当前页："+pageSize+"，每页数据为："+currentPage);
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getUserinfoListNum(id, username, mobile, realname,idcard,adminName, state,baibaoshopstate,money,level);
			if(total == 0){
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getUserinfoList(id, username, mobile, realname, idcard,adminName,state,baibaoshopstate,money,level, pageSize, currentPage);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取用户列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String getAdminList(String username, String state, Integer pageSize,
			Integer currentPage) {
		log.info("获取管理员信息，当前页："+pageSize+"，每页数据为："+currentPage);
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getAdminListNum(username, state);
			if(total == 0){
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getAdminList(username, state, pageSize, currentPage);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取用户列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String getMenu(long roleid) {
		log.info("根据角色获取菜单，角色id为："+roleid);
		try {
			List<Map<String, Object>> maplist = dao.getMenu(roleid);
			List<MenuTree> list = new ArrayList<MenuTree>();
			MenuTree menutree;
			Map<String, String> attributes;
			for(Map<String,Object> map :maplist){
				menutree = new MenuTree();
				menutree.setId(StringUtil.converString(map.get("id")));
				menutree.setText(StringUtil.converString(map.get("name")));
				if(!StringUtil.converString(map.get("parentid")).equals(""))
					menutree.setFuid(StringUtil.converString(map.get("parentid")));
				attributes = new HashMap<String,String>();
				attributes.put("url", StringUtil.converString(map.get("url")));
				menutree.setAttributes(attributes);
				list.add(menutree);
			}
			List<MenuTree> rootlist = new ArrayList<MenuTree>();
			for(int i=0;i<list.size();i++){
				menutree = list.get(i);
				menutree.setChildren(list);
				if(menutree.getFuid() == null)
					rootlist.add(menutree);
			}
			return JSONArray.fromObject(rootlist).toString().replace("\"children\":[],", "").replace("\"checked\":\"\",", "");
		} catch (Exception e) {
			log.error("获得菜单异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败";
	}

	public String getRoleinfoList(String rolename, String state,
			Integer pageSize, Integer currentPage) {
		log.info("获得角色信息");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getRoleinfoListNum(rolename, state);
			if(total == 0){
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = dao.getRoleinfoList(rolename, state, pageSize, currentPage);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取角色列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}

	public String getPermissionByRoleid(Long roleid) {
		log.info("通过角色id获得权限");
		try {
			List<Map<String, Object>> maplist = dao.getPermission();
			List<MenuTree> treelist = new ArrayList<MenuTree>();
			MenuTree menutree;
			List<Map<String, Object>> list = dao.getPermissionByRoleid(roleid);
			for(Map<String, Object> map : maplist){
				menutree = new MenuTree();
				menutree.setId(StringUtil.converString(map.get("id")));
				menutree.setText(StringUtil.converString(map.get("name")));
				if(!StringUtil.converString(map.get("parentid")).equals("")){
					menutree.setFuid(StringUtil.converString(map.get("parentid")));
				}
				treelist.add(menutree);
			}
			List<MenuTree> rootlist = new ArrayList<MenuTree>();
			for(int i=0;i<treelist.size();i++){
				menutree = treelist.get(i);
				menutree.setChildren(treelist);
				for(Map<String, Object> map : list){
					if (StringUtil.converString(map.get("id")).equals(menutree.getId())){
						menutree.setChecked("true");
						break;
					}
				}
				if(menutree.getFuid() == null){
					rootlist.add(menutree);
				}
			}
			return JSONArray.fromObject(rootlist).toString().replace("\"children\":[],", "").replace("\"checked\":\"\",", "");
		} catch (Exception e) {
			log.error("获取权限异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败";
	}

	public boolean insertRolePermission(Long roleid, String permissionid) {
		try {
			dao.deleteRolePermission(roleid);
			String[] permission = permissionid.split(",");
			for(String per:permission) {
				dao.insertRolePermission(roleid, Long.valueOf(per));
			}
			return true;
		} catch (Exception e) {
			log.error("赋权异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public List<MenuTree> getMenuList(Long roleid) {
		log.info("获得list树");
		List<MenuTree> rootList = new ArrayList<MenuTree>();
		try {
			List<Map<String, Object>> maplist = dao.getMenu(roleid);
			List<MenuTree> list = new ArrayList<MenuTree>();
			MenuTree menutree;
			Map<String, String> attributes;
			for(Map<String, Object> map : maplist){
				menutree = new MenuTree();
				menutree.setId(StringUtil.converString(map.get("id")));
				menutree.setText(StringUtil.converString(map.get("text")));
				menutree.setUrl(StringUtil.converString(map.get("url")));
				if(!StringUtil.converString(map.get("parentid")).equals("")){
					menutree.setFuid(StringUtil.converString(map.get("parentid")));
				}
				attributes = new HashMap<String, String>();
				attributes.put("url", StringUtil.converString(map.get("url")));
				menutree.setAttributes(attributes);
				list.add(menutree);
			}
			
			for(int i=0;i<list.size();i++){
				menutree = list.get(i);
				menutree.setChildren(list);
				if(menutree.getFuid() == null){
					rootList.add(menutree);
				}
			}
		} catch (Exception e) {
			log.error("获得list树异常："+e.getMessage());
			e.printStackTrace();
		}
		return rootList;
	}

	public boolean checkLogin(String username, String password) {
		log.info("验证登陆");
		try {
			Map<String, Object> map = dao.getAdminByName(username);
			if(StringUtil.converString(map.get("password")).equals(StringUtil.hash(password))){
				return true;
			}
		} catch (Exception e) {
			log.error("验证登录异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean ifExistsAdmin(String name) {
		log.info("验证管理员是否重复");
		try {
			if(dao.ifExistsAdmin(name) > 0)
				return false;
		} catch (Exception e) {
			log.error("验证管理员是否重复异常："+e.getMessage());
			e.printStackTrace();
		}
		return true;
	}
	
	public boolean ifExistsUser(String name) {
		log.info("验证用户是否重复");
		try {
			if(dao.ifExistsUser(name) > 0)
				return false;
		} catch (Exception e) {
			log.error("验证用户是否重复异常："+e.getMessage());
			e.printStackTrace();
		}
		return true;
	}
	
	public String autoUser() {
		log.info("自动补全用户");
		try {
			return JSONArray.fromObject(dao.autoUser()).toString();
		} catch (Exception e) {
			log.error("自动补全用户异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败";
	}
	
	public String autoMobile() {
		log.info("自动补全手机号码");
		try {
			return JSONArray.fromObject(dao.autoMobile()).toString();
		} catch (Exception e) {
			log.error("自动补全手机号码异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败";
	}
	
	public String autoRealname() {
		log.info("自动补全真实姓名");
		try {
			return JSONArray.fromObject(dao.autoRealname()).toString();
		} catch (Exception e) {
			log.error("自动补全真实姓名异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败";
	}
	
	public String autoIdcard() {
		log.info("自动补全身份证");
		try {
			return JSONArray.fromObject(dao.autoIdcard()).toString();
		} catch (Exception e) {
			log.error("自动补全身份证异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败";
	}
	public String autoAdminName() {
		log.info("自动补全商务专员");
		try {
			return JSONArray.fromObject(dao.autoAdminName()).toString();
		} catch (Exception e) {
			log.error("自动补全商务专员异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败";
	}

	public String autoAdmin() {
		log.info("自动补全管理员");
		try {
			return JSONArray.fromObject(dao.autoAdmin()).toString();
		} catch (Exception e) {
			log.error("自动补全管理员异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败";
	}

	public String autoRole() {
		log.info("自动补全角色");
		try {
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			return JSONArray.fromObject(dao.autoRole(),jsonConfig).toString();
		} catch (Exception e) {
			log.error("自动补全角色异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败";
	}

	public boolean isRepeatRole(String rolename) {
		log.info("验证角色名是否重复");
		try {
			if(dao.isRepeatRole(rolename) > 0)
				return false;
		} catch (Exception e) {
			log.error("验证异常："+e.getMessage());
			e.printStackTrace();
		}
		return true;
	}

	public boolean isRepeatMobile(String mobile) {
		log.info("验证手机号是否重复");
		try {
			if(dao.isRepeatMobile(mobile) > 0)
				return false;
		} catch (Exception e) {
			log.error("验证异常："+e.getMessage());
			e.printStackTrace();
		}
		return true;
	}

	public String getRoleCombox() {
		log.info("获得角色下拉菜单信息");
		try {
			return JSONArray.fromObject(dao.getRoleCombox()).toString();
		} catch (Exception e) {
			log.error("获得角色下拉菜单异常："+e);
			e.printStackTrace();
		}
		return "查询失败";
	}

	public boolean insertAdmin(String username, String password, int sex,
			String mobile, String email, String realname, String idcard,
			long roleid) {
		log.info("添加管理员");
		try {
			return dao.insertAdmin(username, password, sex, mobile, email, realname, idcard, roleid);
		} catch (Exception e) {
			log.error("添加管理员异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean insertRole(String rolename, String note) {
		log.info("添加角色");
		try {
			return dao.insertRole(rolename, note);
		} catch (Exception e) {
			log.error("添加角色异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateAdmin(int sex, String mobile, String email, String realname,
			String idcard, long roleid, long id) {
		log.info("修改管理员");
		try {
			return dao.updateAdmin(sex, mobile, email, realname, idcard, roleid, id);
		} catch (Exception e) {
			log.error("修改管理员异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateRole(long id, String rolename, String note) {
		log.info("修改角色");
		try {
			return dao.updateRole(id, rolename, note);
		} catch (Exception e) {
			log.error("修改角色异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean modifyPassword(long id, String password) {
		log.info("修改密码");
		try {
			return dao.modifyPassword(id, StringUtil.hash(password));
		} catch (Exception e) {
			log.error("修改密码异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteUser(long id) {
		log.info("删除用户");
		try {
			return dao.deleteUser(id);
		} catch (Exception e) {
			log.error("删除用户异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteRole(long id) {
		log.info("删除角色");
		try {
			return dao.deleteRole(id);
		} catch (Exception e) {
			log.error("删除角色异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean freezeUser(long id, String state) {
		log.info("冻结/解冻用户");
		try {
			return dao.freezeUser(id, state);
		} catch (Exception e) {
			log.error("冻结/解冻用户异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean isRepeatCardid(int ismanager, String cardid) {
		log.info("验证身份证是否重复："+cardid);
		try {
			if(dao.isRepeatCardid(ismanager, cardid) > 0)
				return false;
		} catch (Exception e) {
			log.error("验证身份证是否重复异常："+e);
			e.printStackTrace();
		}
		return true;
	}

	public boolean addUser(String username, String password, int sex,
			String mobile, String email, String realname, String idcard,
			int job, String address,String weixin, int isgroup, String recommend) {
		log.info("添加用户信息");
		try {
			return dao.addUser(username, password, sex, mobile, email, realname, idcard, job, address, weixin, isgroup, recommend);
		} catch (Exception e) {
			log.error("添加用户信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updUser(int sex, String mobile, String email, String realname,
			String idcard, int job, String address,String adminName,String desction, String weixin, int isgroup, String recommend, long id) {
		log.info("修改用户信息");
		try {
			return dao.updUser(sex, mobile, email, realname, idcard, job, address,adminName,desction,weixin,isgroup ,recommend,id);
		} catch (Exception e) {
			log.error("修改用户信息异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String getJobList(int currentPage, int pageSize) {
		log.info("获得职业信息列表");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = dao.getJobListNum();
			if (total == 0) {
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			List<Map<String, Object>> maplist = dao.getJobList(currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(maplist));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获得职业信息列表异常："+e);
			e.printStackTrace();
		}
		return "查询失败";
	}

	public boolean addJob(String name) {
		log.info("添加职业");
		try {
			return dao.addJob(name);
		} catch (Exception e) {
			log.error("添加职业异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean delJob(long id) {
		log.info("删除职业");
		try {
			return dao.delJob(id);
		} catch (Exception e) {
			log.error("删除职业异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean updJob(long id, String name) {
		log.info("修改职业");
		try {
			return dao.updJob(id, name);
		} catch (Exception e) {
			log.error("修改职业异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public String getJobCombobox() {
		log.info("获得职业下拉列表");
		try {
			return JSONArray.fromObject(dao.getJobCombobox()).toString();
		} catch (Exception e) {
			log.error("获得职业下拉列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败";
	}

	public boolean moneyControl(long id, double money) {
		log.info("用户余额控制");
		try {
			Map<String, Object> map = this.getUserById(id);
			if ((money + Double.valueOf(map.get("money").toString())) < 0) {
				money = -Double.valueOf(map.get("money").toString());
			}
			return dao.moneyControl(id, money);
		} catch (Exception e) {
			log.error("用户余额控制异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean pointControl(long id, int point) {
		log.info("用户积分控制");
		try {
			Map<String, Object> map = this.getUserById(id);
			if ((point + Integer.valueOf(map.get("point").toString())) < 0) {
				point = -Integer.valueOf(map.get("point").toString());
			}
			return dao.pointControl(id, point);
		} catch (Exception e) {
			log.error("用户积分控制异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public boolean levelControl(long id, int level) {
		log.info("等级控制");
		try {
			return dao.levelControl(id, level);
		} catch (Exception e) {
			log.error("等级控制异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	public boolean stateControl(long id, int baibaoshopstate) {
		log.info("审核状态控制");
		try {
			return dao.stateControl(id, baibaoshopstate);
		} catch (Exception e) {
			log.error("审核状态控制异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	public Map<String, Object> exportCSV(String id, String username, String mobile, String realname, String idcard, String adminName, String state,String baibaoshopstate, String money ,String level, int pageSize, int currentPage) {
		log.info("导出csv");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			
			List<Map<String, Object>> list = dao.getUserinfoList(id, username, mobile, realname, idcard,adminName,state,baibaoshopstate,money,level, pageSize, currentPage);
			for(int i =0;i< list.size();i++){
		           Map<String, Object> mapdata= list.get(i);
					 for(Entry<String, Object> entry:mapdata.entrySet()){
					   //System.out.println(entry.getKey()+"------->"+entry.getValue());
					    if(entry.getKey().equals("email")){
					    	if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("realname")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }  else if(entry.getKey().equals("idcard")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }  else if(entry.getKey().equals("adminName")){
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  } else if(entry.getKey().equals("address")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("jobname")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }else if(entry.getKey().equals("desction")){ 
						  if(entry.getValue()==null){
					    		entry.setValue("");
					    	}
					  }
		     }
			}
			
			map.put("useList", list==null?new ArrayList<Map<String, Object>>():list);
		} catch (Exception e) {
			log.error("获取用户列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

}
