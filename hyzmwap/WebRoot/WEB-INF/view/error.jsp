<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>华豫之门官方网站-卫视文化乐园</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
  </head>
  <body>
  <div data-role="page">
  	<div data-role="header" data-position="fixed">
		<h1><img src="<c:url value='/images/logo.png'/>" width="20px" height="20px" align="top">&nbsp;卫视文化乐园</h1>
	</div>
  	<h2>提示：  服务连接失败，请检查您的网络环境是否正常</h2>
	 <a href="javascript:history.go(-1);" class="ui-shadow ui-btn ui-corner-all">刷新</a>
  </div>  	
  </body>
</html>
