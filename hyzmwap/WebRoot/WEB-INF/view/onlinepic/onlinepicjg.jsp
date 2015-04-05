<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String id="";
if(request.getParameter("id")!=null && !"".equals(request.getParameter("id"))){
  id=request.getParameter("id");
}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

<title>拍品详情</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<style type="text/css">
body { padding: 0; margin: 0; background: #fff; font-family: "Lucida Grande", Helvetica, Arial,Verdana, sans-serif; color: #444340; }
h1 { font-size: 1.3em; padding: 10px 10px; margin: 0 10% ; color: #fff;text-overflow: ellipsis;
overflow: hidden;
white-space: nowrap;}
p{text-indent: 2em;padding:2px 10px;}
img { border: none; }
a { color: #444340; }

#Header { background: #000; height: 42px; border-bottom: 1px solid #3c3c3c; text-align: center;}
/*#Header img {float: left}*/
#Header .leftdiv {float: left; padding: 10px 10px;}
#Header .centerdiv {display: inline;}

#MainContent { background: #ffffff; padding-bottom: 30px; }

#Footer { padding: 10px; border-top: none; }

#SocialLinks { padding: 10px 0 0 0; }
#SocialLinks:after { clear: both; content: "."; display: block; height: 0; visibility: hidden; }
#SocialLinks a { display: block; float: left; padding-right: 15px; }

div.gallery-row:after { clear: both; content: "."; display: block; height: 0; visibility: hidden; }
div.gallery-item { float: left; width: 33.333333%; }
div.gallery-item a { display: block; margin: 5px; border: 1px solid #3c3c3c; }
div.gallery-item img { display: block; width: 150px; height: 100px; max-width:100%; }
</style>

<link href="<c:url value='/css/photoswipe.css'/>" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="<c:url value='/jquery/jquery-1.6.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/simple-inheritance.min.js'/>"></script>

<!-- NOTE: including the jQuery engine version -->
<script type="text/javascript" src="<c:url value='/jquery/code-photoswipe-jQuery-1.0.11.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("#Gallery a").photoSwipe();
});


</script>
  </head>

  <body>

	<div id="Header">
		<div class="centerdiv"><h1>${yclots.name}</h1> </div>
	</div>
 <div class="slider">
        <div class="slide-group">
	       <div class="gallery-item"><a href="http://admin.wswhly.com/zengjipaipin/${fn:split(item.pic,',')[0]}"><img src="http://admin.wswhly.com/zengjipaipin/${fn:split(item.pic,',')[0]}" alt="${item.name}"/></a></div>
	          <div class="slide">

	          </div>

        </div>
      </div>
<div style="padding: 0 5px;">
		  <p>
		   <b>${item.name}</b><hr/>
		  尺寸/重量:${item.size}<hr/>
		  藏品分类：${item.typename}<hr/>
<%--		 鉴定专家：${item.zjname}<hr/>--%>
		  上传时间:${item.sfuploaddate}<hr/>
		  <c:if test="${item.state==8}">
		  回复时间:	${item.sfresultsdate}<hr/>
       	综合评价:<c:if test="${item.zhpg==1}">新</c:if><c:if test="${item.zhpg==2}">老</c:if><c:if test="${item.zhpg==3}">老仿</c:if><hr/>
       	<c:if test="${item.zhpg!=1}">
       	估值（万）:<c:if test="${item.level>=2}">${item.guzhi}</c:if><hr/>
       	行情走势:${item.hangqing}<hr/>
       	</c:if>
       	详细说明:${item.detailnote} <hr/>
       	是否推荐复审:<c:if test="${item.isshangpai==1}">不推荐复审</c:if><c:if test="${item.isshangpai==2}">推荐复审</c:if>
					<c:if test="${item.isshangpai==3}">送拍到国外大拍行送拍藏品展示</c:if><c:if test="${item.isshangpai==4}">送拍到国内大拍行送拍藏品展示</c:if><c:if test="${item.isshangpai==5}">送拍到淘宝平台网拍藏品展示</c:if>
					<c:if test="${item.isshangpai==6}">送拍到华豫官网微拍藏品展示</c:if><hr/>
		 </c:if>
		  状态:<c:if test="${item.state==1}">等待鉴定</c:if>
					<c:if test="${item.state==2}">等待鉴定</c:if>
					<c:if test="${item.state==3}">审核未通过，图片清晰度不够</c:if>
					<c:if test="${item.state==4}">审核未通过，该藏品所选门类与实际不符</c:if>
					<c:if test="${item.state==5}">审核未通过，请您核对藏品数量</c:if>
					<c:if test="${item.state==6}">等待鉴定</c:if>
					<c:if test="${item.state==7}">过期未得到专家审核</c:if>
					<c:if test="${item.state==8}">已鉴定</c:if>
					<c:if test="${item.state==9}">等待鉴定</c:if><hr/>
		  <br>
		 
		  <c:forTokens items="${item.pic}" delims="," var="val"> <img src="http://admin.wswhly.com/zengjipaipin//${val}" alt="" width="100%"/> </c:forTokens>
</div>


  </body>
</html>
