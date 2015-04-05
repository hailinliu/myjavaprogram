<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@page import="com.hyzm.bean.video.VideoListRespBean.Video"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html>
  <head>
    
    <title>专家讲坛_卫视文化乐园-华豫之门官方网站</title>
    
	<meta http-equiv="pragma" content="no-cache"></meta>
	<meta http-equiv="cache-control" content="no-cache"></meta>
	<meta http-equiv="expires" content="0"></meta>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"></meta>
	<meta http-equiv="description" content="This is my page"></meta>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/swfobject.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/scroll.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<meta name=keywords content="专家讲坛"></meta>
	<meta name=description content="华豫之门专家讲坛"></meta>
  </head>
  
  <body style="background-color: black">
			<p id="player1"><a href="http://www.macromedia.com/go/getflashplayer">Get the Flash Player</a> to see this player.</p>
			<script type="text/javascript">
			 var s1 = new SWFObject("<c:url value='/swfvideo/FlvPlayer.swf'/>","single","${width}","${height}","0");
			 s1.addParam("allowfullscreen","true");
			 s1.addVariable("file","${video.name}"); 
			
			 s1.addVariable("image","${video.imgurl}");
			 s1.addVariable("width","${width}");
			 s1.addVariable("height","${height}");
			 s1.write("player1");
			</script>
  </body>
</html>
