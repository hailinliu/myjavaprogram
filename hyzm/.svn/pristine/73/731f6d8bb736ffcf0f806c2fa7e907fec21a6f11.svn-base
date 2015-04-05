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
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.bean.CurrentSession;
import com.hyzm.forward.service.onlinepic.OnlinePicService;
import com.hyzm.forward.service.user.UserService;
import com.hyzm.util.DateUtil;

@Controller
@RequestMapping("/onlinepic")
public class OnlinePicControl {
	@Autowired
	private UserService userService;
	@Autowired
	private OnlinePicService service;
	
	@RequestMapping("/gotoonlinepicindex")
	public String gotoonlinepicindex(HttpServletRequest request,HttpServletResponse response){
		try {
			//获取会员等级
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			request.setAttribute("userid", currentsession.getId());
			request.setAttribute("userlevel", currentsession.getLevel());
			//获取当前用户余额
			//用户余额
			Map<String, Object> yemap = userService.CurrentMoney(currentsession.getId());
			double yemoney=Double.valueOf(yemap.get("money").toString());
			request.setAttribute("yemoney",yemoney);
			//获取当前用户上传了几件藏品
			Map<String, String> wherenum=new HashMap<String, String>();
			wherenum.put("userid", String.valueOf(currentsession.getId()));
			wherenum.put("money", "0");
			int num=service.getOnlinePicCollForCount(wherenum);
			request.setAttribute("num",num);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("userlevel",-1);
			request.setAttribute("yemoney",-1);
			request.setAttribute("num",-1);
			return "/onlinepic/index";
		}
		return "/onlinepic/index";
	}
	
