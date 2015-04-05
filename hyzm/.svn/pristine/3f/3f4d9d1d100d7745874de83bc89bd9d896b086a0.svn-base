package com.hyzm.forward.control;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.bean.CurrentSession;
import com.hyzm.bean.collection.CollectionListRespBean.Collection;
import com.hyzm.forward.service.flagshop.FlagShopBaseInfoService;
import com.hyzm.forward.service.lylots.lyService;
import com.hyzm.forward.service.user.UserService;


@Controller
@RequestMapping("/collect")
public class LylotsControl {
	@Autowired
	lyService  lyservice;
	@Autowired
	private UserService userService;
	@Autowired
	private FlagShopBaseInfoService flagShopBaseInfoService;
	@RequestMapping("/gotouplylots")
	public String gotouplylots(HttpServletRequest request,HttpServletResponse response){
	//获取乐园专场
		
		try {
			Map<String, Object> map = lyservice.getLyZc();
			List<Map<String, Object>> list=(List<Map<String, Object>>) map.get("list");
			request.setAttribute("lyzclist", list);
			//获取会员等级
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			request.setAttribute("userid", currentsession.getId());
			request.setAttribute("userlevel", currentsession.getLevel());
			//获取当前用户余额
			//用户余额
			Map<String, Object> yemap = userService.CurrentMoney(currentsession.getId());
			double yemoney=Double.valueOf(yemap.get("money").toString());
			request.setAttribute("yemoney",yemoney);
			//获取当前用户上传了几件拍拍
			 Map<String, Object>  mapnum=lyservice.getMylots(String.valueOf(currentsession.getId()));
			 request.setAttribute("num", mapnum.get("count"));
			 //获取旗舰商家
			 Map<String, Object> flagmap=flagShopBaseInfoService.queryFlagShopBaseInfoByuserId(String.valueOf(currentsession.getId()));
			 request.setAttribute("flagmap", flagmap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/collect/upload";
		
		
		
	}
	@RequestMapping("/gotolyindex")
	public String gotolyindex(HttpServletRequest request,HttpServletResponse response){
	//获取乐园专场
		
		try {
			Map<String, Object> map = lyservice.getLyZc();
			List<Map<String, Object>> list=(List<Map<String, Object>>) map.get("list");
			request.setAttribute("lyzclist", list);
			//获取会员等级
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			request.setAttribute("userid", currentsession.getId());  
			request.setAttribute("userlevel", currentsession.getLevel());
			//获取当前用户余额
			//用户余额
			Map<String, Object> yemap = userService.CurrentMoney(currentsession.getId());
			double yemoney=Double.valueOf(yemap.get("money").toString());
			request.setAttribute("yemoney",yemoney);
			//获取当前用户上传了几件拍拍
			 Map<String, Object>  mapnum=lyservice.getMylots(String.valueOf(currentsession.getId()));
			 request.setAttribute("num", mapnum.get("count"));
			 //获取旗舰商家
			 Map<String, Object> flagmap=flagShopBaseInfoService.queryFlagShopBaseInfoByuserId(String.valueOf(currentsession.getId()));
			 request.setAttribute("flagmap", flagmap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/collect/index";
		
		
		
	}
	
	
	@RequestMapping("/uplylots")
	public String uplylots(HttpServletRequest request,HttpServletResponse response){
		try {
			boolean tag=true;
			String specialID=request.getParameter("specialID");
			String name=request.getParameter("name");
			String uptime=request.getParameter("uptime");
			String autor=request.getParameter("autor");
			String year=request.getParameter("year");
			String size=request.getParameter("size");
			String image=request.getParameter("image");
			String ybprice=request.getParameter("ybprice");
			String suggest=request.getParameter("suggest");
			//String lynumber=request.getParameter("lynumber");
			String state=request.getParameter("state");
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			String userid=String.valueOf(currentsession.getId());
			System.out.println(name+autor+year+size+userid+specialID);
			if(name==null){name="";}
			if(autor==null){autor="";}
			if(size==null){size="";}
			if(suggest==null){suggest="";}
			if(year==null){year="";}
			//用户余额
			Map<String, Object> map = userService.CurrentMoney(currentsession.getId());
			double yemoney=Double.valueOf(map.get("money").toString());
			int userlevel=Integer.valueOf(currentsession.getLevel());
			//获取当前用户上传了几件拍拍
			 Map<String, Object>  mapnum=lyservice.getMylots(userid);
			int num=(Integer) mapnum.get("count");
			
			 //获取旗舰商家
			 Map<String, Object> flagmap=flagShopBaseInfoService.queryFlagShopBaseInfoByuserId(userid);
			
			//如果是免费会员
			if(userlevel==0){
				//如果该免费会员为旗舰商家  可以免费上传30件
				if(flagmap!=null&&flagmap.get("id")!=""){
					if(num>30){
						if(yemoney-100<0){
							request.setAttribute("msg", "余额不足,请充值！");
							tag=false;
						}
					}
					
				}else{
					if(yemoney-100<0){
						request.setAttribute("msg", "余额不足,请充值！");
						tag=false;
					}
				}
			}
			//如果为星级会员  可以免费上传30件
			if(userlevel==1&&num>30){
			   if(yemoney-100<0){
				   request.setAttribute("msg","余额不足请充值");
				   tag=false;
				}
			}
			//如果为贵宾会员  可以免费上传60件
			if(userlevel==2&&num>60){
			   if(yemoney-100<0){
				   request.setAttribute("msg","余额不足请充值");
				   tag=false;
				}
			}
			//如果为高级会员  可以免费上传80件
			if(userlevel==3&&num>80){
			   if(yemoney-100<0){
				   request.setAttribute("msg","余额不足请充值");
				   tag=false;
				}
			}
			//添加拍品
			if(tag){
				 Map<String, Object> resp =lyservice.addlylots(Integer.parseInt(specialID), name, uptime, Long.parseLong(userid), autor, year, size, image, ybprice, suggest, state,userlevel);
				 int errorcode=Integer.valueOf(resp.get("num").toString());
				if(errorcode==1){
					request.setAttribute("msg","上传成功！");
				}else{
					request.setAttribute("msg","上传失败！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return this.gotouplylots(request, response);
}

	@RequestMapping("/gotomylylots")
	public String gotomylylots(HttpServletRequest request,HttpServletResponse response){
	//获取乐园专场		
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		request.setAttribute("userid", currentsession.getId());
		String currentPage = request.getParameter("pager.offset");
		String pageSize = request.getParameter("pageSize");
		if (currentPage==null || "0".equals(currentPage)) {
			currentPage = "1";
		}
		if (pageSize == null) {
			pageSize = "10";
		}
		try {
			Map<String, Object> map = lyservice.getMylylots(String.valueOf(currentsession.getId()), Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize));
			List<Map<String, Object>> list=(List<Map<String, Object>>) map.get("list");
			
			//获取当前用户上传了几件拍拍
			 Map<String, Object>  mapnum=lyservice.getMylots(String.valueOf(currentsession.getId()));
			 request.setAttribute("count", mapnum.get("count"));
			 request.setAttribute("currentPage", currentPage);
			 request.setAttribute("pageSize", pageSize);
			request.setAttribute("mylotslist", list);
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/mine/mypaipin";		
	}
	@RequestMapping("/getlylotslist")
	public String getlylotslist(HttpServletRequest request,HttpServletResponse response){
		
		try {
			//获取所有专场
			Map<String, Object> zcmap = lyservice.getLyZc();
			List<Map<String, Object>> zclist=(List<Map<String, Object>>) zcmap.get("list");
			request.setAttribute("lyzclist", zclist);
			//获取专场id
			String specialID=request.getParameter("specialID");
			//价格区间
			String pricearea=request.getParameter("pricearea");
			//来源  如果为乐园自有 userid=1000   用户送拍 userid!=1000
			String ly=request.getParameter("ly");
			String userid="3302";
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "12";
			}
			if (ly==null || "".equals(ly)) {
				ly = "1";//乐园自由
			}
			//获取拍品信息
			Map<String, Object> ppmap = lyservice.getlylots(specialID, pricearea, ly, userid,Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize));
			 request.setAttribute("count", ppmap.get("count"));
			 request.setAttribute("list", ppmap.get("list"));
			 request.setAttribute("currentPage", currentPage);
			 request.setAttribute("pageSize", pageSize);
			 request.setAttribute("specialID", specialID);
			 request.setAttribute("pricearea", pricearea);
			 request.setAttribute("ly", ly);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/collect/show";	
	}
	@RequestMapping("/getlylotsById")
	public String getlylotsById(HttpServletRequest request,HttpServletResponse response){
		try {
			String id=request.getParameter("id");
			Map<String, Object> map = lyservice.getlylotsById(id);
			request.setAttribute("info", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/collect/showinfo";	
	}
}
