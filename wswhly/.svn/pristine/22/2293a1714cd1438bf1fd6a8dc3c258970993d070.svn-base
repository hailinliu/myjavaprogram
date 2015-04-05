<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改藏品</title>
    
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
var swfupload;
$(function(){
var settings = {
       flash_url : "<c:url value='/swfupload/swfupload.swf'/>",
       upload_url: "<c:url value='/collection/uploadCollection'/>",
       file_size_limit : "30MB",
       file_types : "*.jpg;*.jpeg;*.gif;*.png;*.bmp",
       file_post_name: "uploadFile",
       file_types_description : "图片文件",
       file_upload_limit : 10,
       custom_settings : {
           progressTarget : "fsUploadProgress",
           cancelButtonId : "btnCancel"
       },
       debug: false,
       // Button Settings
       button_image_url : "<c:url value='/swfimages/TestImageNoText_65x29.png'/>",
       button_placeholder_id : "spanButtonPlaceholder",
       button_width: 61,
       button_height: 22,
       button_text: '上传图片',
       button_text_style: ".spanButtonPlaceholder { font-size: 12; }",
       button_text_left_padding: 12,
       button_text_top_padding: 3,

       // The event handler functions are defined in handlers.js
       //swfupload_preload_handler : preLoad,
       //swfupload_load_failed_handler : loadFailed,
       file_queued_handler : fileQueued,
       file_queue_error_handler : fileQueueError,
       file_dialog_complete_handler : fileDialogComplete,
       upload_start_handler : uploadStart,
       upload_progress_handler : uploadProgress,
       upload_error_handler : uploadError,
       upload_success_handler : uploadSuccess,
       upload_complete_handler : uploadComplete,
       queue_complete_handler : queueComplete  // Queue plugin event
};
swfupload = new SWFUpload(settings);
var images = '${collection.imgurl}';
var imageslist = images.split(',');
$('#imagelistid').empty()
for (var i = 0; i < imageslist.length-1 ; i++) {
	$('#imagelistid').append("<img src='../collection/small/"+imageslist[i]+"'/>");
}
});

function uploadSuccess(file, serverData) {
	try {
		var progress = new FileProgress(file, this.customSettings.progressTarget);
		progress.setComplete();
		progress.setStatus("上传成功");
		progress.toggleCancel(false);
		$('#imgid').val($('#imgid').val()+serverData+",");
		var imagelist = $('#imgid').val().split(',');
		$('#imagelistid').empty();
		for (var i = 0; i < imagelist.length-1 ; i++) {
			$('#imagelistid').append("<img src='../collection/small/"+imagelist[i]+"'/>");
		}
		$.messager.alert('提示', "上传成功！", 'info');
	} catch (ex) {
		this.debug(ex);
	}
}

function formsubmit(){
	$('#editcollectionform').form('submit', {
		url: "<c:url value='/collection/editcollection'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "修改藏品成功！", 'info',function(){
					document.getElementById("editcollectionform").reset();
			    	window.dialogArguments.$('#collectiontable').datagrid('reload');
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
	<form id="editcollectionform" method="post">
	   <input type="hidden" name="id" value="${collection.id}"/>
	   <input id="imgid" type="hidden" name="imgurl"/>
	   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
			<tr>
			    <td>藏品类型:</td><td>
				<input name="type" value="${collection.type}" class="easyui-combobox" data-options="url:'<c:url value="/collection/typecombox"/>', valueField:'id', textField:'typename', panelHeight:'auto'">
				</td>
			</tr>
			<tr><td>藏品名称:</td><td><input name="name" value="${collection.name}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr>
			    <td>上传图片:</td>
			    <td>
			        <div class="fieldset flash" id="fsUploadProgress">
			            <span class="legend">藏品列表：</span>
			            <div id="imagelistid"></div>
			            </div>
			        <div id="divStatus">上传了0个藏品</div>
			    
				    <div class="flash" id="fsUploadProgress">
				    </div>
				    <div style="padding-left: 5px;">
				        <span id="spanButtonPlaceholder"></span>
				        <input id="btnCancel" type="button" value="取消" onclick="swfupload.cancelQueue()" disabled="disabled" style="margin-left: 2px; height: 22px; font-size: 8pt;" />
				    </div>
                      <p>    图片要求1至10张，图片大小单张不超过3M，累计不超过30M。</p>
			    </td>
			</tr>
			<tr>
			  <td>藏品归属:</td>
			  <td>
			     <input type="radio" checked="checked" name="owner" <c:if test="${collection.owner eq '自有'}">checked="checked"</c:if> value="自有"/>自有&nbsp;&nbsp;
                 <input type="radio" name="owner" <c:if test="${collection.owner eq '受人委托'}">checked="checked"</c:if> value="受人委托"/>受人委托&nbsp;&nbsp;
                 <input type="radio" name="owner" <c:if test="${collection.owner eq '他人拥有'}">checked="checked"</c:if> value="他人拥有"/>他人拥有&nbsp;&nbsp;
			  </td>
			</tr>
			<tr>
			  <td>藏品来源:</td>
			  <td>
			     <input type="radio" checked="checked" name="source" <c:if test="${collection.source eq '家传'}">checked="checked"</c:if> value="家传"/>家传&nbsp;&nbsp;
                 <input type="radio" name="source" <c:if test="${collection.source eq '普通买卖'}">checked="checked"</c:if> value="普通买卖"/>普通买卖&nbsp;&nbsp;
                 <input type="radio" name="source" <c:if test="${collection.source eq '拍卖'}">checked="checked"</c:if> value="拍卖"/>拍卖&nbsp;&nbsp;
			     <input type="radio" name="source" <c:if test="${collection.source eq '其他方式'}">checked="checked"</c:if> value="其他方式"/>其他方式
			  </td>
			</tr>
			<tr><td>藏品简介:</td><td>
			</td>
			</tr>
		</table>
		<textarea name="note" id="myEditor">${collection.note}</textarea>
		<script type="text/javascript">
		    UE.getEditor('myEditor')
		</script>
	</form>
	<div style="text-align:right;padding:5px 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="formsubmit();">修改</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="window.close();">返回</a>
       </div>
  </body>
</html>
