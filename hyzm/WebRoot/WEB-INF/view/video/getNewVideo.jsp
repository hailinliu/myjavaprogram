<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>新闻视频_卫视文化乐园-华豫之门官方网站</title>

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
	<meta name=keywords content="新闻视频">
	<meta name=description content="卫视文化乐园-华豫之门官方网站新闻视频">
  	<style type="text/css">
#demo {
	background: #FFF;
	overflow: hidden;
	width: 950px;
}

#indemo {
	float: left;
	width: 800%;
}

#demo1 {
	float: left;
}

#demo2 {
	float: left;
}
</style>
  </head>

  <body>
    <jsp:include page="../head/header.jsp"></jsp:include>

  <jsp:include page="../banner/banner.jsp"></jsp:include>
<!--main style ben-->
<div class="main_box clear">
   <div class="qjtjs_pic">
      <span class="bread_nav">当前位置：首页<span class="jt">></span>新闻视频<span class="jt">></span>视频<span class="jt">></span> <a href="#">${video.title}</a></span>
   </div>
   <div class="qjtjs_nr clear">
     <div class="title_box2">
       <h3>${video.title}</h3>
       <ul class="title_list2">
           <li>新闻名称：${video.proficient}</li>
           <li>上传时间：${video.uploaddate}</li>
       </ul>
     </div>

      <div class="video_box clear">

			<p id="player1"><a href="http://www.macromedia.com/go/getflashplayer">Get the Flash Player</a> to see this player.</p>
			<script type="text/javascript">
			 var s1 = new SWFObject("<c:url value='/swfvideo/FlvPlayer.swf'/>","single","700","500","7");
			 var videourls="${video.name}";

			 var newvideomp4 = videourls.replace("flv","mp4");  // 替换flv为mp4 格式 字符串
			 // alert(newvideomp4);

			 s1.addParam("allowfullscreen","true");
			 s1.addVariable("file",newvideomp4);


			 s1.addVariable("image","${video.imgurl}");
			 s1.addVariable("width","700");
			 s1.addVariable("height","500");
			 s1.write("player1");
			</script>

      </div>
</div>
</div>
<!--main style end-->

    <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
