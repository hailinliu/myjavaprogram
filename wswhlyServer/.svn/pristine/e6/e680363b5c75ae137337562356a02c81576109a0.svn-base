package com.wswhly.control;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.wswhly.bean.tool.GetJobsRespBean;
import com.wswhly.bean.tool.SendMsgReqBean;
import com.wswhly.bean.tool.VersionInfoReqBean;
import com.wswhly.bean.tool.VersionInfoRespBean;
import com.wswhly.dao.ToolDao;
import com.wswhly.util.DateUtil;
import com.wswhly.util.StringUtil;
import com.wswhly.util.sendsms.SendSMS;
import com.wswhly.util.sendsmsv.SendSmsV;

@Controller
public class ToolControl {
	
	private static final Logger logger = Logger.getLogger(ToolControl.class);
	
	@Autowired
	private ToolDao toolDao;
	
	/**
	 * 发送短信
	 * //1.注册 2修改 3通知 4忘记密码
	 */
	@RequestMapping("/SendSms")
	public void SendSms(HttpServletRequest request,HttpServletResponse response){
		SendMsgReqBean sendsmsreq = (new Gson()).fromJson(request.getAttribute("data").toString(), SendMsgReqBean.class);
		try{
			String verifycode = StringUtil.getVerifyCode();
			String content = StringUtil.getVerifySMS(verifycode);
			//获取类型
			int type=sendsmsreq.getType();
			String mobile=sendsmsreq.getMobile();
			//获取今天发送短信记录条数如果大于90不发送
			if(toolDao.getcountBYmobile(mobile, 24*60*60,"")>=90){
				request.setAttribute("resultjson",StringUtil.Error("9999", "一天之内只能发送90条信息！"));
				long smsid =toolDao.addSmsSend(sendsmsreq.getMobile(),  content,"1110", 0, "1111-11-11 11:11:11","0000");
				toolDao.addVerifyCode(sendsmsreq.getMobile(), smsid, verifycode);
				return ;
			}

			//获取最近180秒是否有发送记录
			if(toolDao.getcountBYmobile(mobile, 180,"")>=1){
				request.setAttribute("resultjson",StringUtil.Error("9999", "180秒之内只能发送1条信息！"));
				long smsid =toolDao.addSmsSend(sendsmsreq.getMobile(), content,"1112", 0, "1111-11-11 11:11:11","0000");
				toolDao.addVerifyCode(sendsmsreq.getMobile(), smsid, verifycode);
				return ;
			}
			//判断今天验证码发送的次数  最多只能发送5次
			if(toolDao.getcountBYmobile(mobile, 24*60*60,"验证码")>=5){
				request.setAttribute("resultjson",StringUtil.Error("9999", "一天之内只能发送5条验证码信息！"));
				long smsid = toolDao.addSmsSend(sendsmsreq.getMobile(), content,"1111", 0, "1111-11-11 11:11:11","0000");
				toolDao.addVerifyCode(sendsmsreq.getMobile(), smsid, verifycode);
				return ;
			}
			//Map<String,String> map = SendSMS.SendSMS(sendsmsreq.getMobile(), content);
			Map<String,String> map = SendSmsV.SendSMS(sendsmsreq.getMobile(), content);
			if(map == null){
				request.setAttribute("resultjson",StringUtil.Error("9999", "短信发送失败"));
				return ;
			}
			long smsid = toolDao.addSmsSend(sendsmsreq.getMobile(), content, StringUtil.converString(map.get("errorcode")), 0, DateUtil.FormatDate(new Date()), StringUtil.converString(map.get("msgcount")));
			//long smsid = toolDao.addSmsSend(sendsmsreq.getMobile(), verifycode, "1111", 0, "2014-12-28 11:11:11", "1");
			if(!toolDao.addVerifyCode(sendsmsreq.getMobile(), smsid, verifycode)){
				request.setAttribute("resultjson",StringUtil.Error("9999", "数据插入失败"));
				return ;
			}
			request.setAttribute("resultjson",StringUtil.Success(""));
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("SendSms Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 获取职业列表
	 */
	@RequestMapping("/GetJobs")
	public void GetJobs(HttpServletRequest request,HttpServletResponse response){
		try{
			GetJobsRespBean getjobresp = new GetJobsRespBean();
			getjobresp.setList(toolDao.queryJobs());
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(getjobresp)));
		}catch (Exception e) {
			logger.error("GetJobs Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 版本信息
	 */
	@RequestMapping("/Version")
	public void Version(HttpServletRequest request,HttpServletResponse response){
		VersionInfoReqBean versionreq = (new Gson()).fromJson(request.getAttribute("data").toString(), VersionInfoReqBean.class);
		VersionInfoRespBean versionresp = new VersionInfoRespBean();
		try{
			if(versionreq.getVersion() == null || versionreq.getVersion().equals("")){
				request.setAttribute("resultjson",StringUtil.Error("9999", "未发现新版本"));
				return;
			}
			Map<String,Object> map = toolDao.queryVersion();
			if(map == null){
				request.setAttribute("resultjson",StringUtil.Error("9999", "已是最新版本"));
				return;
			}
			String[] from = versionreq.getVersion().split("\\.");
			String version = StringUtil.converString(map.get("VERSION"));
			String[] local = version.split("\\.");
			for(int i=0;i<local.length;i++){
				if(Integer.valueOf(local[i]) > Integer.valueOf(from[i])){
					versionresp.setVersion(version);
					versionresp.setContent(StringUtil.converString(map.get("CONTENT")));
					versionresp.setPath(StringUtil.converString(map.get("PATH")));
					break;
				}
			}
			if(versionresp.getVersion() ==null || versionresp.getVersion().equals("")){
				request.setAttribute("resultjson",StringUtil.Error("9999", "已是最新版本"));
				return;
			}
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(versionresp)));
		}catch (Exception e) {
			logger.error("Version Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
}
