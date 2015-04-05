<%@page import="com.hyzm.bean.video.VideoListRespBean.Video"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<title>专家讲坛</title>
		<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
		<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>">
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
	<script type="text/javascript">
	$().ready(function(){ 
		var video, output; 
		var scale = 0.25; 
		var initialize = function() { 
		output = $("#output"); 
		video = $("#video").get(0); 
		$("#capture").click(captureImage); 
		}; 
		var captureImage = function() { 
		var canvas = document.createElement("canvas"); 
		canvas.width = video.videoWidth * scale; 
		canvas.height = video.videoHeight * scale; 
		canvas.getContext('2d') 
		.drawImage(video, 0, 0, canvas.width, canvas.height); 
		var img = document.createElement("img"); 
		img.src = canvas.toDataURL(); 
		output.prepend(img); 
		}; 
		$(initialize); 
		}); 
	</script>
	</head>
<%
	Video aa = (Video)request.getAttribute("video");
	String name = aa.getName();
	name = name.substring(0, name.lastIndexOf("."));
	String jpgname = name + ".jpg";
	name = name + ".mp4";
%>
	<body>
	<div data-role="page">
	<jsp:include page="../head/header.jsp?name=专家讲坛"></jsp:include>
		<video id="video" width="100%" controls="controls" preload="auto" >
		<source src="<%=name%>" type="video/mp4"> 
		您的浏览器不支持此种视频格式。 
		</video> 
	</div>
	</body>
</html>
