<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>华豫之门官方网站-卫视文化乐园</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
	<meta property="wb:webmaster" content="8db2e96bd24a19eb" />

	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
	<script src="<c:url value='/js/indexNew.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='/css/indexNew.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/lunbo/wapapplunbo/css/swipe.css'/>">
	<!-- <link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" /> -->

    <script type="text/javascript">
    //js 判断是手机访问还是电脑访问
	var type = navigator.userAgent.match(/.*Mobile.*/)?"mo":"pc";
	// if(type=='pc'){ window.location.href="http://www.wswhly.com/"; }
    </script>

    <!-- 轮播样式 -->


<style type="text/css">
	.ui-loader{
		display: none;
		/*// 不可取消*/
	}
</style>

<!-- END 轮播样式 -->

  </head>
  <body>
  <div data-role="page">
  <div data-role="header" data-position="fixed" id="header">
<c:if test="${ empty CurrentSession.username}">
  	 <a onclick="location.href='<c:url value='/redirect?p=login'/>'" class="login">登录</a>
</c:if>
<c:if test="${ not empty CurrentSession.username}">
  		 <a onclick="location.href='http://wap.wswhly.com/user/UserCenter'" class="my">我的</a>
</c:if>
		<h1 class="h1-title" style="text-align: center;">华豫之门</h1>
<c:if test="${ empty CurrentSession.username}">
  	 <a onclick="location.href='http://wap.wswhly.com/redirect?p=register'" class="regist">注册</a>
</c:if>
<c:if test="${ not empty CurrentSession.username}">
  		 <a onclick="logout()" class="logoff">注销</a>
</c:if>
	</div>
	<div data-role="content" id="content">

	<!-- lunbo -->
		<div class="addWrap">
		  <div class="swipe" id="mySwipe">
		    <div class="swipe-wrap">

		    	<div onclick="location='<c:url value='/onlinepic/gotoonlinepicindex'/>'">

		       		<img class="img-responsive" src="<c:url value='/images/2015jiandingwap.jpg'/>"/>

		       </div>

		       <div onclick="location='<c:url value='/onlinepic/gotoonlinepicindex#pagethree'/>'">

		       		<img class="img-responsive" src="<c:url value='/images/2015zhanshiwap.jpg'/>"/>

		       </div>

		       <div>

		       		<img class="img-responsive" src="<c:url value='/images/banner0327.jpg'/>"/>

		       </div>
		       <div onclick="location='<c:url value='/redirect?p=hxbm'/>'">

		       		<img class="img-responsive" src="<c:url value='/images/500_200_01.jpg'/>"/>

		       </div>
		       <div onclick="location='http://admin.wswhly.com/wswhlywap/'">

		       		<img class="img-responsive" src="<c:url value='/images/2015zhuanjiaadmin.jpg'/>"/>

		       </div>
		  </div>
		  <ul id="position">
		    <li class="cur"></li>
		    <li class=""></li>
		    <li class=""></li>
			<li class=""></li>
			<li class=""></li>
		  </ul>
		</div>

	<script src="<c:url value='/lunbo/wapapplunbo/js/swipe.js'/>"></script>
	<script type="text/javascript">
	var bullets = document.getElementById('position').getElementsByTagName('li');
	var banner = Swipe(document.getElementById('mySwipe'), {
		auto: 2000,
		continuous: true,
		disableScroll:false,
		callback: function(pos) {
			var i = bullets.length;
			while (i--) {
			  bullets[i].className = ' ';
			}
			bullets[pos].className = 'cur';
		}
	});
	</script>

	<!-- end lunbo -->

	<div id="nav" data-role="nav-bar">
		<ul>

			<li>
				<a onclick="location.href='http://wap.wswhly.com/redirect?p=hxbm'">海选报名</a>
			</li>

			<li>
				<a onclick="location.href='http://wap.wswhly.com/onlinepic/gotoonlinepicindex'" style="background-position:90% 0%">图片鉴定</a>
			</li>
			<li>
				<a onclick="location.href='http://wap.wswhly.com/redirect?p=baibaoxiang/bbx'" style="background-position:13% 33%">百宝箱</a>
			</li>

			<li>
				<a onclick="location.href='http://wap.wswhly.com/hyzmwap/proficient/getDijjf'" style="background-position:90% 33%">大家风范</a>
			</li>
			<li>
				<a onclick="location.href='http://wap.wswhly.com/redirect?p=vip'" style="background-position:13% 66%">会员服务</a>
			</li>
			<li>
				<a onclick="location.href='http://wap.wswhly.com/redirect?p=cjfy'" style="background-position:90% 66%">藏界风云</a>
			</li>

			<li>
				<a onclick="location.href='http://wap.wswhly.com/collection/gotoZtcp?typeid=2'" style="background-position:13% 100%">华豫藏品展示</a>
			</li>
			<li>
				<a onclick="location.href='http://wap.wswhly.com/onlinepic/gotoonlinepicindex#pagethree'" style="background-position:90% 100%">送拍藏品展示</a>
			</li>
		</ul>
	<div style="clear:both"></div>
	</div>
</div>
<div style="padding-bottom:50px" data-role="footer" data-position="inline" id="footer">
		<ul>
			<li>
				<a onclick="location.href='http://wap.wswhly.com/'" class="index"></a>
				<span>主页</span>
			</li>
			<li>
				<a onclick="location.href='http://wap.wswhly.com/news/gotoCollectionInfoList'" class="info"></a>
				<span>资讯</span>
			</li>
			<li>
				<a onclick="location.href='http://wap.wswhly.com/redirect?p=activity/activities'" class="active"></a>
				<span>官网活动</span>
			</li>
			<li>
				<a onclick="location.href='http://wap.wswhly.com/user/UserCenter'" class="center"></a>
				<span>我的</span>
			</li>
		</ul>

	</div>
</div>
  </body>
</html>
