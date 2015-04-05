package com.hyzm.admin.service.baibao.impl;

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

import com.hyzm.admin.dao.baibao.BaibaoShopBaseInfoDao;
import com.hyzm.admin.service.baibao.BaibaoShopBaseInfoService;
import com.hyzm.util.DateJsonValueProcessor;
@Service
public class BaibaoShopBaseInfoServiceImpl implements BaibaoShopBaseInfoService {
private final Logger log = Logger.getLogger(this.getClass());
	/*
	 * 
	 * 获取商家列表
	 */
	@Autowired
	private BaibaoShopBaseInfoDao shopDao;
	public String getBaibaoshopList(Date begindate, Date enddate, String username,String shopname,String mobile,String state, int currentPage, int pageSize) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			long total = shopDao.getBaibaoshopinfoListNum(begindate, enddate, username, shopname,mobile, state);
			if(total == 0){
				return "{total:0,rows:[]}";
			}
			map.put("total", total);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			List<Map<String, Object>> listmap = shopDao.getBaibaoshopinfoList(begindate, enddate, username, shopname,mobile, state, currentPage, pageSize);
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
	 * @see com.hyzm.admin.service.Baibaoshop.BaibaoshopBaseInfoService#addBaibaoshopinfo(int, java.lang.String, java.lang.String, long, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	public boolean addBaibaoshopinfo( String shopname, String username,String mainscope, String manifesto,String weixin,String weixinimg,
			String shopaddress,String mobile,String desction, String img, String state) {
		log.info("添加商家");
		try {
			return shopDao.addBaibaoshopinfo(shopname, username, mainscope, manifesto, weixin, weixinimg, shopaddress, mobile, desction, img, state);
		} catch (Exception e) {
			log.error("添加商家异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	/*
	 * (non-Javadoc)修改商家
	 * @see com.hyzm.admin.service.Baibaoshop.BaibaoshopBaseInfoService#updBaibaoshopinfo(int, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
	 */
	public boolean updBaibaoshopinfo(long id,String shopname,String mainscope, String manifesto,String weixin,
			String shopaddress,String mobile,String desction, String img) {
		try {
			return shopDao.updBaibaoshopinfo(id, shopname, mainscope, manifesto, weixin, shopaddress, mobile, desction, img);
		} catch (Exception e) {
			log.error("修改商家异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	/*
	 * (non-Javadoc)通过id获取信息
	 * @see com.hyzm.admin.service.Baibaoshop.BaibaoshopBaseInfoService#getBaibaoshopinfoById(long)
	 */
	public Map<String, Object> getBaibaoshopinfoById(long id) {
		log.info("获取商家");
		Map<String, Object> map = new HashMap<String, Object>();
	    try {
			map = shopDao.getBaibaoshopinfoById(id);
		} catch (Exception e) {
			log.error("获取商家异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	/*
	 * (non-Javadoc)删除信息
	 * @see com.hyzm.admin.service.Baibaoshop.BaibaoshopBaseInfoService#delBaibaoshopinfo(long)
	 */
	public boolean delBaibaoshopinfo(long id) {
		log.info("删除商家");
		try {
			return shopDao.delBaibaoshopinfo(id);
		} catch (Exception e) {
			log.error("删除商家异常："+e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	/*
	 * 导出CSV
	 * (non-Javadoc)
	 * @see com.hyzm.admin.service.Baibaoshop.BaibaoshopBaseInfoService#exportCSV(java.util.Date, java.util.Date, java.lang.String, java.lang.String, java.lang.String, java.lang.String, int, int)
	 */
	/*public Map<String, Object> exportCSV(Date begindate, Date enddate,
			String username, String shopname, String state,
			int currentPage, int pageSize) {
		log.info("导出csv");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<Map<String, Object>> list = shopDao.getBaibaoshopinfoList(begindate, enddate, username, shopname, state, currentPage, pageSize);
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
	}*/
	public String getBaibaoshopBaseinfoCombobox() {
		List<Map<String, Object>> listmap;
		try {
			listmap = shopDao.getBaibaoshopinfoList(null, null, "", "", "","", 1, 100000);
			return JSONArray.fromObject(listmap).toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
		
	}
	/*
	 * (non-Javadoc)合作审批
	 * @see com.hyzm.admin.service.Baibaoshop.BaibaoshopBaseInfoService#joinControl(long, int, java.util.Date, java.util.Date)
	 */
	public boolean joinControl(long id, int state)
			throws Exception {
		log.info("修改合作审批状态及起始日期");
		try {
			return shopDao.upjoinType(id, state);
		} catch (Exception e) {
			log.error("修改类型异常：" + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	
	}
	



