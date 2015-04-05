package com.hyzm.admin.service.flagshop.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyzm.admin.dao.flagshop.FlagShopBaseInfoDao;
import com.hyzm.admin.dao.flagshop.FlagshopDao;
import com.hyzm.admin.service.flagshop.FlagShopBaseInfoService;
import com.hyzm.util.DateJsonValueProcessor;
@Service
public class FlagShopBaseInfoServiceImpl implements FlagShopBaseInfoService {
private final Logger log = Logger.getLogger(this.getClass());
	/*
	 * 
	 * 获取商家列表
	 */
	@Autowired
	private FlagShopBaseInfoDao shopDao;
	public String getFlagshopList(Date begindate, Date enddate,
			String username, String name, String commissioner, String type,
			int currentPage, int pageSize) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = shopDao.getFlagshopinfoListNum(begindate, enddate, username, name, commissioner, type);
			if(total == 0){
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = shopDao.getFlagshopinfoList(begindate, enddate, username, name, commissioner, type, currentPage, pageSize);
			map.put("rows", JSONArray.fromObject(listmap, jsonConfig));
			return JSONObject.fromObject(map).toString();
		} catch (Exception e) {
			log.error("获取商家列表异常："+e.getMessage());
			e.printStackTrace();
		}
		return "查询失败！";
	}
	/*
	 * (non-Javadoc)添加商家
	 * @see com.hyzm.admin.service.flagshop.FlagShopBaseInfoService#addFlagshopinfo(int, java.lang.String, java.lang.String, long, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	public boolean addFlagshopinfo(int type, String name, String username,String daoyu, String mainscope, String contactname, String contacttel,String qq,String weixin,String sinlwblog,
			String addresss,String map,String introduce,String commissioner,String startdate,String enddate, String logo,  String state) {
		log.info("添加商家");
		try {
			return shopDao.addFlagshopinfo(type, name, username, daoyu, mainscope, contactname, contacttel, qq, weixin, sinlwblog, addresss, map, introduce, commissioner, startdate, enddate, logo, state);
		} catch (Exception e) {
			log.error("添加商家异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	/*
	 * (non-Javadoc)修改商家
	 * @see com.hyzm.admin.service.flagshop.FlagShopBaseInfoService#updFlagshopinfo(int, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	public boolean updFlagshopinfo(long id,int type, String name,String daoyu, String mainscope, String contactname, String contacttel,String qq,String weixin,String sinlwblog,
			String addresss,String map,String introduce,String commissioner,String startdate,String enddate, String logo,  String state) {
		try {
			return shopDao.updFlagshopinfo(id, type, name, daoyu, mainscope, contactname, contacttel, qq, weixin, sinlwblog, addresss, map, introduce, commissioner, startdate, enddate, logo, state);
		} catch (Exception e) {
			log.error("修改商家异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	/*
	 * (non-Javadoc)通过id获取信息
	 * @see com.hyzm.admin.service.flagshop.FlagShopBaseInfoService#getFlagshopinfoById(long)
	 */
	public Map<String, Object> getFlagshopinfoById(long id) {
		log.info("获取商家");
		Map<String, Object> map = new HashMap<String, Object>();
	    try {
			map = shopDao.getFlagshopinfoById(id);
		} catch (Exception e) {
			log.error("获取商家异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	/*
	 * (non-Javadoc)删除信息
	 * @see com.hyzm.admin.service.flagshop.FlagShopBaseInfoService#delFlagshopinfo(long)
	 */
	public boolean delFlagshopinfo(long id) {
		log.info("删除商家");
		try {
			return shopDao.delFlagshopinfo(id);
		} catch (Exception e) {
			log.error("删除商家异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	/*
	 * 导出CSV
	 * (non-Javadoc)
	 * @see com.hyzm.admin.service.flagshop.FlagShopBaseInfoService#exportCSV(java.util.Date, java.util.Date, java.lang.String, java.lang.String, java.lang.String, java.lang.String, int, int)
	 */
	public Map<String, Object> exportCSV(Date begindate, Date enddate,
			String username, String name, String commissioner, String type,
			int currentPage, int pageSize) {
		log.info("导出csv");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<Map<String, Object>> list = shopDao.getFlagshopinfoList(begindate, enddate, username, name, commissioner, type, currentPage, pageSize);
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> mapdata = list.get(i);
				for (Entry<String, Object> entry : mapdata.entrySet()) {
					if (entry.getKey().equals("username")) {
						if (entry.getValue() == null) {
							entry.setValue("");
						}
					} else if (entry.getKey().equals("name")) {
						if (entry.getValue() == null) {
							entry.setValue("");
						}
					} else if (entry.getKey().equals("mainscope")) {
						if (entry.getValue() == null) {
							entry.setValue("");
						}
					} else if (entry.getKey().equals("introduce")) {
						if (entry.getValue() == null) {
							entry.setValue("");
						}
					} else if (entry.getKey().equals("logo")) {
						if (entry.getValue() == null) {
							entry.setValue("");
						}
					} else if (entry.getKey().equals("contactname")) {
						if (entry.getValue() == null) {
							entry.setValue("");
						}
					} else if (entry.getKey().equals("contacttel")) {
						if (entry.getValue() == null) {
							entry.setValue("");
						}
					}else if (entry.getKey().equals("addresss")) {
						if (entry.getValue() == null) {
							entry.setValue("");
						}
					} else if (entry.getKey().equals("map")) {
						if (entry.getValue() == null) {
							entry.setValue("");
						}
					} else if (entry.getKey().equals("commissioner")) {
						if (entry.getValue() == null) {
							entry.setValue("");
						}
					} else if (entry.getKey().equals("startdate")) {
						if (entry.getValue() == null) {
							entry.setValue("");
						}
					} else if (entry.getKey().equals("enddate")) {
						if (entry.getValue() == null) {
							entry.setValue("");
						}
					} else if (entry.getKey().equals("state")) {
						if (entry.getValue() == null) {
							entry.setValue("");
						} else if (entry.getKey().equals("type")) {
							if (entry.getValue() == null) {
								entry.setValue("");
							}
						}
					} 
				}
			}

			map.put("shoplist",
					list == null ? new ArrayList<Map<String, Object>>() : list);
		} catch (Exception e) {
			log.error("获取用户列表异常：" + e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	public String getFlagShopBaseinfoCombobox() {
		List<Map<String, Object>> listmap;
		try {
			listmap = shopDao.getFlagshopinfoList(null, null, "", "", "", "", 1, 100000);
			return JSONArray.fromObject(listmap).toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
		
	}
	/*
	 * (non-Javadoc)合作审批
	 * @see com.hyzm.admin.service.flagshop.FlagShopBaseInfoService#joinControl(long, int, java.util.Date, java.util.Date)
	 */
	public boolean joinControl(long id, int state, String startdate, String enddate)
			throws Exception {
		log.info("修改合作审批状态及起始日期");
		try {
			return shopDao.upjoinType(id, state, startdate, enddate);
		} catch (Exception e) {
			log.error("修改类型异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	
	}
	



