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
       upload_url: "http://116.255.149.172:7080/wswhly/collect/uploadCollection",
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
		$('#imagelist1').append("<img src='http://116.255.149.172:7080/wswhly/zengjipaipin/"+serverData+"' width='200' onclick='deleteImg(this)' style='cursor:pointer;'/><br/>");
	} catch (ex) {
		this.debug(ex);
	}
}

$(document).ready(function(){

	var image = '${lylots.image}';
	var imageslist1 = image.split(',');
	$('#imagelist1').empty();
	for (var i = 0; i < imageslist1.length-1 ; i++) {
		$('#imagelist1').append("<img src='http://116.255.149.172:7080/wswhly/zengjipaipin/"+imageslist1[i]+"' width='200' onclick='deleteImg(this)' style='cursor:pointer;'/><br/>");
	}
	$('#ins_id').combobox('setValue', '${lylots.insid}');
	$('#actionid').combobox('setValue','${lylots.actid}');
    $('#specialID').combobox('setValue','${lylots.specid}');
	
});
function formsubmit(){
	if($("#specialID").val()==undefined){
	$.messager.alert('警告', '请选择专场！', 'warning');
			return;
	}
	if ($("#specialID").val() == ' ') {
		$.messager.alert('警告', '请选择专场！', 'warning');
		return;
	}
	var imagelist1 = $('#imagelist1').children("img");
	var image = '';
	for (var i=0; i<imagelist1.length; i++) {
	var imgsrc=imagelist1[i].src;
		image += imgsrc.substring(imgsrc.lastIndexOf("zengjipaipin/")+12,imgsrc.length)+',';
	}
	$('#image').val(image);
	$('#editLylotsform').form('submit', {	
		url: "<c:url value='/yclots/editlots'/>",		
		onSubmit: function() {
			return $(this).form('validate');
		},	
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "成功！", 'info',function(){
					document.getElementById("editLylotsform").reset();
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

function getaction(){
var ins_id = $("#ins_id").val();
var con= "<select id='actionid' name='actionid' value='${lylots.actid}' onchange='getspecil()' class='easyui-combobox'  data-options='required:true,onSelect:function(row){getspecil()}'> <option value='${lylots.actid}'>${lylots.auctionname}</option>";
$.ajax({
        type:'get',
        url:"<c:url value='/ycaction/getaction?ins_id='/>"+ins_id,
        success:function(data){
         var jsonData = eval(data);
                $.each(jsonData, function(index, objVal) {             
	               con+="<option value='"+objVal["id"]+"'>"+objVal["auctionname"]+"</option>";
                });
                 con+="</select>";
                 $("#pmh").html(con);
        }
    });
}
function getspecil(){
var actionid = $("#actionid").val();
var con= "<select id='specialID'  name='specialID' value='${lylots.specid}'  class='easyui-combobox'> <option value='${lylots.specid}'>${lylots.specialname}</option>";
$.ajax({
        type:'get',
        url:"<c:url value='/ycaction/getspecil?actionid='/>"+actionid,
        success:function(data){
         var jsonData = eval(data);
                $.each(jsonData, function(index, objVal) {              
                
	               con+="<option value='"+objVal["id"]+"'>"+objVal["specialname"]+"</option>";
                });
                 con+="</select>";
                 $("#zc").html(con);
        }
    });
}
$(document).ready(function(){
getaction();
setTimeout("getspecil()",500);
});
</script>
</head>
  
  <body >
  
   <form id="editLylotsform" method="post">
	  <input id="image" type="hidden" name="image"/>	
	   <input type="hidden" name="id" value="${lylots.id}"/>
	   <table id="onecollectiontable" width="100%" border="0" align="center" cellpadding="10" cellspacing="10" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
			<tr valign="middle">
			    <td> 拍卖公司: </td><td>
			      <select id="ins_id" name="ins_id"  value="${lylots.insid}"  onchange="getaction()" class="easyui-combobox"  data-options="required:true,onSelect:function(row){getaction()}">
			    			<option value="">请选择</option>
						<option value="4">苏富比</option>
						<option value="5">佳士得</option>
		          </select>
		          
			     拍卖会： <span id="pmh"  ></span>			 			  
			     专场： <span id="zc"  ></span>
				 
				</td>
			</tr>
			<tr><td>拍品名称:</td><td><input name="name" value="${lylots.name}" class="easyui-validatebox" type="text" data-options="required:true" style="width:600px"></td></tr>	
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
		<tr><td>作者：</td><td><input name="autor"  value="${lylots.autor}" class="easyui-validatebox" type="text" data-options="" style="width:600px"></td></tr>
		<tr><td>尺寸：</td><td><input name="size"  value="${lylots.size}" class="easyui-validatebox" type="text" data-options="" style="width:600px"></td></tr>
		<tr><td>作品分类：</td><td><input name="classes"  value="${lylots.classes}" class="easyui-validatebox" type="text" data-options="" style="width:600px"></td></tr>
		<tr><td>创作年代：</td><td><input name="year"  value="${lylots.year}" class="easyui-validatebox" type="text" data-options="" style="width:600px"></td></tr>
		<tr><td>估价：</td><td><input name="price"  value="${lylots.price}" class="easyui-validatebox" type="text" data-options="" style="width:600px"></td></tr>
		<tr><td>成交价格：</td><td><input name="cjprice"  value="${lylots.cjprice}" class="easyui-validatebox" type="text" data-options="" style="width:600px"></td></tr>
        <tr><td>成交时间：</td><td><input id="cjtime"   name="cjtime" value="${lylots.cjtime}"  type="text" size="9" class="easyui-DateTimeBox" editable="false"/></td>
         <tr><td>拍品描述:</td><td>
			</td>
			</tr>
		</table>
		<textarea name="suggest" id="myEditor">${lylots.suggest}</textarea>
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
