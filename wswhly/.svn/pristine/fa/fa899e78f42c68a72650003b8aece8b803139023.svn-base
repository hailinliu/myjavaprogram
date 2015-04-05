<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加商家信息</title>
    
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
    <script type="text/javascript" src="<c:url value="/jquery/jquery.autocomplete.min.js"/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery.autocomplete.css"/>">
    
    
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
	var imagelist = $('#imagelist').children("img");
	if (imagelist.length <= 0) {
		$.messager.alert('警告', '请选择地图！', 'warning');
		return;
	}
	if (imagelist.length > 1) {
		$.messager.alert('警告', '地图只能为1张！', 'warning');
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
	
	$('#addflagshopform').form('submit', {
	
		url: "<c:url value='/flagshopinfo/addflagshop'/>",		
		onSubmit: function() {
			return $(this).form('validate');
		},
	
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "添加商家成功！", 'info',function(){
					document.getElementById("addflagshopform").reset();
					location.href = '<c:url value="/sys/redirect?p=admin/flagshop/flagshopinfoMessage"/>';
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

	$(function(){
 //objects为json数据源对象
		   //objects为json数据源对象
		   $('#usernameid').autocomplete('<c:url value="/sys/autouser"/>', 
	             {
			        minChars: 0, 
	                width :400, 
	                dataType: "json",
	                max: 10,
	                mustMatch:true,
	                scroll:false,
	                //autoFill: true,
	                matchContains: true,
	                parse:function(data){
			           return $.map(eval(data),
			           function(row) {
			               return {
			                   data: row,
			                   value: row.username,
			                   result: row.username
			               }
			           }
			           );
	                },
	                formatItem: function (row, i, max) {
	                    return "<table width='97%'><tr><td align='left'>用户名：" + row.username + "</td></tr></table>";
	                    //return  row.name;
	                }, 
	                formatMatch: function(row, i, max){ 
	                     return row.username;
	                } ,

	                formatResult: function(row, i, max) {
	                     return row.username;
	                }                 
	             });
	});
</script>
  </head>
  
  <body>
    <!-- 添加商家 -->
	<form id="addflagshopform" method="post">
	  <input id="logo" type="hidden" name="logo"/>
	  <input id="map" type="hidden" name="map"/>
	  <input id="weixin" type="hidden" name="weixin"/>
	  <input id="sinlwblog" type="hidden" name="sinlwblog"/>	  
	   <table id="onecollectiontable" width="100%" border="0" align="center" cellpadding="10" cellspacing="10" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
			<tr valign="middle">
			    <td>商家类型:</td>  <td><select id="typeid" name="type" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">公司</option>
						<option value="2">个人</option>
		              </select></td>
			</tr>			
			<tr><td>商家名称:</td><td><input name="name" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr><td>用户名称:</td><td><input id="usernameid" name="username" type="text" size="10" editable="false"/></td></tr>
			<tr><td>经营范围:</td><td><input name="mainscope" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr><td>导语:</td><td><input name="daoyu" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr>
			    <td>上传logo图片:</td>
			    <td>
			       <script type="text/javascript">
			    	var imageid="";
			    	function setimg(id){
			    	imageid=id;
			    	}
			    </script>
                      <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="setimg('imagelist1');window.showModalDialog('<c:url value="/sys/redirect?p=admin/fileManager/fileSelect"/>',window,'dialogWidth=800px;dialogHeight=500px;toolbar=no');">选择logo图片</a>
                      <p>    logo只能为一张。</p>
                      <span id="imagelist1"></span>
			    </td>
			</tr>
			<tr><td>联系人：</td><td><input name="contactname" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr><td>联系电话：</td><td><input name="contacttel" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
			<tr><td>QQ号：</td><td><input name="qq" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>	
					
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
            <tr><td>公司地址：</td><td><input name="addresss" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
             <tr>
			    <td>上传地图:</td>
			    <td>
			        <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="setimg('imagelist');window.showModalDialog('<c:url value="/sys/redirect?p=admin/fileManager/fileSelect"/>',window,'dialogWidth=800px;dialogHeight=500px;toolbar=no');">选择地图</a>
                    <p> 地图只能为一张。</p>
                    <span id="imagelist"></span>
			    </td>
			</tr>	
             <tr><td>合作状态</td><td><select id="state" name="state" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="1">合作中</option>
						<option value="2">合作暂停</option>
						<option value="3">合作结束</option>
		              </select></td></tr>
		 <tr><td>商务专员：</td><td><input id="commissioner" name="commissioner" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>				  
		 <tr><td>开始合作时间</td><td><input id="startdate"  name="startdate" type="text" size="9" class="easyui-datebox" editable="false"/></td></tr>
         <tr><td>结束合作时间</td><td><input id="enddate"  name="enddate" type="text" size="9" class="easyui-datebox" editable="false"/></td></tr>
			<tr><td>详细介绍:</td><td>
			</td>
			</tr>
		</table>
		<textarea name="introduce" id="myEditor"></textarea>
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
