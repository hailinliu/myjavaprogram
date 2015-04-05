<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加专家信息</title>
    
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
$(function(){
	var image = '${pro.imgurl}';
	$('#imagelist').empty().append("<img src='"+image+"' width='200' onclick='deleteImg(this)' style='cursor:pointer;'/>");
});

function formsubmit(){
	var imagelist = $('#imagelist').children("img");
	if (imagelist.length <= 0) {
		$.messager.alert('警告', '请选择图片！', 'warning');
		return;
	}
	$('#imgid').val(imagelist[0].src);
	$('#editproficientform').form('submit', {
		url: "<c:url value='/proficient/editproficient'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "修改专家信息成功！", 'info',function(){
					document.getElementById("editproficientform").reset();
					location.href = '<c:url value="/sys/redirect?p=admin/proficient/proficientManage"/>';
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}

function deleteImg(obj) {
	$(obj).remove();
}
</script>
  </head>
  
  <body>
    <!-- 修改专家信息 -->
	<form id="editproficientform" method="post" enctype="multipart/form-data">
	    <input type="hidden" name="id" value="${pro.id}"/>
	    <input id="imgid" type="hidden" name="imgurl"/>
	    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
				<tr>
					<td>专家姓名:</td><td><input name="name" value="${pro.name}" class="easyui-validatebox" type="text" data-options="required:true"></td>
				</tr>
			    <tr>
			        <td colspan="2">
			          <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="window.showModalDialog('<c:url value="/sys/redirect?p=admin/fileManager/singleFileSelect"/>',window,'dialogWidth=800px;dialogHeight=500px;toolbar=no');">选择图片</a>
                      <p>&nbsp;</p>
                      <span id="imagelist"></span>
			        </td>
				</tr>
				<tr>
					<td>专长:</td><td><input name="speciality" value="${pro.speciality}" class="easyui-validatebox" type="text" data-options="required:true"></td>
				</tr>
				<tr>
					<td>称谓:</td><td><input name="appellation" value="${pro.appellation}" class="easyui-validatebox" type="text" data-options="required:true"></td>
				</tr>
				<tr>
					<td>排序:</td><td><input name="orderc" value="${pro.orderc}" class="easyui-validatebox" type="text" data-options="required:true"></td>
				</tr>
				<tr>
				<td>是否为本期专家:</td>
				<td><select id="isbqhx" value="${pro.isbqhx}" class="easyui-combobox combobox-f combo-f" editable="false" style="width: 100px; display: none;" data-options="panelHeight:'auto'" comboname="isbqhx">		              
		                              <option ${(pro.isbqhx==0) ?  "selected='selected'" :''} value="0" >不是</option>
						              <option ${(pro.isbqhx==1) ?  "selected='selected'" :''} value="1">是</option>
		                </select>
		                </td>
				</tr>
				<tr>
					<td>（如果是本期专家填写）本期海选报名期号:</td><td><input name="hxqh" value="${pro.hxqh}" class="easyui-validatebox" type="text" ></td>
				</tr>
				<tr>
					<td colspan="2">专家信息简介:</td>
				</tr>
		</table>
		<textarea name="note" id="myEditor">${pro.note}</textarea>
		<script type="text/javascript">
		    UE.getEditor('myEditor')
		</script>
	</form>
	<div style="text-align:right;padding:5px 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="formsubmit();">修改</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="history.go(-1);">返回</a>
       </div>
  </body>
</html>
