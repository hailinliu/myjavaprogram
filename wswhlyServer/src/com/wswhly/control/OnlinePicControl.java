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
 * ͼƬ����
 * @author Administrator
 *2015��4��13�� 14:22:23
 */
@Controller
@Transactional
public class OnlinePicControl {
	private static final Logger logger = Logger.getLogger(BaiBaoControl.class);
	@Autowired
	private OnlinePicDao onlinepicdao;
	@Autowired
	private TradeDao tradeDao;//ע�뽻��DAO
	/***********************************************************����Ϊ��Ʒ����*******************************************************************************/
	//���Ӳ�Ʒ
	@RequestMapping("/AddOnlinePicColl")
	public void AddOnlinePicColl(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			String userid=where.get("userid").toString();
			double nowmoney = tradeDao.queryMoney(Long.valueOf(userid));//��ѯ�û�ʣ����
			//�������
			double ordermoney=Double.valueOf(where.get("money"));
			if(nowmoney-ordermoney<0){
				data.put("num", 0);//����
			}else if(onlinepicdao.AddOnlinePicColl(where)==1){
				data.put("num", 1);
				//��ȡ�Ѿ��ϴ��ļ���
//				Map<String,String> upcountMap=new HashMap<String, String>();
//				upcountMap.put("userid", userid);
//				int upcount=onlinepicdao.getOnlinePicCollForCount(upcountMap);
				
				Map<String,Object> whereuser=new HashMap<String, Object>(); 
				whereuser.put("userid", userid);
				
				//�޸����
				if(ordermoney>0){
					whereuser.put("money", ordermoney);
					onlinepicdao.UpdateMoney(whereuser);
				}
				//���Ӷ�����
				String ordernum = StringUtil.getOrdernum();//��ȡ�������
				//���Ӷ�����Ϣ
				Map<String,Object> orderdata=new HashMap<String, Object>();
				orderdata.put("userid", userid);
				orderdata.put("ordernum", ordernum);
				orderdata.put("money", ordermoney);
				orderdata.put("tradetype", 6);
				orderdata.put("leftmoney", nowmoney-ordermoney);
				onlinepicdao.AddOrder(orderdata);//��Ӷ�����Ϣ
				
				//���ӻ�����Ϣ
				Map<String,Object> pointdata=new HashMap<String, Object>();
				pointdata.put("userid", userid);
				pointdata.put("points", ordermoney);
				pointdata.put("tradetype", 6);
				pointdata.put("note", "��Ʒ��������");
				onlinepicdao.AddPoint(pointdata);
				
				//������֧��ϸ��Ϣ
				Map<String,Object> moneydata=new HashMap<String, Object>();
				moneydata.put("userid", userid);
				moneydata.put("money", ordermoney);
				moneydata.put("tradetype", 6);
				moneydata.put("note", "��Ʒ��������");
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
	//�޸Ĳ�Ʒ
	@RequestMapping("/UpdateOnlinePicColl")
	public void UpdateOnlinePicColl(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", onlinepicdao.UpdateOnlinePicColl(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("UpdateOnlinePicColl Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	//ɾ����Ʒ
	@RequestMapping("/DeleteOnlinePicColl")
	public void DeleteOnlinePicColl(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	//��ѯ������Ʒ
	@RequestMapping("/getOnlinePicCollForMap")
	public void  getOnlinePicCollForMap(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data=onlinepicdao.getOnlinePicCollForMap(where);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getOnlinePicCollForMap Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	//��ѯ��Ʒ����
	@RequestMapping("/getOnlinePicCollForCount")
	public void getOnlinePicCollForCount(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", onlinepicdao.getOnlinePicCollForCount(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getOnlinePicCollForCount Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	//��ѯ��Ʒ�б�
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
 
	
	/***********************************************************����ΪͼƬ������Ʒ���ͷ���*******************************************************************************/
	//��ȡ��Ʒ����
	@RequestMapping("/getOnlinePicType")
	public void getOnlinePicType(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("list", onlinepicdao.getOnlinePicType(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getOnlinePicType Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	
	/***********************************************************����ΪͼƬ����ר�ҷ���*******************************************************************************/
	//��ȡר��
	@RequestMapping("/getOnlinePicProf")
	public void getOnlinePicProf(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("list", onlinepicdao.getOnlinePicProf(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("getOnlinePicProf Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
}
