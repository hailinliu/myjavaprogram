<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>华豫之门官方网站-卫视文化乐园</title>
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
	<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>
	" />
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
	<script type="text/javascript">
	$(document).ready(function() {
	});

	function submitform(){
		var money = $("#money").val();
		if(money == ""){
			alert("请输入充值金额");
			return false;
		}
		if(!check(money)){
			alert("请输入正确的充值金额");
			return false;
		}
		$('.bm_over').show();
		$("#loginform").submit();
	}


	function check(v) {
		var a = /^[0-9]*(\.[0-9]{1,2})?$/;
		if (!a.test(v)) {
			return false;
		} else {
			return true;
		}
	}
	</script>
	<style type="text/css">

	  /*遮蔽层*/
	  .bm_over{
	    height:100%;width:100%;background:rgba(0,0,0,0.4);background:#000;filter:alpha(Opacity=80);-moz-opacity:0.8;opacity: 0.8;position: absolute;z-index: 1000;text-align:center;font-family:微软雅黑; display: none;
	}
	</style>
</head>
<body>

<!-- 报名结束 遮蔽层！！！ -->
<div id="bmover" class="bm_over">
	<h3 style="font-size:25px;color:#F6ED10;padding-top:40%;">请等待,连接支付宝...</h3>
</div>



	<div data-role="page">
		<jsp:include page="../head/header.jsp?name=充值"></jsp:include>
		<div data-role="content">
			<form id="loginform" action="<c:url value='/pay'/>
			" method="post" data-ajax="false">
			<input type="text" placeholder="金额" name="money" id="money"  maxlength="10"/>
		</form>
		<button class="ui-shadow ui-btn ui-corner-all" onclick="submitform()">充值</button>
		<p>
			温馨提示：
1、“充值”将进入 <i style="color:#258FE2">“ 支付宝 ”</i>  充值环节，支持信用卡和储蓄卡快捷支付功能。
		</p>
		<p>2、快捷支付（含信用卡和借记卡）单笔限额2000元，每月限额10000元。
</p>
		<!-- <p>
			3、储蓄卡快捷支付 <i style="color:#258FE2">工商、建行、邮政</i> 限额5000元，<i style="color:#258FE2">农业、交通、中行</i> 限额10000元，其它银行限额50000元，实际以银行公布为准。
		</p> -->
		<p>3、如您充值金额超出银行卡限额，建议您先对您的支付宝账户进行分次充值，再使用支付宝余额充值到网站。</p>
	</div>
	<jsp:include page="../foot/footer.jsp"></jsp:include>
</div>
</body>
</html>