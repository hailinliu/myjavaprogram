package com.hyzm.forward.control;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.hyzm.bean.CurrentSession;
import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.collection.CollectionListRespBean.Collection;
import com.hyzm.bean.collection.CollectionTypeRespBean.Type;
import com.hyzm.bean.enroll.EnrollReqBean;
import com.hyzm.bean.enroll.CurrentEnrollRespBean.Enroll;
import com.hyzm.bean.enroll.EnrollListRespBean.EnrollRecord;
import com.hyzm.bean.enroll.EnrollReqBean.Invoice;
import com.hyzm.bean.trade.UpdateVipRespBean;
import com.hyzm.bean.trade.MoneyRecordListRespBean.MoneyRecord;
import com.hyzm.forward.service.collection.CollectionService;
import com.hyzm.forward.service.mine.MineService;
import com.hyzm.forward.service.user.UserService;
import com.hyzm.util.StringUtil;

@Controller
@RequestMapping("/mine")
public class MineControl {
	
	@Autowired
	private MineService service;
	
	@Autowired
	private CollectionService colService;
	@Autowired
	private UserService userService;
	@Autowired
	private MineService mineService;
	
	@RequestMapping("/mypointslist")
	public String getMyPoints(HttpServletRequest request, HttpServletResponse response) {
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			String year = request.getParameter("year");
			if (year == null || "".equals(year)) {
				year = "1";
			}
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "9";
			}
			
			Map<String,Object> map = userService.CurrentMoney(currentsession.getId());
			if(map.get("errorcode").equals("0000")){
				request.setAttribute("points", map.get("points"));
			}
			
