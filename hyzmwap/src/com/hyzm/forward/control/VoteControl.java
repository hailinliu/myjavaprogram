package com.hyzm.forward.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.hyzm.bean.CurrentSession;
import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.collection.CollectionListRespBean;
import com.hyzm.bean.collection.CollectionListRespBean.Collection;
import com.hyzm.bean.collection.CollectionTypeRespBean.Type;
import com.hyzm.bean.forums.ForumsListRespBean.Forums;
import com.hyzm.bean.vote.ActivityListRespBean.Activity;
import com.hyzm.bean.vote.ActivityReqBean;
import com.hyzm.bean.vote.VoteInfoReqBean;
import com.hyzm.forward.service.collection.CollectionService;
import com.hyzm.forward.service.forums.ForumsService;
import com.hyzm.forward.service.mine.MineService;
import com.hyzm.forward.service.vote.VoteService;
import com.hyzm.util.ImageUtil;
import com.hyzm.util.PropertiesUtil;
import com.hyzm.util.StringUtil;

@Controller
@RequestMapping("/vote")
public class VoteControl {
	@Autowired
	private MineService service;
	
	@Autowired
	private VoteService voteService;
	@Autowired
	private CollectionService colService;
	
	@Autowired
	private ForumsService forumsService;
	
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
		return "gotohyzm/gotoupload";
	}
	
	@RequestMapping("/gotocollectupload")
	public String gotocollectupload(HttpServletRequest request) {
		try {
			List<Type> list = colService.getTypeList();
			String count = request.getParameter("count");
			request.setAttribute("typeList", list);
			request.setAttribute("count", count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "gemcoll/gotoupload";
	}
	
	@RequestMapping("/gotovipupload")
	public String gotovipupload(HttpServletRequest request) {
		try {
			List<Type> list = colService.getTypeList();
			String count = request.getParameter("count");
			request.setAttribute("typeList", list);
			request.setAttribute("count", count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "vipcollection/gotoupload";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/myvipupload")
	public String myvipupload(HttpServletRequest request) {
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "12";
			}
			Map<String, Object> map = voteService.getMyActivitiesList(Integer.valueOf(currentPage), Integer.valueOf(pageSize), currentsession.getId(), "", "4");
			List<Activity> list = (List<Activity>) map.get("list");
			for (Activity col : list) {
				String image = col.getImgurl();
				String[] imgarray = image.split(",");
				col.setImgurl(imgarray[0]);
			}
			request.setAttribute("count",map.get("count"));
			request.setAttribute("listsize", list.size());
			request.setAttribute("uploadList", list);
			request.setAttribute("pageSize", pageSize);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "vipcollection/myUpload";
	}

	@RequestMapping("/uploadCollectionMsg")
	public void updateCollectionMsg(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");	
		MessageRespBean respBean=null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			String fileNameLong = "";
			String extensionName = "";
			String filename = "";
			String imageurl = "";
			if (request instanceof MultipartHttpServletRequest) {
				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				List<MultipartFile> files = multipartRequest.getFiles("fileField");
				if (files.size() == 0) {
					imageurl = request.getParameter("oldimage");
				} else {
					for (MultipartFile file : files) {
						long size = file.getSize();
						if (size != 0) {
							byte[] data = new byte[(int) size];
							InputStream input = file.getInputStream();
							input.read(data);
							fileNameLong = file.getOriginalFilename();//获取上传的文件名称
							extensionName = fileNameLong.substring(fileNameLong.lastIndexOf(".") + 1);//获取文件扩展名
							filename = UUID.randomUUID().toString();//重命名文件
							String saveFilePath = new PropertiesUtil("config.properties").getProperties("voteActivityUrl");
							File outFile = new File(saveFilePath + filename + "." +extensionName);
							if (!outFile.exists()) {
								outFile.createNewFile();
							}
							FileOutputStream outStream = new FileOutputStream(outFile);
							outStream.write(data);
							outStream.close();
							input.close();
							ImageUtil.imageZip(saveFilePath, filename, extensionName, 156, 142);
							imageurl = imageurl + filename + "." +extensionName + ",";
						}
					}
				}
			}
			out = response.getWriter();
		    String id = request.getParameter("id");
		    String type = request.getParameter("type");
		    ActivityReqBean reqBean = new ActivityReqBean();
		    if (id == null || "".equals(id)) {
		    	reqBean.setUserid(currentsession.getId());
		    	reqBean.setType(Integer.valueOf(request.getParameter("typeid")));
		    	reqBean.setName(request.getParameter("name"));
		    	reqBean.setImgurl(imageurl);
		    	reqBean.setNote(request.getParameter("memo"));
		    	reqBean.setSerialnum(StringUtil.getCollectionnum("ac"));
		    	reqBean.setUserlevel(currentsession.getLevel());
		    	if (!type.equals("4")) {
		    		reqBean.setIssue(voteService.getCurrentActivity(request.getParameter("type")));
		    	}
		    	respBean=voteService.activityInfo(reqBean);
		    } else {
				reqBean.setId(Long.valueOf(request.getParameter("id")));
				reqBean.setType(Integer.valueOf(request.getParameter("typeid")));
				reqBean.setName(request.getParameter("name"));
				reqBean.setImgurl(imageurl);
				reqBean.setNote(request.getParameter("memo"));
				respBean = voteService.updateActivityInfo(reqBean);
		    }
		    if (respBean.getErrorcode().equals("0000")) {
		    	if (type.equals("2")) {
		    		out.print("<script>alert('操作成功！');location.href='../redirect?p=gotohyzm/myRelease';</script>");
		    	} else if (type.equals("3")) {
		    		out.print("<script>alert('操作成功！');location.href='../redirect?p=gemcoll/myRelease';</script>");
		    	} else {
		    		out.print("<script>alert('操作成功！');location.href='../redirect?p=vipcollection/myRelease';</script>");
		    	}
		    } else {
		    	if (type.equals("2")) {
		    		out.print("<script>alert('"+respBean.getErrorinfo()+"');location.href='../vote/gotoupload';</script>");
		    	} else if (type.equals("3")) {
		    		out.print("<script>alert('"+respBean.getErrorinfo()+"');location.href='../vote/gotocollectupload';</script>");
		    	} else {
		    		out.print("<script>alert('"+respBean.getErrorinfo()+"');location.href='../vote/gotovipupload';</script>");
		    	}
		    }
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorinfo", respBean.getErrorinfo());
		}
		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/gotoMyupload")
	public String gotoMyupload(HttpServletRequest request) {
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
			Map<String, Object> map = voteService.getMyCollection(currentsession.getId(), Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.parseInt(pageSize));
			List<Activity> list = (List<Activity>) map.get("list");
			for (Activity col : list) {
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
		return "gotohyzm/myupload";
	}
	
	@RequestMapping("/updateVote")
		public void updateVote(HttpServletRequest request, HttpServletResponse response) {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html");	
			PrintWriter out = null;
			MessageRespBean respBean=null;
			try {
				String collectionid= request.getParameter("collectionid");				
				out = response.getWriter();
				CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");	
				
				List<Activity> list=voteService.getVoteList(currentSession.getId(), Long.parseLong(collectionid));
				if(null!=list && list.size()>0){
					out.print("999");
				}else{
					VoteInfoReqBean info = new VoteInfoReqBean();
					info.setCollectionid(Long.parseLong(collectionid));
					info.setUserid(currentSession.getId());
					//info.setVotenum(1);
					voteService.voteInfo(info);
					respBean=voteService.updateActivityInfo(Integer.parseInt(collectionid));			
					out.print(new Gson().toJson(respBean.getErrorcode()));
				}	
			} catch (Exception e) {
				
				out.print("程序异常！");
				e.printStackTrace();
				out.print(new Gson().toJson(respBean.getErrorcode()));
			}
			
		}
	
	@RequestMapping("/activityAllList")
	public void activityAllList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String currentPage = request.getParameter("page");
			String pageSize = request.getParameter("pagesize");
			String order = request.getParameter("order");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "12";
			}
			if (order == null) {
				order = "2";
			}
			Map<String, Object> map = voteService.getActivitiesList(Integer.valueOf(currentPage), Integer.valueOf(pageSize), voteService.getCurrentActivity("2"), order, "2");
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/collectAllList")
	public void collectAllList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String currentPage = request.getParameter("page");
			String pageSize = request.getParameter("pagesize");
			String order = request.getParameter("order");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "12";
			}
			if (order == null) {
				order = "2";
			}
			Map<String, Object> map = voteService.getActivitiesList(Integer.valueOf(currentPage), Integer.valueOf(pageSize), voteService.getCurrentActivity("3"), order, "3");
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/vipCollectionList")
	public void vipCollecionList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String currentPage = request.getParameter("page");
			String pageSize = request.getParameter("pagesize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "12";
			}
			Map<String, Object> map = voteService.getActivitiesList(Integer.valueOf(currentPage), Integer.valueOf(pageSize), 0, "", "4");
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/gotoHyvote")
	public String gotoHyvote(HttpServletRequest request, HttpServletResponse response) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			String type = request.getParameter("type");
			Activity activity = voteService.getActivity(id);
			
			//评论
			List<Forums> listForum=forumsService.getFlagshopList(id, type);
			List<Forums> listRepaly=new ArrayList<Forums>() ;
			List<Forums> addlist=new ArrayList<Forums>() ;
			int likenum=0;
			for (Forums forums : listForum) {
				likenum+=Integer.parseInt(forums.getLikenum());
				if(!forums.getCountnum().equals("0")){
					listRepaly.add(forums);	
				}else{
					addlist.add(forums);
				}
			}
			request.setAttribute("forumList", addlist);
			request.setAttribute("repalyList", listRepaly);
			request.setAttribute("forumSize", listForum.size());
			request.setAttribute("likenum", likenum+listForum.size());
			request.setAttribute("type", type);
			
			request.setAttribute("activity", activity);;
			request.setAttribute("imgarray", activity.getImgurl());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "gotohyzm/gotoHyvote";
	}
	
	@RequestMapping("/gotoHygem")
	public String gotoHygem(HttpServletRequest request, HttpServletResponse response) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			String type = request.getParameter("type");
			Activity activity = voteService.getActivity(id);
			
			//评论
			List<Forums> listForum=forumsService.getFlagshopList(id, type);
			List<Forums> listRepaly=new ArrayList<Forums>() ;
			List<Forums> addlist=new ArrayList<Forums>() ;
			int likenum=0;
			for (Forums forums : listForum) {
				likenum+=Integer.parseInt(forums.getLikenum());
				if(!forums.getCountnum().equals("0")){
					listRepaly.add(forums);	
				}else{
					addlist.add(forums);
				}
			}
			request.setAttribute("forumList", addlist);
			request.setAttribute("repalyList", listRepaly);
			request.setAttribute("forumSize", listForum.size());
			request.setAttribute("likenum", likenum+listForum.size());
			request.setAttribute("type", type);
			
			request.setAttribute("activity", activity);;
			request.setAttribute("imgarray", activity.getImgurl());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "gemcoll/getHygem";
	}
	
	@RequestMapping("/gotoHyvip")
	public String gotoHyvip(HttpServletRequest request, HttpServletResponse response) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			Activity activity = voteService.getActivity(id);
			
			//评论
			List<Forums> listForum=forumsService.getFlagshopList(id, "4");
			List<Forums> listRepaly=new ArrayList<Forums>() ;
			List<Forums> addlist=new ArrayList<Forums>() ;
			int likenum=0;
			for (Forums forums : listForum) {
				likenum+=Integer.parseInt(forums.getLikenum());
				if(!forums.getCountnum().equals("0")){
					listRepaly.add(forums);	
				}else{
					addlist.add(forums);
				}
			}
			request.setAttribute("forumList", addlist);
			request.setAttribute("repalyList", listRepaly);
			request.setAttribute("forumSize", listForum.size());
			request.setAttribute("likenum", likenum+listForum.size());
			request.setAttribute("type", 4);
			
			request.setAttribute("activity", activity);;
			request.setAttribute("imgarray", activity.getImgurl());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "vipcollection/getvipcoll";
	}
	
	@RequestMapping("/vote")
	public void vote(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long collectionid = Long.valueOf(request.getParameter("collectionid"));
			MessageRespBean respBean = voteService.vote(currentsession.getId(), collectionid);
			if (respBean.getErrorcode().equals("0000")) {
				out.print("0000");
			} else {
				out.print(respBean.getErrorinfo());
			}
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/updateNote")
	public void updateNote(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String note = request.getParameter("note");
			MessageRespBean respBean = voteService.updateNote(id, note);
			if (respBean.getErrorcode().equals("0000")) {
				out.print("0000");
			} else {
				out.print(respBean.getErrorinfo());
			}
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getCollection")
	public String getCollectionById(HttpServletRequest request, HttpServletResponse response) {
		Collection col = new CollectionListRespBean().new Collection();
		List<Collection> list = new ArrayList<Collection>();
		try {
			String id = request.getParameter("id");
			String userid = request.getParameter("userid");
			col = colService.getCollectionById(Long.valueOf(id), userid==null||"".equals(userid)?0:Long.valueOf(userid));
			String images = col.getImgurl();
			String[] imgsarray = images.split(",");
			col.setImgurl(imgsarray[0]);
			list = colService.getCollectionList(id, col.getType());
			for (Collection coll : list) {
				String image = coll.getImgurl();
				String[] imgarray = image.split(",");
				coll.setImgurl(imgarray[0]);
			}
			request.setAttribute("collection", col);
			request.setAttribute("colList", list);
			request.setAttribute("imgsarray", imgsarray);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "collection/getCollection";
	}
	
	@RequestMapping("/myActivityRelease")
	public void myActivityRelease(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String currentPage = request.getParameter("page");
			String pageSize = request.getParameter("pagesize");
			String order = request.getParameter("order");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "12";
			}
			if (order == null) {
				order = "2";
			}
			Map<String, Object> map = voteService.getMyActivitiesList(Integer.valueOf(currentPage), Integer.valueOf(pageSize), currentsession.getId(), order, "2");
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/myCollectRelease")
	public void myCollectRelease(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String currentPage = request.getParameter("page");
			String pageSize = request.getParameter("pagesize");
			String order = request.getParameter("order");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "12";
			}
			if (order == null) {
				order = "2";
			}
			Map<String, Object> map = voteService.getMyActivitiesList(Integer.valueOf(currentPage), Integer.valueOf(pageSize), currentsession.getId(), order, "3");
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/myVipRelease")
	public void myVipRelease(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String currentPage = request.getParameter("page");
			String pageSize = request.getParameter("pagesize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "12";
			}
			Map<String, Object> map = voteService.getMyActivitiesList(Integer.valueOf(currentPage), Integer.valueOf(pageSize), currentsession.getId(), "", "4");
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/deleteVipCollection")
	public void deleteVipCollection(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			MessageRespBean respBean = voteService.activityDel(id);
			if (respBean.getErrorcode().equals("0000")) {
				out.print("0000");
			} else {
				out.print(respBean.getErrorinfo());
			}
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/gotoUpdateVipCollection")
	public String gotoUpdateVipCollection(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			Activity activity = voteService.getActivity(id);
			List<Type> list = colService.getTypeList();
			String count = request.getParameter("count");
			request.setAttribute("typeList", list);
			request.setAttribute("count", count);
			request.setAttribute("activity", activity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "vipcollection/gotoupload";
	}
	
	@RequestMapping("/updateVipCollection")
	public void updateVipCollection(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			ActivityReqBean reqBean = new ActivityReqBean();
			reqBean.setId(Long.valueOf(request.getParameter("id")));
			reqBean.setType(Integer.valueOf(request.getParameter("typeid")));
			reqBean.setName(request.getParameter("name"));
			reqBean.setImgurl(request.getParameter("imgurl"));
			reqBean.setNote(request.getParameter("memo"));
			MessageRespBean respBean = voteService.updateActivityInfo(reqBean);
			if (respBean.getErrorcode().equals("0000")) {
				out.print("0000");
			} else {
				out.print(respBean.getErrorinfo());
			}
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}

}
