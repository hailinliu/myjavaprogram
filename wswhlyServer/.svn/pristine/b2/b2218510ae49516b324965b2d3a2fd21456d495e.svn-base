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
 * 百宝街 control
 * @author xjt
 * @createDate 2014年12月16日 10:45:21
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
	
	/******************************************************关注********************************************************************/
	/**
	 * 添加关注
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 取消关注
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 根据用户id   或藏品id  。。。。等 分页查询
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/******************************************************打分选项********************************************************************/
	/**
	 * 根据用户id   或藏品id  。。。。等 分页查询
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/******************************************************藏品********************************************************************/
	/**
	 * 添加藏品
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 修改藏品
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 删除藏品
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 *专家推荐藏品  
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 根据藏品id查询藏品详细信息
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 根据用户id   或者店铺id   或者  藏品种类  、藏品价格区间   交易中转类型  交易中转状态    是否专家推荐  卖家地址   关键字 藏品名称  店铺名称  店主名称  分页查询        。。。。。。。 条件不确定 
	 * 根据  最新  最热（点击量）    评论排序 评分排序
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/******************************************************打分记录********************************************************************/
	/**
	 * 添加打分记录
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 查询打分记录       暂定该方法用处
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/******************************************************藏品图片********************************************************************/
	/**
	 ** 添加图片
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 ** 删除图片
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 查询图片     根据藏品id 
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/******************************************************店铺********************************************************************/
	/**
	 * 商家申请
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 修改商家信息
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	* 根据  经营范围   详细地址   关键字 （商家名称   店铺名称  手机号  微信号）   分页查询         。。。。。。。 条件不确定 
	 * 根据  最新  最热（点击量）    评论排序 评分排序
	 * sumcollection :共上传藏品件数，dscollection：待售中藏品件数，jyzzcollection:交易中转中的藏品件数，yscollection：已售罄藏品件数，cyrsgrades：评分参与人数，zjgrades：评分总计，tsforums:评论条数，cyrsforums:评论参与人数, clicknum：店铺点击量 最热
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 根据map 中userid 查询店铺基本信息    或根据店铺id查询基本信息
	 * sumcollection :共上传藏品件数 shcollection:审核中藏品件数 dscollection：待售中藏品件数 jyzzcollection:交易中转中的藏品件数 yscollection：已售罄藏品件数 cyrsgrades：评分参与人数 zjgrades：评分总计 tsforums:评论条数 cyrsforums:评论参与人数 
	 * dszcyrsgrades：待售中评分参与人数 	dszjgrades：待售中评分总计 	dstsforums:待售中评论条数 	dscyrsforums:待售中评论参与人数 	yszcyrsgrades：待售中评分参与人数 	yszjgrades：待售中评分总计 	ystsforums:待售中评论条数 	yscyrsforums:待售中评论参与人数
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/******************************************************店铺********************************************************************/
	/**
	 * 支付订单
	 */
	@RequestMapping("/BaiBao_PayTransfer")
	public void BaiBao_PayTransfer(HttpServletRequest request,HttpServletResponse response){
		Map<String,String> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			//获取藏品价格
			Map<String, String> mapcoll=new HashMap<String, String>();
			mapcoll.put("id", where.get("collectionid"));
			Map<String,Object> coll=baibaocollectiondao.getCollection(mapcoll);
			//获取交易中转
			Map<String, String> maptrans=new HashMap<String, String>();
			maptrans.put("id", where.get("id"));
			Map<String, Object> transfermap=baibaotransferdao.getTransfer(maptrans);
			//买家userid
			String purchaseruserid="";
			double ordermoney=0.00;
			//增加积分
			int addpoints=0;
			if(coll!=null&&transfermap!=null){
				purchaseruserid=transfermap.get("purchaseruserid").toString();//买方id
				ordermoney=Double.valueOf(coll.get("price").toString());//获取交易金额
				addpoints=Integer.parseInt(new java.text.DecimalFormat("0").format(ordermoney));
			}
			
			//修改余额
			Map<String,Object> whereuser=new HashMap<String, Object>(); 
			whereuser.put("userid", purchaseruserid);
			whereuser.put("money", ordermoney);
			whereuser.put("point", addpoints);
			baibaotransferdao.updatemoney(whereuser);
			
			//增加订单表
			String ordernum = StringUtil.getOrdernum();//获取订单编号
			double nowmoney = baibaotransferdao.queryMoney(Long.valueOf(purchaseruserid));//查询用户剩余金额
			//增加订单信息
			Map<String,Object> orderdata=new HashMap<String, Object>();
			orderdata.put("userid", purchaseruserid);
			orderdata.put("ordernum", ordernum);
			orderdata.put("money", ordermoney);
			orderdata.put("tradetype", 5);
			orderdata.put("leftmoney", nowmoney);
			baibaotransferdao.addOrder(orderdata);//添加订单信息
			
			//增加积分信息
			Map<String,Object> pointdata=new HashMap<String, Object>();
			pointdata.put("userid", purchaseruserid);
			pointdata.put("points", ordermoney);
			pointdata.put("tradetype", 5);
			pointdata.put("note", "百宝街藏品交易中转支付");
			baibaotransferdao.addpoint(pointdata);
			
			//增加收支明细信息
			Map<String,Object> moneydata=new HashMap<String, Object>();
			moneydata.put("userid", purchaseruserid);
			moneydata.put("money", ordermoney);
			moneydata.put("tradetype", 5);
			moneydata.put("note", "百宝街藏品交易中转支付");
			moneydata.put("leftmoney", nowmoney);
			moneydata.put("ordernum", ordernum);
			baibaotransferdao.addusermoney(moneydata);
			
			
			
			//修改交易中转状态信息
			where.put("payorder", ordernum);
			
			data.put("num", baibaotransferdao.UpdateTransfer(where));
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("BaiBao_PayTransfer Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 添加交易中转信息
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 修改交易中转信息
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	* 根据买方id  或者卖方id  等 查询交易中转   分页查询
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 查询单个结果
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
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
}
