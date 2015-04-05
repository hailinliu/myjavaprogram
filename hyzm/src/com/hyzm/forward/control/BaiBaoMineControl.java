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
import com.hyzm.bean.collection.CollectionListRespBean.Collection;
import com.hyzm.bean.collection.CollectionTypeRespBean.Type;
import com.hyzm.forward.service.baibao.BaiBaoAttentionService;
import com.hyzm.forward.service.baibao.BaiBaoChooseService;
import com.hyzm.forward.service.baibao.BaiBaoCollectionService;
import com.hyzm.forward.service.baibao.BaiBaoGradesService;
import com.hyzm.forward.service.baibao.BaibaoShopService;
import com.hyzm.forward.service.collection.CollectionService;
import com.hyzm.util.DateUtil;

@Controller
@Transactional
public class BaiBaoMineControl {
	@Autowired
	private BaiBaoAttentionService baibaoattentionService;//关注表
	@Autowired
	private BaiBaoChooseService baibaochooseService;//打分选项表
	@Autowired
	private BaiBaoCollectionService baibaocollectionService;//百宝藏品
	@Autowired
	private BaiBaoGradesService baibaogradesService;//打分记录表
	@Autowired
	private BaibaoShopService baibaoshopService;//店铺
	@Autowired
	private CollectionService colService;//藏分分类
	/***********************************************************************关注*************************************************************************************/
	
