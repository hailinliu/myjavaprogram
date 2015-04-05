<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>用户登录_卫视文化乐园-华豫之门官方网站</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name=keywords content="登陆框，账号登陆">
  <meta name=description content="卫视文化乐园-华豫之门官方网站账号登陆">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
  <script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <link href="<c:url value='/hyzmLogo.ico'/>" mce_href="<c:url value='/hyzmLogo.ico'/>" rel="bookmark" type="image/x-icon" />
  <link href="<c:url value='/hyzmLogo.ico'/>" mce_href="<c:url value='/hyzmLogo.ico'/>" rel="icon" type="image/x-icon" />
  <link href="<c:url value='/hyzmLogo.ico'/>" mce_href="<c:url value='/hyzmLogo.ico'/>" rel="shortcut icon" type="image/x-icon" />
  <style type="text/css">
	#header{ width: 1140px; height: 175px; margin: 0 auto; overflow: hidden;}
	#header a{ display: block; width: 91px; height: 96px; float: left; margin-top: 79px;}
	#header span{display: block; width: 100px; height: 24px; float: left; margin:  114px 0 0 20px; padding-left: 20px; border-left:1px solid #d4d4d4;  font: bold 24px/24px Microsoft Yahei;  }
	#content{ width: 100%; height: 620px; background: #f0f4f7;}
	.content{ width: 1140px; height: 620px; margin: 0 auto; overflow: hidden;}
	#content .adLeft{ float: left; width: 600px; height: 460px; margin:60px 40px 0 0;background: #fff; }
	#content .frameRight{ float: left; width: 497px; height: 457px; background: #fff; border:1px solid #c9d3e6;border-top-width: 2px; margin-top: 60px; }
	.frameRight .tabNav{ width: 100%; height:40px; }
	.frameRight .tabNav li{ float: left; width: 165px; height: 39px; border-bottom: 1px solid #c9d3e6; border-right:1px solid #c9d3e6; font:bold 16px/40px "宋体"; color:#6d6d6d; text-align: center; cursor: pointer;}
	.frameRight .tabNav .active{ color: #000; border-bottom: none;}
	.frameRight .tabContent li{ float: left; width: 497px; height: 417px;  display: none;}
	.tabContent .secondUp{ width: 100%; height: 326px; border-bottom: 1px solid #c9d3e6;text-align: center; }
	.tabContent .secondUp .weixinQR{ height: 240px; padding-top: 40px;}
	.tabContent .secondUp .weixinLogintip{ padding: 40px 0;display: none;}
	.tabContent .secondUp p{ color:#a7a7a7; line-height: 30px;}
	.tabContent .secondUp p a{color: #cdcdcd;}
	.tabContent .secondUp p a:hover{ text-decoration: underline;color: #cdcdcd;}
	.tabContent .secondDown{ width: 100%; height: 90px;}
	.tabContent .secondDown p{ height: 40px; line-height: 40px; font-size: 14px; color: #aaa; text-indent: 2em;}
	.tabContent .secondDown p a{ font-weight: bold; color: #3481cf;}
	.tabContent .secondDown div{text-indent: 2em;}
	.tabContent .thirdUp{width: 100%; height: 286px; border-bottom: 1px solid #c9d3e6;}
	.tabContent .inputBox{width: 340px; height: 123px; margin: 40px auto 0 auto; border:1px solid #d2d3d4; overflow: hidden;}
	.tabContent .inputBox input{ width: 316px; height: 41px; margin: 0 12px; padding: 10px 0; display: block; line-height: 41px; font-size: 16px; text-indent: 2em; }
	#username{ border-bottom: 1px solid #d2d3d4; background: url(<c:url value='/images/loginUser.png'/>) no-repeat 0 21px;}
	#password{background: url(<c:url value='/images/loginPassword.png'/>) no-repeat 0 21px;}
	.tabContent .thirdUp p{width: 340px; height: 45px; line-height: 45px; margin: 0 auto;}
	.tabContent .thirdUp p a{ margin-left: 160px;}
	#remember{ vertical-align: middle; margin-right: 12px;}
	#login{ display: block; width: 340px; height: 50px; margin: 12px auto;  background: #d14642; font: normal 24px/50px Microsoft Yahei;color: #fff; border-radius: 5px;cursor: pointer;}
	#footer{ width: 1140px; height: 100px; margin: 0 auto; overflow: hidden;}
  </style>
  <script>
  $(function(){
  	var liNav=$(".tabNav li");
  	var liContent=$(".tabContent li");
  	var tips=$(".secondUp p a");
  	var qr=$(".weixinQR");
  	var tipInfo=$(".weixinLogintip");
  	var username=$("#username");
  	//登录框TAB切换效果
  	liNav.each(function(){
  		$(this).click(function(){
  			$(this).addClass('active').siblings('li').removeClass('active');
  			var index=$(this).index();
  			liContent.eq(index).css("display","block").siblings('li').css("display","none");
  		})
  	});
  	//微信扫码使用帮助
  	tips.mouseover(function(){
  		qr.css("display","none");
  		tipInfo.css("display","block");
  	}).mouseout(function(){
  		qr.css("display","block");
  		tipInfo.css("display","none");
  	});

  })
  </script>
  </head>

<body>
	<div id="header">
		<h1><a href="/"><img src="<c:url value='/images/logo2.jpg'/>" width="91" height="96" alt="华豫之门官方网站 - 卫视文化乐园"/></a><span>会员登录</span></h1>
	</div>
	<div id="content">
		<div class="content">
			<div class="adLeft"></div>
			<div class="frameRight">
				<ul class="tabNav">
					<li class="active">QQ快速登录</li>
					<li>微信登录</li>
					<li style="border-right:none;">乐园账号登录</li>
				</ul>
				<ul class="tabContent">
					<li style="display:block;"></li>
					<li>
					<div class="secondUp">
						<div class="weixinQR">
							<p><b>安全登录 防止被盗</b></p>
							<img src="" alt="" width="150" height="150" />
							<p><b>使用微信扫描上方二维码</b></p>
						</div>
						<div class="weixinLogintip">
						<img src="<c:url value='/images/weixin_logintip.png'/>" width="258" height="200"/>
						</div>
						<p><a>使用帮助</a></p>
					</div>
					<div class="secondDown">
						<p>使用其他方式登录，或者现在<a href="">免费注册乐园账号</a></p>
						<div>
							<a href=""><img src="<c:url value='/images/weiboLogin.png'/>" width="50" height="50" /></a>
							<a href=""><img src="<c:url value='/images/alipayLogin.png'/>" width="50" height="50" /></a>
						</div>
					</div>
					</li>
					<li>
						<div class="thirdUp">
							<form>
								<div class="inputBox">
									<input type="text" name="username" id="username" placeholder="用户名/电子邮箱/手机号码" autocomplete="off" size="20">
									<input type="password" name="password" id="password">
								</div>
								<p><input type="checkbox" name="remember" id="remember" placeholderval="" autocomplete="off" maxlength="16"><label for="remember">下次自动登录</label>
									<a href="">忘记密码？</a>
								</p>
								<input type="button" value="登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录" name="login" id="login">
							</form>
						</div>
						<div class="secondDown">
						<p>使用其他方式登录，或者现在<a href="">免费注册乐园账号</a></p>
						<div>
							<a href=""><img src="<c:url value='/images/weiboLogin.png'/>" width="50" height="50" /></a>
							<a href=""><img src="<c:url value='/images/alipayLogin.png'/>" width="50" height="50" /></a>
						</div>
					</div>
					</li>
				</ul>
			</div>
		</div>

	</div>
	<div id="footer"></div>



</body>
</html>
