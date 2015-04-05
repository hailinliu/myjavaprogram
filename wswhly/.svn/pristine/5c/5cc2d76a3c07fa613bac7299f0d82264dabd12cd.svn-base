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
       file_upload_limit : 1,
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

	var imgurl = '${baibaoshop.img}';
	$('#imagelist1').empty();
		$('#imagelist1').append("<img src='http://116.255.149.172:7080/wswhly/Baibaourl/"+imgurl+"' width='200' onclick='deleteImg(this)' style='cursor:pointer;'/><br/>");

	$("input[name='mainscopec']").each(function () {
	                    if('${baibaoshop.mainscope}'.indexOf(this.value)>=0){
	                    	  this.checked=true;
	                    }
	                })
});
function formsubmit(){	
	var mainscope='';
	$("input[name='mainscopec']:checked").each(function () {
			mainscope=mainscope+this.value+",";
		  })
	$('#mainscope').val(mainscope);
	var imagelist1 = $('#imagelist1').children("img");
	if (imagelist1.length > 1) {
		$.messager.alert('警告', '头像只能为1张！', 'warning');
		return;
	}
	var imgurl = '';
	for (var i=0; i<imagelist1.length; i++) {
	var imgsrc=imagelist1[i].src;
		imgurl += imgsrc.substring(imgsrc.lastIndexOf("Baibaourl/")+9,imgsrc.length);
	}
	
	$('#img').val(imgurl);

	$('#editbaibaoshopform').form('submit', {	
		url: "<c:url value='/baibaoshopinfo/editbaibaoshop'/>",		
		onSubmit: function() {
			return $(this).form('validate');
		},	
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "修改商家成功！", 'info',function(){
					document.getElementById("editbaibaoshopform").reset();
					window.dialogArguments.$('#baibaoshoptable').datagrid('reload');
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
   <form id="editbaibaoshopform" method="post">
	   <input id="img" type="hidden" name="img"/>
	   <input type="hidden" name="id" value="${baibaoshop.id}"/>
	   <table id="onebaibaoshop" width="100%" border="0" align="center" cellpadding="10" cellspacing="10" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
			<tr><td>商家名称:</td><td><input name="shopname" value="${baibaoshop.shopname}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr><td>经营范围:</td><td>
			<input  name="mainscope" id="mainscope" value="${baibaoshop.mainscope}" class="easyui-validatebox" type="hidden" data-options="required:true">
			 <input type="checkbox" name="mainscopec" id="mainscope1"  value="14"/> 瓷器陶器
             <input type="checkbox" name="mainscopec" id="mainscope2"  value="15"/>玉器赏石
             <input type="checkbox" name="mainscopec"  id="mainscope3" value="16"/>书画古籍
             <input type="checkbox" name="mainscopec"  id="mainscope4" value="17"/>青铜佛像
             <input type="checkbox" name="mainscopec"  id="mainscope5" value="18"/>木器雕品
             <input type="checkbox" name="mainscopec"  id="mainscope6" value="19"/>古币钱币
             <input type="checkbox" name="mainscopec"  id="mainscope7" value="20"/>珠宝首饰
             <input type="checkbox" name="mainscopec"  id="mainscope8" value="21"/>油画雕塑
             <input type="checkbox" name="mainscopec"  id="mainscope9" value="22"/>邮票邮品
             <input type="checkbox" name="mainscopec"  id="mainscope10" value="23"/>其他藏品
			</td></tr>
			<tr><td>商家宣言:</td><td><input name="manifesto"  value="${baibaoshop.manifesto}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr>
			    <td>上传图片:</td>
			    <td>
			        <div class="fieldset flash" id="fsUploadProgress">
			            <span class="legend">列表：</span>
			            <div id="imagelistid"></div>
			            </div>
			        <div id="divStatus"></div>
			    
				    <div class="flash" id="fsUploadProgress">
				    </div>
				    <div style="padding-left: 5px;">
				        <span id="spanButtonPlaceholder"></span>
				        <input id="btnCancel" type="button" value="取消" onclick="swfupload.cancelQueue()" disabled="disabled" style="margin-left: 2px; height: 22px; font-size: 8pt;" />
				    </div>
                      <p>    图片要求1张，图片大小单张不超过3M</p>
                        <span id="imagelist1"></span>
			    </td>
			</tr>
			<tr>
			<tr><td>联系电话：</td><td><input name="mobile" value="${baibaoshop.mobile}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr><td>微信号：</td><td><input name="weixin"  value="${baibaoshop.weixin}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>			
            <tr><td>公司地址：</td><td><input name="shopaddress" value="${baibaoshop.shopaddress}"  class="easyui-validatebox" type="text" data-options="required:true"></td></tr>           
			<tr><td>详细介绍:</td><td>
			</td>
			</tr>
		</table>
		<textarea name="desction" id="myEditor">${baibaoshop.desction}</textarea>
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
