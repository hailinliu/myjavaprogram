<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>华豫之门官方网站-卫视文化乐园</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
  </head>
  <body>
  <div data-role="page">
  	<jsp:include page="../head/header.jsp?name=充值成功"></jsp:include>
  	<div role="main" class="ui-content">
    <p>充值成功<br/><hr/>
	      您的账户${username}已成功充值了${overMoney}元，充值后账户余额为${money}元。
  	</div>
  	<ul data-role="listview">
  		<li><a href="<c:url value='/redirect?p=mine/myMoney'/>" data-ajax="false">查看收支明细</a></li>
  		<li><a href="<c:url value='/mine/gotoenroll'/>" data-ajax="false">继续网上报名</a></li>
  		<li><a href="<c:url value='/mine/gotovip'/>" data-ajax="false">继续升级会员</a></li>
  	</ul>
  	<jsp:include page="../foot/footer.jsp"></jsp:include>
  </div>
</body>
</html>