<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<link rel="stylesheet"
	href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
<script type="application/javascript"
	src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
<script type="application/javascript"
	src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
<script type="text/javascript">
var currentpage = 1,
	pagesize = 10,
	count = -1;

$(document).ready(function() {
	loaddata(1);
});

function loaddata(page){
	if(count != -1 && ((currentpage-1) * pagesize) >= count){
		$('#more').attr('disabled',"true");
		$('#more').html("无更多数据");
		return false;
	}
	$.ajax({type: "POST",
		dataType: "json",
		url: "<c:url value='/mine/mymoneylist'/>",
		data: {page:page,size:pagesize,d:new Date().getTime()},
		success:function(json){
			count = json.count;
			if(count == 0){
				$('#thelist').append("<li>暂无数据</li>");
				$('#more').remove();
			}
			$.each(json.list,function(index,money){
				var type = "未知";
				var mark = "";
				if(money.type == "1"){
					type = "充值";
					mark = "+";
				}else if(money.type == "2"){
					if(money.tradetype == "1")
						type = "报名";
					else if(money.tradetype == "2")
						type = "会员升级";
					mark = "-";
				}
			    $('#thelist').append("<li data-role='list-divider'>"+money.tradedate
			+"<span class='ui-li-count'>"+type+"</span></li>"
			+"<li>余额："+money.leftmoney+"元<span class='ui-li-count'>"+mark+""+money.money+"元</span></li>");
			});
			 $('#thelist').listview('refresh');
		}
	});
}

function nextpage() {
	 currentpage++;
	 return loaddata(currentpage);
}

</script>
</head>
<body>
	<div data-role="page">
		<jsp:include page="../head/header.jsp?name=支付明细"></jsp:include>
		<div data-role="content">
			<ul id="thelist" data-role="listview">
			</ul>
		</div>
		<button id="more" class="ui-shadow ui-btn ui-corner-all" onclick="nextpage()">更多...</button>
	</div>
</body>
</html>
