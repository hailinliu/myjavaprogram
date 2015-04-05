
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>会员信息表</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/default/easyui.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/icon.css"/>">
	<script type="text/javascript" src="<c:url value="/jquery/jquery-1.8.0.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.easyui.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.easyui.toolbar.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/locale/easyui-lang-zh_CN.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.autocomplete.min.js"/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery.autocomplete.css"/>">
  </head>
  
  <body>
 <div id="scanuser" class="easyui-window" data-options="title:'用户详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="oneusertable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td width="30%">用户名:：</td>
			    <td id="oneusernameid"></td>
			  </tr>
			   <tr>
			    <td>收藏履历:</td>
			    <td id="onecollectageid"></td>
			  </tr>
			  <tr>
			    <td>收藏履历:</td>
			    <td id="onecollectageid"></td>
			  </tr>
			  <tr>
			    <td>收藏品类:</td>
			    <td id="onelikeoptionid"></td>
			  </tr>
			   <tr>
			    <td>收藏渠道:</td>
			    <td id="onechannelid"></td>
			  </tr>
			  <tr>
			    <td>接受价格:</td>
			    <td id="onepriceid"></td>
			  </tr>
			  <tr>
			    <td>电子邮箱：</td>
			    <td id="oneemailid"></td>
			  </tr>
			  <tr>
			    <td>真实姓名：</td>
			    <td id="onerealnameid"></td>
			  </tr>
			  <tr>
			    <td>身份证号：</td>
			    <td id="oneidcardid"></td>
			  </tr>
			  <tr>
			    <td>职业：</td>
			    <td id="onejobid"></td>
			  </tr>
			  <tr>
			    <td>地址：</td>
			    <td id="oneaddressid"></td>
			  </tr>
			  <tr>
			    <td>积分：</td>
			    <td id="onepointid"></td>
			  </tr>
			  <tr>
			    <td>余额：</td>
			    <td id="onemoneyid"></td>
			  </tr>
			  <tr>
			    <td>会员等级：</td>
			    <td id="onelevelid"></td>
			  </tr>
			  <tr>
			    <td>状态：</td>
			    <td id="onestateid"></td>
			  </tr>
			  
			</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanuser').window('close');">关闭</a>
		</div>
	  </div>
	</div>
	
  </body>
</html>
