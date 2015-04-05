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

import net.sf.json.JSONArray;

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
	
	//获取藏品个数
	@RequestMapping("/getPicCollCount")
	public void getPicCollCount(HttpServletRequest request, HttpServletResponse response){
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
			int usertype=Integer.valueOf(request.getSession().getAttribute("usertype").toString());
			Map<String,String> map=new HashMap<String, String>();
			if(usertype==1){
			map.put("zjuserid",String.valueOf(currentsession.getUserinfo().getId()));
			}
			map.put("state",request.getParameter("state"));
			int num = service.getOnlinePicCollForCount(map);
			out.print(num);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	
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
			int usertype=Integer.valueOf(request.getSession().getAttribute("usertype").toString());
			if(usertype==1){
			map.put("zjuserid",String.valueOf(currentsession.getUserinfo().getId()));
			}
			map.put("typeid",request.getParameter("typeid"));
			map.put("state",request.getParameter("state"));
			map.put("isshangpai",request.getParameter("isshangpai"));
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
			int usertype=Integer.valueOf(request.getSession().getAttribute("usertype").toString());
			if(usertype==1){
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
			}
			map.put("state",request.getParameter("state"));
			map.put("isshangpai",request.getParameter("isshangpai"));
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
			map.put("state",request.getParameter("state"));
			map.put("fsdate",DateUtil.getDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
			map.put("id",request.getParameter("id"));
			int num = service.UpdateOnlinePicColl(map);
			out.print(num);
		} catch (Exception e) {
			out.print(0);
			e.printStackTrace();
		}
	}
//	我要鉴定
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
//			map.put("state",request.getParameter("state"));
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
			map.put("id",request.getParameter("id"));
			map.put("zjuserid",String.valueOf(currentsession.getUserinfo().getId()));
			map.put("state",request.getParameter("state"));
			map.put("zhpg",request.getParameter("zhpg"));
			map.put("niandai",request.getParameter("niandai"));
			map.put("guzhi",request.getParameter("guzhi"));
			map.put("hangqing",request.getParameter("hangqing"));
			map.put("detailnote",request.getParameter("detailnote"));
			map.put("isshangpai",request.getParameter("isshangpai"));
			map.put("resultsdate",DateUtil.getDateTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
			
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
		return "/onlinepic/onlinejg";
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
		return "/onlinepic/oninfo";
	}

	//查询所有在线图片鉴定专家
	@RequestMapping("/getOnlinePicProf")
	public void getOnlinePicProf(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Map<String,String> map=new HashMap<String, String>();
			String result = service.getOnlinePicProf(map);
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
