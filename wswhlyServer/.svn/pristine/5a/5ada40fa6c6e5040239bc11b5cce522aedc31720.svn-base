package com.wswhly.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.TimeUtil;
import com.wswhly.util.sendmail.SendMail;
/**
 * 2015年1月8日 10:15:49
 * @author xjt
 *0
 */
@Repository
public class TimerUtil {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private String kfmo = "13733823055,15890071113";//客服手机号
	private String dg_kfmo = "13733823055,15890071113,18790282811";//代购客服手机号
	private String[] kfemail = { "529887775@qq.com", "372901428@qq.com", "1062108470@qq.com" };//客服邮箱
	private String[] dg_kfemail = { "529887775@qq.com", "372901428@qq.com","1062108470@qq.com", "18790282811@139.com" };//客服邮箱
	private String[] adminemail = { "xjt_job@yeah.net", "529887775@qq.com" };//系统扫描出现异常  向管理员邮箱发送邮件
	private int s=60*5;//邮件发送频率  单位秒   5分钟
	private int s_1=30;//扫描范围  单位秒  30秒
	private int s_2=60*10;//扫描范围  单位秒  10分钟
	private int s_3=60*60*2;//扫描范围  单位秒   2小时
	private int s_4=60*60*24;//扫描范围  单位秒  24小时
	
	
	//秒
	public  void DoTh_1(){
		Per(s_1); 
	}
	//分钟
	public  void DoTh_2(){
		Per(s_2);
	}
	//小时
	public  void DoTh_3(){
		Per(s_3);
	}
	//天
	public  void DoTh_4(){
		Per(s_4);
	}
	//每天晚上8点
	public void DoTh_5(){
		OnlinePicgj();
	}
	
	public void Per(int second){
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
		System.out.println("");
		System.out.println("***************************************"+sf.format(new Date())+"开始**********************************************************");
		try {
			//！！！！！先执行短信扫描提醒  再执行数据扫描！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
			SmsreCord(second);
			Updata(second);
			//代购
			DaiGou(second);
			//图片在线鉴定
			OnlinePic();
		} catch (Exception e) {
			emailSend("定时扫描出现异常", "定时扫描出现异常，请管理员尽快处理！ 异常："+e.getMessage().toString());
		}finally{
			System.out.println("***************************************"+sf.format(new Date())+"结束**********************************************************");
		}
	}
	
	public void OnlinePicgj(){
		/*************************************************************************每天晚上8点提醒专家************************************************************************************/
		//上传成功提醒专家
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		StringBuffer sql_1=new StringBuffer();
		sql_1.append(" select count(t.id) as counts,p.name as zjname,p.userid as zjuserids ,p.mobile as zjmobile   from t_online_piccoll t left join t_online_picprof p on p.userid=t.zjuserid  where 1=1");
		sql_1.append("  and t.state=1  group by zjname  having counts>=0 ");
		list=jdbcTemplate.queryForList(sql_1.toString());
		for(int i=0;i<list.size();i++){
			String con="尊敬的"+list.get(i).get("zjname")+"老师，截止至今天晚上八点，用户共提交"+list.get(i).get("counts")+"件藏品，期待您的鉴定！请登录手机鉴定页面进行查看!网址:http://admin.wswhly.com/wswhlywap/";
			String res=	smsSend(list.get(i).get("zjmobile").toString(), con);
			//if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				//jdbcTemplate.update("update t_online_piccoll set smsstate=CONCAT(smsstate,',1,')  where state=1 and zjuserid="+list.get(i).get("zjuserids"));
			//}
		}
	}
	
