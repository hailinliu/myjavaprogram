package com.hyzm.forward.control;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.bean.CurrentSession;
import com.hyzm.bean.news.NewsListRespBean.News;
import com.hyzm.forward.service.baibao.BaiBaoAttentionService;
import com.hyzm.forward.service.baibao.BaiBaoChooseService;
import com.hyzm.forward.service.baibao.BaiBaoCollectionService;
import com.hyzm.forward.service.baibao.BaiBaoGradesService;
import com.hyzm.forward.service.baibao.BaibaoShopService;
import com.hyzm.forward.service.news.NewsService;
import com.hyzm.util.PropertiesUtil;
import com.hyzm.util.RedisUtil;


@Controller
@Transactional
public class BaiBaoControl {
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

	
	/***********************************************************************关注*************************************************************************************/
	
	/**
	 * 添加关注信息
	 */
	@RequestMapping("/BaiBao_AddAttention")
	public void BaiBao_AddAttention(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> map=new HashMap<String, String>();
			map.put("userid",String.valueOf(currentsession.getId()));
			map.put("collectionid", request.getParameter("collectionid"));
			//判断用户是否已经关注过该藏品
			Map<String, Object> resmap = baibaoattentionService.getAttentionForList(map);
			if(resmap!=null&&resmap.get("count")!=null&&Integer.valueOf(resmap.get("count").toString())>0){
				out.print("您已经关注该藏品！");
			}else{
				int num=baibaoattentionService.AddAttention(map);
				if(num==1){
					out.print("0000");
				}else{
					out.print("添加关注失败！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("添加关注失败！");
		}
	}
	
	/***********************************************************************打分记录*************************************************************************************/
	
	
	
	
	
	/***********************************************************************打分选项*************************************************************************************/
	
	
	
	
	
	/***********************************************************************藏品信息*************************************************************************************/
	
	/**
	 *专家推荐藏品  
	 */
	@RequestMapping("/BaiBao_UpdateCollectionByZj")
	public void BaiBao_UpdateCollectionByZj(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			//判断当前用户id  是否是专家id
			String userid=String.valueOf(currentsession.getId());
			String [] zjuserid= PropertiesUtil.getPropertiesValue("zjuserid").split(",");
			boolean tag=false;
			for(int i=0;i<zjuserid.length;i++){
				if(userid==zjuserid[i].trim()||userid.equals(zjuserid[i].trim())){
					tag=true;
					break;
				}
			}
			if(tag){
				map.put("zjid", userid);
				int num=baibaocollectionService.UpdateCollectionByZj(map);
				if(num==1){
					out.print("0000");
				}else{
					out.print("推荐藏品失败！");
				}
			}else{
				out.print("您无推荐权限！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("推荐藏品失败！");
		}
	}
	
	/**
	 *根据id查询藏品信息
	 */
	@RequestMapping("/BaiBao_getCollection")
	public String BaiBao_getCollection(HttpServletRequest request,HttpServletResponse response){
		String redirect=request.getParameter("redirect");
		try {
			//藏品详情
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			Map<String,Object> item=baibaocollectionService.getCollection(map);
			
			Map<String, String> mapshop=new HashMap<String, String>();
			mapshop.put("userid", item.get("userid").toString());
			//根据id查询店铺详情
			Map<String,Object> itemshop=baibaoshopService.getShop(mapshop);
			request.setAttribute("item", item);
			request.setAttribute("itemshop", itemshop);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return redirect;	
	}
	
	
	/**
	 * 店铺id   或者  藏品种类  、藏品价格区间   交易中转类型  交易中转状态    是否专家推荐  卖家地址   关键字 藏品名称  店铺名称  店主名称  分页查询        。。。。。。。 条件不确定 
	 * shopname :店铺名称 fullname：店铺地址 cyrsgrades：评分参与人数 zjgrades：评分总计 tsforums:评论条数 cyrsforums:评论参与人数
	 * 根据  最新  最热（点击量）    评论排序 评分排序
	 */
	@RequestMapping("/BaiBao_getCollectionForList")
	public String BaiBao_getCollectionForList(HttpServletRequest request,HttpServletResponse response){
		String redirect=request.getParameter("redirect");
		try {
			Map<String, String> mapc=new HashMap<String, String>();
			//店铺id
			mapc.put("shopid", request.getParameter("id"));
			//藏品种类
			mapc.put("type", request.getParameter("type"));
			//开始价格	
			mapc.put("startprice", request.getParameter("startprice"));
			//结束价格
			mapc.put("endprice", request.getParameter("endprice"));
			//交易中转
			mapc.put("isagree", request.getParameter("isagree"));
			//是否专家推荐
			mapc.put("iszj", request.getParameter("iszj"));
			//状态
			mapc.put("state", request.getParameter("state"));
			//卖家地址
			mapc.put("addresscode", request.getParameter("addresscode"));
			//关键字（藏品名称  店铺名称  店主名称）
			if(request.getParameter("keyword")!=null){
				String keyword=request.getParameter("keyword");
				keyword=new String(keyword.getBytes("ISO8859-1"), "UTF-8");
				mapc.put("keyword", keyword);
			}
			
			
			//顺序
			mapc.put("ordercolumn", request.getParameter("ordercolumn"));
			mapc.put("orderdesc", request.getParameter("orderdesc"));
			
			//分页
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {	currentPage = "1";}
			if (pageSize == null) {pageSize = "10";}
			mapc.put("pageno",String.valueOf( Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1));
			mapc.put("pagesize",pageSize);
			
			//结果
			Map<String, Object> resmap = baibaocollectionService.getCollectionForList(mapc);
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
	
	
	
	
	
	
	
	
	
	
	/***********************************************************************店铺信息*************************************************************************************/
	/**
	 * 添加店铺信息
	 */
	@RequestMapping("/BaiBao_AddShop")
	public void BaiBao_AddShop(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> map=new HashMap<String, String>();
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
			int num=baibaoshopService.AddShop(map);
			if(num==1){
				out.print("0000");
			}else{
				out.print("添加店铺信息失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("添加店铺信息失败！");
		}
		
	}
	
	/**
	 * 修改店铺信息
	 */
	@RequestMapping("/BaiBao_UpdateShop")
	public void BaiBao_UpdateShop(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			Map<String,Object> item=baibaoshopService.getShop(map);
			//判断是否有权限
			if(item!=null&&(item.get("userid")==String.valueOf(currentsession.getId())||item.get("userid").equals(String.valueOf(currentsession.getId())))){
				map.put("shopname", request.getParameter("shopname"));
				map.put("weixin",request.getParameter("weixin"));
				map.put("addresscode",request.getParameter("addresscode"));
				map.put("shopaddress",request.getParameter("shopaddress"));
				map.put("desction",request.getParameter("desction"));
				map.put("weixincode",request.getParameter("weixincode"));
				map.put("img",request.getParameter("img"));
				map.put("mainscope",request.getParameter("mainscope"));
				map.put("manifesto",request.getParameter("manifesto"));
				int num=baibaoshopService.UpdateShop(map);
				if(num==1){
					out.print("0000");
				}else{
					out.print("修改店铺信息失败！");
				}
			}else{
				out.print("您无权限修改该店铺信息！");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			out.print("修改店铺信息失败！");
		}
	}
	/**
	 * 店铺详情
	 */
	@RequestMapping("/BaiBao_getShop")
	public String BaiBao_getShop(HttpServletRequest request,HttpServletResponse response){
		String redirect=request.getParameter("redirect");
		try {
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			//根据id查询店铺详情
			Map<String,Object> item=baibaoshopService.getShop(map);
			
			//根据店铺id查询该店铺下的藏品
			Map<String, String> mapc=new HashMap<String, String>();
			//店铺id
			String shopid=item.get("id").toString();
			mapc.put("shopid", shopid);
			//藏品种类
			mapc.put("type", request.getParameter("type"));
			//开始价格	
			mapc.put("startprice", request.getParameter("startprice"));
			//结束价格
			mapc.put("endprice", request.getParameter("endprice"));
			//交易中转
			mapc.put("isagree", request.getParameter("isagree"));
			//是否专家推荐
			mapc.put("iszj", request.getParameter("iszj"));
			//状态
			mapc.put("state", request.getParameter("state"));
			//卖家地址
//			mapc.put("addresscode", request.getParameter("addresscode"));
			//关键字（藏品名称  店铺名称  店主名称）
//			if(request.getParameter("keyword")!=null){
//				String keyword=request.getParameter("keyword");
//				keyword=new String(keyword.getBytes("ISO8859-1"), "UTF-8");
//				mapc.put("keyword", keyword);
//			}
			
			//顺序
			mapc.put("ordercolumn", request.getParameter("ordercolumn"));
			mapc.put("orderdesc", request.getParameter("orderdesc"));
			
			//分页
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {	currentPage = "1";}
			if (pageSize == null) {pageSize = "10";}
			mapc.put("pageno",String.valueOf( Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1));
			mapc.put("pagesize",pageSize);
			
			//结果
			Map<String, Object> resmap = baibaocollectionService.getCollectionForList(mapc);
			List<Map<String, Object>> list=(List<Map<String, Object>>)resmap.get("list");
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("list", list);
			request.setAttribute("count", resmap.get("count"));
			request.setAttribute("item", item);
			request.setAttribute("mapc", mapc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return redirect;	
	}
	/**
	 * 根据  经营范围   详细地址   关键字 （商家名称   店铺名称  手机号  微信号）   分页查询     
	 * 根据  最新  最热（点击量）    评论排序 评分排序
	 * sumcollection :共上传藏品件数，dscollection：待售中藏品件数，jyzzcollection:交易中转中的藏品件数，yscollection：已售罄藏品件数，cyrsgrades：评分参与人数，zjgrades：评分总计，tsforums:评论条数，cyrsforums:评论参与人数, clicknum：店铺点击量 最热
	 */
	@RequestMapping("/BaiBao_getShopForList")
	public String BaiBao_getShopForList(HttpServletRequest request,HttpServletResponse response){
		String redirect=request.getParameter("redirect");
		try {
			//封装查询条件
			Map<String, String> mapc=new HashMap<String, String>();
			//经营范围
			mapc.put("mainscope", request.getParameter("mainscope"));
			//卖家地址
			mapc.put("addresscode", request.getParameter("addresscode"));
			//关键字(商家名称 店铺名称  微信号   手机号)
			if(request.getParameter("keyword")!=null){
				String keyword=request.getParameter("keyword");
				keyword=new String(keyword.getBytes("ISO8859-1"), "UTF-8");
				mapc.put("keyword", keyword);
			}
			//顺序
			mapc.put("ordercolumn", request.getParameter("ordercolumn"));
			mapc.put("orderdesc", request.getParameter("orderdesc"));
			
			//分页
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {	currentPage = "1";}
			if (pageSize == null) {pageSize = "10";}
			mapc.put("pageno",String.valueOf( Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1));
			mapc.put("pagesize",pageSize);

			//结果
			Map<String, Object> resmap = baibaoshopService.getShopForList(mapc);
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
	/**
	 * 乐园藏品谁家多
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/BaiBao_getShopMaxColl")
	public void BaiBao_getShopMaxColl(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if(RedisUtil.checkVal("maxcolllist")){
				out.print(RedisUtil.get("maxcolllist"));
			}else{
				//乐园藏品谁家多
				Map<String, String> maxcollmap=new HashMap<String, String>();
				maxcollmap.put("searchtype", "lycpsjd");
				maxcollmap.put("ordercolumn", "sumcollection");
				maxcollmap.put("orderdesc", "desc");
				maxcollmap.put("pageno",String.valueOf( 1/20+1));
				maxcollmap.put("pagesize","20");
				Map<String, Object> resmaxcollmap = baibaoshopService.getShopForList(maxcollmap);
				List<Map<String, Object>> maxcolllist=(List<Map<String, Object>>)resmaxcollmap.get("list");
				//将该数据缓存60分钟
				if(!RedisUtil.checkVal("maxcolllist")){
					RedisUtil.set("maxcolllist", JSONArray.fromObject(maxcolllist), 60*60);
				}
				out.print(JSONArray.fromObject(maxcolllist));
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("1111");
		}
		
	}
	
	/**
	 * 乐园藏品评论多
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/BaiBao_getShopMaxForums")
	public void BaiBao_getShopMaxForums(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if(RedisUtil.checkVal("maxplist")){
				out.print(RedisUtil.get("maxplist"));
			}else{
				//乐园藏品评论多
				Map<String, String> maxplmap=new HashMap<String, String>();
				maxplmap.put("ordercolumn", "tsforums");
				maxplmap.put("orderdesc", "desc");
				maxplmap.put("pageno",String.valueOf( 1/8+1));
				maxplmap.put("pagesize","8");
				Map<String, Object> resmaxplmap = baibaocollectionService.getCollectionForList(maxplmap);
				List<Map<String, Object>> maxplist=(List<Map<String, Object>>)resmaxplmap.get("list");
				//将该数据缓存60分钟
				if(!RedisUtil.checkVal("maxplist")){
					RedisUtil.set("maxplist", JSONArray.fromObject(maxplist), 60*60);
				}
				out.print(JSONArray.fromObject(maxplist));
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("1111");
		}
	}

	
	/**
	 * 乐园藏品评分多
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/BaiBao_getShopMaxGrade")
	public void BaiBao_getShopMaxGrade(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if(RedisUtil.checkVal("maxgradelist")){
				out.print(RedisUtil.get("maxgradelist"));
			}else{
				int pagesize=Integer.valueOf(request.getParameter("pagesize"));
				//乐园藏品评分多
				Map<String, String> maxplmap=new HashMap<String, String>();
				maxplmap.put("ordercolumn", "zjgrades");
				maxplmap.put("orderdesc", "desc");
				maxplmap.put("pageno",String.valueOf( 1/pagesize+1));
				maxplmap.put("pagesize",String.valueOf(pagesize));
				Map<String, Object> resmaxplmap = baibaocollectionService.getCollectionForList(maxplmap);
				List<Map<String, Object>> maxplist=(List<Map<String, Object>>)resmaxplmap.get("list");
				//将该数据缓存60分钟
				if(!RedisUtil.checkVal("maxgradelist")){
					RedisUtil.set("maxgradelist", JSONArray.fromObject(maxplist), 60*60);
				}
				out.print(JSONArray.fromObject(maxplist));
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("1111");
		}
	}
	/**
	 * 随机读取藏品
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/BaiBao_getCollectionRand")
	public void BaiBao_getCollectionRand(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if(RedisUtil.checkVal("randcollectionlist")){
				out.print(RedisUtil.get("randcollectionlist"));
			}else{
				int pagesize=Integer.valueOf(request.getParameter("pagesize"));
				//随机读取藏品
				Map<String, String> maxplmap=new HashMap<String, String>();
				maxplmap.put("ordercolumn", "rand");
				maxplmap.put("orderdesc", "desc");
				maxplmap.put("pageno",String.valueOf( 1/pagesize+1));
				maxplmap.put("pagesize",String.valueOf(pagesize));
				Map<String, Object> resmaxplmap = baibaocollectionService.getCollectionForList(maxplmap);
				List<Map<String, Object>> randcollectionlist=(List<Map<String, Object>>)resmaxplmap.get("list");
				//将该数据缓存10分钟
				if(!RedisUtil.checkVal("randcollectionlist")){
					RedisUtil.set("randcollectionlist", JSONArray.fromObject(randcollectionlist), 10*60);
				}
				out.print(JSONArray.fromObject(randcollectionlist));
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("1111");
		}
	}
}
