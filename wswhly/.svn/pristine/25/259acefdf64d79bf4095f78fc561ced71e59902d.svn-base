<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>发送短信</title>
    
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
       upload_url: "<c:url value='/message/uploadMobile'/>",
       file_size_limit : "300 MB",
       file_types : "*.txt",
       file_post_name: "uploadFile",
       file_types_description : "Flash Video File",
       file_upload_limit : 1,
       file_queue_limit : 0,
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
       button_text: '上传文件',
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
});

function uploadSuccess(file, serverData) {
	try {
		var progress = new FileProgress(file, this.customSettings.progressTarget);
		progress.setComplete();
		progress.setStatus("上传成功");
		progress.toggleCancel(false);
		$('#messageid').val(serverData);
		$.messager.alert('提示', "上传成功！", 'info');
	} catch (ex) {
		this.debug(ex);
	}
}

function formsubmit(){
	$('#addmessageform').form('submit', {
		url: "<c:url value='/message/sendMessage'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "短信发送成功！", 'info',function(){
					document.getElementById("addmessageform").reset();
					location.href = '<c:url value="/sys/redirect?p=admin/message/messageManage"/>';
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
    <!-- 添加视频 -->
	<form id="addmessageform" method="post">
	   <input id="messageid" type="hidden" name="message"/>
	   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
			<tr>
			    <td colspan="2" align="center">
			        <hr>
					<!-- 上传文件 -->
					<div class="fieldset flash" id="fsUploadProgress">
			            <span class="legend">文件列表：</span>
			            </div>
			        <div id="divStatus">上传了0个文件</div>
			    
				    <div class="flash" id="fsUploadProgress">
				    </div>
				    <div style="padding-left: 5px;">
				        <span id="spanButtonPlaceholder"></span>
				        <input id="btnCancel" type="button" value="取消" onclick="swfupload.cancelQueue()" disabled="disabled" style="margin-left: 2px; height: 22px; font-size: 8pt;" />
				    </div>
			    </td>
			</tr>
			<tr><td>发送短信：</td></tr>
			<tr>			
			    <td>
			     <input type="radio" name="type" id="type" value="86"/> *八优&nbsp;&nbsp;
                 <input type="radio" name="type" id="type" value="huyi"/>*验证码通知-互亿&nbsp;&nbsp; 
                 <input type="radio" name="type" id="type" value="lianyu"/>*营销广告类-联瑜&nbsp;&nbsp; 			 		
			   </td>
			</tr>
			<tr>
			    <td>
			 		<div id="statword">当前短信内容 <font color='red'>0</font> 字。注意，每条短信内容最多 <font color='red'>70</font>  字，超过 <font color='red'>70</font> 字将以长短信方式发送！</div><textarea name="content"id="content" style="width: 90%" rows="10" onkeyup="checkWord()"></textarea>
			    </td>
			</tr>
		</table>
	</form>
	<div style="text-align:right;padding:5px 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="formsubmit();">添加</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="history.go(-1);">返回</a>
       </div>
       <script type="text/javascript">
       function checkWord(){
       	var len=$("#content").val().length;
	       $("#statword").html("当前短信内容<font color='red'>"+len+"</font>字。注意，每条短信内容最多 <font color='red'>70</font> 字，超过 <font color='red'>70</font> 字将以长短信方式发送！");
       }
       
       </script>
  </body>
</html>
