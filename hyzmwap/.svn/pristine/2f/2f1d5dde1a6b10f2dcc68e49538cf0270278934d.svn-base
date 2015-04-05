package com.hyzm.forward.control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
import com.hyzm.util.ImageUtil;
import com.hyzm.util.PropertiesUtil;
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
	public void getMyPoints(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String currentPage = request.getParameter("page");
			String pageSize = request.getParameter("size");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "10";
			}
			/*Map<String,Object> map = userService.CurrentMoney(currentsession.getId());
			if(map.get("errorcode").equals("0000")){
				request.setAttribute("points", map.get("points"));
			}*/
			Map<String,Object> map = service.getMyPoints(currentsession.getId(), "1", Integer.valueOf(currentPage), Integer.parseInt(pageSize));
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/mymoneylist")
	public void getMyMoney(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String currentPage = request.getParameter("page");
			String pageSize = request.getParameter("size");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "10";
			}
			/*Map<String,Object> map = userService.CurrentMoney(currentsession.getId());
			if(map.get("errorcode").equals("0000")){
				request.setAttribute("money", map.get("money"));
			}*/
			Map<String,Object> map = service.getMyMoney(currentsession.getId(), "1", Integer.valueOf(currentPage), Integer.parseInt(pageSize));
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/enrollHistory")
	public void enrollHistory(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String currentPage = request.getParameter("page");
			String pageSize = request.getParameter("size");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "10";
			}
			//Enroll en = service.getCurrentEnroll();
			Map<String, Object> map = service.getMyApplicationHistory(currentsession.getId(), Integer.valueOf(currentPage), Integer.parseInt(pageSize));
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
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
		return "mine/uploadCollection";
	}
	
	@RequestMapping("/gotoMyUpload")
	public String gotoMyUpload() {
		return "mine/myUpload";
	}
	
	@RequestMapping("/myupload")
	public void getMyUpload(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String currentPage = request.getParameter("page");
			String pageSize = request.getParameter("size");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "10";
			}
			Map<String, Object> map = service.getMyCollection("3", currentsession.getId()+"", Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.parseInt(pageSize));
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	
	@RequestMapping("/uploadCollection")
	public void updateCollectionMsg(HttpServletRequest request, HttpServletResponse response) {
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			if (request instanceof MultipartHttpServletRequest) {
				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				MultipartFile file = multipartRequest.getFiles("fileField").get(0);
				long size = file.getSize();
				byte[] data = new byte[(int) size];
				InputStream input = file.getInputStream();
				input.read(data);
				
				String fileNameLong = file.getOriginalFilename();//获取上传的文件名称
				String extensionName = fileNameLong.substring(fileNameLong.lastIndexOf(".") + 1);//获取文件扩展名
				String filename = UUID.randomUUID().toString();//重命名文件
				String saveFilePath = new PropertiesUtil("config.properties").getProperties("uploadCollection");
				File outFile = new File(saveFilePath + filename + "." +extensionName);
				if (!outFile.exists()) {
					outFile.createNewFile();
				}
				FileOutputStream outStream = new FileOutputStream(outFile);
				outStream.write(data);
				outStream.close();
				input.close();
				ImageUtil.imageZip(saveFilePath, filename, extensionName, 156, 142);
				int type = Integer.valueOf(request.getParameter("type"));
				String name = request.getParameter("name");
				String owner = request.getParameter("owner");
				String source = request.getParameter("source");
				String memo = request.getParameter("memo");
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=UTF-8");
				if(service.uploadCollectionMsg(type, currentsession.getId(), name, owner, source, filename + "." +extensionName, memo)){
					response.getWriter().print("<script>alert('上传成功！');location.href='../mine/gotoenroll';</script>");
				}else{
					response.getWriter().print("<script>alert('上传失败！')</script>");
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
	@RequestMapping("/deleteUpload")
	public String deleteUpload(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			if (service.deleteUpload(id)) {
				return "redirect:/mine/gotoMyUpload";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mine/gotoMyUpload";
	}
	
	@RequestMapping("/gotoMyCollect")
	public String gotoMyCollect() {
		return "mine/myCollect";
	}
	
	@RequestMapping("/mycollect")
	public void getMyCollect(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String currentPage = request.getParameter("page");
			String pageSize = request.getParameter("size");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "10";
			}
			Map<String, Object> map = service.getMyCollection("4", currentsession.getId()+"", Integer.valueOf(currentPage), Integer.parseInt(pageSize));
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/gotoenroll")
	public String gotoEnroll(HttpServletRequest request) {
		try {
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			Map<String, Object> map = service.getMyCollection("3", currentsession.getId()+"", 1, 9);
			
			Enroll en = service.getCurrentEnroll();
			List<Long> enrollids = service.getSelectedCollection(currentsession.getId(), en.getId());
			int mycount = StringUtil.converInteger(map.get("count"));
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
			request.setAttribute("mycollection", service.getMyCollection("3", currentsession.getId()+"", 1, 9999));
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
			out.print(respBean.getErrorcode());
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
				return "";
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
				out.print(resp.getErrorinfo());
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
		return "mine/rechargeOver";
	}
	

}
