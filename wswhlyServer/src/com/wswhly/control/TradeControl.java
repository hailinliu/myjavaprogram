package com.wswhly.control;

import java.util.Date;
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
import com.wswhly.bean.trade.CurrentMoneyReqBean;
import com.wswhly.bean.trade.CurrentMoneyRespBean;
import com.wswhly.bean.trade.MoneyRecordListReqBean;
import com.wswhly.bean.trade.MoneyRecordListRespBean;
import com.wswhly.bean.trade.OffLineRechargeReqBean;
import com.wswhly.bean.trade.PaySuccessReqBean;
import com.wswhly.bean.trade.PointsRecordListReqBean;
import com.wswhly.bean.trade.PointsRecordListRespBean;
import com.wswhly.bean.trade.RechargeReqBean;
import com.wswhly.bean.trade.RechargeRespBean;
import com.wswhly.bean.trade.UpdateVipReqBean;
import com.wswhly.bean.trade.UpdateVipRespBean;
import com.wswhly.dao.ToolDao;
import com.wswhly.dao.TradeDao;
import com.wswhly.dao.UserDao;
import com.wswhly.util.DateUtil;
import com.wswhly.util.StringUtil;
import com.wswhly.util.sendsms.SendSMS;
import com.wswhly.util.sendsmsl.SendSmsL;

@Controller
@Transactional
public class TradeControl {

	private static final Logger logger = Logger.getLogger(TradeControl.class);
	
	@Autowired
	private TradeDao tradeDao;//ע�뽻��DAO
	
	@Autowired
	private UserDao userDao;//ע�뽻��DAO
	
	@Autowired
	private ToolDao toolDao;//ע�빤��DAO
	
