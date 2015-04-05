<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>百宝箱</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<style type="text/css">
body {
	padding: 0;
	margin: 0;
	background: #fff;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	color: #444340;
}
h1 {
	font-size: 1.3em;
	padding: 10px 10px;
	margin: 0;
}
img {
	border: none;
}
a {
	color: #444340;
}
#MainContent {
	background: #ffffff;
	padding-bottom: 30px;
}
#Footer {
	padding: 10px;
	border-top: none;
}
#content a {
	display: block;
	width: 200px;
	line-height: 36px;
	margin: 30px auto 0 auto;
}
</style>
<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.6.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/simple-inheritance.min.js'/>"></script>

<!-- NOTE: including the jQuery engine version -->
<script type="text/javascript" src="<c:url value='/jquery/code-photoswipe-jQuery-1.0.11.min.js'/>"></script>
</head>

<body>
<!--从首页“百宝箱”入口点击进入该页面。
该页面只有三个按钮，即三个入口。
分别对应：1. 我要开店/店铺管理 页面
	    2. 商家列表页面
        3. 店铺列表页面-->
<div data-role="page" class="ui-page ui-page-theme-a ui-page-active" style="display:block">
  <div data-role="header" role="banner" class="ui-header ui-bar-inherit">
    <h1 class="ui-title" role="heading" aria-level="1">百宝箱</h1>
  </div>
  <div id="content" data-role="content" class="ui-content" role="main">
  <img src="../../../images/bbx_zt01.jpg" width="100%" />
  <c:if test="${CurrentSession.baibaoshopstate==null||CurrentSession.baibaoshopstate!=2}">
  <a href="javascript:;" class="btn_01 ui-bar ui-bar-a btn btn-positive btn-block ui-btn ui-shadow ui-corner-all " onclick="location.href='<c:url value="/redirect?p=baibaoxiang/bbx_apply"/>'">我要开店<!--如果用户为开店，此处显示”我要开店“；若已开店，此处显示“店铺管理”。--></a>
  </c:if>
   <c:if test="${CurrentSession.baibaoshopstate==2}">
   <a href="javascript:;" class="btn_01 ui-bar ui-bar-a btn btn-positive btn-block ui-btn ui-shadow ui-corner-all " onclick="location.href='<c:url value="/BaiBaoMine_getShop"/>'">店铺管理<!--如果用户为开店，此处显示”我要开店“；若已开店，此处显示“店铺管理”。--></a>
   </c:if>
     <a href="javascript:;" class="btn_02 ui-bar ui-bar-a btn btn-positive btn-block ui-btn ui-shadow ui-corner-all" onclick="location.href='<c:url value="/BaiBao_getShop?id=7792"/>'">官方推荐</a>
  <a href="javascript:;" class="btn_02 ui-bar ui-bar-a btn btn-positive btn-block ui-btn ui-shadow ui-corner-all" onclick="location.href='<c:url value="/redirect?p=baibaoxiang/cpList"/>'">查找藏品</a>
  <a href="javascript:;" class="btn_03 ui-bar ui-bar-a btn btn-positive btn-block ui-btn ui-shadow ui-corner-all" onclick="location.href='<c:url value="/redirect?p=baibaoxiang/shopList"/>'">查找店铺</a> </div>

</div>
</body>
</html>
