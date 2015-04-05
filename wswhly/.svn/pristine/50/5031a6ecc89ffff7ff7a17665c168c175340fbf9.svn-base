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
	$('#editactionform').form('submit', {
		url: "<c:url value='/ycaction/editaction'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "修改藏品成功！", 'info',function(){
					document.getElementById("editactionform").reset();
			    	window.dialogArguments.$('#actiontable').datagrid('reload');
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
	<form id="editactionform" method="post">
	   <input type="hidden" name="id" value="${action.id}"/>
	   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
			<tr>
			    <td>拍卖机构:</td><td><select id="ins_id" name="ins_id"  value="${action.ins_id}" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="1">北京翰海</option>
						<option value="2">北京保利</option>
						<option value="3">中国嘉德</option>
		              </select></td>
			</tr>
			<tr><td>拍卖会名称:</td><td><input name="auctionname" value="${action.auctionname}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>	
			<tr><td>发布时间：</td><td><input id="actiontime" value="${action.actiontime}"  name="actiontime"   type="text" size="9" class="easyui-DateTimeBox" editable="false"/></td></tr>	
			<tr><td>地点:</td><td><input name="place" value="${action.place}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr><td>专场总数:</td><td><input name="specialnumber" value="${action.specialnumber}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr><td>拍品总数:</td><td><input name="totalnumber" value="${action.totalnumber}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr>
			    <td>状态:</td><td><select id="state" name="state" value="${action.state}" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="1">预展</option>
						<option value="2">结束</option>
		              </select></td>
			</tr>
		    <tr><td>预展时间：</td><td><input id="previewtime"  value="${action.previewtime}" name="previewtime"   type="text" size="9" class="easyui-DateTimeBox" editable="false"/></td></tr>	
			<tr><td>预展地点:</td><td><input name="previewaddress"  value="${action.previewaddress}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
		</table>		
	</form>
	<div style="text-align:right;padding:5px 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="formsubmit();">修改</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="window.close();">返回</a>
       </div>
  </body>
</html>