	/**
	 * ��ȡ����¼�б�
	 */
	@RequestMapping("/MoneyRecordList")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void MoneyRecordList(HttpServletRequest request,HttpServletResponse response){
		MoneyRecordListReqBean moneyrecordreq = (new Gson()).fromJson(request.getAttribute("data").toString(), MoneyRecordListReqBean.class);
		MoneyRecordListRespBean moneyrecordresp = new MoneyRecordListRespBean();
		try{
			moneyrecordresp.setCount(tradeDao.queryMoneyRecordCount(moneyrecordreq.getUserid(),Integer.valueOf(moneyrecordreq.getYear())));
			moneyrecordresp.setList(tradeDao.queryMoneyRecord(moneyrecordreq.getPageno(), moneyrecordreq.getPagesize(), moneyrecordreq.getUserid(),Integer.valueOf(moneyrecordreq.getYear())));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(moneyrecordresp)));
		}catch (Exception e) {
			logger.error("MoneyRecordList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	 * ��ȡ���ּ�¼�б�
	 */
	@RequestMapping("/PointsRecordList")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void PointsRecordList(HttpServletRequest request,HttpServletResponse response){
		PointsRecordListReqBean pointsrecordreq = (new Gson()).fromJson(request.getAttribute("data").toString(), PointsRecordListReqBean.class);
		PointsRecordListRespBean pointsrecordresp = new PointsRecordListRespBean();
		try{
			pointsrecordresp.setCount(tradeDao.queryPointsRecordCount(pointsrecordreq.getUserid(),Integer.valueOf(pointsrecordreq.getYear())));
			pointsrecordresp.setList(tradeDao.queryPointsRecord(pointsrecordreq.getPageno(), pointsrecordreq.getPagesize(), pointsrecordreq.getUserid(),Integer.valueOf(pointsrecordreq.getYear())));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(pointsrecordresp)));
		}catch (Exception e) {
			logger.error("PointsRecordList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	 * ֧���ɹ�֪ͨ
	 */
	@RequestMapping("/PaySuccess")
	@Transactional(rollbackFor=Exception.class)
	public void PaySuccess(HttpServletRequest request,HttpServletResponse response){
		PaySuccessReqBean paysuccessreq = (new Gson()).fromJson(request.getAttribute("data").toString(), PaySuccessReqBean.class);
		try{
			Map<String,Object> map = tradeDao.queryOrder(paysuccessreq.getOrdernum());
			if(map == null){
				request.setAttribute("resultjson",StringUtil.Error("9999", "�������쳣"));
				return ;
			}
			if("1".equals(StringUtil.converString(map.get("state")))){
				request.setAttribute("resultjson",StringUtil.Error("9999", "��֧��"));
				return ;
			}
			if(!tradeDao.modifyOrder(paysuccessreq.getOrdernum(), paysuccessreq.getPaytype(), paysuccessreq.getPaymodel(), paysuccessreq.getTrade_no(), paysuccessreq.getTrade_status())){
				request.setAttribute("resultjson",StringUtil.Error("0001", "�޸Ķ���ʧ��"));
				logger.error(paysuccessreq.getOrdernum()+","+paysuccessreq.getPaytype()+","+paysuccessreq.getPaymodel()+",���¶���ʧ��");
				return ;
			}
			if(!tradeDao.addMoney(StringUtil.converLong(map.get("userid")), 1, (Double)map.get("money"),paysuccessreq.getOrdernum())){
				request.setAttribute("resultjson",StringUtil.Error("0001", "�޸��û���Ϣʧ��"));
				logger.error(paysuccessreq.getOrdernum()+","+paysuccessreq.getPaytype()+","+paysuccessreq.getPaymodel()+",�����û�ʧ��");
				return ;
			}
			try {
				double money=Double.valueOf(map.get("money").toString());
				if(money>=1000){
//					SendSmsL.SendSMS("13733823055,15890071113,18790282811", "�û�:"+map.get("username")+"�ֻ���:"+map.get("mobile")+"��"+DateUtil.FormatDate(new Date())+"��ֵ��"+money+"Ԫ!");
//					System.out.println("�û�:"+map.get("username")+"�ֻ���:"+map.get("mobile")+"��"+DateUtil.FormatDate(new Date())+"��ֵ��"+money+"Ԫ!");
					SendSmsL.SendSMS("13733823055,15890071113,18790282811", "�û�:"+map.get("username")+"�ֻ���:"+map.get("mobile")+"��"+DateUtil.FormatDate(new Date())+"��ֵ��"+money+"Ԫ!");
				}
			} catch (Exception e1) {
				request.setAttribute("resultjson",StringUtil.Success(""));
			}
			request.setAttribute("resultjson",StringUtil.Success(""));
		}catch (Exception e) {
			logger.error("PaySuccess Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	 * ��ֵ
	 */
	@RequestMapping("/Recharge")
	@Transactional(rollbackFor=Exception.class)
	public void Recharge(HttpServletRequest request,HttpServletResponse response){
		RechargeReqBean rechargereq = (new Gson()).fromJson(request.getAttribute("data").toString(), RechargeReqBean.class);
		try{
			RechargeRespBean rechargeresp = new RechargeRespBean();
			double nowmoney = tradeDao.queryMoney(rechargereq.getUserid());
			double leftmoney = StringUtil.DoubleAdd(nowmoney, rechargereq.getMoney());
			String ordernum = StringUtil.getOrdernum();
			tradeDao.addOrder(rechargereq.getUserid(), ordernum, rechargereq.getMoney(), "1", "1",leftmoney);
			rechargeresp.setOrdernum(ordernum);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(rechargeresp)));
		}catch (Exception e) {
			logger.error("Recharge Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	 * ���³�ֵ
	 */
	@RequestMapping("/OffLineRecharge")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void OffLineRecharge(HttpServletRequest request,HttpServletResponse response){
		OffLineRechargeReqBean offlinereq = (new Gson()).fromJson(request.getAttribute("data").toString(), OffLineRechargeReqBean.class);
		try{
			if(tradeDao.addOffLineRecharge(offlinereq.getUserid(), offlinereq.getImgurl(), offlinereq.getMoney())){
				request.setAttribute("resultjson",StringUtil.Success(""));
				return ;
			}
			request.setAttribute("resultjson",StringUtil.Error("9999", "¼��ʧ��"));
		}catch (Exception e) {
			logger.error("OffLineRecharge Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	 * ��ȡ��ǰ���
	 */
	@RequestMapping("/CurrentMoney")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void CurrentMoney(HttpServletRequest request,HttpServletResponse response){
		CurrentMoneyReqBean current = (new Gson()).fromJson(request.getAttribute("data").toString(), CurrentMoneyReqBean.class);
		CurrentMoneyRespBean currentresp = new CurrentMoneyRespBean();
		try{
			currentresp.setMoney(tradeDao.queryMoney(current.getUserid()));
			currentresp.setPoints(tradeDao.queryPoints(current.getUserid()));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(currentresp)));
		}catch (Exception e) {
			logger.error("OffLineRecharge Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	 * ��Ա����
	 */
	@RequestMapping("/UpdateVip")
	@Transactional(rollbackFor=RuntimeException.class)
	public void UpdateVip(HttpServletRequest request,HttpServletResponse response){
		UpdateVipReqBean vipreq = (new Gson()).fromJson(request.getAttribute("data").toString(), UpdateVipReqBean.class);
		try{
			UpdateVipRespBean vipresp = new UpdateVipRespBean();
			double nowmoney = tradeDao.queryMoney(vipreq.getUserid());//��ѯ�û�ʣ����
			int nowpoints = tradeDao.queryPoints(vipreq.getUserid());//��ѯ�û�ʣ����
			if(nowmoney < vipreq.getMoney()){
				request.setAttribute("resultjson",StringUtil.Error("0011", "����"));
				return ;
			}
			String ordernum = StringUtil.getOrdernum();//��ȡ�������
			if(!tradeDao.minusMoney(vipreq.getUserid(), 2, vipreq.getMoney(), ordernum)){
				request.setAttribute("resultjson",StringUtil.Error("0001", "��Ա����ʧ��"));
				return ;
			}
			tradeDao.addPoints(vipreq.getUserid(), 2, (int)vipreq.getMoney());
			double leftmoney = StringUtil.DoubleSubtract(nowmoney, vipreq.getMoney());
			int leftpoints = nowpoints + (int)vipreq.getMoney();
			long orderid = tradeDao.addOrder(vipreq.getUserid(), ordernum, vipreq.getMoney(), "2", "2",leftmoney);//��Ӷ�����Ϣ
			
			String leveltime = DateUtil.addyear(1);
			vipresp.setLevel(vipreq.getViplevel());
			vipresp.setLeveltime(leveltime);
			userDao.modifyLevel(vipreq.getUserid(), vipreq.getViplevel(), leveltime);
			
			Map<String,Object> map = toolDao.querySms(vipreq.getViplevel());
			if(map != null){
				Map<String,String> maps = SendSMS.SendSMS(vipreq.getMobile(),StringUtil.converString(map.get("Content")));
				if(maps == null){
					request.setAttribute("resultjson",StringUtil.Error("9999", "���ŷ���ʧ��"));
					return ;
				}
				long smsid = toolDao.addSmsSend(vipreq.getMobile(), StringUtil.converString(map.get("Content")), StringUtil.converString(maps.get("errorcode")), 0, StringUtil.converString(maps.get("time")), StringUtil.converString(maps.get("msgcount")));
			}
			
			userDao.modifyMoney(vipreq.getUserid(), leftmoney);
			userDao.modifyPoints(vipreq.getUserid(), leftpoints);
			
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(vipresp)));
		}catch (Exception e) {
			logger.error("OffLineRecharge Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
			throw new RuntimeException();
		}
	}
}
