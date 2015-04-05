<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String name = request.getParameter("name");
	if(name == null)
	name="";%>
<script>
	function memu(){
		var memu = $("#memu option:selected").val();
		if(memu == 1){
			location.href="<c:url value='/user/UserCenter'/>";
		}
		if(memu == 2){
			location.href="<c:url value='/index'/>";
		}
		if(memu == 3){
			location.reload();
		}
	}
	function test(){
		alert(123);
	};
</script>
<style type="text/css">
h1 {
	font-size: 1.3em;
	padding: 10px 10px;
	margin: 0;
}

</style>
<div data-role="header" data-position="fixed" class="ui-header ui-bar-inherit ui-header-fixed slidedown">
<!-- <a href="javascript:history.go(-1);" data-icon="back" class="ui-btn-left ui-link ui-btn ui-icon-back ui-btn-icon-left ui-shadow ui-corner-all" data-role="button" role="button">后退</a> -->
	<h1 class="ui-title" role="heading" aria-level="1"><%=name%></h1>
	<!-- <a onclick="location.href='<c:url value="/"/>'" data-icon="home"  data-role="button" role="button">首页</a> -->
	<!-- <div class="ui-btn-right">
	<select id="memu" data-native-menu="false" data-mini="true" data-inline="true" data-icon="grid" onchange="memu()" >
	<option value="0" data-placeholder="true">菜单</option>
	<option value="1">会员中心</option>
	<option value="2">首页</option>
	<option value="3">刷新</option>
	</select>
	</div> -->
  </div>