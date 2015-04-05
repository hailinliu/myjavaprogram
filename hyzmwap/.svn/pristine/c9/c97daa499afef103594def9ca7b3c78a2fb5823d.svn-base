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
<div data-role="page" style="background: rgb(51, 136, 204);color: #fff;text-shadow: none;">
  	<jsp:include page="../head/header.jsp?name=参拍贵宾信息表"></jsp:include>
  	<div data-role="content" id="content">
	<form id="form" role="form" class="form-set" action="">
	<input id="colloctionurl" name="colloctionurl" type="hidden" value="<%=request.getParameter("conurl") %>"/>
	<input id="cjaction" name="cjaction" type="hidden" value=""/>
	<input id="pmfs" name="pmfs" type="hidden" value=""/>
	<input id="sex" name="sex" type="hidden" value=""/>
	<div data-role="fieldcontain">

        <fieldset data-role="controlgroup">
          <legend>您希望参拍哪个拍卖会(必填项):</legend>
            <label for="cjaction1">苏富比</label>
            <input type="checkbox" name="cjaction1" id="cjaction1" value="1">
            <label for="cjaction2">佳士得</label>
            <input type="checkbox" name="cjaction2" id="cjaction2" value="2">
        </fieldset>
      </div>
      <div data-role="fieldcontain">
        <fieldset data-role="controlgroup">
          <legend>您希望的拍卖方式(必填项):</legend>
            <label for="pmfs1"> 现场参拍</label>
            <input type="checkbox" name="pmfs1" id="pmfs1" value="1">
            <label for="pmfs2">代理参拍</label>
            <input type="checkbox" name="pmfs2" id="pmfs2" value="2">
        </fieldset>
      </div>

	<fieldset data-role="controlgroup">
     	<legend>请选择您的性别(必填项)：</legend>
        <label for="sex1">男</label>
        <input type="radio" name="sex" id="sex1" value="1">
        <label for="sex2">女</label>
        <input type="radio" name="sex" id="sex2" value="2">
      </fieldset>
	<div data-role="fieldcontain" id="uiText">
        <label for="name">姓氏(必填项)：</label>
        <input type="text" name="name" id="name">
        <label for="phone">联系电话(必填项)：</label>
        <input type="tel" name="mobile" id="mobile" >
        <label for="email">邮箱：</label>
        <input type="email" name="email" id="email" >
		<label for="weixin">微信号：</label>
        <input type="text" name="weixin" id="weixin" >
        <label for="number">拟定参拍藏品-拍卖编号(无需更改，自动生成)：</label>
        <input id="lotsid" name="lotsid" type="text" readonly="readonly" style="background:#CCCCCC" value="<%=request.getParameter("lotsid") %>"/>
        <!--<a href="" data-role="button" data-icon="info" id="aInfo">拍卖编号是什么？</a>-->
        <input type="hidden" name="address" id="address" >
      </div>
			<input type="button"  value="提交" data-role="button" onclick="sumbitRegister()" >
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
	function sumbitRegister(){
	if($('#cjaction1').is(':checked')||$('#cjaction2').is(':checked'))
	{
	}else{
	   alert("您希望参拍哪个拍卖会!");
	   $("#cjaction").val('');
	   return ;
	}
	if($('#cjaction1').is(':checked')){
		if($("#cjaction").val().indexOf('1')<0){
		$("#cjaction").val($("#cjaction").val()+',1');
		}

	}
	if($('#cjaction2').is(':checked')){
		if($("#cjaction").val().indexOf('2')<0){
		$("#cjaction").val($("#cjaction").val()+',2');
		}

	}

	if($('#pmfs1').is(':checked')||$('#pmfs2').is(':checked'))
	{
	}else{
	   alert("您希望的拍卖方式!");
	    $("#pmfs").val('');
	   return ;
	}

	if($('#pmfs1').is(':checked')){
		if($("#pmfs").val().indexOf('1')<0){
		$("#pmfs").val($("#pmfs").val()+',1');
		}

	}
	if($('#pmfs2').is(':checked')){
		if($("#pmfs").val().indexOf('2')<0){
		$("#pmfs").val($("#pmfs").val()+',2');
		}

	}

	if($('#sex1').is(':checked')||$('#sex2').is(':checked'))
	{
	}else{
	   alert("请选择性别!");
	   $("#sex").val('');
	   return ;
	}

	if($('#sex1').is(':checked')){
		$("#sex").val('1');
	}
	if($('#sex2').is(':checked')){
		$("#sex").val('2');
	}
	if($("#name").val()==''){
		alert('请填写姓名！');
		return;
	}
	if($("#mobile").val()==''){
		alert('请填联系电话！');
		return;
	}


	 $.post("<c:url value='/DaiGou_AddDaigou'/>", $('#form').serialize(),
				function(result) {
			        if(result==0000) {
						alert("您的信息已收到，卫视文化乐园客服人员会尽快与您联系，谢谢！\n 如需帮助,请致电： 0371 - 60110891 ");
						if('<%=request.getParameter("conurl") %>'!=''&&'<%=request.getParameter("conurl") %>'!='null'){
						   window.location.href="<c:url value='/redirect?p=daigou/JSD'/>";
						}else{
							window.location.href="<c:url value='/redirect?p=daigou/rules#pagethree'/>";
						}
					}else{
						alert("申请失败，如需帮助,请致电： 0371 - 60110891");
					}
				});
	}
	</script>
</body></html>