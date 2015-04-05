<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>华豫视频_卫视文化乐园-华豫之门官方网站</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/swfobject.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/scroll.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<meta name=keywords content="华豫视频">
	<meta name=description content="华豫之门视频">
  </head>
  
  <body>
    <jsp:include page="../head/header.jsp"></jsp:include>
    
    <jsp:include page="../banner/banner.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear">
   <div class="qjtjs_pic">
      <span class="bread_nav" style="background: url(../images/hysp_bg_in.jpg);">当前位置：首页<span class="jt">></span>华豫视频<span class="jt">></span>视频讲座<span class="jt">></span> <a href="#">${video.title}</a></span>
   </div>
   <div class="qjtjs_nr clear">
     <div class="title_box2">
       <h3>${video.title}</h3>
       <ul class="title_list2">
           <li>讲座专家：${video.proficient}</li>     
           <li>上传时间：${video.uploaddate}</li>     
       </ul>
     </div>
   
      <div class="video_box clear">
			<p id="player1"><a href="http://www.macromedia.com/go/getflashplayer">Get the Flash Player</a> to see this player.</p>
			<script type="text/javascript">
			 var s1 = new SWFObject("<c:url value='/swfvideo/FlvPlayer.swf'/>","single","700","500","7");
			 s1.addParam("allowfullscreen","true");
			 s1.addVariable("file","${video.name}"); 
			
			 s1.addVariable("image","${video.imgurl}");
			 s1.addVariable("width","700");
			 s1.addVariable("height","500");
			 s1.write("player1");
			</script>
			
      </div>
      
       <ul class="next_list fl">
        <li>
          <c:choose>
             <c:when test="${pre.id == 0}">
	           <span class="content fl">
	             <a>上一篇</a>
	           </span>
	           <span class="headline fl">
	             <a>没有了</a>
	           </span>
             </c:when>
             <c:otherwise>
	           <span class="content fl">
	             <a href="<c:url value='/video/${pre.id}.dhtml'/>">上一篇</a>
	           </span>
	           <span class="headline fl">
	             <a href="<c:url value='/video/${pre.id}.dhtml'/>">${pre.title}</a>
	           </span>
             </c:otherwise>
           </c:choose>
        </li>
        <li>
          <c:choose>
             <c:when test="${next.id == 0}">
	           <span class="content fl">
	             <a>下一篇</a>
	           </span>
	           <span class="headline fl">
	             <a>没有了</a>
	           </span>
             </c:when>
             <c:otherwise>
	           <span class="content fl">
	             <a href="<c:url value='/video/${next.id}.dhtml'/>">下一篇</a>
	           </span>
	           <span class="headline fl">
	             <a href="<c:url value='/video/${next.id}.dhtml'/>">${next.title}</a>
	           </span>
             </c:otherwise>
           </c:choose>
        </li>
     </ul>
      <p class="onclick_wz fr">点击量：<span class="red">${video.clicknum}</span></p>
   
   
     
   </div>
   
   <div class="about_video"></div>
   
   <div class="scrollleft">
	 <ul>
	    <c:forEach items="${videoList}" var="video">
			<li>
				<a href="<c:url value='/video/${video.id}.dthml'/>"><img src="${video.imgurl}" alt="${video.title}" width="235" height="216"/></a>
				<p><a href="<c:url value='/video/${video.id}.dhtml'/>">${video.title}</a></p>
			</li>
	    </c:forEach>
	</ul>
</div>


</div>
<!--main style end-->  
    
    <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
