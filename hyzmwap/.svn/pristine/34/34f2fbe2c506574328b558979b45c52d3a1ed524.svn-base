<%@page import="com.hyzm.bean.video.VideoListRespBean.Video"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Video aa = (Video)request.getAttribute("video");
	String name = aa.getName();
	name = name.substring(0, name.lastIndexOf("."));
	String jpgname = name + ".jpg";
	name = name + ".mp4";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>专家讲坛</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<SCRIPT LANGUAGE=JavaScript>
<!--
function getLight(pars)
{	
	//alert("播放器模式参数值："+string+"");
	if(pars == "open")
	{
		close_light(this);
	}
	else
	{
		close_light(this);
	}
}


//兼容性
function thisMovie(movieName) {
    if (navigator.appName.indexOf("Microsoft") != -1) {
        return window[movieName]
    }
    else {
        return document[movieName]
    }
}

//-->
</SCRIPT> 

<style type="text/css">
<!--
.video { OVERFLOW: hidden; WIDTH: 100%; POSITION: relative}
.close_light_bg {DISPLAY: none; BACKGROUND: #000; FILTER: alpha(opacity = 85); LEFT: 0px; WIDTH: 100%; POSITION: absolute; TOP: 0px; HEIGHT: 100%; opacity: .85}
-->
</style>

</head>

<body>
<DIV class=close_light_bg id=close_light_bg></DIV>
<!--播放器/代码开始-->
<div class="video" id="CuPlayer">
<SCRIPT LANGUAGE=JavaScript>
<!--
var vID        = "CuPlayer"; 
var vWidth     = "100%";
var vHeight    = "";
var vFile      = '<c:url value='/video/CuSunV2set.xml'/>';
var vPlayer    = '<c:url value='/video/player.swf?v=2.5'/>';
var vMp4url    = "<%=name%>";
var vPic       = "<%=jpgname%>";
 
//-->
</SCRIPT> 
<script class="CuPlayerVideo" data-mce-role="CuPlayerVideo" type="text/javascript" src="<c:url value='/video/AsComV3.js'/>"></script>
</div>
<SCRIPT language=javascript src="<c:url value='/video/jquery.js'/>" type=text/javascript></SCRIPT> 
<SCRIPT language=javascript src="<c:url value='/video/action.js'/>" type=text/javascript></SCRIPT>
    
</body>
</html>