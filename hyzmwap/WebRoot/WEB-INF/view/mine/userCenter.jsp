<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
  <head>
    <title>华豫之门官方网站-卫视文化乐园</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
	<script type="text/javascript">
	function logout(){
		$.ajax({type: "POST",
			dataType: "text",
			url: "<c:url value='/user/Logout'/>",
			success:function(data){
				if(data == "0000"){
					window.location.href="<c:url value='/redirect?p=login'/>";
				}
			}
		});
	}
</script>

  </head>

  <body>
  <div data-role="page">
  <jsp:include page="../head/header.jsp?name=会员中心"></jsp:include>
  	<c:if test="${not empty enroll}">
        <p style="color: red;text-align:center;">当前《华豫之门》鉴宝海选网上报名日期为：<span class="disblod">${enroll.begindate} -- ${enroll.enddate}</span>，您已报名<span class="red">${enrollcollection}</span>件收藏品。</p>
   	</c:if>
   	<div data-role="content">
	<ul data-role="listview" data-icon="false">
	  <li><a data-ajax="false" href="<c:url value='/mine/gotovip'/>" style="font-weight:normal;">会员等级：
	    <c:if test="${CurrentSession.level eq 0}">免费会员</c:if>
      	<c:if test="${CurrentSession.level eq 1}">星级会员</c:if>
      	<c:if test="${CurrentSession.level eq 2}">贵宾会员</c:if>
      	<c:if test="${CurrentSession.level eq 3}">高级会员</c:if>
      	<c:if test="${CurrentSession.level eq 4}">超级会员</c:if>
      	<span class="ui-li-count">会员升级</span></a>
      </li>
	  <li><a data-ajax="false" href="<c:url value='/redirect?p=mine/myMoney'/>" style="font-weight:normal;">账户余额：<span style="color: red">${money}</span>元<span class="ui-li-count">收支明细</span></a></li>
	  <li><a data-ajax="false" href="<c:url value='/redirect?p=mine/myPoint'/>" style="font-weight:normal;">账户积分：<span style="color: red">${points}</span>分<span class="ui-li-count">积分明细</span></a></li>
		<li data-role="list-divider">用户信息</li>
		<li>用户名：<span>${CurrentSession.username}</span></li>
		<li><a data-ajax="false" href="<c:url value='/redirect?p=mine/modifyPassword'/>" style="font-weight:normal;" data-transition="pop">密码：<span>******</span><span class="ui-li-count">修改</span></a></li>
		<li><a data-ajax="false" href="<c:url value='/redirect?p=mine/modifyRealname'/>" style="font-weight:normal;" data-transition="pop">真实姓名：<span>${CurrentSession.realname}</span><span class="ui-li-count">修改</span></a></li>
		<li><a data-ajax="false" href="<c:url value='/redirect?p=mine/modifyEmail'/>" style="font-weight:normal;" data-transition="pop">邮箱：<span>${CurrentSession.email}</span><span class="ui-li-count">修改</span></a></li>
		<li>注册时间：<span>${CurrentSession.createdate}</span></li>
		<li><a data-ajax="false" href="<c:url value='/redirect?p=mine/modifyMobile'/>" style="font-weight:normal;" data-transition="pop">手机：<span>${CurrentSession.mobile}</span><span class="ui-li-count">修改</span></a></li>
		<li><a data-ajax="false" href="<c:url value='/redirect?p=mine/modifyAddress'/>" style="font-weight:normal;" data-transition="pop">住址：<span>${CurrentSession.address}</span><span class="ui-li-count">修改</span></a></li>
		<li><a data-ajax="false" href="<c:url value='/redirect?p=mine/modifyIdcard'/>" style="font-weight:normal;" data-transition="pop">身份证：<span>${CurrentSession.idcard}</span><span class="ui-li-count">修改</span></a></li>
<%--		<li><a data-ajax="false" href="<c:url value='/redirect?p=mine/modifyIdcard'/>" style="font-weight:normal;" data-transition="pop">身份证照片：<span>  <img  src="http://116.255.149.172:7080/wswhly/Baibaourl//${fn:split(CurrentSession.idcardimg,',')[0]}" alt="" /></span><span class="ui-li-count">修改</span></a></li>--%>
	</ul>
	<h6>*完善的实名信息有助于提高您的账户安全</h6>
	<a href="javascript:logout()" data-role="button">注销</a>
  </div>
  <div data-role="footer" data-position="fixed">
	<div data-role="navbar">
		<ul>
			<li><a href="<c:url value='/index'/>" data-iconpos="top" data-icon="home" data-ajax="false">首页</a></li>
			<li><a href="<c:url value='/redirect?p=/mine/recharge'/>" data-iconpos="top" data-icon="star" data-ajax="false">充值</a></li>
			<li><a href="<c:url value="/mine/gotoupload"/>" data-iconpos="top" data-icon="info" data-ajax="false">上传</a></li>
			<!-- <li><a href="<c:url value='/mine/gotoenroll'/>" data-iconpos="top" data-icon="star" data-ajax="false">报名</a></li> -->
			<li><a href="<c:url value='/redirect?p=mine/onlinepic'/>" data-iconpos="top" data-icon="star" data-ajax="false">送拍鉴定</a></li>
		</ul>
	</div><!-- /navbar -->
  </div><!-- /footer -->
  </div>
  </body>
</html>
