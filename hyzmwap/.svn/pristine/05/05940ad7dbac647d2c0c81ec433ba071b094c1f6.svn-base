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
	       <div class="gallery-item"><a href="http://116.255.149.172:7080/wswhly/zengjipaipin/${fn:split(yclots.image,',')[0]}"><img src="http://116.255.149.172:7080/wswhly/zengjipaipin/${fn:split(yclots.image,',')[0]}" alt="${yclots.name}"/></a></div>
	          <div class="slide">
	            <%--  <img src="${yclots.image}" alt="Skyfall" width="640" height="300" alt="${yclots.name}"  onclick="window.open('${yclots.image}')"> --%>

	          </div>

        </div>
      </div>
<%--  <img src="${yclots.image}" alt="${yclots.name}"  onclick="window.open('${yclots.image}')" /> --%>



<div style="padding: 0 5px;">

		  <p>
		   <b>${yclots.name}</b><hr/>
		  作者：${yclots.autor}<hr/>
		  作品分类：${yclots.classes}<hr/>
		  创作年代：	${yclots.year}<hr/>
		  估价：	${yclots.price}<hr/>
		  专场：	${yclots.specialname}<hr/>
       <c:if test="${yclots.cjprice !=''}">
            成交价：${yclots.cjprice}<hr/>
       </c:if>

		  时间：	${yclots.actiontime}<hr/>
		  拍卖会：	${yclots.auctionname}<hr/>
		  拍卖公司：	${yclots.as_name}<hr/>
		  <br>
		  <a href="<c:url value='/redirect/?p=daigou/DaiGouInfo&lotsid='/>${yclots.id}" style="padding: 8px 12px;background: #a80000;color: #fff;text-decoration: none;border-radius: 5px;">申请代购</a>
		  </p>
		  <p>
		  ${yclots.suggest}${yclots.note}
		  </p>
<!-- <a href="${yclots.image}"><img src="${yclots.image}" alt="${yclots.name}" width="100%"/></a> -->
</div>


  </body>
</html>
