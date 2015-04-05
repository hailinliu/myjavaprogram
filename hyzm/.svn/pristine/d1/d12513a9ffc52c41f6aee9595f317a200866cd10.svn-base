package com.hyzm.forward.control;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.text.StrBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.bean.forums.ForumsListRespBean.Forums;
import com.hyzm.forward.service.flagshop.FlagShopBaseInfoService;
import com.hyzm.forward.service.forums.ForumsService;
import com.hyzm.util.StringUtil;

@Controller
@RequestMapping("/flagshopbaseinfo")
public class FlagShopBaseInfoControl {
	@Autowired
	FlagShopBaseInfoService  service;
	@Autowired
	private ForumsService forumsService;
	private static String zixun="214";
	private static String pic="215";
	private static String video="216"; 
	/**
	 * 旗舰商家列表
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/getFlagShopBaseInfoList")
	public String getFlagShopBaseInfoList(HttpServletRequest request,HttpServletResponse response){
		String name=request.getParameter("name");
		String type=request.getParameter("type");
		String currentPage = request.getParameter("pager.offset");
		String pageSize = request.getParameter("pageSize");
		if (currentPage==null || "0".equals(currentPage)) {
			currentPage = "1";
		}
		if (pageSize == null) {
			pageSize = "9";
		}
		if(name==null||name=="null"){
			name="";
		}
		if(type==null||type=="null"){
			type="";
		}
		Map<String, Object> map=service.queryFlagShopBaseInfoList(Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize), name, type);
		List<Map<String, Object>> list=(List<Map<String, Object>>) map.get("list");
		for(int i=0;i<list.size();i++){
			try {
				Map<String, Object> newsmap=service.queryFlagShopBaseInfoNews(1, 3, list.get(i).get("id").toString(), "","");
				List<Map<String, Object>> newslist=(List<Map<String, Object>>) newsmap.get("list");
				list.get(i).put("new", newslist);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		request.setAttribute("count", map.get("count"));
		request.setAttribute("list", list);
		request.setAttribute("pageSize", pageSize);
		return "flagship/qjsj_list";
	}
	/**
	 * 获取旗舰商家信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/getFlagShopBaseInfo")
	public String getFlagShopBaseInfo(HttpServletRequest request,HttpServletResponse response){
		String id=request.getParameter("id");
		try {
			//获取旗舰商家基本信息
			Map<String, Object> baseinfo=(Map<String, Object>) service.queryFlagShopBaseInfoById(id);
			//获取该商家推荐信息
			
			//获取推荐新闻前6条信息
			Map<String, Object> tuijianinfo=service.queryFlagShopBaseInfoNews(1, 6, id, "","1");
			
			
			//获取新闻前6条信息
			Map<String, Object> newinfo=service.queryFlagShopBaseInfoNews(1, 6, id, zixun,"");//t_newstype表  214 代表商家资讯
			//获取图展前六条信息
			Map<String, Object> picinfo=(Map<String, Object>)service.queryFlagShopBaseInfoNews(1, 6, id, pic,"");//t_newstype表  215 代表商家图展
			
			//获取视频前6条信息
			Map<String, Object> voidinfo=(Map<String, Object>)service.queryFlagShopBaseInfoNews(1, 5, id, video,"");//t_newstype表  216 代表商家视频
			
			request.setAttribute("baseinfo", baseinfo);
			request.setAttribute("tuijianinfo", tuijianinfo.get("list"));
			request.setAttribute("newinfo", newinfo.get("list"));
			request.setAttribute("picinfo", picinfo.get("list"));
			request.setAttribute("voidinfo", voidinfo.get("list"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "flagship/qjsj_info";
	}
	/**
	 * 获取旗舰商家信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/getFlagShopaboutus")
	public String getFlagShopaboutus(HttpServletRequest request,HttpServletResponse response){
		String id=request.getParameter("id");
		try {
			//获取旗舰商家基本信息
			Map<String, Object> baseinfo=(Map<String, Object>) service.queryFlagShopBaseInfoById(id);
			//获取前6条信息
			Map<String, Object> topinfo=service.queryFlagShopBaseInfoNews(1, 6, id, "","");
			request.setAttribute("baseinfo", baseinfo);
			request.setAttribute("topinfo", topinfo.get("list"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "flagship/qjsj_aboutus";
	}
	/**
	 * 获取旗舰商家动态
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/getFlagShopdynamic")
	public String getFlagShopdynamic(HttpServletRequest request,HttpServletResponse response){
		String id=request.getParameter("id");
		String currentPage = request.getParameter("pager.offset");
		String pageSize = request.getParameter("pageSize");
		if (currentPage==null || "0".equals(currentPage)) {
			currentPage = "1";
		}
		if (pageSize == null) {
			pageSize = "9";
		}
		try {
			//获取旗舰商家基本信息
			Map<String, Object> baseinfo=(Map<String, Object>) service.queryFlagShopBaseInfoById(id);
			//获取前6条信息
			Map<String, Object> dynamicinfo=service.queryFlagShopBaseInfoNews(Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize), id, zixun,"");
			request.setAttribute("baseinfo", baseinfo);
			request.setAttribute("list", dynamicinfo.get("list"));
			request.setAttribute("count", dynamicinfo.get("count"));
			request.setAttribute("pageSize", pageSize);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "flagship/qjsj_dynamic";
	}
	/**
	 * 获取旗舰商家图展
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/getFlagShopPic")
	public String getFlagShopPic(HttpServletRequest request,HttpServletResponse response){
		String id=request.getParameter("id");
		String currentPage = request.getParameter("pager.offset");
		String pageSize = request.getParameter("pageSize");
		if (currentPage==null || "0".equals(currentPage)) {
			currentPage = "1";
		}
		if (pageSize == null) {
			pageSize = "99999999";
		}
		try {
			//获取旗舰商家基本信息
			Map<String, Object> baseinfo=(Map<String, Object>) service.queryFlagShopBaseInfoById(id);
			//获取前6条信息
			Map<String, Object> picinfo=service.queryFlagShopBaseInfoNews(Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize), id, pic,"");
			
			
			List<Map<String, Object>> list= (List<Map<String, Object>>) picinfo.get("list");
			//分组
			List<Map<String, Object>> list1=new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> list2=new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> list3=new ArrayList<Map<String, Object>>();
			for(int i=0;i<list.size();){
				System.out.println(i);
				if(i<list.size()){
				list1.add(list.get(i));
				}
				if(i+1<list.size()){
				list2.add(list.get(i+1));
				}
				if(i+2<list.size()){
				list3.add(list.get(i+2));
				}
				i=i+3;
			}
			request.setAttribute("baseinfo", baseinfo);
			request.setAttribute("list1",list1);
			request.setAttribute("list2",list2);
			request.setAttribute("list3", list3);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "flagship/qjsj_pic";
	}
	/**
	 * 获取旗舰商家视频
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/getFlagShopvideo")
	public String getFlagShopvideo(HttpServletRequest request,HttpServletResponse response){
		String id=request.getParameter("id");
		String currentPage = request.getParameter("pager.offset");
		String pageSize = request.getParameter("pageSize");
		if (currentPage==null || "0".equals(currentPage)) {
			currentPage = "1";
		}
		if (pageSize == null) {
			pageSize = "9999999";
		}
		try {
			//获取旗舰商家基本信息
			Map<String, Object> baseinfo=(Map<String, Object>) service.queryFlagShopBaseInfoById(id);
			//获取前6条信息
			Map<String, Object> dynamicinfo=service.queryFlagShopBaseInfoNews(Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize), id, video,"");
			request.setAttribute("baseinfo", baseinfo);
			request.setAttribute("list", dynamicinfo.get("list"));
			request.setAttribute("count", dynamicinfo.get("count"));
			request.setAttribute("pageSize", pageSize);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "flagship/qjsj_video";
	}
	/**
	 * 获取旗舰咨询 图展 详情
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/getFlagShopnewdetail")
	public String getFlagShopnewdetail(HttpServletRequest request,HttpServletResponse response){
		 return this.getFlagShopvideodetail(request, response);
	}
	/**
	 * 获取旗舰视频 详情
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/getFlagShopvideodetail")
	public String getFlagShopvideodetail(HttpServletRequest request,HttpServletResponse response){
		String baseid=request.getParameter("baseid");
		String id=request.getParameter("id");
		String type="";
		String re="";
		try {
			//获取旗舰商家基本信息
			Map<String, Object> baseinfo=(Map<String, Object>) service.queryFlagShopBaseInfoById(baseid);
			//获取详情
			Map<String, Object> newinfo=(Map<String, Object>) service.queryNews(Long.valueOf(id));
			
			if(newinfo.get("style").toString().equals(zixun)||newinfo.get("style").toString().equals(pic)){
				//上一条
				Map<String, Object> previnfo=(Map<String, Object>) service.queryPrevNews(Long.valueOf(id), newinfo.get("style").toString());
				//下一条
				Map<String, Object> nextinfo=(Map<String, Object>) service.queryNextNews(Long.valueOf(id), newinfo.get("style").toString());
				
				request.setAttribute("baseinfo", baseinfo);
				request.setAttribute("newinfo", newinfo);
				request.setAttribute("previnfo", previnfo);
				request.setAttribute("nextinfo", nextinfo);
				type="7";
				re="flagship/qjsj_dynamicpicdetail";
			}else{
				//获取相关视频
				Map<String, Object> videolistinfo=(Map<String, Object>)service.queryFlagShopBaseInfoNews(1, 4, baseid, video,"");//t_newstype表  216 代表商家视频
				request.setAttribute("baseinfo", baseinfo);
				request.setAttribute("videoinfo", newinfo);
				request.setAttribute("videolistinfo", videolistinfo.get("list"));
				type="8";
				re="flagship/qjsj_videodetail";
			}
			//获取前6条信息
			Map<String, Object> topinfo=service.queryFlagShopBaseInfoNews(1, 6, baseid, "","");
			request.setAttribute("topinfo", topinfo.get("list"));
			
			
			//评论
			List<Forums> listForum=forumsService.getFlagshopList(Long.valueOf(id), type);
			List<Forums> listRepaly=new ArrayList<Forums>() ;
			List<Forums> addlist=new ArrayList<Forums>() ;
			int counts=0;
			for (Forums forums : listForum) {
				counts+=Integer.parseInt(forums.getLikenum());
				if(!forums.getCountnum().equals("0")){
					listRepaly.add(forums);	
				}else{
					addlist.add(forums);
					
				}
			}
			request.setAttribute("listForum", addlist);
			request.setAttribute("listRepaly", listRepaly);
			request.setAttribute("size", listForum.size());
			request.setAttribute("counts", counts);
			request.setAttribute("type", type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
}
