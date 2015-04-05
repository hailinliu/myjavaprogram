package com.hyzm.forward.control;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.bean.CurrentSession;
import com.hyzm.forward.service.baibao.BaiBaoCollectionService;
import com.hyzm.forward.service.baibao.BaiBaoTransferService;
import com.hyzm.forward.service.user.UserService;
import com.hyzm.util.DateUtil;

@Controller
@Transactional
public class BaiBaoTransferControl {
	@Autowired
	private BaiBaoCollectionService baibaocollectionService;//百宝藏品
	@Autowired
	private UserService userService;
	@Autowired
	private BaiBaoTransferService baiBaoTransferService;//交易中转
	
	/**
	 * 申请交易中转
	 */
	@RequestMapping("/BaiBao_AddTransfer")
	public void BaiBao_AddTransfer(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> map=new HashMap<String, String>();
			map.put("purchaseruserid",String.valueOf(currentsession.getId()));
			map.put("shopuserid", request.getParameter("shopuserid"));
			map.put("collectionid", request.getParameter("collectionid"));
			map.put("state", "1,2,3,4,5,100,101,102,103,104,105");
			Map<String,Object> resmap=baiBaoTransferService.getTransferForList(map);
			int count=Integer.valueOf(resmap.get("count").toString());
			if(count==0){
				int num= baiBaoTransferService.AddTransfer(map);
				if(num==1){
					out.print("0000");
				}else{
					out.print("申请失败,请重试！");
				}
			}else{
				out.print("您已经申请过该藏品的交易中转！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("申请失败,请重试！");
		}
	}
	/*****!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!以下为买家!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*******/
	/**
	 *查询买到藏品---买家
	 */
	@RequestMapping("/BaiBao_getUserSellerCenter")
	public String BaiBao_getTransferUserForList(HttpServletRequest request,HttpServletResponse response){
		try {
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> map=new HashMap<String, String>();
			map.put("purchaseruserid", String.valueOf(currentsession.getId()));
			//分页
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {	currentPage = "1";}
			if (pageSize == null) {pageSize = "5";}
			map.put("pageno",String.valueOf( Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1));
			map.put("pagesize",pageSize);
			map.put("orderdesc", "desc");
			Map<String, Object> resmap= baiBaoTransferService.getTransferForList(map);
			List<Map<String, Object>> list=(List<Map<String, Object>>)resmap.get("list");
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("list", list);
			request.setAttribute("count", resmap.get("count"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/mine/baibaojie/myOrderList";
	}
	/**
	 * 跳转支付详情
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/BaiBao_getTransfer")
	public String BaiBaoMine_getShop(HttpServletRequest request,HttpServletResponse response){
		try {			
			Map<String, String> map=new HashMap<String, String>();
			map.put("id",  request.getParameter("id"));
			Map<String, Object> item = baiBaoTransferService.getTransfer(map);			
			//用户余额
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, Object> mapuser = userService.CurrentMoney(currentsession.getId());
			double yemoney=Double.valueOf(mapuser.get("money").toString());
			request.setAttribute("item", item);
			request.setAttribute("yemoney", yemoney);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/mine/baibaojie/mallConfirmOrder";
	}
	/**
	 * 验证该藏品是否已经有人提前申请了交易中转（有可能在买家申请了交易中转  未支付期间  其他人 申请了该藏品的交易中转并已支付）
	 */
	@RequestMapping("/BaiBao_CheckPayTransfer")
	public void BaiBao_CheckPayTransfer(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			//用户余额
			Map<String, Object> mapuser = userService.CurrentMoney(currentsession.getId());
			double yemoney=Double.valueOf(mapuser.get("money").toString());
			
			String collectionid= request.getParameter("collectionid");
			Map<String, String> mapcoll=new HashMap<String, String>();
			mapcoll.put("id", collectionid);
			Map<String,Object> coll=baibaocollectionService.getCollection(mapcoll);
			double price=0.00;
			if(coll!=null){
				//验证该藏品是否已经有人提前申请了交易中转（有可能在买家申请了交易中转  未支付期间  其他人 申请了该藏品的交易中转并已支付）
				if(UtilEquals(coll.get("state"),"2")){ 
					price=Double.valueOf(coll.get("price").toString());//获取交易金额
					if(yemoney-price>=0){
						out.print("0000");
					}else{
						out.print("余额不足,请您先充值然后支付！");
					}
				}else{
					out.print("其他用户已经申请了该藏品的交易中转，并已支付！");
				}
			}else{
				out.print("失败,请重试！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("失败,请重试！");
		}
	}
	/**
	 * 支付订单 交易中转
	 */
	@RequestMapping("/BaiBao_PayTransfer")
	public void BaiBao_PayTransfer(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			//用户余额
			Map<String, Object> mapuser = userService.CurrentMoney(currentsession.getId());
			double yemoney=Double.valueOf(mapuser.get("money").toString());
			
			String collectionid= request.getParameter("collectionid");
			Map<String, String> mapcoll=new HashMap<String, String>();
			mapcoll.put("id", collectionid);
			Map<String,Object> coll=baibaocollectionService.getCollection(mapcoll);
			double price=0.00;
			if(coll!=null){
				//验证该藏品是否已经有人提前申请了交易中转（有可能在买家申请了交易中转  未支付期间  其他人 申请了该藏品的交易中转并已支付）
				if(UtilEquals(coll.get("state"),"2")){
					price=Double.valueOf(coll.get("price").toString());//获取交易金额
					if(yemoney-price>=0){
						Map<String, String> map=new HashMap<String, String>();
						map.put("id", request.getParameter("id"));
						//根据id查询
						Map<String, Object> transfermap=baiBaoTransferService.getTransfer(map);
						if(transfermap!=null){
							//验证是否有权限操作   
							if(UtilEquals(transfermap.get("purchaseruserid"),String.valueOf(currentsession.getId()))&&UtilEquals(transfermap.get("collectionid"),String.valueOf(collectionid))){
								//验证该状态下是否可以操作  如果状态为待支付
								if(UtilEquals(transfermap.get("state"),"1")){
									map.put("collectionid", collectionid);
									map.put("consignee", request.getParameter("consignee"));//收件人
									map.put("consigneemobile", request.getParameter("consigneemobile"));//收件人手机
									map.put("consigneeaddress", request.getParameter("consigneeaddress"));//收件人地址
									map.put("state", "2");//设置状态为 买家已支付
									map.put("paytime", " now()");//设置支付时间
									map.put("wfhtime", " date_add(now(), INTERVAL 5 day) ");//未发货  取消时间   付款后5天未发货  取消订单
									int num= baiBaoTransferService.PayTransfer(map);
									if(num==1){
										//修改该藏品状态为  正在交易中转
										Map<String, String> mapc=new HashMap<String, String>();
										mapc.put("id", request.getParameter("collectionid"));
										mapc.put("state", "3");
										baibaocollectionService.UpdateCollection(mapc);
										out.print("0000");
									}else{
										out.print("支付失败！");
									}
								}else{
									out.print("该阶段下无法进行此操作！");
								}
							}else{
								out.print("您无权限操作！");
							}
						}else{
							out.print("失败,请重试！");
						}
					}else{
						out.print("支付失败，余额不足,请您先充值然后支付！");
					}
				}else{
					out.print("其他用户已经申请了该藏品的交易中转，并已支付！");
				}
			}else{
				out.print("失败,请重试！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("失败,请重试！");
		}
	}
	
	/***
	 * 买家申请延迟收货
	 */
	@RequestMapping("/BaiBao_PurchaserReceive")
	public void BaiBao_PurchaserReceive(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			String userid =String.valueOf(currentsession.getId());
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			//根据id查询
			Map<String, Object> transfermap=baiBaoTransferService.getTransfer(map);
			if(transfermap!=null){
				//验证是否有权限取消   
				if(UtilEquals(transfermap.get("purchaseruserid"),userid)){
					//验证该状态下是否可以操作  如果状态为已发货 并且还未申请过延迟收货
					if(UtilEquals(transfermap.get("state"),"3")&&UtilEquals(transfermap.get("sqycsh"),"0")){
						map.put("sqycsh","1" );//1：申请延迟收货
						map.put("receivetime","date_add(receivetime, INTERVAL 3 day) " );//确认收货时间往后延迟3天
						int num= baiBaoTransferService.UpdateTransfer(map);
						if(num==1){
							out.print("0000");
						}else{
							out.print("失败,请重试！");
						}
					}else{
						out.print("该阶段下无法进行此操作！");
					}
				}else{
					out.print("您无权限操作！");
				}
			}else{
				out.print("失败,请重试！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("失败,请重试！");
		}
	}
	/**
	 * 买家取消订单
	 */
	@RequestMapping("/BaiBao_PurchaserCancelOrder")
	public void BaiBao_PurchaserCancelOrder(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			String userid =String.valueOf(currentsession.getId());
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			//根据id查询
			Map<String, Object> transfermap=baiBaoTransferService.getTransfer(map);
			if(transfermap!=null){
				//验证是否有权限   
				if(UtilEquals(transfermap.get("purchaseruserid"),userid)){
					//验证该状态下是否可以操作  如果状态为待发货
					if(UtilEquals(transfermap.get("state"),"2")){
						map.put("state","201" );//设置状态
						int num= baiBaoTransferService.UpdateTransfer(map);
						if(num==1){
							out.print("0000");
						}else{
							out.print("失败,请重试！");
						}
					}else{
						out.print("该阶段下无法进行此操作！");
					}
				}else{
					out.print("您无权限操作！");
				}
			}else{
				out.print("失败,请重试！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("失败,请重试！");
		}		
	}
	/**
	 * 买家确认收货
	 */
	@RequestMapping("/BaiBao_PurchaserConfReceived")
	public void BaiBao_PurchaserConfReceived(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			String userid =String.valueOf(currentsession.getId());
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			//根据id查询
			Map<String, Object> transfermap=baiBaoTransferService.getTransfer(map);
			if(transfermap!=null){
				//验证是否有权限  
				if(UtilEquals(transfermap.get("purchaseruserid"),userid)){
					//验证该状态下是否可以操作  如果状态为3：卖家已发货
					if(UtilEquals(transfermap.get("state"),"3")){
						map.put("state","4");//设置状态
						map.put("receivetime", " now() "); 
						int num= baiBaoTransferService.UpdateTransfer(map);
						if(num==1){
							out.print("0000");
						}else{
							out.print("失败,请重试！");
						}
					}else{
						out.print("该阶段下无法进行此操作！");
					}
				}else{
					out.print("您无权限操作！");
				}
			}else{
				out.print("失败,请重试！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("失败,请重试！");
		}		
	}
	/**
	 * 买家申请退货
	 */
	@RequestMapping("/BaiBao_PurchaserReceiveResColl")
	public void BaiBao_PurchaserReceiveResColl(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			String userid =String.valueOf(currentsession.getId());
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			//根据id查询
			Map<String, Object> transfermap=baiBaoTransferService.getTransfer(map);
			if(transfermap!=null){
				//验证是否有权限 
				if(UtilEquals(transfermap.get("purchaseruserid"),userid)){
					Date receivetime=DateUtil.getDateTime(transfermap.get("sfreceivetime").toString(), "yyyy-MM-dd HH:mm");
					Date nowtime=DateUtil.getDateTime(transfermap.get("sfnowtime").toString(), "yyyy-MM-dd HH:mm");
					//在确认收货时间之前  并且则状态为3：卖家已发货 
					if(UtilEquals(transfermap.get("state"),"3")&&receivetime.getTime()>=nowtime.getTime()){
						map.put("state","100" );//设置状态
						map.put("applyreturntime", " now() ");//买家申请退货时间
						int num= baiBaoTransferService.UpdateTransfer(map);
						if(num==1){
							out.print("0000");
						}else{
							out.print("操作失败,请重试！");
						}
					}else{
						out.print("该阶段下无法进行此操作！");
					}
				}else{
					out.print("您无权限操作！");
				}
			}else{
				out.print("失败,请重试！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("失败,请重试！");
		}
	}
	
	/**
	 * 买家退货
	 */
	@RequestMapping("/BaiBao_PurchaserDelivery")
	public void BaiBao_PurchaserDelivery(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			String userid =String.valueOf(currentsession.getId());
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			//根据id查询
			Map<String, Object> transfermap=baiBaoTransferService.getTransfer(map);
			if(transfermap!=null){
				//验证是否有权限   
				if(UtilEquals(transfermap.get("purchaseruserid"),userid)){
					Date receivetime=DateUtil.getDateTime(transfermap.get("sfreceivetime").toString(), "yyyy-MM-dd HH:mm");
					Date nowtime=DateUtil.getDateTime(transfermap.get("sfnowtime").toString(), "yyyy-MM-dd HH:mm");
					//验证该状态下是否可以操作  如果状态为卖家同意退货  或者  在确认收货时间内 
					if(UtilEquals(transfermap.get("state"),"101")||(receivetime.getTime()>=nowtime.getTime()&&!UtilEquals(transfermap.get("state"),"103"))){
						map.put("thconsignee", request.getParameter("thconsignee"));//退货收件人
						map.put("thconsigneemobile", request.getParameter("thconsigneemobile"));//退货收件人手机号
						map.put("thconsigneeaddress", request.getParameter("thconsigneeaddress"));//退货收件人地址
						map.put("thkdgs", request.getParameter("thkdgs"));//快递公司
						map.put("thcouriernumber", request.getParameter("thcouriernumber"));//快递单号
						map.put("state", "103");//设置状态为103：退货买家已发货
						map.put("thfhtime", " now()");//设置退货发货时间
						int num= baiBaoTransferService.UpdateTransfer(map);
						if(num==1){
							out.print("0000");
						}else{
							out.print("失败,请重试！");
						}
					}else{
						out.print("该阶段下无法进行此操作！");
					}
				}else{
					out.print("您无权限操作！");
				}
			}else{
				out.print("失败,请重试！");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			out.print("失败,请重试！");
		}
	}
	
	
	
	
	
	/*****!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!以下为卖家!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*******/
	/**
	 *查询卖出藏品---卖家
	 */
	@RequestMapping("/BaiBao_getShopSellerCenter")
	public String BaiBao_getShopSellerCenter(HttpServletRequest request,HttpServletResponse response){
		try {
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> map=new HashMap<String, String>();
			map.put("shopuserid", String.valueOf(currentsession.getId()));
			//分页
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {	currentPage = "1";}
			if (pageSize == null) {pageSize = "5";}
			map.put("pageno",String.valueOf( Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1));
			map.put("pagesize",pageSize);
			map.put("orderdesc", "desc");
			Map<String, Object> resmap= baiBaoTransferService.getTransferForList(map);
			List<Map<String, Object>> list=(List<Map<String, Object>>)resmap.get("list");
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("list", list);
			request.setAttribute("count", resmap.get("count"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/mine/baibaojie/seller_center";
	}
	
	/**
	 * 卖家发货
	 */
	@RequestMapping("/BaiBao_ShopDelivery")
	public void BaiBao_ShopDelivery(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			String userid =String.valueOf(currentsession.getId());
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			//根据id查询
			Map<String, Object> transfermap=baiBaoTransferService.getTransfer(map);
			if(transfermap!=null){
				//验证是否有权限   
				if(UtilEquals(transfermap.get("shopuserid"),userid)){
					//验证该状态下是否可以取消订单  如果状态为待发货
					if(UtilEquals(transfermap.get("state"),"2")){
						map.put("kdgs", request.getParameter("kdgs"));//快递公司
						map.put("couriernumber", request.getParameter("couriernumber"));//快递单号
						map.put("state", "3");//设置状态为卖家发货
						map.put("deliverytime", " now()");			//设置发货时间
						map.put("receivetime", " date_add(now(), INTERVAL 7 day) ");//确认收货时间
						int num= baiBaoTransferService.UpdateTransfer(map);
						if(num==1){
							out.print("0000");
						}else{
							out.print("失败,请重试！");
						}
					}else{
						out.print("该阶段下无法进行此操作！");
					}
				}else{
					out.print("您无权限操作！");
				}
			}else{
				out.print("失败,请重试！");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			out.print("失败,请重试！");
		}
	}
	
	/**
	 * 卖家取消订单
	 */
	@RequestMapping("/BaiBao_ShopCancelOrder")
	public void BaiBao_ShopCancelOrder(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			String userid =String.valueOf(currentsession.getId());
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			//根据id查询
			Map<String, Object> transfermap=baiBaoTransferService.getTransfer(map);
			if(transfermap!=null){
				//验证是否有权限取消   
				if(UtilEquals(transfermap.get("shopuserid"),userid)){
					//验证该状态下是否可以取消订单  如果状态为待发货
					if(UtilEquals(transfermap.get("state"),"2")){
						map.put("state","200" );//设置状态
						int num= baiBaoTransferService.UpdateTransfer(map);
						if(num==1){
							out.print("0000");
						}else{
							out.print("失败,请重试！");
						}
					}else{
						out.print("该阶段下无法进行此操作！");
					}
				}else{
					out.print("您无权限操作！");
				}
			}else{
				out.print("失败,请重试！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("失败,请重试！");
		}		
	}
	
	/**
	 * 卖家是否同意退货
	 */
	@RequestMapping("/BaiBao_ShopIsfRes")
	public void BaiBao_ShopIsfRes(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			String userid =String.valueOf(currentsession.getId());
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			//根据id查询
			Map<String, Object> transfermap=baiBaoTransferService.getTransfer(map);
			if(transfermap!=null){
				//验证是否有权限   
				if(UtilEquals(transfermap.get("shopuserid"),userid)){
					//验证该状态下是否可以操作  如果状态为100:买家申请退货
					if(UtilEquals(transfermap.get("state"),"100")){
						map.put("thconsignee",request.getParameter("thconsignee"));//退货收件人
						map.put("thconsigneemobile",request.getParameter("thconsigneemobile"));//退货收件人手机号
						map.put("thconsigneeaddress",request.getParameter("thconsigneeaddress"));//退货收件人地址
						map.put("state",request.getParameter("state"));//设置状态
						map.put("shopconfirmtime", " now()");//设置  卖方确认退货时间
						int num= baiBaoTransferService.UpdateTransfer(map);
						if(num==1){
							out.print("0000");
						}else{
							out.print("失败,请重试！");
						}
					}else{
						out.print("该阶段下无法进行此操作！");
					}
				}else{
					out.print("您无权限操作！");
				}
			}else{
				out.print("失败,请重试！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("失败,请重试！");
		}		
	}
	/**
	 * 卖家确认收到退货
	 */
	@RequestMapping("/BaiBao_ShopConfRes")
	public void BaiBao_ShopConfRes(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			String userid =String.valueOf(currentsession.getId());
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			//根据id查询
			Map<String, Object> transfermap=baiBaoTransferService.getTransfer(map);
			if(transfermap!=null){
				//验证是否有权限 
				if(UtilEquals(transfermap.get("shopuserid"),userid)){
					//验证该状态下是否可以操作  如果状态为103：退货买家已发货
					if(UtilEquals(transfermap.get("state"),"103")){
						map.put("state","104");//设置状态
						map.put("thmjqrtime", " now()");//设置  卖方确认退货时间
						int num= baiBaoTransferService.UpdateTransfer(map);
						if(num==1){
							out.print("0000");
						}else{
							out.print("失败,请重试！");
						}
					}else{
						out.print("该阶段下无法进行此操作！");
					}
				}else{
					out.print("您无权限操作！");
				}
			}else{
				out.print("失败,请重试！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("失败,请重试！");
		}		
	}
	
	/**!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!公共方法!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!**/
	/**
	 * 申请客服介入
	 */
	@RequestMapping("/BaiBao_Intervention")
	public void BaiBao_Intervention(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			String userid =String.valueOf(currentsession.getId());
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			//根据id查询
			Map<String, Object> transfermap=baiBaoTransferService.getTransfer(map);
			if(transfermap!=null){
				//验证是否有权限   只有买卖双方可以申请
				if(UtilEquals(transfermap.get("shopuserid"),userid)||UtilEquals(transfermap.get("purchaseruserid"),userid)){
					map.put("sqkfjr", "1");
					int num= baiBaoTransferService.UpdateTransfer(map);
					if(num==1){
						out.print("0000");
					}else{
						out.print("失败,请重试！");
					}
				}else{
					out.print("您无权限操作！");
				}
			}else{
				out.print("失败,请重试！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("失败,请重试！");
		}		
	}
	
	/**
	 *查询详情
	 */
	@RequestMapping("/BaiBao_getTransferDetail")
	public String BaiBao_getTransferDetail(HttpServletRequest request,HttpServletResponse response){
		try {
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			String userid =String.valueOf(currentsession.getId());
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			//根据id查询
			Map<String, Object> transfermap=baiBaoTransferService.getTransfer(map);
			if(transfermap!=null){
				//验证是否有权限   只有买卖双方可以申请
				if(UtilEquals(transfermap.get("shopuserid"),userid)||UtilEquals(transfermap.get("purchaseruserid"),userid)){
					request.setAttribute("transfermap", transfermap);
					return "/mine/baibaojie/tade_item_details";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "error";
	}
	/**
	 * 判断两个值是否相等
	 * @param ob1
	 * @param ob2
	 * @return
	 */
	private boolean UtilEquals(Object ob1,Object ob2){
		if(ob1==ob2||ob1.equals(ob2)||ob1.toString()==ob2.toString()||ob1.toString().equals(ob2.toString())||Integer.valueOf(ob1.toString())==Integer.valueOf(ob2.toString())){
			return true;
		}
		return false;
	}
}
