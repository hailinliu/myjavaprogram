package com.hyzm.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import common.Logger;

public class HtmlCreatorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger=Logger.getLogger(HtmlCreatorServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	// 编码方式，可以配置到 web.xml 里。
	String encoding = "GBK";
	// 得到真实的请求地址
	String templatePath = simpleURLReWrite(request);
	String realPath=
	request.getSession().getServletContext().getRealPath("/");
	// 想要生成的静态html文件的名字
	String htmlName = getHtmlFileName(request);
	// 静态html的名字，包含绝对路径
	String cachFileName = realPath + File.separator + htmlName;
	logger.debug("cachFileName = " + cachFileName);
	File cacheFile = new File(cachFileName);
	boolean load = true;
	// 如果静态html 存在，就直接显示html，否则，我们就生成它。
	if(cacheFile.exists()) {
	load = false;
	}
	if(load) {
	final ByteArrayOutputStream os = new ByteArrayOutputStream();
	final ServletOutputStream stream = new ServletOutputStream() {
	public void write(byte[] data, int offset,
	int length) {
	os.write(data, offset, length);
	}
	public void write(int b) throws IOException {
	os.write(b);
	}
	};
	final PrintWriter pw =
	new PrintWriter(new OutputStreamWriter(os, encoding));
	HttpServletResponse rep =
	new HttpServletResponseWrapper(response) {
	public ServletOutputStream getOutputStream() {
	return stream;
	}
	public PrintWriter getWriter() {
	return pw;
	}
	};
	logger.debug("HtmlCreatorServlet RequestDispatcher = " + templatePath);
	// 使用 RequestDispatcher 去处理真正的请求。
	// 例如 index.shtm ，则转发到 index.do
	RequestDispatcher dispatcher =
	getServletContext().getRequestDispatcher(templatePath);
	dispatcher.include(request, rep);
	pw.flush();
	FileOutputStream fos = null;
	try {
	if(os.size() == 0) {
	// 如果请求的地址无效，那么就发送一个404错误。
	response.sendError(
	HttpServletResponse.SC_NOT_FOUND, "");
	} else {
	// 生成静态文件，并且显示这个静态文件
	fos = new FileOutputStream(cachFileName);
	os.writeTo(fos);
	dispatcher =
	getServletContext().
	getRequestDispatcher("/"+htmlName);
	dispatcher.include(request, response);
	}
	} finally {
	if(fos != null) {
	fos.close();
	}
	}
	} else {
	RequestDispatcher dispatcher =
	getServletContext().getRequestDispatcher("/"+htmlName);
	dispatcher.include(request, response);
	}
	}
	// 这个方法就是把 http://xyz.com/product_pageNumber_1.shtm
	// 变成 http://xyz.com/product.do?pageNumber=1
	protected String simpleURLReWrite(HttpServletRequest request)
	throws ServletException, IOException {
	String uri = request.getRequestURI();
	String contextPath = request.getContextPath();
	logger.debug("HtmlCreator contextPath = " + contextPath);
	if (contextPath != null && contextPath.length() > 0)
	uri = uri.substring(contextPath.length());
	uri = uri.substring(0, uri.length()-5);
	String[] urls = uri.split("_");
	uri = urls[0];
	if(urls.length > 1) {
	for(int i = 1; i < urls.length; i += 2) {
	if(i==1) {
	uri += "?" + urls[i] + "=" + urls[i+1];
	} else {
	uri += "&" + urls[i] + "=" + urls[i+1];
	}
	}
	}
	logger.debug("HtmlCreatorServlet get uri = " + uri);
	return uri;
	}
	private String getHtmlFileName(HttpServletRequest request) throws
	ServletException, IOException{
	String uri = request.getRequestURI();
	String contextPath = request.getContextPath();
	if (contextPath != null && contextPath.length() > 0)
	uri = uri.substring(contextPath.length());
	uri = uri.substring(1, uri.length()-5).replace("/", "\\");
	uri += ".html";
	return uri;
	}
}