	@RequestMapping("/gotoonlinepicupload")
	public String gotoonlinepicupload(HttpServletRequest request,HttpServletResponse response){
		try {
			Map<String,String> wherenull =new HashMap<String, String>();
			//获取在线鉴定专家
//			Map<String, Object> profmap = service.getOnlinePicProf(wherenull);
//			List<Map<String, Object>> proflist=(List<Map<String, Object>>) profmap.get("list");
//			request.setAttribute("proflist", proflist);
			
			//获取在线鉴定藏品类型
			Map<String, Object> typemap = service.getOnlinePicType(wherenull);
			List<Map<String, Object>> typelist=(List<Map<String, Object>>) typemap.get("list");
			request.setAttribute("typelist", typelist);
			//获取会员等级
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			request.setAttribute("userid", currentsession.getId());
			request.setAttribute("userlevel", currentsession.getLevel());
			//获取当前用户余额
			//用户余额
			Map<String, Object> yemap = userService.CurrentMoney(currentsession.getId());
			double yemoney=Double.valueOf(yemap.get("money").toString());
			request.setAttribute("yemoney",yemoney);
			//获取当前用户上传了几件藏品
			Map<String, String> wherenum=new HashMap<String, String>();
			wherenum.put("userid", String.valueOf(currentsession.getId()));
			wherenum.put("money", "0");
			int num=service.getOnlinePicCollForCount(wherenum);
			request.setAttribute("num",num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/onlinepic/upload";
	}
	@RequestMapping("/onlinepicupload")
	public void onlinepicupload(HttpServletRequest request,HttpServletResponse response){
		// 输出参数  -1：上传失败  0：余额不足  1：上传成功
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, Object> yemap = userService.CurrentMoney(currentsession.getId());
			double yemoney=Double.valueOf(yemap.get("money").toString());
			//获取当前用户上传了几件藏品
			Map<String, String> wherenum=new HashMap<String, String>();
			wherenum.put("userid", String.valueOf(currentsession.getId()));
			wherenum.put("money", "0");
			int num=service.getOnlinePicCollForCount(wherenum);
			int userlevel=Integer.valueOf(currentsession.getLevel());
			String userid=String.valueOf(currentsession.getId());
			String name=request.getParameter("name");
			String pic=request.getParameter("pic");
			String typeid=request.getParameter("typeid");
			String size=request.getParameter("size");
			String note=request.getParameter("note");
			//String zjuserid=request.getParameter("zjuserid");
			String uploaddate=DateUtil.getDateTime(new Date(), "yyyy-MM-dd HH:mm:ss");
			String yjresultsdate="";//预计鉴定结果时间
			//鉴定费用
			double money=100;
			
			//免费会员
			if(userlevel==0){
				yjresultsdate=DateUtil.getDatefull(10);
			}else if(userlevel==1){//星级会员
				yjresultsdate=DateUtil.getDatefull(5);
					money=50;
				if(yemoney-money<0){
					out.print(0);//余额不足
					return;
				}
			}else if(userlevel==2){//贵宾会员
				yjresultsdate=DateUtil.getDatefull(3);
				if(num>10){//免费鉴定10件  超出每件50
					money=50;
					if(yemoney-money<0){
						out.print(0);//余额不足
						return;
					}
				}else{
					money=0;
				}
			}else if(userlevel==3){//高级会员
				yjresultsdate=DateUtil.getDatefull(2);
				if(num>20){//免费鉴定20件  超出每件50
					money=50;
					if(yemoney-money<0){
						out.print(0);//余额不足
						return;
					}
				}else{
					money=0;
				}
			}else if(userlevel==4){//超级会员
				yjresultsdate=DateUtil.getDatefull(1);
				if(num>30){//免费鉴定30件  超出每件50
					money=50;
					if(yemoney-money<0){
						out.print(0);//余额不足
						return;
					}
				}else{
					money=0;
				}
			}
			if(yemoney-money<0){
				out.print(0);
				return;
			}
			//添加
			Map<String, String> where=new HashMap<String, String>();
			where.put("userid", userid);
			where.put("name", name);
			where.put("pic", pic);
			where.put("typeid", typeid);
			where.put("size", size);
			where.put("note", note);
			
			//系统自动分配专家
			try {
				String zjuserid="";//随机分配专家  同类型
				Map<String,String> wherprof =new HashMap<String, String>();
				wherprof.put("typeid", typeid);
				wherprof.put("state", "1");
				Map<String, Object> profmap = service.getOnlinePicProf(wherprof);
				List<Map<String, Object>> proflist=(List<Map<String, Object>>) profmap.get("list");
				zjuserid=proflist.get(0).get("userid").toString();
				where.put("zjuserid", zjuserid);
			} catch (Exception e) {
				out.print(-2);
				return ;
			}
			//系统不自动分配专家  让专家自己选择
			//where.put("zjuserid", "-1");
			
			
			where.put("uploaddate", uploaddate);
			where.put("yjresultsdate", yjresultsdate);
			where.put("money", String.valueOf(money));
			int upnum =service.AddOnlinePicColl(where);
			out.print(upnum);
			return;
		}catch (Exception e) {
			e.printStackTrace();
			out.print(-1);
		}
	}
	@RequestMapping("/gotoolinePicupdate")
	public String gotoolinePicupdate(HttpServletRequest request,HttpServletResponse response){
		try {
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			request.setAttribute("userlevel", currentsession.getLevel());
			Map<String,String> wherenull =new HashMap<String, String>();
			//获取在线鉴定专家
			Map<String, Object> profmap = service.getOnlinePicProf(wherenull);
			List<Map<String, Object>> proflist=(List<Map<String, Object>>) profmap.get("list");
			request.setAttribute("proflist", proflist);
			
			//获取在线鉴定藏品类型
			Map<String, Object> typemap = service.getOnlinePicType(wherenull);
			List<Map<String, Object>> typelist=(List<Map<String, Object>>) typemap.get("list");
			request.setAttribute("typelist", typelist);
			long sionuserid=currentsession.getId();
			Map<String, String> where=new HashMap<String, String>();
			where.put("id", request.getParameter("id"));
			Map<String, Object> map=service.getOnlinePicCollForMap(where);
			long userid=Long.valueOf(map.get("userid").toString());
			int state=Integer.valueOf(map.get("state").toString());
			if(userid==sionuserid&&(state==3||state==4||state==5)){
				request.setAttribute("item",map);
			}else{
				request.setAttribute("message","<script>alert('您无权修改该条信息！');window.close();</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/onlinepic/update";
	}
	@RequestMapping("/onlinepicupdate")
	public void onlinepicupdate(HttpServletRequest request,HttpServletResponse response){
		// 输出参数  0：失败  1：上传成功
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			int userlevel=Integer.valueOf(currentsession.getLevel());
			String userid=String.valueOf(currentsession.getId());
			String id=request.getParameter("id");
			String state="1";
			String thcs=request.getParameter("thcs");
			String name=request.getParameter("name");
			String pic=request.getParameter("pic");
			String typeid=request.getParameter("typeid");
			String size=request.getParameter("size");
			String note=request.getParameter("note");
			String zjuserid=request.getParameter("zjuserid");
			String uploaddate=DateUtil.getDateTime(new Date(), "yyyy-MM-dd HH:mm:ss");
			String yjresultsdate="";//预计鉴定结果时间
			//免费会员
			if(userlevel==0){
				yjresultsdate=DateUtil.getDatefull(10);
			}else if(userlevel==1){//星级会员
				yjresultsdate=DateUtil.getDatefull(5);
			}else if(userlevel==2){//贵宾会员
				yjresultsdate=DateUtil.getDatefull(3);
			}else if(userlevel==3){//高级会员
				yjresultsdate=DateUtil.getDatefull(2);
			}else if(userlevel==4){//超级会员
				yjresultsdate=DateUtil.getDatefull(1);
			}
			//添加
			Map<String, String> where=new HashMap<String, String>();
			where.put("id", id);
			where.put("thcs", thcs);
			where.put("userid", userid);
			where.put("name", name);
			where.put("pic", pic);
			where.put("typeid", typeid);
			where.put("size", size);
			where.put("note", note);
			where.put("zjuserid", zjuserid);
			where.put("uploaddate", uploaddate);
			where.put("yjresultsdate", yjresultsdate);
			where.put("resultsdate", "null");
			where.put("state", state);
			int upnum =service.UpdateOnlinePicColl(where);
			out.print(upnum);
			return;
		}catch (Exception e) {
			e.printStackTrace();
			out.print(-1);
		}
	}
	@RequestMapping("/olinePicByid")
	public String olinePicByid(HttpServletRequest request,HttpServletResponse response){
		try {
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			long sionuserid=currentsession.getId();
			Map<String, String> where=new HashMap<String, String>();
			where.put("id", request.getParameter("id"));
			Map<String, Object> map=service.getOnlinePicCollForMap(where);
			long userid=Long.valueOf(map.get("userid").toString());
			if(userid==sionuserid){
				request.setAttribute("item",map);
			}else{
				request.setAttribute("message","<script>alert('您无权查看该条信息！');window.close();</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/onlinepic/onlinepicjg";
	}
	
	@RequestMapping("/myUpOlinePic")
	public String myUpOlinePic(HttpServletRequest request,HttpServletResponse response){
		try {
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage) || "".equals(currentPage)) {	currentPage = "1";}
			if (pageSize == null || "".equals(pageSize)) {pageSize = "10";}
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, String> where=new HashMap<String, String>();
			where.put("userid", String.valueOf(currentsession.getId()));
			where.put("pageno",String.valueOf( Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1));
			where.put("pagesize",pageSize);
			Map<String, Object> resmap=service.getOnlinePicCollForList(where);
			request.setAttribute("list",resmap.get("list"));
			request.setAttribute("count",resmap.get("count"));
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("pageSize", pageSize);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/mine/onlinepic";
	}
	@RequestMapping("/onlinePiclist")
	public String OlinePiclist(HttpServletRequest request,HttpServletResponse response){
		try {
			//获取在线鉴定藏品类型
			Map<String,String> wherenull =new HashMap<String, String>();
			Map<String, Object> typemap = service.getOnlinePicType(wherenull);
			List<Map<String, Object>> typelist=(List<Map<String, Object>>) typemap.get("list");
			request.setAttribute("typelist", typelist);
			
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {	currentPage = "1";}
			if (pageSize == null) {pageSize = "10";}
			String isshangpai=request.getParameter("isshangpai");
			if(isshangpai==null||isshangpai==""){
				isshangpai="3";
			}
			String typeid=request.getParameter("typeid");
			Map<String, String> where=new HashMap<String, String>();
			where.put("isshangpai",isshangpai );
			where.put("typeid",typeid );
			where.put("pageno",String.valueOf( Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1));
			where.put("pagesize",pageSize);
			Map<String, Object> resmap=service.getOnlinePicCollForList(where);
			request.setAttribute("list",resmap.get("list"));
			request.setAttribute("count",resmap.get("count"));
			request.setAttribute("typeid",typeid);
			request.setAttribute("isshangpai",isshangpai);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("pageSize", pageSize);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/onlinepic/onlinepiclist";
	}
	@RequestMapping("/olinePicByinfo")
	public String olinePicByinfo(HttpServletRequest request,HttpServletResponse response){
		try {
			Map<String, String> where=new HashMap<String, String>();
			where.put("id", request.getParameter("id"));
			Map<String, Object> map=service.getOnlinePicCollForMap(where);
			request.setAttribute("item",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/onlinepic/onlinepic-info";
	}
	
	
}