	//图片在线鉴定
	public void OnlinePic(){
		/*************************************************************************提醒专家************************************************************************************/
		//上传成功提醒专家
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		StringBuffer sql_1=new StringBuffer();
		sql_1.append(" select t.* , date_format(t.yjresultsdate,'%m-%d %H:%i')as sfyjresultsdate  ,p.name as zjname,p.mobile as zjmobile ,yu.level from t_online_piccoll t left join t_online_picprof p on p.userid=t.zjuserid  left join t_user yu on yu.id=t.userid  where 1=1 ");
		sql_1.append(" and level>=3  and t.state=1  and  locate(',1,',t.smsstate)<=0 ");
		list=jdbcTemplate.queryForList(sql_1.toString());
		for(int i=0;i<list.size();i++){
			String con="尊敬的"+list.get(i).get("zjname")+"老师，有用户提交了在线图片鉴定申请,藏品《"+list.get(i).get("name")+"》,请您于"+list.get(i).get("sfyjresultsdate")+"之前给出鉴定结果！";
			String res=	smsSend(list.get(i).get("zjmobile").toString(), con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_online_piccoll set smsstate=CONCAT(smsstate,',1,')  where id="+list.get(i).get("id"));
			}
		}
		//距离预计鉴定结束时间12小时未给出鉴定结果
		StringBuffer sql_2=new StringBuffer();
		sql_2.append(" select t.* , date_format(t.yjresultsdate,'%m-%d %H:%i')as sfyjresultsdate ,p.name as zjname,p.mobile as zjmobile,yu.level   from t_online_piccoll t left join t_online_picprof p on p.userid=t.zjuserid left join t_user yu on yu.id=t.userid   where 1=1 ");
		sql_2.append(" and t.state=1  and  locate(',2,',t.smsstate)<=0 and  now()>=DATE_SUB(t.yjresultsdate, INTERVAL  "+60*60*12+" second)");
		list=jdbcTemplate.queryForList(sql_2.toString());
		for(int i=0;i<list.size();i++){
			String con="尊敬的"+list.get(i).get("zjname")+"老师，藏品《"+list.get(i).get("name")+"》的鉴定时间还有12小时,请您于"+list.get(i).get("sfyjresultsdate")+"之前给出鉴定结果！";
			String res=	smsSend(list.get(i).get("zjmobile").toString(), con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_online_piccoll set smsstate=CONCAT(smsstate,',2,')  where id="+list.get(i).get("id"));
			}
		}
		//复审未通过 提醒专家
		StringBuffer sql_3=new StringBuffer();
		sql_3.append(" select t.* ,p.name as zjname,p.mobile as zjmobile,yu.level  from t_online_piccoll t left join t_online_picprof p on p.userid=t.zjuserid left join t_user yu on yu.id=t.userid  where 1=1 ");
		sql_3.append(" and t.state=9  and  locate(',3,',t.smsstate)<=0 ");
		list=jdbcTemplate.queryForList(sql_3.toString());
		for(int i=0;i<list.size();i++){
			String con="尊敬的"+list.get(i).get("zjname")+"老师，您鉴定的藏品《"+list.get(i).get("name")+"》后台复审未通过,请您重新给出鉴定结果！";
			String res=	smsSend(list.get(i).get("zjmobile").toString(), con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_online_piccoll set smsstate=CONCAT(smsstate,',3,')  where id="+list.get(i).get("id"));
			}
		}
		
		
		
		/*************************************************************************提醒用户************************************************************************************/
		//退回提醒  提醒用户
		StringBuffer sql_20=new StringBuffer();
		sql_20.append(" select t.* ,u.mobile as usermobile from t_online_piccoll t left join  t_user  u on u.id=t.userid  where 1=1  ");
		sql_20.append(" and t.state in(3,4,5)  and  locate(',20,',t.smsstate)<=0 ");
		list=jdbcTemplate.queryForList(sql_20.toString());
		for(int i=0;i<list.size();i++){
			String con="尊敬的用户，您提交的藏品《"+list.get(i).get("name")+"》，由于不符合要求被退回，请您尽快修改提交！";
			String res=	smsSend(list.get(i).get("usermobile").toString(), con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_online_piccoll set smsstate=CONCAT(smsstate,',20,')  where id="+list.get(i).get("id"));
			}
		}
		
		//退回提醒  提醒用户
		StringBuffer sql_21=new StringBuffer();
		sql_21.append(" select t.* ,u.mobile as usermobile from t_online_piccoll t left join  t_user  u on u.id=t.userid  where 1=1  ");
		sql_21.append(" and t.state =8  and  locate(',21,',t.smsstate)<=0 ");
		list=jdbcTemplate.queryForList(sql_21.toString());
		for(int i=0;i<list.size();i++){
			String con="尊敬的用户，您提交的藏品《"+list.get(i).get("name")+"》，已鉴定完成，请登陆官网查看结果！";
			String res=	smsSend(list.get(i).get("usermobile").toString(), con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_online_piccoll set smsstate=CONCAT(smsstate,',21,')  where id="+list.get(i).get("id"));
			}
		}
		
		//已送拍提醒  提醒用户
		StringBuffer sql_22=new StringBuffer();
		sql_22.append(" select t.* ,u.mobile as usermobile from t_online_piccoll t left join  t_user  u on u.id=t.userid  where 1=1  ");
		sql_22.append(" and t.state =8 and t.isshangpai in(3,4,5,6)  and  locate(',22,',t.smsstate)<=0 ");
		list=jdbcTemplate.queryForList(sql_22.toString());
		for(int i=0;i<list.size();i++){
			String con="尊敬的用户，您提交的藏品《"+list.get(i).get("name")+"》，已送拍，请登陆官网查看！";
			String res=	smsSend(list.get(i).get("usermobile").toString(), con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_online_piccoll set smsstate=CONCAT(smsstate,',22,')  where id="+list.get(i).get("id"));
			}
		}
		
		
		/*************************************************************************提醒客服************************************************************************************/
		//专家审核之后 提醒客服复审
//		StringBuffer sql_30=new StringBuffer();
//		sql_30.append(" select t.* ,u.mobile as usermobile from t_online_piccoll t left join  t_user  u on u.id=t.userid  where 1=1  ");
//		sql_30.append(" and t.state =6  and  locate(',30,',t.smsstate)<=0 ");
//		list=jdbcTemplate.queryForList(sql_30.toString());
//		for(int i=0;i<list.size();i++){
//			String con="藏品《"+list.get(i).get("name")+"》专家已审核通过，请尽快复审！";
//			String res=	smsSend(kfmo, con);
//			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
//				//发送成功 标注该提醒短信已发送
//				jdbcTemplate.update("update t_online_piccoll set smsstate=CONCAT(smsstate,',30,')  where id="+list.get(i).get("id"));
//			}
//		}
	}
	
	
	
	
	//扫描代购表  发送邮件提醒
	public void DaiGou(int second){
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		StringBuffer sql_1=new StringBuffer();
		sql_1.append(" select *  ,date_format(buytime,'%m-%d %H:%i') as fabuytime from t_daigou where smsrecord is null " );
		list=jdbcTemplate.queryForList(sql_1.toString());
		for(int i=0;i<list.size();i++){
			String con="用户："+list.get(i).get("name")+"（手机："+list.get(i).get("mobile")+"）于"+list.get(i).get("fabuytime")+"申请了,编号:"+list.get(i).get("lotsid")+"代购服务，请注意查看后台，及时跟进处理！";
			String res=	smsSend(dg_kfmo, con);
			emailSend_daigou(con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_daigou set smsrecord=1  where id="+list.get(i).get("id"));
			}
		}
	}
	
	
	//扫描数据
	public void Updata(int second){
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		
		//超过24小时未付款    系统取消订单
		StringBuffer sql_1=new StringBuffer();
		sql_1.append(" select t.* from t_baibao_transfer t" );
		sql_1.append(" where t.state=2 and  t.dddqtime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.dddqtime<now() ");
		list=jdbcTemplate.queryForList(sql_1.toString());
		for(int i=0;i<list.size();i++){
			//取消订单
			jdbcTemplate.update("update t_baibao_transfer set state=202 ,version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
		}
		
		//5天未发货 并系统已经提醒过卖家     系统取消订单
		StringBuffer sql_2=new StringBuffer();
		sql_2.append(" select t.* from t_baibao_transfer t" );
		sql_2.append(" where t.state=2 and  t.wfhtime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.wfhtime<now() and  locate(',102,',t.smsrecord)>=0");
		list=jdbcTemplate.queryForList(sql_2.toString());
		for(int i=0;i<list.size();i++){
			//取消订单
			jdbcTemplate.update("update t_baibao_transfer set state=202 ,version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
		}
		
		//发货7天之后 或者申请一次延迟一次收货后 到期  如果买家且状态还在待收货  并系统已经提醒过卖家  系统标注为买家收货
		StringBuffer sql_3=new StringBuffer();
		sql_3.append(" select t.* from t_baibao_transfer t" );
		sql_3.append(" where t.state=3 and  t.receivetime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.receivetime<now() and locate(',103,',t.smsrecord)>=0");
		list=jdbcTemplate.queryForList(sql_3.toString());
		for(int i=0;i<list.size();i++){
			//标注为买家已收货
			jdbcTemplate.update("update t_baibao_transfer set state=4 ,version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
		}
	}
	
	
	
 
	//扫描 短信提醒
	public void SmsreCord(int second){
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		/*************************************************************************提醒客服************************************************************************************/
		//1：用户申请交易中转提醒客服
		StringBuffer sql_1=new StringBuffer();
		sql_1.append(" select t.*, c.name as collrname,u.username as purchasername,date_format(t.starttime,'%m-%d %H:%i') as fstarttime  " );
		sql_1.append(" from t_baibao_transfer t " );
		sql_1.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_1.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_1.append(" where t.state=1   and  locate(',1,',t.smsrecord)<=0   ");
		list=jdbcTemplate.queryForList(sql_1.toString());
		for(int i=0;i<list.size();i++){
				String con="买家"+list.get(i).get("purchasername")+"于"+list.get(i).get("fstarttime")+"申请了‘"+list.get(i).get("collrname")+"’的交易中转！";
				String res=	smsSend(kfmo, con);
				emailSend(con);
				if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
					//发送成功 标注该提醒短信已发送
					jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',1,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
				}
		}
		//2：用户支付提醒客服
		StringBuffer sql_2=new StringBuffer();
		sql_2.append(" select t.*, c.name as collrname,u.username as purchasername,date_format(t.paytime,'%m-%d %H:%i') as fspaytime  " );
		sql_2.append(" from t_baibao_transfer t " );
		sql_2.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_2.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_2.append(" where t.state=2 and   locate(',2,',t.smsrecord)<=0");
		list=jdbcTemplate.queryForList(sql_2.toString());
		for(int i=0;i<list.size();i++){
			String con= "买家"+list.get(i).get("purchasername")+"于"+list.get(i).get("fspaytime")+"支付了‘"+list.get(i).get("collrname")+"’的交易中转！";
			String res=	smsSend(kfmo, con);
			emailSend(con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',2,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//3：卖家发货提醒客服 
		StringBuffer sql_3=new StringBuffer();
		sql_3.append(" select t.*, c.name as collrname,u.username as shoprname,date_format(t.deliverytime,'%m-%d %H:%i') as fsdeliverytime  " );
		sql_3.append(" from t_baibao_transfer t " );
		sql_3.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_3.append(" left join t_user u on u.id=t.shopuserid" );
		sql_3.append(" where t.state=3 and  locate(',3,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_3.toString());
		for(int i=0;i<list.size();i++){
			String con= "卖家"+list.get(i).get("shoprname")+"于"+list.get(i).get("fsdeliverytime")+"发货了‘"+list.get(i).get("collrname")+"’的交易中转！";
			String res=	smsSend(kfmo, con);
			emailSend(con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',3,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//4：买家申请退货提醒客服
		StringBuffer sql_4=new StringBuffer();
		sql_4.append(" select t.*, c.name as collrname,u.username as purchasername,date_format(t.applyreturntime,'%m-%d %H:%i') as fsapplyreturntime  " );
		sql_4.append(" from t_baibao_transfer t " );
		sql_4.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_4.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_4.append(" where t.state=100 and  locate(',4,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_4.toString());
		for(int i=0;i<list.size();i++){
			String con=  "买家"+list.get(i).get("purchasername")+"于"+list.get(i).get("fsapplyreturntime")+"申请了‘"+list.get(i).get("collrname")+"’的退货！";
			String res=	smsSend(kfmo, con);
			emailSend(con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',4,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		//5：申请客服介入提醒客服
		StringBuffer sql_5=new StringBuffer();
		sql_5.append(" select t.*, c.name as collrname,u.username as purchasername" );
		sql_5.append(" from t_baibao_transfer t " );
		sql_5.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_5.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_5.append(" where t.sqkfjr=1 and  locate(',5,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_5.toString());
		for(int i=0;i<list.size();i++){
			String con= "买家"+list.get(i).get("purchasername")+"申请了‘"+list.get(i).get("collrname")+"’的客服介入，进跟进该笔交易！";
			String res=	smsSend(kfmo, con);
			emailSend(con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',5,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//6：卖家5天未发货提醒客服
		StringBuffer sql_6=new StringBuffer();
		sql_6.append(" select t.*, c.name as collrname,u.username as shoprname,date_format(t.wfhtime,'%m-%d %H:%i') as fswfhtime  " );
		sql_6.append(" from t_baibao_transfer t " );
		sql_6.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_6.append(" left join t_user u on u.id=t.shopuserid" );
		sql_6.append(" where t.state=2 and  t.wfhtime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.wfhtime<now() and  locate(',6,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_6.toString());
		for(int i=0;i<list.size();i++){
			String con="卖家"+list.get(i).get("shoprname")+"5天之内未按时发货‘"+list.get(i).get("collrname")+"’系统于"+list.get(i).get("fswfhtime")+"取消了该笔交易，请注意处理该笔交易！";
			String res=	smsSend(kfmo, con);
			emailSend(con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',6,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		//7：卖家取消订单提醒
		StringBuffer sql_7=new StringBuffer();
		sql_7.append(" select t.*, c.name as collrname,u.username as shoprname" );
		sql_7.append(" from t_baibao_transfer t " );
		sql_7.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_7.append(" left join t_user u on u.id=t.shopuserid" );
		sql_7.append(" where t.state=200 and  locate(',7,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_7.toString());
		for(int i=0;i<list.size();i++){
			String con= "卖家"+list.get(i).get("shoprname")+"取消了‘"+list.get(i).get("collrname")+"’的交易中转，请注意查看该交易！";
			String res=	smsSend(kfmo, con);
			emailSend(con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',7,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		//8：买家取消订单提醒
		StringBuffer sql_8=new StringBuffer();
		sql_8.append(" select t.*, c.name as collrname,u.username as purchasername" );
		sql_8.append(" from t_baibao_transfer t " );
		sql_8.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_8.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_8.append(" where t.state=201 and  locate(',8,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_8.toString());
		for(int i=0;i<list.size();i++){
			String con= "买家"+list.get(i).get("purchasername")+"取消了‘"+list.get(i).get("collrname")+"’的交易中转，请注意查看该交易！";
			String res=	smsSend(kfmo, con);
			emailSend(con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',8,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		
		
		
		/*************************************************************************提醒买家************************************************************************************/
		
		//100：12小时未支付提醒买家 t.dddqtime
		StringBuffer sql_100=new StringBuffer();
		sql_100.append(" select t.*, c.name as collrname,date_format(t.txmjfhtime,'%Y-%m-%d %H:%i') as fstxmjfhtime,date_format(t.dddqtime,'%Y-%m-%d %H:%i') as fsdddqtime,u.mobile as  purchasermobile " );
		sql_100.append(" from t_baibao_transfer t " );
		sql_100.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_100.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_100.append(" where t.state=1 and  t.txmjfhtime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.txmjfhtime<now()   and  locate(',100,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_100.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("purchasermobile").toString(), "请您尽快支付在您【百宝箱】申请‘"+list.get(i).get("collrname")+"’的交易！如"+list.get(i).get("fsdddqtime")+"之前未支付，系统将取消该笔交易!");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',100,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		
		//101：卖家发货提醒买家
		StringBuffer sql_101=new StringBuffer();
		sql_101.append(" select t.*, c.name as collrname,u.username as shoprname,date_format(t.deliverytime,'%m-%d %H:%i') as fsdeliverytime ,up.mobile as  purchasermobile " );
		sql_101.append(" from t_baibao_transfer t " );
		sql_101.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_101.append(" left join t_user u on u.id=t.shopuserid" );
		sql_101.append(" left join t_user up on up.id=t.purchaseruserid" );
		sql_101.append(" where t.state=3 and  locate(',101,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_101.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("purchasermobile").toString(), "卖家"+list.get(i).get("shoprname")+"于"+list.get(i).get("fsdeliverytime")+"发货了‘"+list.get(i).get("collrname")+"’的交易中转！");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',101,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		
		//102：卖家5天为发货提醒
		StringBuffer sql_102=new StringBuffer();
		sql_102.append(" select t.*, c.name as collrname,u.username as shoprname,date_format(t.wfhtime,'%m-%d %H:%i') as fswfhtime  ,up.mobile as  purchasermobile" );
		sql_102.append(" from t_baibao_transfer t " );
		sql_102.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_102.append(" left join t_user u on u.id=t.shopuserid" );
		sql_102.append(" left join t_user up on up.id=t.purchaseruserid" );
		sql_102.append(" where t.state=2 and  t.wfhtime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.wfhtime<now() and  locate(',102,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_102.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("purchasermobile").toString(), "卖家"+list.get(i).get("shoprname")+"5天之内未按时发货‘"+list.get(i).get("collrname")+"’系统于"+list.get(i).get("fswfhtime")+"取消了该笔交易，请注意查看该笔交易！");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',102,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//103:确认收货时间内未确认收货提醒 提前12个小时提醒
		StringBuffer sql_103=new StringBuffer();
		sql_103.append(" select t.*, c.name as collrname,u.username as shoprname,date_format(t.receivetime,'%m-%d %H:%i') as fsreceivetime,up.mobile as  purchasermobile" );
		sql_103.append(" from t_baibao_transfer t " );
		sql_103.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_103.append(" left join t_user u on u.id=t.shopuserid" );
		sql_103.append(" left join t_user up on up.id=t.purchaseruserid" );
		sql_103.append(" where t.state=3 and  now()>=DATE_SUB(t.receivetime, INTERVAL  "+60*60*12+" second)   and  locate(',103,',t.smsrecord)<=0");//提前12个小时提醒
		 list=jdbcTemplate.queryForList(sql_103.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("purchasermobile").toString(), "藏品‘"+list.get(i).get("collrname")+"’已发货，系统将于"+list.get(i).get("fsreceivetime")+"自动确认收货，如果您未申请过延迟收货，您可以申请一次延迟收货，请注意查看该笔交易！");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',103,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		//105：卖家收到退货提醒
		StringBuffer sql_105=new StringBuffer();
		sql_105.append(" select t.*, c.name as collrname,u.username as shoprname,date_format(t.thmjqrtime,'%m-%d %H:%i') as fsthmjqrtime ,up.mobile as  purchasermobile" );
		sql_105.append(" from t_baibao_transfer t " );
		sql_105.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_105.append(" left join t_user u on u.id=t.shopuserid" );
		sql_105.append(" left join t_user up on up.id=t.purchaseruserid" );
		sql_105.append(" where t.state=104 and  t.thmjqrtime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.thmjqrtime<now() and  locate(',105,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_105.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("purchasermobile").toString(), "卖家"+list.get(i).get("shoprname").toString()+"于"+list.get(i).get("fsthmjqrtime").toString()+"已经收到了，藏品‘"+list.get(i).get("collrname")+"’的退货，请注意查看该笔交易！");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',105,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		//106：卖家取消订单提醒
		StringBuffer sql_106=new StringBuffer();
		sql_106.append(" select t.*, c.name as collrname,u.username as shoprname,up.mobile as  purchasermobile" );
		sql_106.append(" from t_baibao_transfer t " );
		sql_106.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_106.append(" left join t_user u on u.id=t.shopuserid" );
		sql_106.append(" left join t_user up on up.id=t.purchaseruserid" );
		sql_106.append(" where t.state=200 and  locate(',106,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_106.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("purchasermobile").toString(), "卖家"+list.get(i).get("shoprname")+"取消了‘"+list.get(i).get("collrname")+"’的交易中转，请注意查看该交易！");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',106,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		/*************************************************************************提醒卖家************************************************************************************/
		//200：买家支付之后提醒卖家
		StringBuffer sql_200=new StringBuffer();
		sql_200.append(" select t.*, c.name as collrname,u.username as purchasername,date_format(t.paytime,'%m-%d %H:%i') as fspaytime ,us.mobile as shopmobile " );
		sql_200.append(" from t_baibao_transfer t " );
		sql_200.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_200.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_200.append(" left join t_user us on us.id=t.shopuserid" );
		sql_200.append(" where t.state=2 and   locate(',200,',t.smsrecord)<=0");
		list=jdbcTemplate.queryForList(sql_200.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("shopmobile").toString(), "买家"+list.get(i).get("purchasername")+"于"+list.get(i).get("fspaytime")+"支付了‘"+list.get(i).get("collrname")+"’的交易中转！请您尽快发货，48小时内未发货，之后系统每天将返还买家1%的费用，5天之内未发货系统将取消该订单！");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',200,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//201：2天内发货提醒
		StringBuffer sql_201=new StringBuffer();
		sql_201.append(" select t.*, c.name as collrname,u.username as shoprname,u.mobile as shopmobile,date_format(t.dddqtime,'%Y-%m-%d %H:%i') as fsdddqtime,date_format(t.txmjfhtime,'%Y-%m-%d %H:%i') as fstxmjfhtime   " );
		sql_201.append(" from t_baibao_transfer t " );
		sql_201.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_201.append(" left join t_user u on u.id=t.shopuserid" );
		sql_201.append(" where t.state=2 and  t.dddqtime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.dddqtime<now() and  locate(',201,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_201.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("shopmobile").toString(), "由于您"+list.get(i).get("fsdddqtime")+"之前未发货,系统将返还买家1%的费用，"+list.get(i).get("fstxmjfhtime")+"之前未发货，系统每天将返还买家1%的费用，到时系统将取消该订单");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',201,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//202：5天未发货提醒
		StringBuffer sql_202=new StringBuffer();
		sql_202.append(" select t.*, c.name as collrname,u.username as shoprname,u.mobile as shopmobile,date_format(t.wfhtime,'%m-%d %H:%i') as fswfhtime  " );
		sql_202.append(" from t_baibao_transfer t " );
		sql_202.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_202.append(" left join t_user u on u.id=t.shopuserid" );
		sql_202.append(" where t.state=2 and  t.wfhtime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.wfhtime<now() and  locate(',202,',t.smsrecord)<=0");
		list=jdbcTemplate.queryForList(sql_202.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("shopmobile").toString(), "由于您5天之内未按时发货‘"+list.get(i).get("collrname")+"’系统于"+list.get(i).get("fswfhtime")+"取消了该笔交易！");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',202,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//203：买家申请延迟收货提醒卖家
		StringBuffer sql_203=new StringBuffer();
		sql_203.append(" select t.*, c.name as collrname,u.username as purchasername ,us.mobile as shopmobile" );
		sql_203.append(" from t_baibao_transfer t " );
		sql_203.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_203.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_203.append(" left join t_user us on us.id=t.shopuserid" );
		sql_203.append(" where t.state=3 and t.sqycsh=1 and  locate(',203,',t.smsrecord)<=0");
		list=jdbcTemplate.queryForList(sql_203.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("shopmobile").toString(), "买家"+list.get(i).get("purchasername")+"申请了‘"+list.get(i).get("collrname")+"’的延迟收货！");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',203,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
				
		//204：买家申请退货提醒卖家
		StringBuffer sql_204=new StringBuffer();
		sql_204.append(" select t.*, c.name as collrname,u.username as purchasername,us.mobile as shopmobile " );
		sql_204.append(" from t_baibao_transfer t " );
		sql_204.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_204.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_204.append(" left join t_user us on us.id=t.shopuserid" );
		sql_204.append(" where t.state=100   and  locate(',204,',t.smsrecord)<=0");
		list=jdbcTemplate.queryForList(sql_204.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("shopmobile").toString(), "买家"+list.get(i).get("purchasername")+"提交了‘"+list.get(i).get("collrname")+"’的退货申请！请尽快处理！");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',204,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//205：买家确认收货提醒卖家
		StringBuffer sql_205=new StringBuffer();
		sql_205.append(" select t.*, c.name as collrname,u.username as purchasername,us.mobile as shopmobile " );
		sql_205.append(" from t_baibao_transfer t " );
		sql_205.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_205.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_205.append(" left join t_user us on us.id=t.shopuserid" );
		sql_205.append(" where t.state=4   and  locate(',205,',t.smsrecord)<=0");
		list=jdbcTemplate.queryForList(sql_205.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("shopmobile").toString(), "买家"+list.get(i).get("purchasername")+"确认了‘"+list.get(i).get("collrname")+"’收货！");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',205,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//206：买家无理由退货提醒卖家
		StringBuffer sql_206=new StringBuffer();
		sql_206.append(" select t.*, c.name as collrname,u.username as purchasername,us.mobile as shopmobile " );
		sql_206.append(" from t_baibao_transfer t " );
		sql_206.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_206.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_206.append(" left join t_user us on us.id=t.shopuserid" );
		sql_206.append(" where t.state=103   and  locate(',206,',t.smsrecord)<=0");
		list=jdbcTemplate.queryForList(sql_206.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("shopmobile").toString(), "买家"+list.get(i).get("purchasername")+"无理由退货了‘"+list.get(i).get("collrname")+"’！请注意查收！");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',206,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//207：买家取消订单提醒
		StringBuffer sql_207=new StringBuffer();
		sql_207.append(" select t.*, c.name as collrname,u.username as purchasername,us.mobile as shopmobile" );
		sql_207.append(" from t_baibao_transfer t " );
		sql_207.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_207.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_207.append(" left join t_user us on us.id=t.shopuserid" );
		sql_207.append(" where t.state=201 and  locate(',207,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_207.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("shopmobile").toString(), "买家"+list.get(i).get("purchasername")+"取消了‘"+list.get(i).get("collrname")+"’的交易中转，请注意查看该交易！");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
				//发送成功 标注该提醒短信已发送
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',207,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		
	}
	
	
//	public static void main(String[] args) {
//		TimerUtil t=new TimerUtil();
//		String res=	t.smsSend("1.3261356132","aa");
//		System.out.println(res);
//		System.out.println(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0);
//	}
	
	
	/**
	 * 短信发送接口
	 */
	public   String smsSend(String mobiles,String con) {
		if(mobiles.indexOf("1.")>=0){
			String mobile1[]=mobiles.split(",");
			int state=0;
			for(int i=0;i<mobile1.length;i++){
				jdbcTemplate.update("insert into  t_sms_send (mobile,content,state,times,backtime,accountcount,createtime)values("+mobile1[i]+",'"+con+"',"+state+",1,now(),0,now())");
			}
			return "<resultcode>0</resultcode>成功";
		}
		try {
			HttpClient client = new HttpClient();

			client.getParams().setParameter(
					HttpMethodParams.HTTP_CONTENT_CHARSET, "utf-8");

			PostMethod post = new PostMethod(
					"http://115.29.44.189:8080/sms/smsInterface.do");

			NameValuePair username = new NameValuePair("username", "睿人通知");
			NameValuePair password = new NameValuePair("password", "123456");
			NameValuePair mobile = new NameValuePair("mobile",mobiles);
			NameValuePair content = new NameValuePair("content",con+"【卫视文化乐园】");

			post.setRequestBody(new NameValuePair[] { username, password,
					mobile, content });
			client.executeMethod(post);
			String result =post.getResponseBodyAsString();//"发送成功！";// 
			result=result.replaceAll(" ", "");
			System.out.println(result);
			post.releaseConnection();
			String mobile1[]=mobiles.split(",");
			int state=0;
			if(result.indexOf("<resultcode>0</resultcode>")>=0){state=0;}else{state=-1;}
			System.out.println(state);
			for(int i=0;i<mobile1.length;i++){
				jdbcTemplate.update("insert into  t_sms_send (mobile,content,state,times,backtime,accountcount,createtime)values("+mobile1[i]+",'"+con+"',"+state+",1,now(),0,now())");
			}
			System.out.println(state);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
//	public static void main(String[] args) {
//	 System.out.println("<resultcode>0</resultcode>".replaceAll(" ", ""));
//	}
	/**
	 * 邮件提醒客服
	 * @param title
	 * @param con
	 * @param emails
	 * @param filelist
	 */
	 public void emailSend(String con){
		   for(int i=0;i<kfemail.length;i++){
				boolean tag= SendMail.doSendHtmlEmail(con, con, kfemail[i], null);
		       	if(tag){
		       		System.out.println( kfemail[i]+":发送成功！");
		       		jdbcTemplate.update("insert into  t_mail_send (mailaddress,state,subject,content,createtime)values('"+kfemail[i]+"',0,'"+con+"','"+con+"',now())");
		       	}else{
		       		System.out.println( kfemail[i]+":发送失败！");
		       	}
			}
	   }
	 /**
		 * 邮件提醒客服
		 * @param title
		 * @param con
		 * @param emails
		 * @param filelist
		 */
		 public void emailSend_daigou(String con){
			   for(int i=0;i<dg_kfemail.length;i++){
					boolean tag= SendMail.doSendHtmlEmail(con, con, dg_kfemail[i], null);
			       	if(tag){
			       		System.out.println( dg_kfemail[i]+":发送成功！");
			       		jdbcTemplate.update("insert into  t_mail_send (mailaddress,state,subject,content,createtime)values('"+dg_kfemail[i]+"',0,'"+con+"','"+con+"',now())");
			       	}else{
			       		System.out.println( dg_kfemail[i]+":发送失败！");
			       	}
				}
		   }
	/**
	 * 系统日子邮件发送
	 * @param title
	 * @param con
	 * @param emails
	 * @param filelist
	 */
	 public void emailSend(String title,String con){
		 con=con.replace("'", "‘");
		//	判断s秒内是否发送过邮件  如果未发送就发送一份    避免太多邮件发送
		String sql=" select * from t_mail_send where state=0 and subject='"+title+"'   and createtime>=DATE_SUB(now(), INTERVAL  "+s+" second) and createtime<now()" ;
		if(jdbcTemplate.queryForList(sql).size()==0){
		   for(int i=0;i<adminemail.length;i++){
				boolean tag= SendMail.doSendHtmlEmail(title, con, adminemail[i], null);
		       	if(tag){
		       		System.out.println( adminemail[i]+":发送成功！");
		       		jdbcTemplate.update("insert into  t_mail_send (mailaddress,state,subject,content,createtime)values('"+adminemail[i]+"',0,'"+title+"','"+con+"',now())");
		       	}else{
		       		System.out.println( adminemail[i]+":发送失败！");
		       	}
			}
	       }else{
				System.out.println(s+"秒内已发送过邮件提醒！");
		}
	   }
	
//	用户申请交易中转提醒客服
//	String sql="select  (select name from t_baibao_collection where id=collectionid) as collrname, " +
//			"(select username from t_user where id=purchaseruserid) as purchasername,date_format(starttime,'%m-%d %H:%i') as fstarttime " +
//			"from t_baibao_transfer " +
//			"where state=1 and starttime>=DATE_SUB(now(), INTERVAL "+second+" second) and starttime<now() and smsrecord not in(1)";
//	List<Map<String,Object>> list=jdbcTemplate.queryForList(sql);
//	for(int i=0;i<list.size();i++){
//			String res=	smsSend("13261356132", "用户"+list.get(i).get("purchasername")+"于"+list.get(i).get("fstarttime")+"申请了'"+list.get(i).get("collrname")+"'的交易中转！");
//			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("成功")>=0||res.indexOf("包含屏")>=0){
//				//发送成功 标注该提醒短信已发送
//				jdbcTemplate.queryForList("update t_baibao_collection set smsrecord=CONCAT(smsrecord,',1')");
//			}
//	}

}
