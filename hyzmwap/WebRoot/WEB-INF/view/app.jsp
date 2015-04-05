<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>app下载</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
	<script type="text/javascript">
<style type="text/css">
	body{margin:0;padding:0;font-size:12px;}
	p{margin:0;padding:0;}
	.main_box{width:720px;height:1280px;margin:0 auto;}
	.top{height:50px;font-size:20px;line-height:50px;text-align:center;width:720px;margin:0 auto;background:#E9E9E9;}
	.logo{text-align:center;margin-top:20px;}
	.txt{text-align:center;font-size:40px;margin:20px 0;line-height:60px;}
	.download{height:152px;text-align:center;}
</style>
  </head>
  <body>
    <div class="main_box">
    	<div class="top">
        	<p>华豫之门APP</p>
        </div>
        <div class="logo">
        	<img src="images/logo2.jpg" width="240px;" height:"240px;" />
        </div>
        <div class="txt">
        	
        	<p>随时随地掌握最新收藏资讯，玩转收藏，你也可以成为大师。</p>
        </div>
        
        <div class="download">
        	<a href="/wswhly.apk">
            	<img src="images/download2.png" />
            </a>
        </div>
    </div>
</body>
</html>