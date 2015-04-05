package com.hyzm.util;

import java.io.CharArrayWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import org.springframework.web.filter.OncePerRequestFilter;



public class PageStaticFilter extends OncePerRequestFilter{

	public static final String ACTION_NAME="a",ACTION_TYPE="b",RESOURCE_ID="c";
	public static final Map<String, String> resours = new HashMap<String, String>();
	public static final String NEWS_TYPE = "\\news\\";
	public static final List<String> realUrl = new ArrayList<String>();
	public static enum ResourceType{
		NEWS,
		PROFICIENT,
		COLLECTION,
		YCLOTS,
		REDIRECT,
		VOTE,
		VIDEO,
		baibaoindex,
		OTHER
	}
	public static String SUFFIX = ".dhtml";
	static{
		realUrl.add("/news/getOneNews");
		realUrl.add("/proficient/getProficient");
		realUrl.add("/collection/getCollectionus");
		realUrl.add("/collection/getCollection");
		realUrl.add("/yclots/getYclotsListByid");
		realUrl.add("/redirect");
		realUrl.add("/vote/gotoHyvote");
		realUrl.add("/video/getVideo");
		realUrl.add("/baibaoindex/getOneBaibaoNews");
	}
	@Override
	protected void doFilterInternal(HttpServletRequest request,HttpServletResponse response, FilterChain chain)throws ServletException, IOException {

		String uri = request.getRequestURI();
		do{
			if(uri.endsWith(SUFFIX)){
				System.out.println("请求rhtml静态资源"+getRealPath(request));
				//转发到动态页面处理
				request.getRequestDispatcher(getRealPath(request)).forward(request, response);
				return;
			}else{
				String folder = getResourcePath(request);
				//System.out.println("folder:"+folder);
				if(folder == null){
					chain.doFilter(request, response);
					return;
				}else{
					
					FileCaptureResponseWrapper responseWrapper = new FileCaptureResponseWrapper(response);
					chain.doFilter(request, responseWrapper);
					try {
						cacheFile(request, responseWrapper,folder);
					} catch (Exception e) {
						e.printStackTrace();
					}
					responseWrapper.writeResponse();
				}
			}
		
		}while(false);
		

	}
	private static String getResourcePath(HttpServletRequest request){
		String contextPath = request.getContextPath();
		String uri = request.getRequestURI();
		String resourceId=request.getParameter("id");
		boolean isvalid = !(resourceId==null || "".equals(resourceId));
		String folder = null;
		if(uri.equals(contextPath+"/news/getOneNews")){
			folder = "news";
		}else if(uri.equals(contextPath+"/proficient/getProficient")){
			folder = "proficient";
		}else if(uri.equals(contextPath+"/collection/getCollectionus")){
			folder = "collection";
		}else if(uri.equals(contextPath+"/collection/getCollection")){
			folder = "collection";
		}else if(uri.equals(contextPath+"/yclots/getYclotsListByid")){
			folder = "yclots";
		}else if(uri.equals(contextPath+"/vote/gotoHyvote")){
			folder = "vote";
		}else if(uri.equals(contextPath+"/collect/getlylotsById")){
			folder = "collect";
		}else if(uri.equals(contextPath+"/video/getVideo")){
			folder = "video";
		}else if(uri.equals(contextPath+"/baibaoindex/getOneBaibaoNews")){
			folder = "baibaoindex";
		}else if(uri.equals(contextPath+"/redirect")){
			String p = request.getParameter("p");
			if(p!=null && p.startsWith("flagship")){
				if(p.indexOf("/")==-1)return null;
				String subp = p.substring(p.indexOf("/"),p.length());
				if(subp.length()<2)return null;
				if(subp.startsWith("/qjsj_onenews") || subp.startsWith("/qjsj_aboutus")){
						folder = p.substring(0,p.indexOf("/")-1);
						request.setAttribute("id", subp.substring(1));
						System.out.println("redirect:"+folder);
				}
			}
			return folder;
		}
		return isvalid?folder:null;
	}
	private static String getRealPath(HttpServletRequest request){
		String contextPath = request.getContextPath();
		String uri = request.getRequestURI();
		uri = uri.replace(SUFFIX, "");
		String resourceId = uri.substring(uri.lastIndexOf("/"),uri.length()).replace("/", "");
		String realPath = "/index";
		if(uri.startsWith(contextPath+"/news/")){
			realPath= "/news/getOneNews";
		}else if(uri.startsWith(contextPath+"/proficient/")){
			realPath= "/proficient/getProficient";
		}else if(uri.startsWith(contextPath+"/collection/")){
			realPath="/collection/getCollectionus" ;
		}else if(uri.startsWith(contextPath+"/collection/")){
			realPath="/collection/getCollection" ;
		}else if(uri.startsWith(contextPath+"/yclots/")){
			realPath= "/yclots/getYclotsListByid";
		}else if(uri.startsWith(contextPath+"/flagship")){
			realPath= "/redirect?p="+uri.replace(contextPath+"/","");
			return realPath;
		}else if(uri.startsWith(contextPath+"/vote/")){
			realPath= "/vote/gotoHyvote";
		}else if(uri.startsWith(contextPath+"/collect/")){
			realPath = "/collect/getlylotsById";
		}else if(uri.startsWith(contextPath+"/video/")){
			realPath = "/video/getVideo";
		}else if(uri.startsWith(contextPath+"/baibaoindex/")){
			realPath = "/baibaoindex/getOneBaibaoNews";
		}
		realPath+="?id="+resourceId;
		return realPath;
	}

