package com.wswhly.control;

import java.util.Date;
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
import com.wswhly.bean.enroll.CurrentEnrollRespBean;
import com.wswhly.bean.enroll.EnrollCollectionReqBean;
import com.wswhly.bean.enroll.EnrollCollectionRespBean;
import com.wswhly.bean.enroll.EnrollInfoReqBean;
import com.wswhly.bean.enroll.EnrollInfoRespBean;
import com.wswhly.bean.enroll.EnrollListReqBean;
import com.wswhly.bean.enroll.EnrollListRespBean;
import com.wswhly.bean.enroll.EnrollReqBean;
import com.wswhly.bean.enroll.EnrollRespBean;
import com.wswhly.dao.EnrollDao;
import com.wswhly.dao.ToolDao;
import com.wswhly.dao.TradeDao;
import com.wswhly.dao.UserDao;
import com.wswhly.util.DateUtil;
import com.wswhly.util.StringUtil;
import com.wswhly.util.sendmail.SendMail;
import com.wswhly.util.sendsms.SendSMS;
import com.wswhly.util.sendsmsv.SendSmsV;

@Controller
@Transactional
public class EnrollControl{

	private static final Logger logger = Logger.getLogger(EnrollControl.class);
	
	@Autowired
	private EnrollDao enrollDao;//注入报名DAO
	
	@Autowired
	private TradeDao tradeDao;//注入交易DAO
	
	@Autowired
	private UserDao userDao;//注入用户DAO
	
	@Autowired
	private ToolDao toolDao;//注入工具DAO
	
