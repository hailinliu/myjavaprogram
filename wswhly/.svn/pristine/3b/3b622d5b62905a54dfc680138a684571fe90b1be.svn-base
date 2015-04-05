<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加藏品</title>
    
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

TD {
	FONT: 12px 微软雅黑
}

#onecollectiontable {border-right:1px solid #E0ECFF;border-bottom:1px solid #E0ECFF}
#onecollectiontable td{border-left:1px solid #E0ECFF;border-top:1px solid #E0ECFF}
</style>   
<script type="text/javascript">
$(function(){
	$('#styletdid').hide();
});

function formsubmit(){
	if ($('#styleid').combobox('getValue') == '' || $('#styleid').combobox('getValue') == '0') {
		$.messager.alert('警告', '请选择藏品类型！', 'warning');
		return;
	}
	
	var imagelist1 = $('#imagelist1').children("img");
	if (imagelist1.length <= 0) {
		$.messager.alert('警告', '请选择缩略图！', 'warning');
		return;
	}
	if (imagelist1.length > 1) {
		$.messager.alert('警告', '缩略图只能为1张！', 'warning');
		return;
	}
	
	var imagelist = $('#imagelist').children("img");
	if (imagelist.length <= 0) {
		$.messager.alert('警告', '请选择图片！', 'warning');
		return;
	}
	if (imagelist.length > 10) {
		$.messager.alert('警告', '图片不能超过10张！', 'warning');
		return;
	}
	
	
	
	var imgurltitleid = '';
	for (var i=0; i<imagelist1.length; i++) {
		imgurltitleid += imagelist1[i].src+',';
	}
	$('#imgurltitleid').val(imgurltitleid);
	
	
	
	var image = '';
	for (var i=0; i<imagelist.length; i++) {
		image += imagelist[i].src+',';
	}
	$('#imgid').val(image);
	
	
	$('#addcollectionform').form('submit', {
		url: "<c:url value='/collectionus/addcollection'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "添加藏品成功！", 'info',function(){
					document.getElementById("addcollectionform").reset();
					location.href = '<c:url value="/sys/redirect?p=admin/collectionus/collectionManage"/>';
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
    <!-- 添加藏品 -->
	<form id="addcollectionform" method="post">
	   <input id="imgid" type="hidden" name="imgurl"/>
	    <input id="imgurltitleid" type="hidden" name="imgurltitle"/>
	   <table id="onecollectiontable" width="100%" border="0" align="center" cellpadding="10" cellspacing="10" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
			<tr valign="middle">
			    <td width="40%">藏品类型:</td>
			    <td>类型:<input id="typeid" name="type" size="8" class="easyui-combobox" data-options="url:'<c:url value="/collectionus/typecombox"/>', valueField:'id', textField:'typename', panelHeight:'auto',formatter:function(row){
				    var opts = $(this).combobox('options');
		            return row[opts.textField];
				},onSelect:function(data){
						    if(data.id != 0){
						        $('#styleid').combobox({ 
									url:'<c:url value="/collectionus/stylecombox"/>?typeid='+$('#typeid').combobox('getValue'), 
									valueField:'id', 
									textField:'typename' 
								});
								$('#styletdid').show();
						    }else{
						        $('#styleid').combobox('clear');
								$('#styletdid').hide();
						    }
				}">
				<span id="styletdid">
				子类型:<input id="styleid" name="style" size="8" class="easyui-combobox" data-options="panelHeight:'auto',formatter:function(row){
				    var opts = $(this).combobox('options');
		            return row[opts.textField];
				}">
				</span>
				</td>
			</tr>
			<tr valign="middle"><td>藏品名称:</td><td><input name="name" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr valign="middle"><td>节目期号:</td><td><input name="tvnum" class="easyui-validatebox" type="text"></td></tr>
			<tr valign="middle">
			    <td colspan="2">
			    <script type="text/javascript">
			    	var imageid="";
			    	function setimg(id){
			    	imageid=id;
			    	}
			    </script>
                      <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="setimg('imagelist1');window.showModalDialog('<c:url value="/sys/redirect?p=admin/fileManager/fileSelect"/>',window,'dialogWidth=800px;dialogHeight=500px;toolbar=no');">选择缩略图</a>
                      <p>    缩略图只能为一张。</p>
                      <span id="imagelist1"></span>
			    </td>
			</tr>
			<tr valign="middle">
			    <td colspan="2">
                      <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="setimg('imagelist');window.showModalDialog('<c:url value="/sys/redirect?p=admin/fileManager/fileSelect"/>',window,'dialogWidth=800px;dialogHeight=500px;toolbar=no');">选择图片</a>
                      <p>    图片要求1至10张，图片大小单张不超过3M，累计不超过30M。</p>
                      <span id="imagelist"></span>
			    </td>
			</tr>
			<tr valign="middle"><td>藏品简介:</td><td>&nbsp;&nbsp;
			</td>
			</tr>
		</table>
		<textarea name="note" id="myEditor"></textarea>
		<script type="text/javascript">
		    UE.getEditor('myEditor')
		</script>
	</form>
	<div style="text-align:right;padding:5px 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="formsubmit();">添加</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="history.go(-1);">返回</a>
       </div>
       
  </body>
</html>
