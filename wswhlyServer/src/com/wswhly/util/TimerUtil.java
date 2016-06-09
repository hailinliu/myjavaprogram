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
 * 2015��1��8�� 10:15:49
 * @author xjt
 *0
 */
@Repository
public class TimerUtil {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private String kfmo = "13733823055,15890071113";//�ͷ��ֻ���
	private String dg_kfmo = "13733823055,15890071113,18790282811";//�����ͷ��ֻ���
	private String[] kfemail = { "529887775@qq.com", "372901428@qq.com", "1062108470@qq.com" };//�ͷ�����
	private String[] dg_kfemail = { "529887775@qq.com", "372901428@qq.com","1062108470@qq.com", "18790282811@139.com" };//�ͷ�����
	private String[] adminemail = { "xjt_job@yeah.net", "529887775@qq.com" };//ϵͳɨ������쳣  �����Ա���䷢���ʼ�
	private int s=60*5;//�ʼ�����Ƶ��  ��λ��   5����
	private int s_1=30;//ɨ�跶Χ  ��λ��  30��
	private int s_2=60*10;//ɨ�跶Χ  ��λ��  10����
	private int s_3=60*60*2;//ɨ�跶Χ  ��λ��   2Сʱ
	private int s_4=60*60*24;//ɨ�跶Χ  ��λ��  24Сʱ
	
	
	//��
	public  void DoTh_1(){
		Per(s_1); 
	}
	//����
	public  void DoTh_2(){
		Per(s_2);
	}
	//Сʱ
	public  void DoTh_3(){
		Per(s_3);
	}
	//��
	public  void DoTh_4(){
		Per(s_4);
	}
	//ÿ������8��
	public void DoTh_5(){
		OnlinePicgj();
	}
	
	public void Per(int second){
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
		System.out.println("");
		System.out.println("***************************************"+sf.format(new Date())+"��ʼ**********************************************************");
		try {
			//������������ִ�ж���ɨ������  ��ִ������ɨ�裡��������������������������������������������������������������������������
			SmsreCord(second);
			Updata(second);
			//����
			DaiGou(second);
			//ͼƬ���߼���
			OnlinePic();
		} catch (Exception e) {
			emailSend("��ʱɨ������쳣", "��ʱɨ������쳣�������Ա���촦�� �쳣��"+e.getMessage().toString());
		}finally{
			System.out.println("***************************************"+sf.format(new Date())+"����**********************************************************");
		}
	}
	
	public void OnlinePicgj(){
		/*************************************************************************ÿ������8������ר��************************************************************************************/
		//�ϴ��ɹ�����ר��
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		StringBuffer sql_1=new StringBuffer();
		sql_1.append(" select count(t.id) as counts,p.name as zjname,p.userid as zjuserids ,p.mobile as zjmobile   from t_online_piccoll t left join t_online_picprof p on p.userid=t.zjuserid  where 1=1");
		sql_1.append("  and t.state=1  group by zjname  having counts>=0 ");
		list=jdbcTemplate.queryForList(sql_1.toString());
		for(int i=0;i<list.size();i++){
			String con="�𾴵�"+list.get(i).get("zjname")+"��ʦ����ֹ���������ϰ˵㣬�û����ύ"+list.get(i).get("counts")+"����Ʒ���ڴ����ļ��������¼�ֻ�����ҳ����в鿴!��ַ:http://admin.wswhly.com/wswhlywap/";
			String res=	smsSend(list.get(i).get("zjmobile").toString(), con);
			//if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				//jdbcTemplate.update("update t_online_piccoll set smsstate=CONCAT(smsstate,',1,')  where state=1 and zjuserid="+list.get(i).get("zjuserids"));
			//}
		}
	}
	
