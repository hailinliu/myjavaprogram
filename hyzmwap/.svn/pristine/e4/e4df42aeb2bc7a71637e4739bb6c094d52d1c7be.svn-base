<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>华豫之门官方网站-卫视文化乐园</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <script src="<c:url value='/js/scroll.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
	 <link rel="stylesheet" href="<c:url value='/css/index.css'/>" />
	<style>

    </style>
    <script type="text/javascript">

    //js 判断是手机访问还是电脑访问
	var type = navigator.userAgent.match(/.*Mobile.*/)?"mo":"pc";
	if(type=='pc'){
		window.location.href="http://www.wswhly.com/";
	}

    function logout(){
		$.ajax({type: "POST",
			dataType: "text",
			url: "<c:url value='/user/Logout'/>",
			success:function(data){
				if(data == "0000"){
					window.location.href="<c:url value='/'/>";
				}
			}
		});
	}
    </script>
  </head>
  <body>
  <div data-role="page" class="w_box" style="">

  	<div data-role="header" data-position="fixed" class="logo_header">
		<h1 class="h1-title"><img src="<c:url value='/images/logo.png'/>" width="21" height="21" align="center" style="margin-top:-3px;">&nbsp;卫视文化乐园</h1>
	</div>
	 <div class="ui-grid-b" style="cursor: pointer;" onclick="location.href='http://wap.wswhly.com/news/getOneNews?id=6917'">
	 <img src="<c:url value='/images/ads/wap-banner1225.jpg'/>" alt="" width="100%" style="display: block;">


		<!-- 轮播 2222 -->
		<!-- <div class="scroll">
			<div class="slide_01" id="slide_01">
				<div class="mod_01" onclick="location.href='http://wap.wswhly.com/news/getOneNews?id=1955'"><img src="<c:url value='/images/ads/ppzhengji.jpg'/>" alt="" width="100%" style="display: block;"></div>
				<div class="mod_01" onclick="location.href='<c:url value='/collect/getlylotslist'/>'"><img src="<c:url value='/images/ads/yuzhan.jpg'/>" alt="" width="100%" style="display: block;"></div>
			<div class="dotModule_new">
				<div id="slide_01_dot"></div>
			</div>
		</div>

		<script type="text/javascript">
		if(document.getElementById("slide_01")){
			var slide_01 = new ScrollPic();
			slide_01.scrollContId   = "slide_01"; //内容容器ID
			slide_01.dotListId      = "slide_01_dot";//点列表ID
			slide_01.dotOnClassName = "selectd";
			slide_01.arrLeftId      = "sl_left"; //左箭头ID
			slide_01.arrRightId     = "sl_right";//右箭头ID
			slide_01.frameWidth     = 720;
			slide_01.pageWidth      = 720;
			slide_01.upright        = false;
			slide_01.speed          = 10;
			slide_01.space          = 30;
			slide_01.initialize(); //初始化
		}
		</script>-->

	 </div>

  	<c:if test="${empty CurrentSession.username}">
  	<fieldset class="ui-grid-a">
	    <div class="ui-block-a"><button class="lo_btn" onclick="location.href='<c:url value='/redirect?p=login'/>'" data-ajax="false">登陆</button></div>
	    <div class="ui-block-b"><button class="lo_btn" onclick="location.href='<c:url value='/redirect?p=register'/>'" data-ajax="false">注册</button></div>
	</fieldset>
  	</c:if>
  	<c:if test="${not empty CurrentSession.username}">
  		<p class="p_welco">&nbsp;&nbsp;欢迎您，<a class="wf_a" data-ajax="false" href="<c:url value='/user/UserCenter'/>">${CurrentSession.username}&nbsp;&nbsp;&nbsp;&nbsp;会员中心</a>&nbsp;&nbsp;&nbsp;<a class="wf_a" href="javascript:logout()">注销</a></p>
  	</c:if>
  	<div class="ui-grid-b">
	    <div class="ui-block-a" onclick="location.href='<c:url value="/redirect?p=vip"/>'" data-ajax="false" style="cursor: pointer;"><div class="ui-bar ui-bar-a" id="icon-a" style=""><img src="images/icon/appstore.png" style=""><br />会员服务</div></div>
	    <div class="ui-block-b" onclick="location.href='<c:url value="/redirect?p=activity/activities"/>'" data-ajax="false" style="cursor: pointer;"><div class="ui-bar ui-bar-a" id="icon-a" style=""><img src="images/icon/ichat.png" style=""><br />官网活动</div></div>
	    <div class="ui-block-c" onclick="location.href='<c:url value="/redirect?p=hxbm"/>'" data-ajax="false" style="cursor: pointer;"><div class="ui-bar ui-bar-a" id="icon-a" style=""><img src="images/icon/calendar.png" style=""><br />海选报名</div></div>
	</div>
  	<div class="ui-grid-b">
	    <div class="ui-block-a" onclick="location.href='#jingpin'" data-rel="dialog" data-transition="pop" data-ajax="false" style="cursor: pointer;"><div class="ui-bar ui-bar-a" id="icon-a" style=""><img src="images/icon/facetime.png" style=""><br />精品推荐</div></div>
	    <div class="ui-block-b" onclick="location.href='<c:url value="/collect/getlylotslist"/>'" data-ajax="false" style="cursor: pointer;"><div class="ui-bar ui-bar-a" id="icon-a" style=""><img src="images/icon/wangpaiyuzhan.png" style=""><br />网拍预展</div></div>
	    <div class="ui-block-c" onclick="location.href='<c:url value="/proficient/getProficients"/>'" data-ajax="false" style="cursor: pointer;"><div class="ui-bar ui-bar-a" id="icon-a" style=""><img src="images/icon/finder.png" style="" /><br />华豫专家</div></div>
	</div>
	<div class="ui-grid-b">
	    <div class="ui-block-a" onclick="location.href='<c:url value="/news/gotoCollectionInfoList"/>'" data-ajax="false" style="cursor: pointer;"><div class="ui-bar ui-bar-a" id="icon-a" style=""><img src="images/icon/ibooks.png" style=""><br />收藏资讯</div></div>
	    <div class="ui-block-b"><div class="ui-bar ui-bar-a" id="icon-a" onclick="location.href='<c:url value="/yclots/getYclotsListByspecialID"/>'" style="cursor: pointer;"><img src="images/icon/pmyuzhan.png" style=""><br />拍卖预展</div></div>
	    <div class="ui-block-b" onclick="location.href='<c:url value="/video/gotoVideoList"/>'" data-ajax="false" style="cursor: pointer;"><div class="ui-bar ui-bar-a" id="icon-a" style=""><img src="images/icon/contacts.png" style=""><br />专家讲坛</div></div>
	    <!-- <div class="ui-block-c"><div class="ui-bar ui-bar-a" id="icon-a" style=""><img src="images/icon/launchpad.png" style=""><br />旗舰商家</div></div> -->
	</div>
	<div class="ui-grid-b">
	    <div class="ui-block-a" onclick="location.href='<c:url value="/redirect?p=gotohyzm/gotohyzm"/>'" data-ajax="false" style="cursor: pointer;"><div class="ui-bar ui-bar-a" id="icon-a" style=""><img src="images/icon/goto_hy.png" style=""><br />我要上华豫</div></div>
	    <div class="ui-block-b" onclick="location.href='<c:url value="/redirect?p=gemcoll/gotogem"/>'" data-ajax="false" style="cursor: pointer;"><div class="ui-bar ui-bar-a" id="icon-a" style=""><img src="images/icon/zhengjiling.png" style=""><br />珍品征集令</div></div>
	    <div class="ui-block-c" onclick="location.href='<c:url value="/redirect?p=vipcollection/vipcoll"/>'" data-ajax="false" style="cursor: pointer;"><div class="ui-bar ui-bar-a" id="icon-a" style=""><img src="images/icon/collections.png" style=""><br />会员藏品区</div></div>
	</div>
	<!-- <div data-role="footer">
	<img src="<c:url value="/images/apppic-200.png"/>" style="width: 100%;display: block;" />
  	</div> -->
	</div>
  <div data-role="page" id="jingpin" data-theme="a">
	<jsp:include page="head/header.jsp?name=精品推荐"></jsp:include>
  	<div role="main" class="ui-content">
        <button class="btn btn-positive btn-block" onclick="location.href='<c:url value="/collection/gotoHycp?typeid=1"/>'">华豫藏品</button>
	    <button class="btn btn-positive btn-block" onclick="location.href='<c:url value="/collection/gotoZtcp?typeid=2"/>'">珍宝台藏品</button>
	    <button class="btn btn-negative btn-block" onclick="location.href='<c:url value="/collection/gotoZjcp?typeid=3"/>'">专家推荐藏品</button>
  	</div>
	 <a href="#jingpin" data-rel="back" class="ui-shadow ui-btn ui-corner-all" data-rel="back">返回</a>
  </div>

  </body>
</html>
