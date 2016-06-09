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
	 * ���Ͷ���
	 * //1.ע�� 2�޸� 3֪ͨ 4��������
	 */
	@RequestMapping("/SendSms")
	public void SendSms(HttpServletRequest request,HttpServletResponse response){
		SendMsgReqBean sendsmsreq = (new Gson()).fromJson(request.getAttribute("data").toString(), SendMsgReqBean.class);
		try{
			String verifycode = StringUtil.getVerifyCode();
			String content = StringUtil.getVerifySMS(verifycode);
			//��ȡ����
			int type=sendsmsreq.getType();
			String mobile=sendsmsreq.getMobile();
			//��ȡ���췢�Ͷ��ż�¼�����������90������
			if(toolDao.getcountBYmobile(mobile, 24*60*60,"")>=90){
				request.setAttribute("resultjson",StringUtil.Error("9999", "һ��֮��ֻ�ܷ���90����Ϣ��"));
				long smsid =toolDao.addSmsSend(sendsmsreq.getMobile(),  content,"1110", 0, "1111-11-11 11:11:11","0000");
				toolDao.addVerifyCode(sendsmsreq.getMobile(), smsid, verifycode);
				return ;
			}

			//��ȡ���180���Ƿ��з��ͼ�¼
			if(toolDao.getcountBYmobile(mobile, 180,"")>=1){
				request.setAttribute("resultjson",StringUtil.Error("9999", "180��֮��ֻ�ܷ���1����Ϣ��"));
				long smsid =toolDao.addSmsSend(sendsmsreq.getMobile(), content,"1112", 0, "1111-11-11 11:11:11","0000");
				toolDao.addVerifyCode(sendsmsreq.getMobile(), smsid, verifycode);
				return ;
			}
			//�жϽ�����֤�뷢�͵Ĵ���  ���ֻ�ܷ���5��
			if(toolDao.getcountBYmobile(mobile, 24*60*60,"��֤��")>=5){
				request.setAttribute("resultjson",StringUtil.Error("9999", "һ��֮��ֻ�ܷ���5����֤����Ϣ��"));
				long smsid = toolDao.addSmsSend(sendsmsreq.getMobile(), content,"1111", 0, "1111-11-11 11:11:11","0000");
				toolDao.addVerifyCode(sendsmsreq.getMobile(), smsid, verifycode);
				return ;
			}
			//Map<String,String> map = SendSMS.SendSMS(sendsmsreq.getMobile(), content);
			Map<String,String> map = SendSmsV.SendSMS(sendsmsreq.getMobile(), content);
			if(map == null){
				request.setAttribute("resultjson",StringUtil.Error("9999", "���ŷ���ʧ��"));
				return ;
			}
			long smsid = toolDao.addSmsSend(sendsmsreq.getMobile(), content, StringUtil.converString(map.get("errorcode")), 0, DateUtil.FormatDate(new Date()), StringUtil.converString(map.get("msgcount")));
			//long smsid = toolDao.addSmsSend(sendsmsreq.getMobile(), verifycode, "1111", 0, "2014-12-28 11:11:11", "1");
			if(!toolDao.addVerifyCode(sendsmsreq.getMobile(), smsid, verifycode)){
				request.setAttribute("resultjson",StringUtil.Error("9999", "���ݲ���ʧ��"));
				return ;
			}
			request.setAttribute("resultjson",StringUtil.Success(""));
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("SendSms Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	 * ��ȡְҵ�б�
	 */
	@RequestMapping("/GetJobs")
	public void GetJobs(HttpServletRequest request,HttpServletResponse response){
		try{
			GetJobsRespBean getjobresp = new GetJobsRespBean();
			getjobresp.setList(toolDao.queryJobs());
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(getjobresp)));
		}catch (Exception e) {
			logger.error("GetJobs Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	 * �汾��Ϣ
	 */
	@RequestMapping("/Version")
	public void Version(HttpServletRequest request,HttpServletResponse response){
		VersionInfoReqBean versionreq = (new Gson()).fromJson(request.getAttribute("data").toString(), VersionInfoReqBean.class);
		VersionInfoRespBean versionresp = new VersionInfoRespBean();
		try{
			if(versionreq.getVersion() == null || versionreq.getVersion().equals("")){
				request.setAttribute("resultjson",StringUtil.Error("9999", "δ�����°汾"));
				return;
			}
			Map<String,Object> map = toolDao.queryVersion();
			if(map == null){
				request.setAttribute("resultjson",StringUtil.Error("9999", "�������°汾"));
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
				request.setAttribute("resultjson",StringUtil.Error("9999", "�������°汾"));
				return;
			}
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(versionresp)));
		}catch (Exception e) {
			logger.error("Version Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
}