	//ͼƬ���߼���
	public void OnlinePic(){
		/*************************************************************************����ר��************************************************************************************/
		//�ϴ��ɹ�����ר��
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		StringBuffer sql_1=new StringBuffer();
		sql_1.append(" select t.* , date_format(t.yjresultsdate,'%m-%d %H:%i')as sfyjresultsdate  ,p.name as zjname,p.mobile as zjmobile ,yu.level from t_online_piccoll t left join t_online_picprof p on p.userid=t.zjuserid  left join t_user yu on yu.id=t.userid  where 1=1 ");
		sql_1.append(" and level>=3  and t.state=1  and  locate(',1,',t.smsstate)<=0 ");
		list=jdbcTemplate.queryForList(sql_1.toString());
		for(int i=0;i<list.size();i++){
			String con="�𾴵�"+list.get(i).get("zjname")+"��ʦ�����û��ύ������ͼƬ��������,��Ʒ��"+list.get(i).get("name")+"��,������"+list.get(i).get("sfyjresultsdate")+"֮ǰ�������������";
			String res=	smsSend(list.get(i).get("zjmobile").toString(), con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_online_piccoll set smsstate=CONCAT(smsstate,',1,')  where id="+list.get(i).get("id"));
			}
		}
		//����Ԥ�Ƽ�������ʱ��12Сʱδ�����������
		StringBuffer sql_2=new StringBuffer();
		sql_2.append(" select t.* , date_format(t.yjresultsdate,'%m-%d %H:%i')as sfyjresultsdate ,p.name as zjname,p.mobile as zjmobile,yu.level   from t_online_piccoll t left join t_online_picprof p on p.userid=t.zjuserid left join t_user yu on yu.id=t.userid   where 1=1 ");
		sql_2.append(" and t.state=1  and  locate(',2,',t.smsstate)<=0 and  now()>=DATE_SUB(t.yjresultsdate, INTERVAL  "+60*60*12+" second)");
		list=jdbcTemplate.queryForList(sql_2.toString());
		for(int i=0;i<list.size();i++){
			String con="�𾴵�"+list.get(i).get("zjname")+"��ʦ����Ʒ��"+list.get(i).get("name")+"���ļ���ʱ�仹��12Сʱ,������"+list.get(i).get("sfyjresultsdate")+"֮ǰ�������������";
			String res=	smsSend(list.get(i).get("zjmobile").toString(), con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_online_piccoll set smsstate=CONCAT(smsstate,',2,')  where id="+list.get(i).get("id"));
			}
		}
		//����δͨ�� ����ר��
		StringBuffer sql_3=new StringBuffer();
		sql_3.append(" select t.* ,p.name as zjname,p.mobile as zjmobile,yu.level  from t_online_piccoll t left join t_online_picprof p on p.userid=t.zjuserid left join t_user yu on yu.id=t.userid  where 1=1 ");
		sql_3.append(" and t.state=9  and  locate(',3,',t.smsstate)<=0 ");
		list=jdbcTemplate.queryForList(sql_3.toString());
		for(int i=0;i<list.size();i++){
			String con="�𾴵�"+list.get(i).get("zjname")+"��ʦ���������Ĳ�Ʒ��"+list.get(i).get("name")+"����̨����δͨ��,�������¸������������";
			String res=	smsSend(list.get(i).get("zjmobile").toString(), con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_online_piccoll set smsstate=CONCAT(smsstate,',3,')  where id="+list.get(i).get("id"));
			}
		}
		
		
		
		/*************************************************************************�����û�************************************************************************************/
		//�˻�����  �����û�
		StringBuffer sql_20=new StringBuffer();
		sql_20.append(" select t.* ,u.mobile as usermobile from t_online_piccoll t left join  t_user  u on u.id=t.userid  where 1=1  ");
		sql_20.append(" and t.state in(3,4,5)  and  locate(',20,',t.smsstate)<=0 ");
		list=jdbcTemplate.queryForList(sql_20.toString());
		for(int i=0;i<list.size();i++){
			String con="�𾴵��û������ύ�Ĳ�Ʒ��"+list.get(i).get("name")+"�������ڲ�����Ҫ���˻أ����������޸��ύ��";
			String res=	smsSend(list.get(i).get("usermobile").toString(), con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_online_piccoll set smsstate=CONCAT(smsstate,',20,')  where id="+list.get(i).get("id"));
			}
		}
		
		//�˻�����  �����û�
		StringBuffer sql_21=new StringBuffer();
		sql_21.append(" select t.* ,u.mobile as usermobile from t_online_piccoll t left join  t_user  u on u.id=t.userid  where 1=1  ");
		sql_21.append(" and t.state =8  and  locate(',21,',t.smsstate)<=0 ");
		list=jdbcTemplate.queryForList(sql_21.toString());
		for(int i=0;i<list.size();i++){
			String con="�𾴵��û������ύ�Ĳ�Ʒ��"+list.get(i).get("name")+"�����Ѽ�����ɣ����½�����鿴�����";
			String res=	smsSend(list.get(i).get("usermobile").toString(), con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_online_piccoll set smsstate=CONCAT(smsstate,',21,')  where id="+list.get(i).get("id"));
			}
		}
		
		//����������  �����û�
		StringBuffer sql_22=new StringBuffer();
		sql_22.append(" select t.* ,u.mobile as usermobile from t_online_piccoll t left join  t_user  u on u.id=t.userid  where 1=1  ");
		sql_22.append(" and t.state =8 and t.isshangpai in(3,4,5,6)  and  locate(',22,',t.smsstate)<=0 ");
		list=jdbcTemplate.queryForList(sql_22.toString());
		for(int i=0;i<list.size();i++){
			String con="�𾴵��û������ύ�Ĳ�Ʒ��"+list.get(i).get("name")+"���������ģ����½�����鿴��";
			String res=	smsSend(list.get(i).get("usermobile").toString(), con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_online_piccoll set smsstate=CONCAT(smsstate,',22,')  where id="+list.get(i).get("id"));
			}
		}
		
		
		/*************************************************************************���ѿͷ�************************************************************************************/
		//ר�����֮�� ���ѿͷ�����
//		StringBuffer sql_30=new StringBuffer();
//		sql_30.append(" select t.* ,u.mobile as usermobile from t_online_piccoll t left join  t_user  u on u.id=t.userid  where 1=1  ");
//		sql_30.append(" and t.state =6  and  locate(',30,',t.smsstate)<=0 ");
//		list=jdbcTemplate.queryForList(sql_30.toString());
//		for(int i=0;i<list.size();i++){
//			String con="��Ʒ��"+list.get(i).get("name")+"��ר�������ͨ�����뾡�츴��";
//			String res=	smsSend(kfmo, con);
//			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
//				//���ͳɹ� ��ע�����Ѷ����ѷ���
//				jdbcTemplate.update("update t_online_piccoll set smsstate=CONCAT(smsstate,',30,')  where id="+list.get(i).get("id"));
//			}
//		}
	}
	
	
	
	
	//ɨ�������  �����ʼ�����
	public void DaiGou(int second){
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		StringBuffer sql_1=new StringBuffer();
		sql_1.append(" select *  ,date_format(buytime,'%m-%d %H:%i') as fabuytime from t_daigou where smsrecord is null " );
		list=jdbcTemplate.queryForList(sql_1.toString());
		for(int i=0;i<list.size();i++){
			String con="�û���"+list.get(i).get("name")+"���ֻ���"+list.get(i).get("mobile")+"����"+list.get(i).get("fabuytime")+"������,���:"+list.get(i).get("lotsid")+"����������ע��鿴��̨����ʱ��������";
			String res=	smsSend(dg_kfmo, con);
			emailSend_daigou(con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_daigou set smsrecord=1  where id="+list.get(i).get("id"));
			}
		}
	}
	
	
	//ɨ������
	public void Updata(int second){
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		
		//����24Сʱδ����    ϵͳȡ������
		StringBuffer sql_1=new StringBuffer();
		sql_1.append(" select t.* from t_baibao_transfer t" );
		sql_1.append(" where t.state=2 and  t.dddqtime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.dddqtime<now() ");
		list=jdbcTemplate.queryForList(sql_1.toString());
		for(int i=0;i<list.size();i++){
			//ȡ������
			jdbcTemplate.update("update t_baibao_transfer set state=202 ,version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
		}
		
		//5��δ���� ��ϵͳ�Ѿ����ѹ�����     ϵͳȡ������
		StringBuffer sql_2=new StringBuffer();
		sql_2.append(" select t.* from t_baibao_transfer t" );
		sql_2.append(" where t.state=2 and  t.wfhtime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.wfhtime<now() and  locate(',102,',t.smsrecord)>=0");
		list=jdbcTemplate.queryForList(sql_2.toString());
		for(int i=0;i<list.size();i++){
			//ȡ������
			jdbcTemplate.update("update t_baibao_transfer set state=202 ,version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
		}
		
		//����7��֮�� ��������һ���ӳ�һ���ջ��� ����  ��������״̬���ڴ��ջ�  ��ϵͳ�Ѿ����ѹ�����  ϵͳ��עΪ����ջ�
		StringBuffer sql_3=new StringBuffer();
		sql_3.append(" select t.* from t_baibao_transfer t" );
		sql_3.append(" where t.state=3 and  t.receivetime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.receivetime<now() and locate(',103,',t.smsrecord)>=0");
		list=jdbcTemplate.queryForList(sql_3.toString());
		for(int i=0;i<list.size();i++){
			//��עΪ������ջ�
			jdbcTemplate.update("update t_baibao_transfer set state=4 ,version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
		}
	}
	
	
	
 
	//ɨ�� ��������
	public void SmsreCord(int second){
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		/*************************************************************************���ѿͷ�************************************************************************************/
		//1���û����뽻����ת���ѿͷ�
		StringBuffer sql_1=new StringBuffer();
		sql_1.append(" select t.*, c.name as collrname,u.username as purchasername,date_format(t.starttime,'%m-%d %H:%i') as fstarttime  " );
		sql_1.append(" from t_baibao_transfer t " );
		sql_1.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_1.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_1.append(" where t.state=1   and  locate(',1,',t.smsrecord)<=0   ");
		list=jdbcTemplate.queryForList(sql_1.toString());
		for(int i=0;i<list.size();i++){
				String con="���"+list.get(i).get("purchasername")+"��"+list.get(i).get("fstarttime")+"�����ˡ�"+list.get(i).get("collrname")+"���Ľ�����ת��";
				String res=	smsSend(kfmo, con);
				emailSend(con);
				if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
					//���ͳɹ� ��ע�����Ѷ����ѷ���
					jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',1,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
				}
		}
		//2���û�֧�����ѿͷ�
		StringBuffer sql_2=new StringBuffer();
		sql_2.append(" select t.*, c.name as collrname,u.username as purchasername,date_format(t.paytime,'%m-%d %H:%i') as fspaytime  " );
		sql_2.append(" from t_baibao_transfer t " );
		sql_2.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_2.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_2.append(" where t.state=2 and   locate(',2,',t.smsrecord)<=0");
		list=jdbcTemplate.queryForList(sql_2.toString());
		for(int i=0;i<list.size();i++){
			String con= "���"+list.get(i).get("purchasername")+"��"+list.get(i).get("fspaytime")+"֧���ˡ�"+list.get(i).get("collrname")+"���Ľ�����ת��";
			String res=	smsSend(kfmo, con);
			emailSend(con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',2,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//3�����ҷ������ѿͷ� 
		StringBuffer sql_3=new StringBuffer();
		sql_3.append(" select t.*, c.name as collrname,u.username as shoprname,date_format(t.deliverytime,'%m-%d %H:%i') as fsdeliverytime  " );
		sql_3.append(" from t_baibao_transfer t " );
		sql_3.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_3.append(" left join t_user u on u.id=t.shopuserid" );
		sql_3.append(" where t.state=3 and  locate(',3,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_3.toString());
		for(int i=0;i<list.size();i++){
			String con= "����"+list.get(i).get("shoprname")+"��"+list.get(i).get("fsdeliverytime")+"�����ˡ�"+list.get(i).get("collrname")+"���Ľ�����ת��";
			String res=	smsSend(kfmo, con);
			emailSend(con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',3,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//4����������˻����ѿͷ�
		StringBuffer sql_4=new StringBuffer();
		sql_4.append(" select t.*, c.name as collrname,u.username as purchasername,date_format(t.applyreturntime,'%m-%d %H:%i') as fsapplyreturntime  " );
		sql_4.append(" from t_baibao_transfer t " );
		sql_4.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_4.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_4.append(" where t.state=100 and  locate(',4,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_4.toString());
		for(int i=0;i<list.size();i++){
			String con=  "���"+list.get(i).get("purchasername")+"��"+list.get(i).get("fsapplyreturntime")+"�����ˡ�"+list.get(i).get("collrname")+"�����˻���";
			String res=	smsSend(kfmo, con);
			emailSend(con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',4,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		//5������ͷ��������ѿͷ�
		StringBuffer sql_5=new StringBuffer();
		sql_5.append(" select t.*, c.name as collrname,u.username as purchasername" );
		sql_5.append(" from t_baibao_transfer t " );
		sql_5.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_5.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_5.append(" where t.sqkfjr=1 and  locate(',5,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_5.toString());
		for(int i=0;i<list.size();i++){
			String con= "���"+list.get(i).get("purchasername")+"�����ˡ�"+list.get(i).get("collrname")+"���Ŀͷ����룬�������ñʽ��ף�";
			String res=	smsSend(kfmo, con);
			emailSend(con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',5,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//6������5��δ�������ѿͷ�
		StringBuffer sql_6=new StringBuffer();
		sql_6.append(" select t.*, c.name as collrname,u.username as shoprname,date_format(t.wfhtime,'%m-%d %H:%i') as fswfhtime  " );
		sql_6.append(" from t_baibao_transfer t " );
		sql_6.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_6.append(" left join t_user u on u.id=t.shopuserid" );
		sql_6.append(" where t.state=2 and  t.wfhtime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.wfhtime<now() and  locate(',6,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_6.toString());
		for(int i=0;i<list.size();i++){
			String con="����"+list.get(i).get("shoprname")+"5��֮��δ��ʱ������"+list.get(i).get("collrname")+"��ϵͳ��"+list.get(i).get("fswfhtime")+"ȡ���˸ñʽ��ף���ע�⴦��ñʽ��ף�";
			String res=	smsSend(kfmo, con);
			emailSend(con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',6,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		//7������ȡ����������
		StringBuffer sql_7=new StringBuffer();
		sql_7.append(" select t.*, c.name as collrname,u.username as shoprname" );
		sql_7.append(" from t_baibao_transfer t " );
		sql_7.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_7.append(" left join t_user u on u.id=t.shopuserid" );
		sql_7.append(" where t.state=200 and  locate(',7,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_7.toString());
		for(int i=0;i<list.size();i++){
			String con= "����"+list.get(i).get("shoprname")+"ȡ���ˡ�"+list.get(i).get("collrname")+"���Ľ�����ת����ע��鿴�ý��ף�";
			String res=	smsSend(kfmo, con);
			emailSend(con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',7,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		//8�����ȡ����������
		StringBuffer sql_8=new StringBuffer();
		sql_8.append(" select t.*, c.name as collrname,u.username as purchasername" );
		sql_8.append(" from t_baibao_transfer t " );
		sql_8.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_8.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_8.append(" where t.state=201 and  locate(',8,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_8.toString());
		for(int i=0;i<list.size();i++){
			String con= "���"+list.get(i).get("purchasername")+"ȡ���ˡ�"+list.get(i).get("collrname")+"���Ľ�����ת����ע��鿴�ý��ף�";
			String res=	smsSend(kfmo, con);
			emailSend(con);
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',8,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		
		
		
		/*************************************************************************�������************************************************************************************/
		
		//100��12Сʱδ֧��������� t.dddqtime
		StringBuffer sql_100=new StringBuffer();
		sql_100.append(" select t.*, c.name as collrname,date_format(t.txmjfhtime,'%Y-%m-%d %H:%i') as fstxmjfhtime,date_format(t.dddqtime,'%Y-%m-%d %H:%i') as fsdddqtime,u.mobile as  purchasermobile " );
		sql_100.append(" from t_baibao_transfer t " );
		sql_100.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_100.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_100.append(" where t.state=1 and  t.txmjfhtime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.txmjfhtime<now()   and  locate(',100,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_100.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("purchasermobile").toString(), "��������֧���������ٱ��䡿���롮"+list.get(i).get("collrname")+"���Ľ��ף���"+list.get(i).get("fsdddqtime")+"֮ǰδ֧����ϵͳ��ȡ���ñʽ���!");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',100,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		
		//101�����ҷ����������
		StringBuffer sql_101=new StringBuffer();
		sql_101.append(" select t.*, c.name as collrname,u.username as shoprname,date_format(t.deliverytime,'%m-%d %H:%i') as fsdeliverytime ,up.mobile as  purchasermobile " );
		sql_101.append(" from t_baibao_transfer t " );
		sql_101.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_101.append(" left join t_user u on u.id=t.shopuserid" );
		sql_101.append(" left join t_user up on up.id=t.purchaseruserid" );
		sql_101.append(" where t.state=3 and  locate(',101,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_101.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("purchasermobile").toString(), "����"+list.get(i).get("shoprname")+"��"+list.get(i).get("fsdeliverytime")+"�����ˡ�"+list.get(i).get("collrname")+"���Ľ�����ת��");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',101,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		
		//102������5��Ϊ��������
		StringBuffer sql_102=new StringBuffer();
		sql_102.append(" select t.*, c.name as collrname,u.username as shoprname,date_format(t.wfhtime,'%m-%d %H:%i') as fswfhtime  ,up.mobile as  purchasermobile" );
		sql_102.append(" from t_baibao_transfer t " );
		sql_102.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_102.append(" left join t_user u on u.id=t.shopuserid" );
		sql_102.append(" left join t_user up on up.id=t.purchaseruserid" );
		sql_102.append(" where t.state=2 and  t.wfhtime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.wfhtime<now() and  locate(',102,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_102.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("purchasermobile").toString(), "����"+list.get(i).get("shoprname")+"5��֮��δ��ʱ������"+list.get(i).get("collrname")+"��ϵͳ��"+list.get(i).get("fswfhtime")+"ȡ���˸ñʽ��ף���ע��鿴�ñʽ��ף�");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',102,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//103:ȷ���ջ�ʱ����δȷ���ջ����� ��ǰ12��Сʱ����
		StringBuffer sql_103=new StringBuffer();
		sql_103.append(" select t.*, c.name as collrname,u.username as shoprname,date_format(t.receivetime,'%m-%d %H:%i') as fsreceivetime,up.mobile as  purchasermobile" );
		sql_103.append(" from t_baibao_transfer t " );
		sql_103.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_103.append(" left join t_user u on u.id=t.shopuserid" );
		sql_103.append(" left join t_user up on up.id=t.purchaseruserid" );
		sql_103.append(" where t.state=3 and  now()>=DATE_SUB(t.receivetime, INTERVAL  "+60*60*12+" second)   and  locate(',103,',t.smsrecord)<=0");//��ǰ12��Сʱ����
		 list=jdbcTemplate.queryForList(sql_103.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("purchasermobile").toString(), "��Ʒ��"+list.get(i).get("collrname")+"���ѷ�����ϵͳ����"+list.get(i).get("fsreceivetime")+"�Զ�ȷ���ջ��������δ������ӳ��ջ�������������һ���ӳ��ջ�����ע��鿴�ñʽ��ף�");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',103,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		//105�������յ��˻�����
		StringBuffer sql_105=new StringBuffer();
		sql_105.append(" select t.*, c.name as collrname,u.username as shoprname,date_format(t.thmjqrtime,'%m-%d %H:%i') as fsthmjqrtime ,up.mobile as  purchasermobile" );
		sql_105.append(" from t_baibao_transfer t " );
		sql_105.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_105.append(" left join t_user u on u.id=t.shopuserid" );
		sql_105.append(" left join t_user up on up.id=t.purchaseruserid" );
		sql_105.append(" where t.state=104 and  t.thmjqrtime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.thmjqrtime<now() and  locate(',105,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_105.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("purchasermobile").toString(), "����"+list.get(i).get("shoprname").toString()+"��"+list.get(i).get("fsthmjqrtime").toString()+"�Ѿ��յ��ˣ���Ʒ��"+list.get(i).get("collrname")+"�����˻�����ע��鿴�ñʽ��ף�");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',105,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		//106������ȡ����������
		StringBuffer sql_106=new StringBuffer();
		sql_106.append(" select t.*, c.name as collrname,u.username as shoprname,up.mobile as  purchasermobile" );
		sql_106.append(" from t_baibao_transfer t " );
		sql_106.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_106.append(" left join t_user u on u.id=t.shopuserid" );
		sql_106.append(" left join t_user up on up.id=t.purchaseruserid" );
		sql_106.append(" where t.state=200 and  locate(',106,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_106.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("purchasermobile").toString(), "����"+list.get(i).get("shoprname")+"ȡ���ˡ�"+list.get(i).get("collrname")+"���Ľ�����ת����ע��鿴�ý��ף�");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',106,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		/*************************************************************************��������************************************************************************************/
		//200�����֧��֮����������
		StringBuffer sql_200=new StringBuffer();
		sql_200.append(" select t.*, c.name as collrname,u.username as purchasername,date_format(t.paytime,'%m-%d %H:%i') as fspaytime ,us.mobile as shopmobile " );
		sql_200.append(" from t_baibao_transfer t " );
		sql_200.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_200.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_200.append(" left join t_user us on us.id=t.shopuserid" );
		sql_200.append(" where t.state=2 and   locate(',200,',t.smsrecord)<=0");
		list=jdbcTemplate.queryForList(sql_200.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("shopmobile").toString(), "���"+list.get(i).get("purchasername")+"��"+list.get(i).get("fspaytime")+"֧���ˡ�"+list.get(i).get("collrname")+"���Ľ�����ת���������췢����48Сʱ��δ������֮��ϵͳÿ�콫�������1%�ķ��ã�5��֮��δ����ϵͳ��ȡ���ö�����");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',200,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//201��2���ڷ�������
		StringBuffer sql_201=new StringBuffer();
		sql_201.append(" select t.*, c.name as collrname,u.username as shoprname,u.mobile as shopmobile,date_format(t.dddqtime,'%Y-%m-%d %H:%i') as fsdddqtime,date_format(t.txmjfhtime,'%Y-%m-%d %H:%i') as fstxmjfhtime   " );
		sql_201.append(" from t_baibao_transfer t " );
		sql_201.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_201.append(" left join t_user u on u.id=t.shopuserid" );
		sql_201.append(" where t.state=2 and  t.dddqtime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.dddqtime<now() and  locate(',201,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_201.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("shopmobile").toString(), "������"+list.get(i).get("fsdddqtime")+"֮ǰδ����,ϵͳ���������1%�ķ��ã�"+list.get(i).get("fstxmjfhtime")+"֮ǰδ������ϵͳÿ�콫�������1%�ķ��ã���ʱϵͳ��ȡ���ö���");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',201,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//202��5��δ��������
		StringBuffer sql_202=new StringBuffer();
		sql_202.append(" select t.*, c.name as collrname,u.username as shoprname,u.mobile as shopmobile,date_format(t.wfhtime,'%m-%d %H:%i') as fswfhtime  " );
		sql_202.append(" from t_baibao_transfer t " );
		sql_202.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_202.append(" left join t_user u on u.id=t.shopuserid" );
		sql_202.append(" where t.state=2 and  t.wfhtime>=DATE_SUB(now(), INTERVAL  "+second+" second) and t.wfhtime<now() and  locate(',202,',t.smsrecord)<=0");
		list=jdbcTemplate.queryForList(sql_202.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("shopmobile").toString(), "������5��֮��δ��ʱ������"+list.get(i).get("collrname")+"��ϵͳ��"+list.get(i).get("fswfhtime")+"ȡ���˸ñʽ��ף�");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',202,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//203����������ӳ��ջ���������
		StringBuffer sql_203=new StringBuffer();
		sql_203.append(" select t.*, c.name as collrname,u.username as purchasername ,us.mobile as shopmobile" );
		sql_203.append(" from t_baibao_transfer t " );
		sql_203.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_203.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_203.append(" left join t_user us on us.id=t.shopuserid" );
		sql_203.append(" where t.state=3 and t.sqycsh=1 and  locate(',203,',t.smsrecord)<=0");
		list=jdbcTemplate.queryForList(sql_203.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("shopmobile").toString(), "���"+list.get(i).get("purchasername")+"�����ˡ�"+list.get(i).get("collrname")+"�����ӳ��ջ���");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',203,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
				
		//204����������˻���������
		StringBuffer sql_204=new StringBuffer();
		sql_204.append(" select t.*, c.name as collrname,u.username as purchasername,us.mobile as shopmobile " );
		sql_204.append(" from t_baibao_transfer t " );
		sql_204.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_204.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_204.append(" left join t_user us on us.id=t.shopuserid" );
		sql_204.append(" where t.state=100   and  locate(',204,',t.smsrecord)<=0");
		list=jdbcTemplate.queryForList(sql_204.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("shopmobile").toString(), "���"+list.get(i).get("purchasername")+"�ύ�ˡ�"+list.get(i).get("collrname")+"�����˻����룡�뾡�촦��");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',204,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//205�����ȷ���ջ���������
		StringBuffer sql_205=new StringBuffer();
		sql_205.append(" select t.*, c.name as collrname,u.username as purchasername,us.mobile as shopmobile " );
		sql_205.append(" from t_baibao_transfer t " );
		sql_205.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_205.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_205.append(" left join t_user us on us.id=t.shopuserid" );
		sql_205.append(" where t.state=4   and  locate(',205,',t.smsrecord)<=0");
		list=jdbcTemplate.queryForList(sql_205.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("shopmobile").toString(), "���"+list.get(i).get("purchasername")+"ȷ���ˡ�"+list.get(i).get("collrname")+"���ջ���");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',205,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//206������������˻���������
		StringBuffer sql_206=new StringBuffer();
		sql_206.append(" select t.*, c.name as collrname,u.username as purchasername,us.mobile as shopmobile " );
		sql_206.append(" from t_baibao_transfer t " );
		sql_206.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_206.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_206.append(" left join t_user us on us.id=t.shopuserid" );
		sql_206.append(" where t.state=103   and  locate(',206,',t.smsrecord)<=0");
		list=jdbcTemplate.queryForList(sql_206.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("shopmobile").toString(), "���"+list.get(i).get("purchasername")+"�������˻��ˡ�"+list.get(i).get("collrname")+"������ע����գ�");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',206,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		//207�����ȡ����������
		StringBuffer sql_207=new StringBuffer();
		sql_207.append(" select t.*, c.name as collrname,u.username as purchasername,us.mobile as shopmobile" );
		sql_207.append(" from t_baibao_transfer t " );
		sql_207.append(" left join t_baibao_collection c on c.id=t.collectionid" );
		sql_207.append(" left join t_user u on u.id=t.purchaseruserid" );
		sql_207.append(" left join t_user us on us.id=t.shopuserid" );
		sql_207.append(" where t.state=201 and  locate(',207,',t.smsrecord)<=0");
		 list=jdbcTemplate.queryForList(sql_207.toString());
		for(int i=0;i<list.size();i++){
			String res=	smsSend(list.get(i).get("shopmobile").toString(), "���"+list.get(i).get("purchasername")+"ȡ���ˡ�"+list.get(i).get("collrname")+"���Ľ�����ת����ע��鿴�ý��ף�");
			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
				//���ͳɹ� ��ע�����Ѷ����ѷ���
				jdbcTemplate.update("update t_baibao_transfer set smsrecord=CONCAT(smsrecord,',207,'),version=version+1 where id="+list.get(i).get("id")+" and version="+list.get(i).get("version"));
			}
		}
		
		
	}
	
	
//	public static void main(String[] args) {
//		TimerUtil t=new TimerUtil();
//		String res=	t.smsSend("1.3261356132","aa");
//		System.out.println(res);
//		System.out.println(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0);
//	}
	
	
	/**
	 * ���ŷ��ͽӿ�
	 */
	public   String smsSend(String mobiles,String con) {
		if(mobiles.indexOf("1.")>=0){
			String mobile1[]=mobiles.split(",");
			int state=0;
			for(int i=0;i<mobile1.length;i++){
				jdbcTemplate.update("insert into  t_sms_send (mobile,content,state,times,backtime,accountcount,createtime)values("+mobile1[i]+",'"+con+"',"+state+",1,now(),0,now())");
			}
			return "<resultcode>0</resultcode>�ɹ�";
		}
		try {
			HttpClient client = new HttpClient();

			client.getParams().setParameter(
					HttpMethodParams.HTTP_CONTENT_CHARSET, "utf-8");

			PostMethod post = new PostMethod(
					"http://115.29.44.189:8080/sms/smsInterface.do");

			NameValuePair username = new NameValuePair("username", "���֪ͨ");
			NameValuePair password = new NameValuePair("password", "123456");
			NameValuePair mobile = new NameValuePair("mobile",mobiles);
			NameValuePair content = new NameValuePair("content",con+"�������Ļ���԰��");

			post.setRequestBody(new NameValuePair[] { username, password,
					mobile, content });
			client.executeMethod(post);
			String result =post.getResponseBodyAsString();//"���ͳɹ���";// 
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
	 * �ʼ����ѿͷ�
	 * @param title
	 * @param con
	 * @param emails
	 * @param filelist
	 */
	 public void emailSend(String con){
		   for(int i=0;i<kfemail.length;i++){
				boolean tag= SendMail.doSendHtmlEmail(con, con, kfemail[i], null);
		       	if(tag){
		       		System.out.println( kfemail[i]+":���ͳɹ���");
		       		jdbcTemplate.update("insert into  t_mail_send (mailaddress,state,subject,content,createtime)values('"+kfemail[i]+"',0,'"+con+"','"+con+"',now())");
		       	}else{
		       		System.out.println( kfemail[i]+":����ʧ�ܣ�");
		       	}
			}
	   }
	 /**
		 * �ʼ����ѿͷ�
		 * @param title
		 * @param con
		 * @param emails
		 * @param filelist
		 */
		 public void emailSend_daigou(String con){
			   for(int i=0;i<dg_kfemail.length;i++){
					boolean tag= SendMail.doSendHtmlEmail(con, con, dg_kfemail[i], null);
			       	if(tag){
			       		System.out.println( dg_kfemail[i]+":���ͳɹ���");
			       		jdbcTemplate.update("insert into  t_mail_send (mailaddress,state,subject,content,createtime)values('"+dg_kfemail[i]+"',0,'"+con+"','"+con+"',now())");
			       	}else{
			       		System.out.println( dg_kfemail[i]+":����ʧ�ܣ�");
			       	}
				}
		   }
	/**
	 * ϵͳ�����ʼ�����
	 * @param title
	 * @param con
	 * @param emails
	 * @param filelist
	 */
	 public void emailSend(String title,String con){
		 con=con.replace("'", "��");
		//	�ж�s�����Ƿ��͹��ʼ�  ���δ���;ͷ���һ��    ����̫���ʼ�����
		String sql=" select * from t_mail_send where state=0 and subject='"+title+"'   and createtime>=DATE_SUB(now(), INTERVAL  "+s+" second) and createtime<now()" ;
		if(jdbcTemplate.queryForList(sql).size()==0){
		   for(int i=0;i<adminemail.length;i++){
				boolean tag= SendMail.doSendHtmlEmail(title, con, adminemail[i], null);
		       	if(tag){
		       		System.out.println( adminemail[i]+":���ͳɹ���");
		       		jdbcTemplate.update("insert into  t_mail_send (mailaddress,state,subject,content,createtime)values('"+adminemail[i]+"',0,'"+title+"','"+con+"',now())");
		       	}else{
		       		System.out.println( adminemail[i]+":����ʧ�ܣ�");
		       	}
			}
	       }else{
				System.out.println(s+"�����ѷ��͹��ʼ����ѣ�");
		}
	   }
	
//	�û����뽻����ת���ѿͷ�
//	String sql="select  (select name from t_baibao_collection where id=collectionid) as collrname, " +
//			"(select username from t_user where id=purchaseruserid) as purchasername,date_format(starttime,'%m-%d %H:%i') as fstarttime " +
//			"from t_baibao_transfer " +
//			"where state=1 and starttime>=DATE_SUB(now(), INTERVAL "+second+" second) and starttime<now() and smsrecord not in(1)";
//	List<Map<String,Object>> list=jdbcTemplate.queryForList(sql);
//	for(int i=0;i<list.size();i++){
//			String res=	smsSend("13261356132", "�û�"+list.get(i).get("purchasername")+"��"+list.get(i).get("fstarttime")+"������'"+list.get(i).get("collrname")+"'�Ľ�����ת��");
//			if(res.indexOf("<resultcode>0</resultcode>")>=0||res.indexOf("�ɹ�")>=0||res.indexOf("������")>=0){
//				//���ͳɹ� ��ע�����Ѷ����ѷ���
//				jdbcTemplate.queryForList("update t_baibao_collection set smsrecord=CONCAT(smsrecord,',1')");
//			}
//	}

}
