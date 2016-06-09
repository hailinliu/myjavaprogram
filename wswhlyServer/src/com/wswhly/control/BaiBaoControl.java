package com.wswhly.control;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.wswhly.dao.BaiBaoAttentionDao;
import com.wswhly.dao.BaiBaoChooseDao;
import com.wswhly.dao.BaiBaoCollectionDao;
import com.wswhly.dao.BaiBaoGradesDao;
import com.wswhly.dao.BaiBaoImgDao;
import com.wswhly.dao.BaiBaoTransferDao;
import com.wswhly.dao.BaibaoShopDao;
import com.wswhly.util.StringUtil;

/**
 * �ٱ��� control
 * @author xjt
 * @createDate 2014��12��16�� 10:45:21
 */
@Controller
@Transactional
public class BaiBaoControl {
	private static final Logger logger = Logger.getLogger(BaiBaoControl.class);
	@Autowired
	private BaiBaoAttentionDao baibaoattentiondao;
	@Autowired
	private BaiBaoChooseDao baibaochoosedao;
	@Autowired
	private BaiBaoCollectionDao baibaocollectiondao;
	@Autowired
	private BaiBaoGradesDao baibaogradesdao;
	@Autowired
	private BaiBaoImgDao baibaoimgdao;
	@Autowired
	private BaibaoShopDao baibaoshopdao;
	@Autowired
	private BaiBaoTransferDao baibaotransferdao;
	
