package com.hyzm.admin.control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.NumberFormats;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Zip;
import org.apache.tools.ant.types.FileSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.admin.service.onlinepic.OnlinePicService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;
import com.hyzm.util.DownloadImage;

@Controller
@RequestMapping("/onlinepic")
public class OnlinePicControl {
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private OnlinePicService service;
	
	//查询藏品列表
	@RequestMapping("/getPicCollForList")
	public void getPicCollForList(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			if(currentsession==null){
				out.print("程序异常");
				return;
			}
			Map<String,String> map=new HashMap<String, String>();
			map.put("username",request.getParameter("username"));
			map.put("mobile",request.getParameter("mobile"));
			map.put("name",request.getParameter("name"));
			map.put("zjuserid",request.getParameter("zjuserid"));
			map.put("typeid",request.getParameter("typeid"));
			map.put("state",request.getParameter("state"));
			map.put("isshangpai",request.getParameter("isshangpai"));
			map.put("zhpg",request.getParameter("zhpg"));
			map.put("level",request.getParameter("level"));
			map.put("ordercolumn",request.getParameter("ordercolumn"));
			map.put("pageno",request.getParameter("page"));
			map.put("pagesize",request.getParameter("rows"));
			String result = service.getOnlinePicCollForList(map);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	//我要鉴定列表
	@RequestMapping("/getMyPicCollForList")
	public void getMyPicCollForList(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			String userid=String.valueOf(currentsession.getUserinfo().getId());
			if(currentsession==null){
				out.print("程序异常");
				return;
			}
			Map<String,String> map=new HashMap<String, String>();
			map.put("username",request.getParameter("username"));
			map.put("mobile",request.getParameter("mobile"));
			map.put("name",request.getParameter("name"));
			map.put("zjuserid",request.getParameter("zjuserid"));
			String typeid="";
			//获取专家对应的了类型id
			Map<String,String> mapprof=new HashMap<String, String>();
			String zjresult = service.getOnlinePicProf(mapprof);
			List<Map<String, Object>> zjlist=JSONArray.fromObject(zjresult);
			for(int i=0;i<zjlist.size();i++){
				Map<String, Object> zjmap=zjlist.get(i);
				if(zjmap!=null&&(zjmap.get("userid").toString()==userid||userid.equals(zjmap.get("userid").toString()))){
					typeid=zjmap.get("typeid").toString();
				}
			}
			
			map.put("typeid",typeid);
			map.put("state",request.getParameter("state"));
			map.put("isshangpai",request.getParameter("isshangpai"));
			map.put("zhpg",request.getParameter("zhpg"));
			map.put("level",request.getParameter("level"));
			map.put("ordercolumn",request.getParameter("ordercolumn"));
			map.put("pageno",request.getParameter("page"));
			map.put("pagesize",request.getParameter("rows"));
			String result = service.getOnlinePicCollForList(map);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	//导出
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			Map<String,String> map=new HashMap<String, String>();
			map.put("username",request.getParameter("username"));
			map.put("mobile",request.getParameter("mobile"));
			map.put("name",request.getParameter("name"));
			map.put("zjuserid",request.getParameter("zjuserid"));
			map.put("typeid",request.getParameter("typeid"));
			map.put("state",request.getParameter("state"));
			map.put("isshangpai",request.getParameter("isshangpai"));
			map.put("zhpg",request.getParameter("zhpg"));
			map.put("level",request.getParameter("level"));
			map.put("ordercolumn",request.getParameter("ordercolumn"));
			map.put("pageno",request.getParameter("page"));
			map.put("pagesize",request.getParameter("rows"));
			String result = service.getOnlinePicCollForList(map);
			Map<String, Object> zjmap=JSONObject.fromObject(result);
			String rows=zjmap.get("rows").toString();
			List<Map<String, Object>>zjlist=JSONArray.fromObject(rows);
			if(zjlist == null || zjlist.size() == 0){
				PrintWriter out = response.getWriter();
				response.setContentType("text/html; charset=UTF-8");
				response.setCharacterEncoding("UTF-8");
				out.print("无数据");
				return ;
			}
			OutputStream os =  null;
			response.reset();//清空输出流
			try {
				os = response.getOutputStream();//取得输出流
				response.setHeader("Content-disposition", "attachment;filename=tupianjianding"+DateUtil.getDateTime(new Date(), "yyMMddHHmmss")+".xls");
				response.setContentType("application/msexcel");
				WritableWorkbook wwb = Workbook.createWorkbook(os);//创建Excel文件
				WritableSheet ws = wwb.createSheet("Sheet1", 10);//创建一个工作表
				WritableFont hd = new WritableFont(WritableFont.createFont("微软雅黑"),
						16, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE);
				WritableCellFormat headerFormat = new WritableCellFormat(NumberFormats.TEXT);
				headerFormat.setFont(hd);  
				headerFormat.setBackground(Colour.YELLOW);  
				headerFormat.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);  
				headerFormat.setAlignment(Alignment.CENTRE);
				ws.addCell(new Label(0, 0, "图片鉴定信息表", headerFormat));
				ws.mergeCells(0, 0, 17, 0);
				WritableFont wf = new WritableFont(WritableFont.createFont("微软雅黑"),10,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK);//设置单元格的文字格式
				WritableCellFormat wcf = new WritableCellFormat(wf);
				wcf.setWrap(false);
				wcf.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK); 
				wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
				wcf.setAlignment(Alignment.CENTRE);
				wcf.setWrap(true);
				
				ws.addCell(new Label(0,1,"用户名",wcf));
				ws.addCell(new Label(1,1,"用户级别",wcf));
				ws.addCell(new Label(2,1,"用户电话",wcf));
				ws.addCell(new Label(3,1,"鉴定专家",wcf));
				ws.addCell(new Label(4,1,"藏品名称",wcf));
				ws.addCell(new Label(5,1,"类型",wcf));
				ws.addCell(new Label(6,1,"尺寸、重量",wcf));
				ws.addCell(new Label(7,1,"上传时间",wcf));
				ws.addCell(new Label(8,1,"要求鉴定结果时间",wcf));
				ws.addCell(new Label(9,1,"专家鉴定时间",wcf));
				ws.addCell(new Label(10,1,"复审或上拍时间",wcf));
				ws.addCell(new Label(11,1,"综合评价",wcf));
				ws.addCell(new Label(12,1,"年代",wcf));
				ws.addCell(new Label(13,1,"估值（万）",wcf));
				ws.addCell(new Label(14,1,"行情走势",wcf));
				ws.addCell(new Label(15,1,"是否推荐复审",wcf));
				ws.addCell(new Label(16,1,"退回次数",wcf));
				ws.addCell(new Label(17,1,"状态",wcf));
				int i = 2;
				for (Map<String, Object> enMap : zjlist) {
					ws.addCell(new Label(0,i,enMap.get("username").toString(),wcf));
					if(enMap.get("level").toString().equals("1")){
						ws.addCell(new Label(1,i,"星级会员",wcf));
					}else if(enMap.get("level").toString().equals("2")){
						ws.addCell(new Label(1,i,"贵宾会员",wcf));
					}else if(enMap.get("level").toString().equals("3")){
					    ws.addCell(new Label(1,i,"高级会员",wcf));
					}else if(enMap.get("level").toString().equals("4")){
						ws.addCell(new Label(1,i,"超级会员",wcf));
					}else{
						ws.addCell(new Label(1,i,"免费会员",wcf));
					}
					ws.addCell(new Label(2,i,enMap.get("mobile").toString(),wcf));
					ws.addCell(new Label(3,i,enMap.get("zjname").toString(),wcf));
					ws.addCell(new Label(4,i,enMap.get("name").toString(),wcf));
					ws.addCell(new Label(5,i,enMap.get("typename").toString(),wcf));
					ws.addCell(new Label(6,i,enMap.get("size").toString(),wcf));
				    ws.addCell(new Label(7,i,enMap.get("uploaddate").toString(),wcf));
					ws.addCell(new Label(8,i,enMap.get("yjresultsdate").toString(),wcf));	
					ws.addCell(new Label(9,i,enMap.get("resultsdate").toString(),wcf));	
					ws.addCell(new Label(10,i,enMap.get("fsdate").toString(),wcf));	
					if(enMap.get("zhpg").toString().equals("1")){
						ws.addCell(new Label(11,i,"新",wcf));
					}else if(enMap.get("zhpg").toString().equals("2")){
						ws.addCell(new Label(11,i,"老",wcf));
					}else if(enMap.get("zhpg").toString().equals("3")){
					    ws.addCell(new Label(11,i,"老仿",wcf));
					}else{
						ws.addCell(new Label(11,i,"",wcf));
					}
					
					ws.addCell(new Label(12,i,enMap.get("niandai").toString(),wcf));
					ws.addCell(new Label(13,i,enMap.get("guzhi").toString(),wcf));
					ws.addCell(new Label(14,i,enMap.get("hangqing").toString(),wcf));
					if(enMap.get("isshangpai").toString().equals("1")){
						ws.addCell(new Label(15,i,"不推荐复审",wcf));
					}else if(enMap.get("isshangpai").toString().equals("2")){
						ws.addCell(new Label(15,i,"推荐复审",wcf));
					}else if(enMap.get("isshangpai").toString().equals("3")){
					    ws.addCell(new Label(15,i,"送拍到国外大拍行送拍藏品展示",wcf));
					}else if(enMap.get("isshangpai").toString().equals("4")){
						ws.addCell(new Label(15,i,"送拍到国内大拍行送拍藏品展示",wcf));
					}else if(enMap.get("isshangpai").toString().equals("5")){
						ws.addCell(new Label(15,i,"送拍到淘宝平台网拍藏品展示",wcf));
					}else if(enMap.get("isshangpai").toString().equals("6")){
						ws.addCell(new Label(15,i,"送拍到华豫官网微拍藏品展示",wcf));
					}else{
						ws.addCell(new Label(15,i,"",wcf));
					}
					ws.addCell(new Label(16,i,enMap.get("thcs").toString(),wcf));
					
					if(enMap.get("state").toString().equals("1")){
						ws.addCell(new Label(17,i,"已上传等待审核",wcf));
					}else if(enMap.get("state").toString().equals("2")){
						ws.addCell(new Label(17,i,"专家正在审核",wcf));
					}else if(enMap.get("state").toString().equals("3")){
						ws.addCell(new Label(17,i,"审核未通过，图片清晰度不够",wcf));
					}else if(enMap.get("state").toString().equals("4")){
						ws.addCell(new Label(17,i,"审核未通过，图片含有色情暴力等违法信息",wcf));
					}else if(enMap.get("state").toString().equals("5")){
						ws.addCell(new Label(17,i,"审核未通过，请您核对藏品数量再次上传",wcf));
					}else if(enMap.get("state").toString().equals("6")){
						ws.addCell(new Label(17,i,"专家已审核",wcf));
					}else if(enMap.get("state").toString().equals("7")){
						ws.addCell(new Label(17,i,"过期未得到专家审核",wcf));
					}else if(enMap.get("state").toString().equals("8")){
						ws.addCell(new Label(17,i,"后台复审通过",wcf));
					}else if(enMap.get("state").toString().equals("9")){
						ws.addCell(new Label(17,i,"后台复审未通过",wcf));
					}else{
						ws.addCell(new Label(17,i,"",wcf));
					}
					i++;
				}
				ws.getSettings().setVerticalFreeze(2);
				wwb.write();
				wwb.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//上拍
	@RequestMapping("/OnlinePicCollSp")
	public void OnlinePicCollSp(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			if(currentsession==null){
				out.print("修改失败");
				return;
			}
			Map<String,String> map=new HashMap<String, String>();
			map.put("state",request.getParameter("state"));
			map.put("isshangpai",request.getParameter("isshangpai"));
			map.put("fsdate",DateUtil.getDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
			map.put("id",request.getParameter("id"));
			int num = service.UpdateOnlinePicColl(map);
			out.print(num);
		} catch (Exception e) {
			out.print(0);
			e.printStackTrace();
		}
	}
	//复审
	@RequestMapping("/MyOnlinePicCollFs")
	public void MyOnlinePicCollFs(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			if(currentsession==null){
				out.print("修改失败");
				return;
			}
			Map<String,String> map=new HashMap<String, String>();
			map.put("fsdate",DateUtil.getDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
			map.put("state",request.getParameter("state"));
			map.put("id",request.getParameter("id"));
			int num = service.UpdateOnlinePicColl(map);
			out.print(num);
		} catch (Exception e) {
			out.print(0);
			e.printStackTrace();
		}
	}
	//我要鉴定
	@RequestMapping("/MyOnlinePicColl")
	public void MyOnlinePicColl(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			if(currentsession==null){
				out.print("修改失败");
				return;
			}
			Map<String,String> mapwhere=new HashMap<String, String>();
			mapwhere.put("id", request.getParameter("id"));
			Map<String, Object> item= service.getOnlinePicCollForMap(mapwhere);
			int itemzjuserid=Integer.valueOf(item.get("zjuserid").toString());
			if(itemzjuserid!=-1){
				out.print("-1");
				return ;
			}
			Map<String,String> map=new HashMap<String, String>();
			map.put("zjuserid",String.valueOf(currentsession.getUserinfo().getId()));
			map.put("id",request.getParameter("id"));
			int num = service.UpdateOnlinePicColl(map);
			out.print(num);
		} catch (Exception e) {
			out.print(0);
			e.printStackTrace();
		}
	}
	//	分配专家
	@RequestMapping("/FpOnlinePicColl")
	public void FpOnlinePicColl(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Map<String,String> map=new HashMap<String, String>();
			map.put("zjuserid",request.getParameter("zjuserid"));
			map.put("id",request.getParameter("id"));
			int num = service.UpdateOnlinePicColl(map);
			out.print(num);
		} catch (Exception e) {
			out.print(0);
			e.printStackTrace();
		}
	}
	//退货
	@RequestMapping("/thOnlinePicColl")
	public void thOnlinePicColl(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			if(currentsession==null){
				out.print("修改失败");
				return;
			}
			Map<String,String> map=new HashMap<String, String>();
			map.put("zjuserid",String.valueOf(currentsession.getUserinfo().getId()));
			map.put("state",request.getParameter("state"));
			map.put("smsstate","");//清空短信发送记录
			map.put("id",request.getParameter("id"));
			map.put("resultsdate",DateUtil.getDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
			int num = service.UpdateOnlinePicColl(map);
			out.print(num);
		} catch (Exception e) {
			out.print(0);
			e.printStackTrace();
		}
	}
	//专家鉴定
	@RequestMapping("/UpdateOnlinePicCollByProf")
	public void UpdateOnlinePicCollByProf(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			if(currentsession==null){
				out.print("修改失败");
				return;
			}
			Map<String,String> map=new HashMap<String, String>();
			map.put("zjuserid",String.valueOf(currentsession.getUserinfo().getId()));
			map.put("state",request.getParameter("state"));
			map.put("zhpg",request.getParameter("zhpg"));
			map.put("niandai",request.getParameter("niandai"));
			map.put("guzhi",request.getParameter("guzhi"));
			map.put("hangqing",request.getParameter("hangqing"));
			map.put("detailnote",request.getParameter("detailnote"));
			map.put("isshangpai",request.getParameter("isshangpai"));
			map.put("resultsdate",DateUtil.getDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
			map.put("id",request.getParameter("id"));
			int num = service.UpdateOnlinePicColl(map);
			out.print(num);
		} catch (Exception e) {
			out.print(0);
			e.printStackTrace();
		}
	}
	
	//管理员修改数据
	
	//跳转到鉴定信息添加页面
	@RequestMapping("/gotoOnlineUpJg")
	public String gotoOnlineUpJg(HttpServletRequest request) {
		try {
			String id =request.getParameter("id");
			Map<String,String> map=new HashMap<String, String>();
			map.put("id", id);
			request.setAttribute("item", service.getOnlinePicCollForMap(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/onlinepic/onlinepiccolljg";
	}
	//查询详细信息
	@RequestMapping("/getOnlinePicColl")
	public String getOnlinePicColl(HttpServletRequest request) {
		try {
			String id =request.getParameter("id");
			Map<String,String> map=new HashMap<String, String>();
			map.put("id", id);
			request.setAttribute("item", service.getOnlinePicCollForMap(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/onlinepic/onlinepiccoll";
	}

	//查询所有在线图片鉴定专家
	@RequestMapping("/getOnlinePicProf")
	public void getOnlinePicProf(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = service.getOnlinePicProf(null);
			out.print(result);
		} catch (Exception e) {
			out.print("查询失败");
			e.printStackTrace();
		}
	}
     //添加专家
	@RequestMapping("/Addzj")
	public void Addzj(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			if(currentsession==null){
				out.print("添加失败");
				return;
			}
			Map<String,String> map=new HashMap<String, String>();
			map.put("name",request.getParameter("name"));
			map.put("typeid",request.getParameter("typeid"));
			map.put("userid",request.getParameter("userid"));
			map.put("mobile",request.getParameter("mobile"));
			int num = service.AddOnlinePicProf(map);
			out.print(num);
		} catch (Exception e) {
			out.print(0);
			e.printStackTrace();
		}
	} 
	//修改专家
	@RequestMapping("/Updatezj")
	public void Updatezj(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			if(currentsession==null){
				out.print("修改失败");
				return;
			}
			Map<String,String> map=new HashMap<String, String>();
			map.put("name",request.getParameter("name"));
			map.put("typeid",request.getParameter("typeid"));
			map.put("userid",request.getParameter("userid"));
			map.put("mobile",request.getParameter("mobile"));
			map.put("state",request.getParameter("state"));
			map.put("id",request.getParameter("id"));
			int num = service.UpdateOnlinePicProf(map);
			out.print(num);
		} catch (Exception e) {
			out.print(0);
			e.printStackTrace();
		}
	}
	//查询所有在线图片鉴定藏品类型
	@RequestMapping("/getOnlinePicType")
	public void getOnlinePicType(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = service.getOnlinePicType(null);
			out.print(result);
		} catch (Exception e) {
			out.print("查询失败");
			e.printStackTrace();
		}
	}
	  //添加类型
	@RequestMapping("/AddType")
	public void AddType(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			if(currentsession==null){
				out.print("添加失败");
				return;
			}
			Map<String,String> map=new HashMap<String, String>();
			map.put("name",request.getParameter("name"));
			int num = service.AddOnlinePicType(map);
			out.print(num);
		} catch (Exception e) {
			out.print(0);
			e.printStackTrace();
		}
	} 
	 //修改类型
	@RequestMapping("/UpdateType")
	public void UpdateType(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			if(currentsession==null){
				out.print("修改失败");
				return;
			}
			Map<String,String> map=new HashMap<String, String>();
			map.put("name",request.getParameter("name"));
			map.put("state",request.getParameter("state"));
			map.put("id",request.getParameter("id"));
			int num = service.UpdateOnlinePicType(map);
			out.print(num);
		} catch (Exception e) {
			out.print(0);
			e.printStackTrace();
		}
	} 
	@RequestMapping("/downIMGByid")
	public void downIMGByid(HttpServletRequest request, HttpServletResponse response) {
		try {
			String id =request.getParameter("id");
			Map<String,String> where=new HashMap<String, String>();
			where.put("id", id);
			Map<String, Object> map=service.getOnlinePicCollForMap(where);
			String images[];
			String name=map.get("bh").toString();
			//判断文件是否存在
			if(map.get("pic")!=null){
				images=map.get("pic").toString().split(",");
				for(int i=0;i<images.length;i++){
					String newPath= request.getSession().getServletContext().getRealPath("/") + "zengjipaipin/test/"+name+"/";
					String newfilename=images[i].substring(images[i].lastIndexOf("/")+1,images[i].length());
					DownloadImage.download("http://admin.wswhly.com/zengjipaipin/"+images[i],newfilename, newPath);
				}
				//对 name文件夹进行压缩打包
				compress(request.getSession().getServletContext().getRealPath("/") + "zengjipaipin/test/",name);
				//下载打包之后的文件
				 // path是指欲下载的文件的路径。
				String path=request.getSession().getServletContext().getRealPath("/") + "zengjipaipin/test/"+name+".zip";
	            File file = new File(path);
	            // 取得文件名。
	            String filename = file.getName();

	            // 以流的形式下载文件。
	            InputStream fis = new BufferedInputStream(new FileInputStream(path));
	            byte[] buffer = new byte[fis.available()];
	            fis.read(buffer);
	            fis.close();
	            response.reset();
	            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes()));
	            response.addHeader("Content-Length", "" + file.length());
	            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
	            response.setContentType("application/octet-stream");
	            toClient.write(buffer);
	            toClient.flush();
	            toClient.close();
	            file.delete(); 
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
//		压缩文件
		public void compress(String srcPathName,String filename) {  
			 File zipFile=new  File(srcPathName+"/"+filename+".zip");
	        File srcdir = new File(srcPathName+"/"+filename);   
	        if (!srcdir.exists())   
	            throw new RuntimeException(srcPathName + "不存在！");   
	           
	        Project prj = new Project();   
	        Zip zip = new Zip();   
	        zip.setProject(prj);   
	        zip.setDestFile(zipFile);   
	        FileSet fileSet = new FileSet();   
	        fileSet.setProject(prj);   
	        fileSet.setDir(srcdir);   
	        zip.addFileset(fileSet);   
	        zip.execute();   
	    }   
}
