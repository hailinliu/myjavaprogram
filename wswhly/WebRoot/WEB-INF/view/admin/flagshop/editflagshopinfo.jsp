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

$(document).ready(function(){
	var logo = '${flagshop.logo}';
	var imagelist1 = logo.split(',');
	$('#imagelist1').empty();
	for (var i = 0; i < imagelist1.length-1 ; i++) {
		$('#imagelist1').append("<img src='"+imagelist1[i]+"' width='200' onclick='deleteImg(this)' style='cursor:pointer;'/><br/>");
	}
	var map = '${flagshop.map}';
	var imagelist = map.split(',');
	$('#imagelist').empty();
	for (var i = 0; i < imagelist.length-1 ; i++) {
		$('#imagelist').append("<img src='"+imagelist[i]+"' width='200' onclick='deleteImg(this)' style='cursor:pointer;'/><br/>");
	}
	var weixin = '${flagshop.weixin}';
	var imagelistwe = weixin.split(',');
	$('#imagelistwe').empty();
	for (var i = 0; i < imagelistwe.length-1 ; i++) {
		$('#imagelistwe').append("<img src='"+imagelistwe[i]+"' width='200' onclick='deleteImg(this)' style='cursor:pointer;'/><br/>");
	}
	var sinlwblog = '${flagshop.sinlwblog}';
	var imagelistsin = sinlwblog.split(',');
	$('#imagelistsin').empty();
	for (var i = 0; i < imagelistsin.length-1 ; i++) {
		$('#imagelistsin').append("<img src='"+imagelistsin[i]+"' width='200' onclick='deleteImg(this)' style='cursor:pointer;'/><br/>");
	}
	$('#typeid').combobox('setValue', '${flagshop.type}');
	$('#styleid').combobox({ 
		url:'<c:url value="/flagshopinfo/stylecombox?typeid=${flagshop.type}"/>', 
		valueField:'id', 
		textField:'typename' 
	});
	$('#styleid').combobox('setValue', '${flagshop.style}');
});
function formsubmit(){
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

	var imagelist1 = $('#imagelist1').children("img");
	if (imagelist1.length <= 0) {
		$.messager.alert('警告', '请选择log！', 'warning');
		return;
	}
	if (imagelist1.length > 1) {
		$.messager.alert('警告', 'logo只能为1张！', 'warning');
		return;
	}
	
		var imagelistwe = $('#imagelistwe').children("img");
	if (imagelistwe.length <= 0) {
		$.messager.alert('警告', '请选择微信图片！', 'warning');
		return;
	}
	if (imagelistwe.length > 1) {
		$.messager.alert('警告', '图片只能为1张！', 'warning');
		return;
	}	
	var imagelistsin = $('#imagelistsin').children("img");
	if (imagelistsin.length <= 0) {
		$.messager.alert('警告', '请选择微博图片！', 'warning');
		return;
	}
	if (imagelistsin.length > 1) {
		$.messager.alert('警告', '图片只能为1张！', 'warning');
		return;
	}
	var imagelist = $('#imagelist').children("img");
	if (imagelist.length <= 0) {
		$.messager.alert('警告', '请选择地图！', 'warning');
		return;
	}
	if (imagelist.length > 1) {
		$.messager.alert('警告', '地图只能为1张！', 'warning');
		return;
	}
	
	var imgurltitleid = '';
	for (var i=0; i<imagelist1.length; i++) {
		imgurltitleid += imagelist1[i].src+',';
	}
	$('#logo').val(imgurltitleid);
	
	
	var map = '';
	for (var i=0; i<imagelist.length; i++) {
		map += imagelist[i].src+',';
	}
	$('#map').val(map);
		var weixin = '';
	for (var i=0; i<imagelistwe.length; i++) {
		weixin += imagelistwe[i].src+',';
	}
	$('#weixin').val(weixin);
	var sinlwblog = '';
	for (var i=0; i<imagelistsin.length; i++) {
		sinlwblog += imagelistsin[i].src+',';
	}
	$('#sinlwblog').val(sinlwblog);


	if ($("#typeid").combobox("getValue") == ' ') {
		$.messager.alert('警告', '请选择公司类型！', 'warning');
		return;
	}
	//$('#imgid').val(image);
	
	$('#editflagshopform').form('submit', {
	
		url: "<c:url value='/flagshopinfo/editflagshop'/>",		
		onSubmit: function() {
			return $(this).form('validate');
		},
	
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "修改商家成功！", 'info',function(){
					document.getElementById("editflagshopform").reset();
					window.dialogArguments.$('#collectiontable').datagrid('reload');
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
   <form id="editflagshopform" method="post">
	  <input id="logo" type="hidden" name="logo"/>
	  <input id="map" type="hidden" name="map"/>
	   <input id="weixin" type="hidden" name="weixin"/>
	  <input id="sinlwblog" type="hidden" name="sinlwblog"/>	
	   <input type="hidden" name="id" value="${flagshop.id}"/>
	   <table id="onecollectiontable" width="100%" border="0" align="center" cellpadding="10" cellspacing="10" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
			<tr valign="middle">
			    <td>商家类型:</td>  <td><select id="typeid" name="type"  value="${flagshop.type}" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">公司</option>
						<option value="2">个人</option>
		              </select></td>
			</tr>
			<tr><td>商家名称:</td><td><input name="name" value="${flagshop.name}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr><td>经营范围:</td><td><input name="mainscope" value="${flagshop.mainscope}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr><td>导语:</td><td><input name="daoyu"  value="${flagshop.daoyu}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr>
			    <td>上传logo图片:</td>
			    <td>
			       <script type="text/javascript">
			    	var imageid="";
			    	function setimg(id){
			    	imageid=id;
			    	}
			    </script>
                      <a class="easyui-linkbutton"  data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="setimg('imagelist1');window.showModalDialog('<c:url value="/sys/redirect?p=admin/fileManager/fileSelect"/>',window,'dialogWidth=800px;dialogHeight=500px;toolbar=no');">选择 logo图片</a>
                      <p>    logo只能为一张。</p>
                      <span id="imagelist1"></span>
			    </td>
			</tr>
			<tr><td>联系人：</td><td><input name="contactname"  value="${flagshop.contactname}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr><td>联系电话：</td><td><input name="contacttel" value="${flagshop.contacttel}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr><td>QQ号：</td><td><input name="qq"  value="${flagshop.qq}" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr>
			    <td>上传微信二维码图片:</td>
			    <td>
                <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="setimg('imagelistwe');window.showModalDialog('<c:url value="/sys/redirect?p=admin/fileManager/fileSelect"/>',window,'dialogWidth=800px;dialogHeight=500px;toolbar=no');">选择微信二维码图片</a>
                      <p>   微信二维码图片只能为一张。</p>
                      <span id="imagelistwe"></span>
			    </td>
			</tr>
			<tr>
			    <td>上传新浪微博二维码图片:</td>
			    <td>
                <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="setimg('imagelistsin');window.showModalDialog('<c:url value="/sys/redirect?p=admin/fileManager/fileSelect"/>',window,'dialogWidth=800px;dialogHeight=500px;toolbar=no');">选择新浪微博二维码图片</a>
                      <p>    新浪微博二维码图片只能为一张。</p>
                      <span id="imagelistsin"></span>
			    </td>
			</tr>
            <tr><td>公司地址：</td><td><input name="addresss" value="${flagshop.addresss}"  class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
             <tr>
			    <td>上传地图:</td>
			    <td>
			        <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="setimg('imagelist');window.showModalDialog('<c:url value="/sys/redirect?p=admin/fileManager/fileSelect"/>',window,'dialogWidth=800px;dialogHeight=500px;toolbar=no');">选择地图</a>
                    <p> 地图只能为一张。</p>
                    <span id="imagelist"></span>
			    </td>
			</tr>	
             <tr><td>合作状态</td><td><select id="state" value="${flagshop.state}"  name="state" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="1">合作中</option>
						<option value="2">合作暂停</option>
						<option value="3">合作结束</option>
		              </select></td></tr>	
		 <tr><td>商务专员：</td><td><input id="commissioner" name="commissioner" value="${flagshop.commissioner}"  class="easyui-validatebox" type="text" data-options="required:true"></td></tr>			  
		 <tr><td>开始合作时间</td><td><input id="startdate"   name="startdate" value="${flagshop.startdate}"  type="text" size="9" class="easyui-datebox" editable="false"/></td></tr>
         <tr><td>结束合作时间</td><td><input id="enddate"  name="enddate" value="${flagshop.enddate}" type="text" size="9" class="easyui-datebox" editable="false"/></td></tr>
			<tr><td>详细介绍:</td><td>
			</td>
			</tr>
		</table>
		<textarea name="introduce" id="myEditor">${collection.introduce}</textarea>
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