			map = service.getMyPoints(currentsession.getId(), year, Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.parseInt(pageSize));
			request.setAttribute("year", year);
			request.setAttribute("count", map.get("count"));
			request.setAttribute("pointList", map.get("list"));
			request.setAttribute("pageSize", pageSize);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mine/myPoint";
	}
	
	@RequestMapping("/mymoneylist")
	public String getMyMoney(HttpServletRequest request, HttpServletResponse response) {
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			String year = request.getParameter("year");
			if (year == null || "".equals(year)) {
				year = "1";
			}
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "9";
			}
			
			Map<String,Object> map = userService.CurrentMoney(currentsession.getId());
			if(map.get("errorcode").equals("0000")){
				request.setAttribute("money", map.get("money"));
			}
			
			map = service.getMyMoney(currentsession.getId(), year, Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.parseInt(pageSize));
			request.setAttribute("year", year);
			request.setAttribute("count", map.get("count"));
			request.setAttribute("moneyList", map.get("list"));
			request.setAttribute("pageSize", pageSize);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mine/myMoney";
	}
	
	@RequestMapping("/getPayOver")
	public String getPayOver(HttpServletRequest request, HttpServletResponse response) {
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			String year = request.getParameter("year");
			if (year == null || "".equals(year)) {
				year = "1";
			}
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "9";
			}
			request.setAttribute("username", currentsession.getUsername());
			Map<String,Object> map = userService.CurrentMoney(currentsession.getId());
			if(map.get("errorcode").equals("0000")){
				request.setAttribute("money", map.get("money"));
			}
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			 String dateString = formatter.format(new java.util.Date());
			 
			map = service.getMyMoney(currentsession.getId(), year, Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.parseInt(pageSize));
			List<MoneyRecord> list= (List<MoneyRecord>) map.get("list");
			 if(null!=list && list.size()>0){
				 MoneyRecord over=list.get(0);
				 String time=over.getTradedate();
				 time =time.substring(0,10);
				 if(time.equals(dateString)){
					 if(over.getType().equals("1")){
						  request.setAttribute("overMoney", over.getMoney()); 
						 }	 
				 }else{
					 
					  request.setAttribute("overMoney", "");  
				 } 
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mine/chongzhiover";
	}
	
	
	
	@RequestMapping("/applicationHistory")
	public String getMyApplicationHistory(HttpServletRequest request, HttpServletResponse response) {
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "9";
			}
			Enroll en = service.getCurrentEnroll();
			Map<String, Object> map = service.getMyApplicationHistory(currentsession.getId(), Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.parseInt(pageSize));
			request.setAttribute("count", map.get("count"));
			request.setAttribute("enroll", en);
			request.setAttribute("historyList", map.get("list"));
			request.setAttribute("pageSize", pageSize);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mine/myApplicationHistory";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/myupload")
	public String getMyUpload(HttpServletRequest request, HttpServletResponse response) {
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "9";
			}
			Map<String, Object> map = service.getMyCollection("3", currentsession.getId()+"", Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.parseInt(pageSize));
			List<Collection> list = (List<Collection>) map.get("list");
			for (Collection col : list) {
				String image = col.getImgurl();
				String[] imgarray = image.split(",");
				col.setImgurl(imgarray[0]);
			}
			request.setAttribute("count", map.get("count"));
			request.setAttribute("listsize", list.size());
			request.setAttribute("uploadList", list);
			request.setAttribute("pageSize", pageSize);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mine/myUpload";
	}
	
	@RequestMapping("/gotoupload")
	public String gotoupload(HttpServletRequest request) {
		try {
			List<Type> list = colService.getTypeList();
			String count = request.getParameter("count");
			request.setAttribute("typeList", list);
			request.setAttribute("count", count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mine/upload";
	}
	
	@RequestMapping("/gotoUpdateCollection")
	public String gotoUpdateCollection(HttpServletRequest request) {
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			long id = Long.valueOf(request.getParameter("id"));
			Collection col = colService.getCollectionById(id, currentsession.getId());
			List<Type> list = colService.getTypeList();
			request.setAttribute("col", col);
			request.setAttribute("typeList", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mine/upload";
	}
	
	@RequestMapping("/uploadCollectionMsg")
	public String updateCollectionMsg(HttpServletRequest request, HttpServletResponse response) {
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			String image = "";
			String id = request.getParameter("id");
			int type = Integer.valueOf(request.getParameter("type"));
			String name = request.getParameter("name");
			String owner = request.getParameter("owner");
			String source = request.getParameter("source");
			String imgurl = request.getParameter("imgurl");
			String memo = request.getParameter("memo");
			if (id != null && !"".equals(id)) {
				Collection col = colService.getCollectionById(Long.valueOf(id), currentsession.getId());
				if (imgurl == null || "".equals(imgurl)) {
					image = col.getImgurl();
				} else {
					image = imgurl;
				}
			} else {
				image = imgurl;
			}
			if (service.updateCollectionMsg(id, type, currentsession.getId(), name, owner, source, image, memo)) {
				return "redirect:/mine/myupload";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mine/myupload";
	}
	
	@RequestMapping("/deleteUpload")
	public String deleteUpload(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			if (service.deleteUpload(id)) {
				return "redirect:/mine/myupload";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mine/myupload";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/mycollect")
	public String getMyCollect(HttpServletRequest request, HttpServletResponse response) {
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "9";
			}
			Map<String, Object> map = service.getMyCollection("4", currentsession.getId()+"", Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.parseInt(pageSize));
			List<Collection> list = (List<Collection>) map.get("list");
			if (list == null) {
				list = new ArrayList<Collection>();
			}
			for (Collection col : list) {
				String image = col.getImgurl();
				String[] imgarray = image.split(",");
				col.setImgurl(imgarray[0]);
			}
			request.setAttribute("count", map.get("count"));
			request.setAttribute("listsize", list.size());
			request.setAttribute("colList", list);
			request.setAttribute("pageSize", pageSize);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mine/myCollection";
	}
	
	@RequestMapping("/gotoenroll")
	public String gotoEnroll(HttpServletRequest request) {
		try {
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, Object> map = service.getMyCollection("3", currentsession.getId()+"", 1, 9);
			
			Enroll en = service.getCurrentEnroll();
			List<Long> enrollids = service.getSelectedCollection(currentsession.getId(), en.getId());
			int mycount = StringUtil.converInteger(map.get("count"));
			int state=StringUtil.converInteger(map.get("state"));
			Map<String, Object> enrollMap = mineService.getMyApplicationHistory(0, 1, 10);
			List<EnrollRecord> list=(List<EnrollRecord>) enrollMap.get("list");
			if(null!=list && list.size()>0){
				EnrollRecord  enroll=list.get(0);
				String time=enroll.getValiddate();
				time=time.substring(5,23);
				request.setAttribute("enrolltime", time);
			}
			map = userService.CurrentMoney(currentsession.getId());
			if(map.get("errorcode").equals("0000")){
				request.setAttribute("money", map.get("money"));
			}	
			request.setAttribute("mypage", mycount/9+1);
			request.setAttribute("enroll", en);
			request.setAttribute("state", state);
			
			request.setAttribute("enrollids", enrollids);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mine/enroll";
	}
	
	@RequestMapping("/getMyCollections")
	public void getMyCollectionList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String currentPage = request.getParameter("currentPage");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "9";
			}
			Map<String, Object> map = service.getMyCollection("3", currentsession.getId()+"", Integer.valueOf(currentPage), Integer.valueOf(pageSize));
			String result = new Gson().toJson(map);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/enroll")
	public void EnrollCollection(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			List<Long> list = new ArrayList<Long>();
			long bmid = Long.valueOf(request.getParameter("bmid"));
			String money = request.getParameter("money");
			String collectionid = request.getParameter("collectionid");
			String[] collection = collectionid.split(",");
			for (String str : collection) {
				if (str != null && !"".equals(str)) {
					list.add(Long.valueOf(str));
				}
			}
			Invoice invoice = null;
			String postmsg = request.getParameter("postmsg");
		
			if (postmsg != null && !"".equals(postmsg)) {
				invoice = new EnrollReqBean().new Invoice();
				invoice.setName(request.getParameter("invoicename"));
				invoice.setRecipient(request.getParameter("recipient"));
				invoice.setMobile(request.getParameter("mobile"));
				invoice.setAddress(request.getParameter("address"));
				invoice.setZipcode(request.getParameter("zipcode"));
			}
			MessageRespBean respBean = service.EnrollCollection(bmid, currentsession.getId(), currentsession.getMobile(), list, Double.valueOf(money), invoice);
			out.print(new Gson().toJson(respBean.getErrorcode()));
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/payOffLine")
	public String payOffLine(HttpServletRequest request, HttpServletResponse response) {
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			String money = request.getParameter("money");
			String imgurl = request.getParameter("imgurl");
			if (service.payOffLine(currentsession.getId(), money==null||"".equals(money)?0.00:Double.valueOf(money), imgurl)) {
				return "redirect:/mine/mymoneylist";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mine/mymoneylist";
	}
	
	@RequestMapping("/collect")
	public String collect(HttpServletRequest request) {
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			long collectionid = Long.valueOf(request.getParameter("collectionid"));
			if (service.collect(currentsession.getId(), collectionid)) {
				return "redirect:/mine/mycollect";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mine/mycollect";
	}
	
	@RequestMapping("/deleteMyCollection")
	public String deleteMyCollection(HttpServletRequest request) {
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			long collectionid = Long.valueOf(request.getParameter("collectionid"));
			if (service.deleteMyCollection(currentsession.getId(), collectionid)) {
				return "redirect:/mine/mycollect";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mine/mycollect";
	}
	
	@RequestMapping("/gotovip")
	public String gotoVip(HttpServletRequest request) {
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map = userService.CurrentMoney(currentsession.getId());
			if(map.get("errorcode").equals("0000")){
				request.setAttribute("money", map.get("money"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mine/vip";
	}
	
	@RequestMapping("/vipUpdate")
	public void vipUpdate(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			double money = Double.valueOf(request.getParameter("money"));
			String viplevel = request.getParameter("level");
			MessageRespBean resp = service.vipUpdate(currentsession.getId(), money, viplevel, currentsession.getMobile());
			if ("0000".equals(resp.getErrorcode())) {
				UpdateVipRespBean respBean = new Gson().fromJson(resp.getContent(), UpdateVipRespBean.class);
				currentsession.setLevel(respBean.getLevel());
				currentsession.setLeveltime(respBean.getLeveltime());
				out.print("0000");
			} else {
				out.print("会员升级失败！");
			}
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getMoney")
	public void getMoney(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			Map<String, Object> map = userService.CurrentMoney(currentsession.getId());
			if(map.get("errorcode").equals("0000")){
				request.setAttribute("money", map.get("money"));
				out.print(map.get("money"));
			}else{
				out.print("0000");		
			}
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}
	

}
