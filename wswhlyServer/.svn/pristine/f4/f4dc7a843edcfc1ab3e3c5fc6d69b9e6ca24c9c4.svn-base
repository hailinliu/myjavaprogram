package com.wswhly.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.wswhly.dao.OnlinePicDao;
import com.wswhly.dao.TradeDao;
import com.wswhly.util.StringUtil;

/**
 * 图片鉴定
 * @author Administrator
 *2015年4月13日 14:22:23
 */
@Controller
@Transactional
public class OnlinePicControl {
	private static final Logger logger = Logger.getLogger(BaiBaoControl.class);
	@Autowired
	private OnlinePicDao onlinepicdao;
	@Autowired
	private TradeDao tradeDao;//注入交易DAO
	/***********************************************************以下为藏品方法*******************************************************************************/
	//增加藏品
	@RequestMapping("/AddOnlinePicColl")
	public void AddOnlinePicColl(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			String userid=where.get("userid").toString();
			double nowmoney = tradeDao.queryMoney(Long.valueOf(userid));//查询用户剩余金额
			//订单额度
			double ordermoney=Double.valueOf(where.get("money"));
			if(nowmoney-ordermoney<0){
				data.put("num", 0);//余额不足
			}else if(onlinepicdao.AddOnlinePicColl(where)==1){
				data.put("num", 1);
				//获取已经上传的件数
//				Map<String,String> upcountMap=new HashMap<String, String>();
//				upcountMap.put("userid", userid);
//				int upcount=onlinepicdao.getOnlinePicCollForCount(upcountMap);
				
				Map<String,Object> whereuser=new HashMap<String, Object>(); 
				whereuser.put("userid", userid);
				
				//修改余额
				if(ordermoney>0){
					whereuser.put("money", ordermoney);
					onlinepicdao.UpdateMoney(whereuser);
				}
				//增加订单表
				String ordernum = StringUtil.getOrdernum();//获取订单编号
				//增加订单信息
				Map<String,Object> orderdata=new HashMap<String, Object>();
				orderdata.put("userid", userid);
				orderdata.put("ordernum", ordernum);
				orderdata.put("money", ordermoney);
				orderdata.put("tradetype", 6);
				orderdata.put("leftmoney", nowmoney-ordermoney);
				onlinepicdao.AddOrder(orderdata);//添加订单信息
				
				//增加积分信息
				Map<String,Object> pointdata=new HashMap<String, Object>();
				pointdata.put("userid", userid);
				pointdata.put("points", ordermoney);
				pointdata.put("tradetype", 6);
				pointdata.put("note", "拍品征集鉴定");
				onlinepicdao.AddPoint(pointdata);
				
				//增加收支明细信息
				Map<String,Object> moneydata=new HashMap<String, Object>();
				moneydata.put("userid", userid);
				moneydata.put("money", ordermoney);
				moneydata.put("tradetype", 6);
				moneydata.put("note", "拍品征集鉴定");
				moneydata.put("leftmoney", nowmoney-ordermoney);
				moneydata.put("ordernum", ordernum);
				onlinepicdao.AddUserMoney(moneydata);
			}else{
				data.put("num", -1);
			}
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("AddOnlinePicColl Exception"+e.getMessage());
			data.put("num",-1);
		}
	}
	//修改藏品
	@RequestMapping("/UpdateOnlinePicColl")
	public void UpdateOnlinePicColl(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", onlinepicdao.UpdateOnlinePicColl(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("UpdateOnlinePicColl Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	//删除藏品
	@RequestMapping("/DeleteOnlinePicColl")
	public void DeleteOnlinePicColl(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	//查询单个藏品
	@RequestMapping("/getOnlinePicCollForMap")
	public void  getOnlinePicCollForMap(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data=onlinepicdao.getOnlinePicCollForMap(where);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getOnlinePicCollForMap Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	//查询藏品个数
	@RequestMapping("/getOnlinePicCollForCount")
	public void getOnlinePicCollForCount(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", onlinepicdao.getOnlinePicCollForCount(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getOnlinePicCollForCount Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	//查询藏品列表
	@RequestMapping("/getOnlinePicCollForList")
	public void  getOnlinePicCollForList(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("count", onlinepicdao.getOnlinePicCollForCount(where));
			data.put("list", onlinepicdao.getOnlinePicCollForList(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getOnlinePicCollForList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
 
	
	/***********************************************************以下为图片鉴定藏品类型方法*******************************************************************************/
	//获取藏品类型
	@RequestMapping("/getOnlinePicType")
	public void getOnlinePicType(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("list", onlinepicdao.getOnlinePicType(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getOnlinePicType Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	
	/***********************************************************以下为图片鉴定专家方法*******************************************************************************/
	//获取专家
	@RequestMapping("/getOnlinePicProf")
	public void getOnlinePicProf(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("list", onlinepicdao.getOnlinePicProf(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getOnlinePicProf Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
}
