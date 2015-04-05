<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String id="";
if(request.getParameter("id")!=null && !"".equals(request.getParameter("id"))){
  id=request.getParameter("id");
}
 %>
<!DOCTYPE HTML>
<html>
<head>
<title>藏品详情</title>
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

#Footer {
	padding: 10px;
	border-top: none;
}
#SocialLinks {
	padding: 10px 0 0 0;
}
#SocialLinks:after {
	clear: both;
	content: ".";
	display: block;
	height: 0;
	visibility: hidden;
}
#SocialLinks a {
	display: block;
	float: left;
	padding-right: 15px;
}
div.gallery-row:after {
	clear: both;
	content: ".";
	display: block;
	height: 0;
	visibility: hidden;
}
div.gallery-item {
	float: left;
	width: 33.333333%;
}
div.gallery-item a {
	display: block;
	margin: 5px;
	border: 1px solid #3c3c3c;
}
div.gallery-item img {
	display: block;
	width: 150px;
	height: 100px;
	max-width: 100%;
}
.cpList p span{ margin-right:2em}
.cpList p em{ font-size:.9em; font-style:normal; color:#aaa}
.cpjs_img11 img{ width:100%}
.info-show{ cursor:pointer}
</style>
<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>">
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.6.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/simple-inheritance.min.js'/>"></script>

<!-- NOTE: including the jQuery engine version -->
<script type="text/javascript" src="<c:url value='/jquery/code-photoswipe-jQuery-1.0.11.min.js'/>"></script>
<script type="text/javascript">
</script>
</head>

<body>
<div data-role="page" class="ui-page ui-page-theme-a ui-page-active" style="display:block">
  <div data-role="header" role="banner" class="ui-header ui-bar-inherit">
    <h1 class="ui-title" role="heading" aria-level="1">${item.name}</h1>
  </div>
  <div data-role="content" class="ui-content cpList" role="main">
  <a href="javascript:;" class="cp_lpics">
  <img width="100%" src="http://admin.wswhly.com/zengjipaipin//${fn:split(item.pic,',')[0]}"  alt="" />
  </a>
  <p>
<em>藏品名称：</em>
<span><b>${item.name}</b></span>
</p>
<p>
<em>藏品类型：</em>
<span>${item.typename}</span>
</p>
    <hr>
    <p> <em>尺寸/重量：</em><span>${item.size}</span>  </p>
    <hr>
     <p> <em>年代：</em><span>${item.niandai}</span>  </p>
    <hr>
    <p><em>估值：</em> <span><c:if test="${item.level>=2}">${item.guzhi}</c:if>（万）</span></p>
	<hr>
    <p><em>上传时间：</em><span>${item.sfuploaddate}</span></p>
    <hr>
    <div>
      <H3>藏品介绍:</H3>
      <P>${item.note}</P>

    <div class="cpjs_img11">
      <c:forTokens items="${item.pic}" delims="," var="val"> <img src="http://admin.wswhly.com/zengjipaipin//${val}" alt=""  width="100%"/> </c:forTokens>
    </div>
  </div>
  </div>
</div>
<jsp:include page="../foot/footer.jsp"></jsp:include>
</body>
</html>