	/**
	 * 获取报名List
	 */
	@RequestMapping("/EnrollList")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void EnrollList(HttpServletRequest request,HttpServletResponse response){
		EnrollListReqBean enrollreq = (new Gson()).fromJson(request.getAttribute("data").toString(), EnrollListReqBean.class);
		EnrollListRespBean enrollresp = new EnrollListRespBean();
		try{
			if(enrollreq.getUserid() == 0l){//若userid为0  查询当前期报名记录
				List<CurrentEnrollRespBean.Enroll> list = enrollDao.queryCurrentEntoll();//查询当前报名期数
				if(list.size() > 0){//判断是否当前有期数
					enrollresp.setCount(enrollDao.queryEntollRecordInfoCount(list.get(0).getId()));
					enrollresp.setList(enrollDao.queryEntollRecordInfo(enrollreq.getPageno(), enrollreq.getPagesize(), list.get(0).getId()));
				}else{
					enrollresp.setCount(0);
				}
			}else{//若userid不为0  查询用户报名记录
				enrollresp.setCount(enrollDao.queryEntollRecordCount(enrollreq.getUserid()));
				enrollresp.setList(enrollDao.queryEntollRecord(enrollreq.getPageno(), enrollreq.getPagesize(), enrollreq.getUserid()));
			}
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(enrollresp)));
		}catch (Exception e) {
			logger.error("EnrollList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 获取当前期报名
	 */
	@RequestMapping("/CurrentEnroll")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void CurrentEnroll(HttpServletRequest request,HttpServletResponse response){
		CurrentEnrollRespBean enrollresp = new CurrentEnrollRespBean();
		try{
			List<CurrentEnrollRespBean.Enroll> list = enrollDao.queryCurrentEntoll();
			if(list.size() > 0){
				enrollresp.setEnroll(list.get(0));
			}
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(enrollresp)));
		}catch (Exception e) {
			logger.error("CurrentEnroll Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 报名
	 */
	@RequestMapping("/Enroll")
	@Transactional(rollbackFor=RuntimeException.class)
	public void Enroll(HttpServletRequest request,HttpServletResponse response){
		EnrollReqBean enrollreq = (new Gson()).fromJson(request.getAttribute("data").toString(), EnrollReqBean.class);
		try{
			EnrollRespBean enrollresp = new EnrollRespBean();
			double nowmoney = tradeDao.queryMoney(enrollreq.getUserid());//查询用户剩余金额
			int nowpoints = tradeDao.queryPoints(enrollreq.getUserid());//查询用户剩余金额
			if(nowmoney < enrollreq.getMoney()){
				request.setAttribute("resultjson",StringUtil.Error("0011", "余额不足"));
				return ;
			}
			String ordernum = StringUtil.getOrdernum();//获取订单编号
			if(!tradeDao.minusMoney(enrollreq.getUserid(), 4, enrollreq.getMoney(), ordernum)){
				request.setAttribute("resultjson",StringUtil.Error("0001", "报名失败"));
				return ;
			}
			tradeDao.addPoints(enrollreq.getUserid(), 4, (int)enrollreq.getMoney());
			double leftmoney = StringUtil.DoubleSubtract(nowmoney, enrollreq.getMoney());
			int leftpoints = nowpoints + (int)enrollreq.getMoney();
			long orderid = tradeDao.addOrder(enrollreq.getUserid(), ordernum, enrollreq.getMoney(), "4", "2",leftmoney);//添加订单信息
			
			List<CurrentEnrollRespBean.Enroll> list = enrollDao.queryEntoll(enrollreq.getBmid());
			if(list.size() == 0){
				throw new RuntimeException();
			}
			CurrentEnrollRespBean.Enroll enroll = list.get(0);
			
			String enrollnum = StringUtil.getEnrollnum(enroll.getCycle());//获取报名编号
			
			//获取鉴定时间计算用户鉴定时间 begin
			int count = enrollDao.queryCurrentEntollCount(enrollreq.getBmid());
			count = count + enrollreq.getCollectionid().size();
			String validdate = StringUtil.getValidDate(enroll.getValiddate(), count);
			//获取鉴定时间计算用户鉴定时间end
			
			long bmrecordid = enrollDao.addEntoll(enrollreq.getBmid(), enrollreq.getUserid(), orderid, enrollnum, validdate);//添加报名记录
			List<Long> collectionids = enrollreq.getCollectionid();
			for(int i=0;i<collectionids.size();i++){
				if(!enrollDao.addEntollCollection(bmrecordid, collectionids.get(i))){//添加报名藏品
					request.setAttribute("resultjson",StringUtil.Error("9999", "报名失败"));
					return ;
				}
			}
			if(enrollreq.getInvoice() != null){
				if(!enrollDao.addInvoice(enrollreq.getUserid(), orderid, enrollreq.getInvoice())){//添加发票信息
					request.setAttribute("resultjson",StringUtil.Error("9999", "报名失败"));
					return ;
				}
			}
			userDao.modifyMoney(enrollreq.getUserid(), leftmoney);
			userDao.modifyPoints(enrollreq.getUserid(), leftpoints);
			//支付成功之后将订单改为已支付
			//tradeDao.modifyOrder(ordernum, "1", "1", ordernum, "1");
			String content =  StringUtil.getEnrollSMS(enrollreq.getCollectionid().size(),enrollnum,validdate);
			String mobile=enrollreq.getMobile();
			//获取今天发送短信记录条数如果大于90不发送
			if(toolDao.getcountBYmobile(mobile, 24*60*60,"")>=90){
				request.setAttribute("resultjson",StringUtil.Error("9999", "一天之内只能发送90条信息！"));
				long smsid =toolDao.addSmsSend(enrollreq.getMobile(),  content,"1110", 0,  "1111-11-11 11:11:11","0000");
				return ;
			}
			//获取最近180秒是否有发送记录
			if(toolDao.getcountBYmobile(mobile, 180,"")>=1){
				request.setAttribute("resultjson",StringUtil.Error("9999", "180秒之内只能发送1条信息！"));
				long smsid =toolDao.addSmsSend(enrollreq.getMobile(), content,"1112", 0,  "1111-11-11 11:11:11","0000");
				return ;
			}
			//发送短信
			Map<String,String> map = SendSmsV.SendSMS(enrollreq.getMobile(),content);
			if(map == null){
				request.setAttribute("resultjson",StringUtil.Error("9999", "短信发送失败"));
				return ;
			}
			long smsid = toolDao.addSmsSend(enrollreq.getMobile(), content, StringUtil.converString(map.get("errorcode")), 0, StringUtil.converString(map.get("time")), StringUtil.converString(map.get("msgcount")));
			
//			String mailaddress=toolDao.getMailBymobile(mobile);
//			if(mailaddress!=null&&mailaddress.indexOf("@")>0){
//				content="<a>【卫视文化乐园】</a>尊敬的用户，"+content+"5分钟内请查看短信是否发送到您的手机，如未收到请联系官网客服！<br/>官网：www.wswhly.com <br/>此邮件为系统自动发信，请勿直接回复，谢谢！ ";
//				int sendmail_state=SendMail.send(mailaddress, "报名成功！", content);
//				Map<String, String> sendmailmap=new HashMap<String, String>();
//				sendmailmap.put("mailaddress", mailaddress);
//				sendmailmap.put("state", String.valueOf(sendmail_state));
//				sendmailmap.put("subject", "报名成功！");
//				sendmailmap.put("content", content);
//				toolDao.addSendMail(sendmailmap);
//			}
			/*//发送短信
			content = StringUtil.getEnrollSMS(enrollreq.getCollectionid().size(), enrollreq.getMoney(), enrollnum);
			map = SendSMS.SendSMS(enrollreq.getMobile(),content);
			if(map == null){
				request.setAttribute("resultjson",StringUtil.Error("9999", "短信发送失败"));
				return ;
			}
			smsid = toolDao.addSmsSend(enrollreq.getMobile(), content, StringUtil.converString(map.get("errorcode")), 0, StringUtil.converString(map.get("time")), StringUtil.converString(map.get("msgcount")));*/
			
			enrollresp.setOrdernum(ordernum);
			enrollresp.setMoney(leftmoney);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(enrollresp)));
		}catch (Exception e) {
			logger.error("Enroll Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
			throw new RuntimeException();
		}
	}
	/**
	 * 报名信息
	 */
	@RequestMapping("/EnrollInfo")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void EnrollInfo(HttpServletRequest request,HttpServletResponse response){
		EnrollInfoReqBean enrollreq = (new Gson()).fromJson(request.getAttribute("data").toString(), EnrollInfoReqBean.class);
		try{
			int count = enrollDao.addInfo(enrollreq);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(count)));
		}catch (Exception e) {
			logger.error("Enroll Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 已报名藏品
	 */
	@RequestMapping("/EnrollCollection")
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public void EnrollCollection(HttpServletRequest request,HttpServletResponse response){
		EnrollCollectionReqBean enrollreq = (new Gson()).fromJson(request.getAttribute("data").toString(), EnrollCollectionReqBean.class);
		EnrollCollectionRespBean enrollresp = new EnrollCollectionRespBean();
		try{
			List<Long> list = enrollDao.queryEntollCollection(enrollreq.getUserid(), enrollreq.getEnrollid());
			enrollresp.setList(list);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(enrollresp)));
		}catch (Exception e) {
			logger.error("EnrollCollection Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
}
