package com.hyzm.forward.service.trade.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.trade.PaySuccessReqBean;
import com.hyzm.bean.trade.RechargeReqBean;
import com.hyzm.bean.trade.RechargeRespBean;
import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.trade.TradeService;

@Service
public class TradeServiceImpl extends MessageResponse implements TradeService{

	private final Logger log = Logger.getLogger(this.getClass());
	
	public Map<String,Object> Recharge(long userid,double money) throws Exception {
		log.info("支付");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			RechargeReqBean recharge = new RechargeReqBean();
			recharge.setUserid(userid);
			recharge.setMoney(money);
			MessageRespBean respBean = getMessageResponse(recharge, "Recharge");
			if ("0000".equals(respBean.getErrorcode())) {
				map.put("errorcode", "0000");
				RechargeRespBean rechargeresp = new Gson().fromJson(respBean.getContent(), RechargeRespBean.class);
				map.put("ordernum", rechargeresp.getOrdernum());
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
			}
		} catch (Exception e) {
			log.error("支付异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String,Object> PaySuccess(String ordernum,String paymodel,String paytype,String trade_no,String trade_status) throws Exception {
		log.info("支付成功");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			PaySuccessReqBean pay = new PaySuccessReqBean();
			pay.setOrdernum(ordernum);
			pay.setPaymodel(paymodel);
			pay.setPaytype(paytype);
			pay.setTrade_no(trade_no);
			pay.setTrade_status(trade_status);
			MessageRespBean respBean = getMessageResponse(pay, "PaySuccess");
			if ("0000".equals(respBean.getErrorcode())) {
				map.put("errorcode", "0000");
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
			}
		} catch (Exception e) {
			log.error("支付异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
}