	/**
	 * 取消关注信息
	 */
	@RequestMapping("/BaiBaoMine_DeleteAttention")
	public void BaiBao_DeleteAttention(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			int num=baibaoattentionService.DeleteAttention(map);
			if(num==1){
				out.print("0000");
			}else{
				out.print("取消关注失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("取消关注失败！");
		}
	}
	
	/**
	 * 查询关注
	 */
	@RequestMapping("/BaiBaoMine_getAttentionForList")
	public String BaiBaoMine_getAttentionForList(HttpServletRequest request,HttpServletResponse response){
		String redirect=request.getParameter("redirect");
		try {
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> mapc=new HashMap<String, String>();
			mapc.put("userid",String.valueOf(currentsession.getId()));
			mapc.put("collectionid", request.getParameter("collectionid"));
			
			//顺序
			mapc.put("ordercolumn", request.getParameter("ordercolumn"));
			mapc.put("orderdesc", request.getParameter("orderdesc"));
			
			//分页
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {	currentPage = "1";}
			if (pageSize == null) {pageSize = "6";}
			mapc.put("pageno",String.valueOf( Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1));
			mapc.put("pagesize",pageSize);
			
			//结果
			Map<String, Object> resmap = baibaoattentionService.getAttentionForList(mapc);
			List<Map<String, Object>> list=(List<Map<String, Object>>)resmap.get("list");
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("list", list);
			request.setAttribute("count", resmap.get("count"));
			request.setAttribute("mapc", mapc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return redirect;	
	}
	
	
	
	
	/***********************************************************************商家申请*************************************************************************************/
	/**
	 * 查询是否已经申请过
	 */
	@RequestMapping("/BaiBaoMine_getShop")
	public String BaiBaoMine_getShop(HttpServletRequest request,HttpServletResponse response){
		try {
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> map=new HashMap<String, String>();
			map.put("userid", String.valueOf(currentsession.getId()));
			Map<String, Object> item = baibaoshopService.getShop(map);
			request.setAttribute("item", item);
			request.setAttribute("dosth", request.getParameter("dosth"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/mine/baibaojie/editshops";
	}
	/**
	 * 店铺信息申请
	 */
	@RequestMapping("/BaiBaoMine_AddShop")
	public void BaiBaoMine_AddShop(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			map.put("shopname", request.getParameter("shopname"));
			map.put("userid",String.valueOf(currentsession.getId()));
			map.put("mobile",currentsession.getMobile());
			map.put("weixin",request.getParameter("weixin"));
			map.put("addresscode",request.getParameter("addresscode"));
			map.put("shopaddress",request.getParameter("shopaddress"));
			map.put("desction",request.getParameter("desction"));
			map.put("weixinimg",request.getParameter("weixinimg"));
			map.put("img",request.getParameter("img"));
			map.put("mainscope",request.getParameter("mainscope"));
			map.put("manifesto",request.getParameter("manifesto"));
			if(request.getParameter("id")!=null&&request.getParameter("id")!=""&&!request.getParameter("id").equals("")){
				map.put("state","1");//正常（审核通过）
				int num=baibaoshopService.UpdateShop(map);
				if(num==1){
					out.print("0000");
				}else{
					out.print("店铺信息申请失败！");
				}
			}else{
				int num=baibaoshopService.AddShop(map);
				if(num==1){
					out.print("0000");
				}else{
					out.print("店铺信息申请失败！");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			out.print("店铺信息申请失败！");
		}
	}
	/***********************************************************************藏品信息*************************************************************************************/
	/**
	 * 添加藏品信息
	 */
	@RequestMapping("/BaiBaoMine_AddCollection")
	public String BaiBaoMine_AddCollection(HttpServletRequest request,HttpServletResponse response){
		try {
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			map.put("type", request.getParameter("type"));
			map.put("name", request.getParameter("name"));
			map.put("userid",String.valueOf(currentsession.getId()));
			map.put("note", request.getParameter("note"));
			map.put("advertisement", request.getParameter("advertisement"));
			map.put("price", request.getParameter("price"));
			map.put("imgurl", request.getParameter("imgurl"));
			map.put("isagree", request.getParameter("isagree"));
			if(request.getParameter("id")==null||request.getParameter("id")==""){
				int num=baibaocollectionService.AddCollection(map);
				if(num==1){
					request.setAttribute("messages", "<script>alert('添加成功！');</script>");
				}else{
					request.setAttribute("messages", "<script>alert('添加失败！');</script>");
				}
			}else{
				Map<String, String> maps=new HashMap<String, String>();
				maps.put("id", request.getParameter("id"));
				//根据id查询
				Map<String,Object> item=baibaocollectionService.getCollection(maps);
				//判断是否有权限
				int userid=Integer.valueOf(item.get("userid").toString().trim());
				if(item!=null&&userid==currentsession.getId()){ 
					int num=baibaocollectionService.UpdateCollection(map);
					if(num==1){
						request.setAttribute("messages", "<script>alert('修改成功！');</script>");
					}else{
						request.setAttribute("messages", "<script>alert('修改失败！');</script>");
					}
				}else{
					request.setAttribute("messages", "<script>alert('您无权限修改该藏品！');</script>");
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.BaiBaoMine_getShopList(request,response);
	}
	@RequestMapping("/gotoBaiBaoMine_UpdateCollection")
	public String gotoBaiBaoMine_UpdateCollection(HttpServletRequest request,HttpServletResponse response) {
		try {
			//查询店铺是否通过审核
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> map=new HashMap<String, String>();
			map.put("userid", String.valueOf(currentsession.getId()));
			Map<String, Object> item = baibaoshopService.getShop(map);
			if(item==null||Integer.valueOf(item.get("state").toString())!=1){
				return this.BaiBaoMine_getShop(request, response);
			}
			if(request.getParameter("id")!=null&&request.getParameter("id")!=""){
				Map<String, String> mapc=new HashMap<String, String>();
				mapc.put("id", request.getParameter("id"));
				Map<String, Object> baibao=baibaocollectionService.getCollection(mapc);
				request.setAttribute("baibao", baibao);
			}
			List<Type> list = colService.getTypeList();
			request.setAttribute("typeList", list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/mine/baibaojie/editcollection";
	}
	/**
	 * 删除下架藏品
	 */
	@RequestMapping("/BaiBaoMine_DeleteCollection")
	public String  BaiBaoMine_DeleteCollection(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			//根据id查询
			Map<String,Object> item=baibaocollectionService.getCollection(map);
			//判断是否有权限
			int userid=Integer.valueOf(item.get("userid").toString().trim());
			if(item!=null&&userid==currentsession.getId()){
				int num=baibaocollectionService.DeleteCollection(map);
				if(num==1){
					request.setAttribute("messages", "<script>alert('删除成功！');</script>");
				}else{
					request.setAttribute("messages", "<script>alert('删除失败！');</script>");
				}
			}else{
				request.setAttribute("messages", "<script>alert('您无权限下架该藏品！');</script>");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("messages", "<script>alert('删除失败！');</script>");
		}
		return this.BaiBaoMine_getShopList(request,response);
	}
	
	/**
	 * 开启交易中转
	 */
	@RequestMapping("/BaiBaoMine_OpenCollection")
	public void  BaiBaoMine_OpenCollection(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			//根据id查询
			Map<String,Object> item=baibaocollectionService.getCollection(map);
			//判断是否有权限
			int userid=Integer.valueOf(item.get("userid").toString().trim());
			if(item!=null&&userid==currentsession.getId()){
				map.put("opentrade",request.getParameter("opentrade"));//开启交易
				map.put("isagree",request.getParameter("opentrade"));//设置 交易中转
				map.put("opentradetime", DateUtil.getDateTime(new Date(), "yyyy-MM-dd hh:mm:ss"));
				int num=baibaocollectionService.UpdateCollection(map);
				if(num==1){
					out.print("0000");
				}else{
					out.print("开启失败！");
				}
			}else{
				out.print("您无权限开启该藏品的交易中转！");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			out.print("开启失败！");
		}
	}
	
	/**
	 * 根据userid查询店铺信息
	 */
	@RequestMapping("/BaiBaoMine_getShopList")
	public String BaiBaoMine_getShopList(HttpServletRequest request,HttpServletResponse response){
		try {
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> mapc=new HashMap<String, String>();
			mapc.put("userid", String.valueOf(currentsession.getId()));
			mapc.put("state", "1,2,3,4,5");
			//分页
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {	currentPage = "1";}
			if (pageSize == null) {pageSize = "6";}
			mapc.put("pageno",String.valueOf( Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1));
			mapc.put("pagesize",pageSize);
			mapc.put("orderdesc", "desc");
			//结果
			Map<String, Object> resmap = baibaocollectionService.getCollectionForList(mapc);
			
			List<Map<String, Object>> list=(List<Map<String, Object>>)resmap.get("list");
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("list", list);
			request.setAttribute("count", resmap.get("count"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/mine/baibaojie/myupload";
	}
}
