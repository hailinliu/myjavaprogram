package com.wswhly.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.wswhly.bean.enroll.EnrollCollectionReqBean;
import com.wswhly.bean.enroll.EnrollCollectionRespBean;
import com.wswhly.dao.FlagShopBaseInfoDao;
import com.wswhly.dao.ToolDao;
import com.wswhly.dao.TradeDao;
import com.wswhly.dao.UserDao;
import com.wswhly.dao.lylotsDao;
import com.wswhly.util.StringUtil;


@Controller
@Transactional
public class LylotsControl {
	private static final Logger logger = Logger.getLogger(LylotsControl.class);
	@Autowired
	private lylotsDao lylotsdao;//注入报名DAO
	@Autowired
	private TradeDao tradeDao;//注入交易DAO
	@Autowired
	private FlagShopBaseInfoDao flagShopBaseInfoDao;
	/**
	 * 上传
	 */
	@RequestMapping("/addlylots")
	public void getaddlylots(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			if(lylotsdao.addlylots(where)){
				data.put("num", 1);
				String userid=where.get("userid").toString();
				//获取已经上传的件数
				int num=lylotsdao.querylotsCount( Integer.valueOf(userid));
				int userlevel=Integer.valueOf(where.get("userlevel").toString());
				 //获取旗舰商家
				 Map<String, Object> flagmap=new HashMap<String, Object>();
				try {
					flagmap=flagShopBaseInfoDao.queryFlagShopBaseInfoByuserId(userid);
				} catch (Exception e) {
					flagmap=null;
				}
				
				//订单额度
				double ordermoney=0;
				//增加积分
				int addpoints=0;
				Map<String,Object> whereuser=new HashMap<String, Object>(); 
				whereuser.put("userid", userid);
				//修改余额
				if(userlevel==0){
					//如果该免费会员为旗舰商家  可以免费上传30件
					if(flagmap!=null&&flagmap.get("id")!=""){
						if(num>30){
								lylotsdao.updatemoney(whereuser);
								ordermoney=100;
								addpoints=100;
						}
					}else{
							lylotsdao.updatemoney(whereuser);
							ordermoney=100;
							addpoints=100;
					}
				
				}
				//如果为星级会员  可以免费上传30件
				if(userlevel==1&&num>30){
					lylotsdao.updatemoney(whereuser);
					ordermoney=100;
					addpoints=100;
				}
				//如果为贵宾会员  可以免费上传60件
				if(userlevel==2&&num>60){
					lylotsdao.updatemoney(whereuser);
					ordermoney=100;
					addpoints=100;
				}
				//如果为高级会员  可以免费上传80件
				if(userlevel==3&&num>80){
					lylotsdao.updatemoney(whereuser);
					ordermoney=100;
					addpoints=100;
				}
				
				//增加订单表
				String ordernum = StringUtil.getOrdernum();//获取订单编号
				double nowmoney = tradeDao.queryMoney(Long.valueOf(userid));//查询用户剩余金额
				//增加订单信息
				Map<String,Object> orderdata=new HashMap<String, Object>();
				orderdata.put("userid", userid);
				orderdata.put("ordernum", ordernum);
				orderdata.put("money", ordermoney);
				orderdata.put("tradetype", 3);
				orderdata.put("leftmoney", nowmoney);
				lylotsdao.addOrder(orderdata);//添加订单信息
				
				//增加积分信息
				Map<String,Object> pointdata=new HashMap<String, Object>();
				pointdata.put("userid", userid);
				pointdata.put("points", ordermoney);
				pointdata.put("tradetype", 3);
				pointdata.put("note", "拍品征集");
				lylotsdao.addpoint(pointdata);
				
				//增加收支明细信息
				Map<String,Object> moneydata=new HashMap<String, Object>();
				moneydata.put("userid", userid);
				moneydata.put("money", ordermoney);
				moneydata.put("tradetype", 3);
				moneydata.put("note", "拍品征集");
				moneydata.put("leftmoney", nowmoney);
				moneydata.put("ordernum", ordernum);
				lylotsdao.addusermoney(moneydata);
			}else{
				data.put("num", 0);
			}
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getaddlylots Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	//获取专场
	@RequestMapping("/getLyZc")
	public void getLyZc(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("list", lylotsdao.getLyZc());
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getFlagShopBaseInfoNews Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	//修改余额
		@RequestMapping("/updatemoney")
		public void updatemoney(HttpServletRequest request,HttpServletResponse response){
			Map<String,Object> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
			Map<String,Object> data= new HashMap<String, Object>();
			try {
				if(lylotsdao.updatemoney(where)){
					data.put("num", 1);
				}else{
					data.put("num", 0);
				}
				request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
			} catch (Exception e) {
				logger.error("getFlagShopBaseInfoNews Exception"+e.getMessage());
				request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
			}
		}
	
	/*
	 * 获取我的上传个数
	 */
	@RequestMapping("/getMylots")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void getMylots(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try{
			data.put("count", lylotsdao.querylotsCount( Integer.valueOf(where.get("userid").toString())));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		}catch (Exception e) {
			logger.error("getMylots Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/*
	 * 获取我的上传
	 */
	@RequestMapping("/getMylylots")
	public void getMylylots(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("list", lylotsdao.getMylylots(Long.valueOf(where.get("userid").toString()),Integer.valueOf(where.get("pageno").toString()),Integer.valueOf(where.get("pagesize").toString())));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getMylylots Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/*
	 * 获取拍品列表
	 */
	@RequestMapping("/getlylots")
	public void getlylots(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("list", lylotsdao.getlylots(where));
			data.put("count", lylotsdao.getlylotsCount(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getlylots Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/*
	 * 获取拍品详情
	 */
	@RequestMapping("/getlylotsById")
	public void getlylotsById(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data=lylotsdao.getlylotsByid(where);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getlylots Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
}

	
