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
	<style type="text/css">
		body{margin:0;padding:0;}
		p{margin:0;padding:0;}
		.main_box{width:100%;text-align:center;}
		.top{font-size:2em;text-align:center;width:100%;background:#E9E9E9;}
		.logo{text-align:center;padding-top:20px;}
		.txt{text-align:center;padding:0 1.2em;font-size:1.2em;line-height:1.8em;}
		.download{text-align:center;}
        .tishi{line-height:2em;text-align: center;font-size:1.2em;}
        .tishi2{margin-bottom: 20px;padding:0 1.2em;}
        .tishi2 a:link,.tishi2 a:visited{font-size: 1.2em;color:#3388FF;text-align: center;text-decoration: none;}
        .tishi2 a:hover{text-decoration: underline;}
	</style>
  </head>
  <body>
    <div class="main_box">
    	<div class="top">
        	<p>华豫之门APP</p>
        </div>
        <div class="logo">
        	<img src="<c:url value='/images/logo2.png'/>" />
        </div>
        <div class="txt">
        	<p>随时随地掌握最新收藏资讯，玩转收藏，你也可以成为大师。</p>
        </div>

        <div class="download">
        	<a href="http://www.wswhly.com/wswhly.apk">
            	<img src="<c:url value='/images/download2.png'/>" />
            </a>
        </div>
        <div class="download">
            <a href="https://itunes.apple.com/cn/app/hua-yu-zhi-men/id912137110?l=en&mt=8">
                <img src="<c:url value='/images/download3.png'/>" />
            </a>
        </div>
    </div>
</body>
</html>