	/******************************************************��ע********************************************************************/
	/**
	 * ��ӹ�ע
	 */
	@RequestMapping("/BaiBao_AddAttention")
	public void BaiBao_AddAttention(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", baibaoattentiondao.AddAttention(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_AddAttention Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	/**
	 * ȡ����ע
	 */
	@RequestMapping("/BaiBao_DeleteAttention")
	public void BaiBao_DeleteAttention(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", baibaoattentiondao.DeleteAttention(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_DeleteAttention Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	/**
	 * �����û�id   ���Ʒid  ���������� ��ҳ��ѯ
	 */
	@RequestMapping("/BaiBao_getAttentionForList")
	public void BaiBao_getAttentionForList(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("count", baibaoattentiondao.getAttentionForCount(where));
			data.put("list", baibaoattentiondao.getAttentionForList(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_getAttentionForList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/******************************************************���ѡ��********************************************************************/
	/**
	 * �����û�id   ���Ʒid  ���������� ��ҳ��ѯ
	 */
	@RequestMapping("/BaiBao_getChooseForList")
	public void BaiBao_getChooseForList(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("list", baibaochoosedao.getChooseForList(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_getChooseForList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/******************************************************��Ʒ********************************************************************/
	/**
	 * ��Ӳ�Ʒ
	 */
	@RequestMapping("/BaiBao_AddCollection")
	public void BaiBao_AddCollection(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", baibaocollectiondao.AddCollection(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_AddCollection Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	/**
	 * �޸Ĳ�Ʒ
	 */
	@RequestMapping("/BaiBao_UpdateCollection")
	public void BaiBao_UpdateCollection(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", baibaocollectiondao.UpdateCollection(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_UpdateCollection Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	/**
	 * ɾ����Ʒ
	 */
	@RequestMapping("/BaiBao_DeleteCollection")
	public void BaiBao_DeleteCollection(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", baibaocollectiondao.DeleteCollection(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_DeleteCollection Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	/**
	 *ר���Ƽ���Ʒ  
	 */
	@RequestMapping("/BaiBao_UpdateCollectionByZj")
	public void BaiBao_UpdateCollectionByZj(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", baibaocollectiondao.UpdateCollectionByZj(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_UpdateCollectionByZj Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	/**
	 * ���ݲ�Ʒid��ѯ��Ʒ��ϸ��Ϣ
	 */
	@RequestMapping("/BaiBao_getCollection")
	public void BaiBao_getCollection(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data=baibaocollectiondao.getCollection(where);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_getCollection Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	/**
	 * �����û�id   ���ߵ���id   ����  ��Ʒ����  ����Ʒ�۸�����   ������ת����  ������ת״̬    �Ƿ�ר���Ƽ�  ���ҵ�ַ   �ؼ��� ��Ʒ����  ��������  ��������  ��ҳ��ѯ        �������������� ������ȷ�� 
	 * ����  ����  ���ȣ��������    �������� ��������
	 */
	@RequestMapping("/BaiBao_getCollectionForList")
	public void BaiBao_getCollectionForList(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("count", baibaocollectiondao.getCollectionForCount(where));
			data.put("list", baibaocollectiondao.getCollectionForList(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_getCollectionForList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/******************************************************��ּ�¼********************************************************************/
	/**
	 * ��Ӵ�ּ�¼
	 */
	@RequestMapping("/BaiBao_AddGrades")
	public void BaiBao_AddGrades(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", baibaogradesdao.AddGrades(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_AddGrades Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	/**
	 * ��ѯ��ּ�¼       �ݶ��÷����ô�
	 */
	@RequestMapping("/BaiBao_getGradesForList")
	public void BaiBao_getGradesForList(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("list", baibaogradesdao.getGradesForList(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_getGradesForList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	/******************************************************��ƷͼƬ********************************************************************/
	/**
	 ** ���ͼƬ
	 */
	@RequestMapping("/BaiBao_AddImg")
	public void BaiBao_AddImg(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", baibaoimgdao.AddImg(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_AddImg Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	/**
	 ** ɾ��ͼƬ
	 */
	@RequestMapping("/BaiBao_DeleteImg")
	public void BaiBao_DeleteImg(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", baibaoimgdao.DeleteImg(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_DeleteImg Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	/**
	 * ��ѯͼƬ     ���ݲ�Ʒid 
	 */
	@RequestMapping("/BaiBao_getImgForList")
	public void BaiBao_getImgForList(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("list", baibaoimgdao.getImgForList(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_getImgForList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/******************************************************����********************************************************************/
	/**
	 * �̼�����
	 */
	@RequestMapping("/BaiBao_AddShop")
	public void BaiBao_AddShop(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", baibaoshopdao.AddShop(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_AddShop Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	/**
	 * �޸��̼���Ϣ
	 */
	@RequestMapping("/BaiBao_UpdateShop")
	public void BaiBao_UpdateShop(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", baibaoshopdao.UpdateShop(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_UpdateShop Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	* ����  ��Ӫ��Χ   ��ϸ��ַ   �ؼ��� ���̼�����   ��������  �ֻ���  ΢�źţ�   ��ҳ��ѯ         �������������� ������ȷ�� 
	 * ����  ����  ���ȣ��������    �������� ��������
	 * sumcollection :���ϴ���Ʒ������dscollection�������в�Ʒ������jyzzcollection:������ת�еĲ�Ʒ������yscollection����������Ʒ������cyrsgrades�����ֲ���������zjgrades�������ܼƣ�tsforums:����������cyrsforums:���۲�������, clicknum�����̵���� ����
	 */
	@RequestMapping("/BaiBao_getShopForList")
	public void BaiBao_getShopForList(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("count", baibaoshopdao.getShopForCount(where));
			data.put("list", baibaoshopdao.getShopForList(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_getShopForList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	 * ����map ��userid ��ѯ���̻�����Ϣ    ����ݵ���id��ѯ������Ϣ
	 * sumcollection :���ϴ���Ʒ���� shcollection:����в�Ʒ���� dscollection�������в�Ʒ���� jyzzcollection:������ת�еĲ�Ʒ���� yscollection����������Ʒ���� cyrsgrades�����ֲ������� zjgrades�������ܼ� tsforums:�������� cyrsforums:���۲������� 
	 * dszcyrsgrades�����������ֲ������� 	dszjgrades�������������ܼ� 	dstsforums:�������������� 	dscyrsforums:���������۲������� 	yszcyrsgrades�����������ֲ������� 	yszjgrades�������������ܼ� 	ystsforums:�������������� 	yscyrsforums:���������۲�������
	 */
	@RequestMapping("/BaiBao_getShop")
	public void BaiBao_getShop(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data=baibaoshopdao.getShop(where);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_getShop Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/******************************************************����********************************************************************/
	/**
	 * ֧������
	 */
	@RequestMapping("/BaiBao_PayTransfer")
	public void BaiBao_PayTransfer(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			//��ȡ��Ʒ�۸�
			Map<String, String> mapcoll=new HashMap<String, String>();
			mapcoll.put("id", where.get("collectionid"));
			Map<String,Object> coll=baibaocollectiondao.getCollection(mapcoll);
			//��ȡ������ת
			Map<String, String> maptrans=new HashMap<String, String>();
			maptrans.put("id", where.get("id"));
			Map<String, Object> transfermap=baibaotransferdao.getTransfer(maptrans);
			//���userid
			String purchaseruserid="";
			double ordermoney=0.00;
			//���ӻ���
			int addpoints=0;
			if(coll!=null&&transfermap!=null){
				purchaseruserid=transfermap.get("purchaseruserid").toString();//��id
				ordermoney=Double.valueOf(coll.get("price").toString());//��ȡ���׽��
				addpoints=Integer.parseInt(new java.text.DecimalFormat("0").format(ordermoney));
			}
			
			//�޸����
			Map<String,Object> whereuser=new HashMap<String, Object>(); 
			whereuser.put("userid", purchaseruserid);
			whereuser.put("money", ordermoney);
			whereuser.put("point", addpoints);
			baibaotransferdao.updatemoney(whereuser);
			
			//���Ӷ�����
			String ordernum = StringUtil.getOrdernum();//��ȡ�������
			double nowmoney = baibaotransferdao.queryMoney(Long.valueOf(purchaseruserid));//��ѯ�û�ʣ����
			//���Ӷ�����Ϣ
			Map<String,Object> orderdata=new HashMap<String, Object>();
			orderdata.put("userid", purchaseruserid);
			orderdata.put("ordernum", ordernum);
			orderdata.put("money", ordermoney);
			orderdata.put("tradetype", 5);
			orderdata.put("leftmoney", nowmoney);
			baibaotransferdao.addOrder(orderdata);//��Ӷ�����Ϣ
			
			//���ӻ�����Ϣ
			Map<String,Object> pointdata=new HashMap<String, Object>();
			pointdata.put("userid", purchaseruserid);
			pointdata.put("points", ordermoney);
			pointdata.put("tradetype", 5);
			pointdata.put("note", "�ٱ��ֲ�Ʒ������ת֧��");
			baibaotransferdao.addpoint(pointdata);
			
			//������֧��ϸ��Ϣ
			Map<String,Object> moneydata=new HashMap<String, Object>();
			moneydata.put("userid", purchaseruserid);
			moneydata.put("money", ordermoney);
			moneydata.put("tradetype", 5);
			moneydata.put("note", "�ٱ��ֲ�Ʒ������ת֧��");
			moneydata.put("leftmoney", nowmoney);
			moneydata.put("ordernum", ordernum);
			baibaotransferdao.addusermoney(moneydata);
			
			
			
			//�޸Ľ�����ת״̬��Ϣ
			where.put("payorder", ordernum);
			
			data.put("num", baibaotransferdao.UpdateTransfer(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_PayTransfer Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	/**
	 * ��ӽ�����ת��Ϣ
	 */
	@RequestMapping("/BaiBao_AddTransfer")
	public void BaiBao_AddTransfer(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", baibaotransferdao.AddTransfer(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_AddTransfer Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	/**
	 * �޸Ľ�����ת��Ϣ
	 */
	@RequestMapping("/BaiBao_UpdateTransfer")
	public void BaiBao_UpdateTransfer(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("num", baibaotransferdao.UpdateTransfer(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_UpdateTransfer Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	/**
	* ������id  ��������id  �� ��ѯ������ת   ��ҳ��ѯ
	 */
	@RequestMapping("/BaiBao_getTransferForList")
	public void BaiBao_getTransferForList(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data.put("count", baibaotransferdao.getTransferForCount(where));
			data.put("list", baibaotransferdao.getTransferForList(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_getTransferForList Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
	
	/**
	 * ��ѯ�������
	 * @param map
	 * @return
	 */
	@RequestMapping("/BaiBao_getTransfer")
	public void BaiBao_getTransfer(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data=baibaotransferdao.getTransfer(where);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		}catch (Exception e) {
			logger.error("BaiBao_getTransfer Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "δ֪����"));
		}
	}
}
