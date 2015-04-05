package com.hyzm.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import common.Logger;

public class UrlFile {
	private Logger logger=Logger.getLogger(HtmlCreatorServlet.class);
	public static String getFilepath(HttpServletRequest request){
		String realPath=request.getSession().getServletContext().getRealPath("/");
			// 想要生成的静态html文件的名字
			String htmlName="";
			try {
				htmlName = getHtmlFileName(request);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			// 静态html的名字，包含绝对路径
			String cachFileName = realPath + File.separator + htmlName;
			return cachFileName;
	}
	private static String getHtmlFileName(HttpServletRequest request) throws
		ServletException, IOException{
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		if (contextPath != null && contextPath.length() > 0)
		uri = uri.substring(contextPath.length());
		uri = uri.substring(1, uri.length()-5).replace("/", "\\");
		uri += ".html";
		return uri;
	}
	/**
	* 删除文件
	* @param filePathAndName String 文件路径及名称 如c:/fqf.txt
	* @param fileContent String
	* @return boolean
	*/
	public static void delFile(String path) {
	try {
	String filePath = path;
	filePath = filePath.toString();
	java.io.File myDelFile = new java.io.File(filePath);
	myDelFile.delete();
	}
	catch (Exception e) {
	System.out.println("删除文件操纵出错");
	e.printStackTrace();
	}
	}
	/**
	* 删除文件夹
	* @param filePathAndName String 文件夹路径及名称 如c:/fqf
	* @param fileContent String
	* @return boolean
	*/
	public static void delFolder(String path) {
	try {
	delAllFile(path); //删除完里面所有内容
	String filePath = path;
	filePath = filePath.toString();
	java.io.File myFilePath = new java.io.File(filePath);
	myFilePath.delete(); //删除空文件夹
	}
	catch (Exception e) {
	System.out.println("删除文件夹操纵出错");
	e.printStackTrace();
	}
	}
	/**
	* 删除文件夹里面的所有文件
	* @param path String 文件夹路径 如 c:/fqf
	*/
	public static void delAllFile(String path) {
	File file = new File(path);
	if (!file.exists()) {
	return;
	}
	if (!file.isDirectory()) {
	return;
	}
	String[] tempList = file.list();
	File temp = null;
	for (int i = 0; i < tempList.length; i++) {
	if (path.endsWith(File.separator)) {
	temp = new File(path + tempList[i]);
	}
	else {
	temp = new File(path + File.separator + tempList[i]);
	}
	if (temp.isFile()) {
	temp.delete();
	}
	if (temp.isDirectory()) {
	delAllFile(path+"/"+ tempList[i]);//先删除文件夹里面的文件
	delFolder(path+"/"+ tempList[i]);//再删除空文件夹
	}
	}
	}
}
