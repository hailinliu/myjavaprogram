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
       flash_url : "http://116.255.149.172:7080/wswhly/swfupload/swfupload.swf",
       upload_url: "http://116.255.149.172:7080/wswhly/baibao/uploadBaibaourl",
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
});

function uploadSuccess(file, serverData) {
	try {
		var progress = new FileProgress(file, this.customSettings.progressTarget);
		progress.setComplete();
		progress.setStatus("上传成功");
		progress.toggleCancel(false);
		$('#imagelist1').append("<img src='http://116.255.149.172:7080/wswhly/Baibaourl/"+serverData+"' width='200' onclick='deleteImg(this)' style='cursor:pointer;'/><br/>");
		$.messager.alert('提示', "上传成功！", 'info');
	} catch (ex) {
		this.debug(ex);
	}
}

$(document).ready(function(){

	var imgurl = '${baibaocollection.imgurl}';
	var imageslist1 = imgurl.split(',');
	$('#imagelist1').empty();
	for (var i = 0; i < imageslist1.length-1 ; i++) {
		$('#imagelist1').append("<img src='http://116.255.149.172:7080/wswhly/Baibaourl/"+imageslist1[i]+"' width='200' onclick='deleteImg(this)' style='cursor:pointer;'/><br/>");
	}
});
function formsubmit(){	
	var imagelist1 = $('#imagelist1').children("img");
	var imgurl = '';
	for (var i=0; i<imagelist1.length; i++) {
	var imgsrc=imagelist1[i].src;
		imgurl += imgsrc.substring(imgsrc.lastIndexOf("Baibaourl/")+9,imgsrc.length)+',';
	}
	$('#imgurl').val(imgurl);
	$('#editbaibaocollectionform').form('submit', {	
		url: "<c:url value='/baibao/editBaibaoCollection'/>",		
		onSubmit: function() {
			return $(this).form('validate');
		},	
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "修改拍品成功！", 'info',function(){
					document.getElementById("editbaibaocollectionform").reset();
					window.dialogArguments.$('#baicollectiontable').datagrid('reload');
					window.close();
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
   <form id="editbaibaocollectionform" method="post">
	  <input id="imgurl" type="hidden" name="imgurl"/>	
	   <input type="hidden" name="id" value="${baibaocollection.id}"/>
	   <table id="onecollectiontable" width="100%" border="0" align="center" cellpadding="10" cellspacing="10" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">			
			<tr><td>藏品名称:</td><td><input name="name" value="${baibaocollection.name}" class="easyui-validatebox" type="text" data-options="required:true" style="width:600px"></td></tr>	
			<tr>
			    <td>上传图片:</td>
			    <td>
			        <div class="fieldset flash" id="fsUploadProgress">
			            <span class="legend">拍品列表：</span>
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
                        <span id="imagelist1"></span>
			    </td>
			</tr>
			<tr>
				
         <tr><td>价格：</td><td><input name="price"  value="${baibaocollection.price}" class="easyui-validatebox" type="text" data-options="" style="width:600px"></td></tr>        
         <tr><td>广告：</td><td><input name="advertisement"  value="${baibaocollection.advertisement}" class="easyui-validatebox" type="text" style="width:600px"></td></tr>
		 <tr><td>是否同意中转：</td> <td>
			     <input type="radio" name="isagree" <c:if test="${baibaocollection.isagree==1}">checked="checked"</c:if> value="1"/>同意&nbsp;&nbsp;
                 <input type="radio" name="isagree" <c:if test="${baibaocollection.isagree==2}">checked="checked"</c:if> value="2"/>不同意&nbsp;&nbsp;      
			  </td></tr>	     
         <tr><td>拍品介绍:</td><td>
			</td>
			</tr>
		</table>
		<textarea name="note" id="myEditor">${baibaocollection.note}</textarea>
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
