<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>鉴定结果</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/default/easyui.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/icon.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/default.css"/>">
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.queue.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/fileprogress.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/handlers.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery-1.8.0.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.easyui.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/locale/easyui-lang-zh_CN.js"/>"></script>
	<script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "<c:url value='/ueditor/'/>";
    </script>
	<script type="text/javascript" src="<c:url value="/ueditor/ueditor.config.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/ueditor/ueditor.all.min.js"/>"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/zoomy0.5.css"/>">
    <script type="text/javascript" src="<c:url value="/jquery/jquery.zoomy0.5.min.js"/>"></script>
<style type="text/css">
body{
    FONT: 9pt 微软雅黑;
    background:url(<c:url value="/images/lightblue.jpg"/>);
}
textarea{
	width:200px;
	border:1px solid #ccc;
	padding:2px;
}

TD {
	FONT: 12px 微软雅黑
}
</style>   
 <script type="text/javascript">
    //This is it
    $(function(){    
        $('.zoom').zoomy();
    });
    </script>
</head>
  
  <body>
   <form id="editLylotsform" method="post">
	   <input type="hidden" name="id" value="${item.id}"/>
	   <table id="onecollectiontable" width="100%" border="0" align="center" cellpadding="10" cellspacing="10" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
				<tr><td>藏品名称:&nbsp;&nbsp;${item.name}</td></tr>
				<tr><td>综合评价:<select id="zhpg" name="zhpg" class="easyui-combobox" editable="false" style="width: 170px" data-options="panelHeight:'auto'">
						<option value="">---请选择--</option>
						<option value="1">新</option>
					    <option value="2">老</option>
						<option value="3">老仿</option>
		              </select></td></tr>
				<tr><td>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;代:<input type="text" id="niandai"name="niandai"/></td></tr>
				<tr><td>估&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;值:<input type="text" id="guzhi"name="guzhi"/></td></tr>
				<tr><td>是否推荐复审:<select id="isshangpai" name="isshangpai" class="easyui-combobox" editable="false" style="width: 170px" data-options="panelHeight:'auto'">
						<option value="">---请选择--</option>
						<option value="1">不推荐复审</option>
					    <option value="2">推荐复审</option>
		              </select></td></tr>
		         <tr><td>行情走势:<textarea name="hangqing" id="hangqing">${item.hangqing}</textarea>
<%--						<script type="text/javascript">--%>
<%--						    UE.getEditor('hangqing')--%>
<%--						</script>--%>
				</td></tr>
				<tr><td>详细说明:
				<textarea name="detailnote" id="detailnote">${item.detailnote}</textarea>
<%--						<script type="text/javascript">--%>
<%--						    UE.getEditor('detailnote')--%>
<%--						</script></td></tr>--%>
				</table>
	</form>
	<div style="text-align:right;padding:5px 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="formsubmit();">修改</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="window.close();">返回</a>
       </div>
       
  </body>
</html>
