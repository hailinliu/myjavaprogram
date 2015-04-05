<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title></title>

 	 <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_comment.css'/>"/>

	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>

  </head>

  <body>
  <div id="sj_mainbox">
 <!-- 商家菜单 -->
		<div class="sj_titbox">
	      <a href="<c:url value='/redirect?p=flagship01/qjsj_info'/>" target="_blank" class="tit_current">商家首页</a>
	      <a href="<c:url value='/redirect?p=flagship01/qjsj_aboutus'/>" target="_blank">商家简介</a>
	      <a href="<c:url value='/redirect?p=flagship01/qjsj_details'/>" target="_blank">商家动态</a>
	      <a href="<c:url value='/redirect?p=flagship01/qjsj_tuzhan'/>" target="_blank">商家图展</a>
	      <a href="<c:url value='/redirect?p=flagship01/qjsj_video'/>" target="_blank">商家视频</a>
	    </div>

 </body>
</html>