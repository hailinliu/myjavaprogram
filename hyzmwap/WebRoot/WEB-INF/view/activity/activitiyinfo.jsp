<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>官网活动</title>
  
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>">
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
	
	<style type="text/css">
	p img {width: 100%;}
	
	#scroll {
	position:fixed; bottom:50px; right:50px;
	}
	
	.scrollItem {
		width:20px; height:20px; cursor:pointer; text-align:center; padding-top:10px;
	}
	</style>
	<script type="text/javascript">
	$(function () {
        var speed = 800;//滚动速度
        //回到顶部
        $("#toTop").click(function () {
		  	$('html,body').animate({
				scrollTop: '0px'
			},
			speed);			
        });
        $("#toTop1").click(function () {
		  	$('html,body').animate({
				scrollTop: '0px'
			},
			speed);			
        });
        $("#toTop2").click(function () {
		  	$('html,body').animate({
				scrollTop: '0px'
			},
			speed);			
        });
    });
	</script>

  </head>
  
  <body>
	<div data-role="page" data-close-btn="right" data-dialog="true">
	    <div data-role="header">
			<h1>官网活动</h1>
		</div>
	  	<div role="main" class="ui-content">
	  	 <p align="center">
	  	  <h1 style="font-size:24px;margin-bottom:20px;">${n.title}</h1><hr/>
	  	    时间：${n.createdate}<hr/>
	  	    标签：${n.label}<hr/>
	  	 </p>
	     ${n.content}
	  	</div>
	  	<div id="scroll">
	        <div class="scrollItem" id="toTop"><img src="<c:url value='/images/returntop.gif'/>"></div>
	    </div>
	</div>
  </body>
</html>
