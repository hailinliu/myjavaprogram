<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改拍卖会</title>
    
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
	<script type="text/javascript" src="<c:url value="/jquery/jquery-1.8.0.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.easyui.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/locale/easyui-lang-zh_CN.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.queue.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/fileprogress.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/handlers.js"/>"></script>
	<script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "<c:url value='/ueditor/'/>";
    </script>
	<script type="text/javascript" src="<c:url value="/ueditor/ueditor.config.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/ueditor/ueditor.all.min.js"/>"></script>
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
function formsubmit(){
	$('#editspecilform').form('submit', {
		url: "<c:url value='/ycspecil/editspecil'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "修改专场成功！", 'info',function(){
					document.getElementById("editspecilform").reset();
			    	window.dialogArguments.$('#speciltable').datagrid('reload');
				    window.close();
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}
</script>
  </head>
  
  <body>
    <!-- 修改藏品 -->
	<form id="editspecilform" method="post">
	   <input type="hidden" name="id"  value="${specil.id}"/>
	  <table width="100%" border="0" align="center" cellpadding="10" cellspacing="10" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
	       <tr>
			    <td>拍卖会名称:</td><td>
				<input name="actionid" value="${specil.actionid} class="easyui-combobox" data-options="required:true,url:'<c:url value="/ycspecil/actioncombox"/>', valueField:'id', textField:'auctionname', panelHeight:'auto'">
				</td>
			</tr>
			<tr><td>拍卖专场:</td><td><input name="specialname"  value="${specil.specialname}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>	
			<tr><td>专场时间：</td><td><input id="time"    name="time"  value="${specil.time}" type="text" size="9" class="easyui-DateTimeBox" editable="false"/></td></tr>	
			<tr><td>拍卖地点:</td><td><input name="address" value="${specil.address}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr><td>拍品总数:</td><td><input name="totalnum" value="${specil.totalnum}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
		</table>		
	</form>
	<div style="text-align:right;padding:5px 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="formsubmit();">修改</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="window.close();">返回</a>
       </div>
  </body>
</html>