	private static void cacheFile(HttpServletRequest request,FileCaptureResponseWrapper wrapper,String path) throws Exception{
		String contextPath = request.getContextPath();
		String uri = request.getRequestURI();
		String resourceId=request.getParameter("id");
		if(resourceId==null)resourceId = request.getAttribute("id").toString();
		wrapper.writeFile(request.getSession().getServletContext().getRealPath("")+"/"+path+"/", resourceId+SUFFIX);
	}
	private static String getSimpleUrl(String url){
		int strIndex = url.indexOf("/");
		int endIndex = url.indexOf("?");
		endIndex = endIndex == -1?url.length():endIndex;
		url = strIndex==-1?null:url.substring(strIndex, endIndex);
		return url;
	}
	private static Map<String,String> getActionOp(HttpServletRequest request){
		String url = request.getRequestURL().toString();
		String simpleUrl = getSimpleUrl(request.getRequestURL().toString());
		Map<String,String> resourcekv = new HashMap<String, String>();
		String actionName = null;
		String actionType = null;
		if(simpleUrl==null||simpleUrl.indexOf("/")==-1){
			return null;
		}else{
			actionName =  simpleUrl.substring(simpleUrl.lastIndexOf("/"),simpleUrl.length()-1);
			actionType = simpleUrl.substring(simpleUrl.lastIndexOf("/"));
		}
		resourcekv.put(ACTION_NAME, actionName);
		resourcekv.put(ACTION_TYPE, actionType);
		String resourceId = url.indexOf("?")==-1?"":url.substring(url.indexOf("?"),url.length()-1);
		resourcekv.put(RESOURCE_ID, resourceId);
		return resourcekv;
	}
	public static class FileCaptureResponseWrapper extends HttpServletResponseWrapper {
		private CharArrayWriter output;
		private HttpServletResponse response;

		public String toString() {
			return output.toString();
		}

		public FileCaptureResponseWrapper(HttpServletResponse response) {
			super(response);
			this.response = response;
			output = new CharArrayWriter();
		}

		@Override
		public PrintWriter getWriter() {
			return new PrintWriter(output);
		}

		public void writeFile(String path,String fileName) throws IOException {
			// FileWriter fw = new FileWriter(fileName,"utf-8");
			// fw.write( output.toCharArray(),"utf-8" );
			// PrintWriter writer = new PrintWriter(new OutputStreamWriter(new
			// FileOutputStream(fileName),"utf-8"));

			if(new File(path+fileName).exists())return;
			File file = new File(path);
			if(!file.exists())file.mkdirs();
			FileOutputStream fos = new FileOutputStream(path+fileName);
			System.out.println("filepath:"+path+fileName);
			OutputStreamWriter osw = new OutputStreamWriter(fos, "UTF-8");
			osw.write(output.toCharArray());
			System.out.println("cache file"+fileName);
			osw.close();
		}

		public void writeResponse() throws IOException {
			PrintWriter out = response.getWriter();
			response.setContentLength(-1);
			out.print(output.toCharArray());
			out.flush();
			out.close();
		}
	}
}
