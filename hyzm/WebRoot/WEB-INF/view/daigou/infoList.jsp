<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>参拍贵宾信息表</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport">
<style type="text/css">
body {	padding: 0;	margin: 0;	background: #fff;	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;	color: #444340;}
h1 {	font-size: 1.3em;	padding: 10px 10px;	margin: 0;}
img {	border: none;}
a {	color: #444340;}
#uiText  label{margin: 12px 0}
#aInfo{ border: none; box-shadow: none; text-align: left;font-weight: normal; color: #999;margin: .4em 0}
#aInfo::after{border: none;box-shadow: none;}
#wtn{display:none;position: absolute;top: 0;left: 0; width: 100%; overflow:hidden;z-index: 999;margin-top: 50px}
</style>
<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
</head>
<body>
<div data-role="page">
  	<jsp:include page="../head/header.jsp?name=参拍贵宾信息表"></jsp:include>
  	<div data-role="content" id="content">
	<form id="form" role="form" class="form-set" action="">
	<div data-role="fieldcontain">
        <fieldset data-role="controlgroup">
          <legend>您希望参拍哪个拍卖会:</legend>
            <label for="sfb">苏富比</label>
            <input type="checkbox" name="favcolor" id="sfb" value="sfb">
            <label for="jsd">佳士得</label>
            <input type="checkbox" name="favcolor" id="jsd" value="jsd">
        </fieldset>
      </div>
      <div data-role="fieldcontain">
        <fieldset data-role="controlgroup">
          <legend>您希望的拍卖方式:</legend>
            <label for="scene"> 现场参拍</label>
            <input type="checkbox" name="favcolor" id="scene" value="scene">
            <label for="agent">代理参拍</label>
            <input type="checkbox" name="favcolor" id="agent" value="agent">
        </fieldset>
      </div>

	<fieldset data-role="controlgroup">
     	<legend>请选择您的性别：</legend>
        <label for="male">男性</label>
        <input type="radio" name="gender" id="male" value="male">
        <label for="female">女性</label>
        <input type="radio" name="gender" id="female" value="female">
      </fieldset>
	<div data-role="fieldcontain" id="uiText">
        <label for="name">姓名：</label>
        <input type="text" name="name" id="name">
        <label for="phone">联系电话：</label>
        <input type="tel" name="phone" id="phone" >
        <label for="email">邮箱：</label>
        <input type="email" name="email" id="email" >
		<label for="weixin">微信号：</label>
        <input type="text" name="weixin" id="weixin" >
        <label for="number">拟定参拍藏品-拍卖编号：</label>
        <input type="text" name="number" id="number" >
        <a href="" data-role="button" data-icon="info" id="aInfo">拍卖编号是什么？</a>
      </div>
			<input type="submit"  value="提交" data-role="button">
		</form>
		<a href="javascript:history.back()" data-role="button" style="background:#aaa;color:#fff;text-shadow:none">取消</a>
	</div>
	<div id='wtn' data-disable-page-zoom="true"  data-position="fixed"><img src='../../../images/wtn.jpg' width="100%" >
	<p>点击页面任何区域，即可返回</p>
	</div>
</div>


	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
	<script>
	$(function(){
		var aInfo=$("#aInfo"),aContent=$("#content"),wtn=$("#wtn");
		aInfo.on("tap",function(){
			wtn.show();
			aContent.hide();

		});
		wtn.on('tap',function() {
			$(this).hide();
			aContent.show();
		});

	})
	</script>
</body></html>