<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改新闻</title>
    
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
	<script type="text/javascript" src="<c:url value="/jquery/jquery-1.8.0.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.easyui.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.queue.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/fileprogress.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/handlers.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/locale/easyui-lang-zh_CN.js"/>"></script>
 <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "<c:url value='/ueditor/'/>";
    </script>
	<script type="text/javascript" src="<c:url value="/ueditor/ueditor.config.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/ueditor/ueditor.all.min.js"/>"></script>
    
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
	var imagestitle = '${news.imgurltitle}';
	var imageslist1 = imagestitle.split(',');
	$('#imagelist1').empty();
	for (var i = 0; i < imageslist1.length-1 ; i++) {
		$('#imagelist1').append("<img src='"+imageslist1[i]+"' width='100' onclick='deleteImg(this)' style='cursor:pointer;'/><br/>");
	}
	$('#state').combobox('setValue', '${news.state}');
});


function formsubmit(){
		
		var style = $("#style").combobox("getValue");
		  var flagshopid = $("#flagshopbaseinfoid").combobox("getValue");
		 if(style==215||style==216||style==214){
		 		if(flagshopid==''){
			 		$.messager.alert('警告', '请选择缩旗舰商家！', 'warning');
					return;
		 		}
		 }else{
		 	$('#flagshopbaseinfoid').combobox('setValue','')
		 }
		var imagelist1 = $('#imagelist1').children("img");
			//if (imagelist1.length <= 0) {
			//	$.messager.alert('警告', '请选择缩略图！', 'warning');
			//	return;
			//}
			if (imagelist1.length > 1) {
				$.messager.alert('警告', '缩略图只能为1张！', 'warning');
				return;
			}
		var imgurltitleid = '';
			for (var i=0; i<imagelist1.length; i++) {
				imgurltitleid += imagelist1[i].src;
			}
			$('#imgurltitleid').val(imgurltitleid);
		var title1=document.getElementById("titleEditor").value;
		for(var i=0;i<10;i++){
		title1=title1.replace("<p>", "");
		title1=title1.replace("</p>", "");
		title1=title1.replace("<br/>", "");
		title1=title1.replace("span", "font");
		}
		var chkObjs = document.getElementsByName("images"); 
		var images;
		for(var i=0;i<chkObjs.length;i++){ 
			if(chkObjs[i].checked){ 
			images=chkObjs[i].value; 
			break; 
			} 
		} 
		if(images=='1'){
		title1=title1+'<img src="http://www.wswhly.com/images/hot.gif" width="22" height="10">';
		}else if(images=='2'){
		title1=title1+'<img src="http://www.wswhly.com/images/new.gif" width="18" height="7">';
		}
		$("#titleEditor").attr("value",title1);
		$('#editnewsform').form('submit', {
				url: "<c:url value='/news/editnews'/>",
				onSubmit: function() {
					return $(this).form('validate');
				},
				success: function(data) {
					if(data == "0000"){
						$.messager.alert('提示', "处理成功！", 'info',function(){
							document.getElementById("editnewsform").reset();
							window.dialogArguments.$('#newstable').datagrid('reload');
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
$(function(){
if(${news.style}!=214&&${news.style}!=215&&${news.style}!=216){
	$('#flagshoptdid').hide();
	}
});
</script>
  </head>
  
  <body>
    <!-- 修改新闻 -->
	<form id="editnewsform" method="post">
	   <input type="hidden" name="id" value="${news.id}"/>
	   <input id="imgurltitleid" type="hidden" name="imgurltitle"/>
	   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
			<tr>
				<td>收藏资讯标题:
				<textarea name="title" id="titleEditor">${news.title}</textarea>
		<script type="text/javascript">
		     UE.getEditor('titleEditor',{
            //这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
            toolbars:[['FullScreen', 'Source','forecolor','fontfamily', 'fontsize','test','link','underline']],
            //关闭字数统计
            wordCount:false,
            //关闭elementPath
            elementPathEnabled:false,
            //默认的编辑区域高度
            initialFrameHeight:30,
             initialFrameWidth:400
           
        })
		</script>
		<input id="images" name="images" type="radio" value="0"  />无&nbsp;&nbsp;<input id="images" name="images" type="radio" value="1" /><img src="http://www.wswhly.com/images/hot.gif" width="22" height="10">&nbsp;&nbsp;<input id="images" name="images" type="radio" value="2"/><img src="http://www.wswhly.com/images/new.gif" width="18" height="7">
		</td>
				<td>收藏资讯类型:<input name="style" id="style" value="${news.style}" class="easyui-combobox" data-options="url:'<c:url value="/news/gettypecombobox"/>?parentid=1', valueField:'id', textField:'style', panelHeight:'auto',formatter:function(row){
				    var opts = $(this).combobox('options');
		            return row[opts.textField];
				},onSelect:function(data){
						    if(data.id != 0&&(data.id==214||data.id==215||data.id==216)){
								$('#flagshoptdid').show();
						    }else{
						        $('flagshopbaseinfoid').combobox('clear');
								$('#flagshoptdid').hide();
						    }
				}">
				<span id="flagshoptdid">
				旗舰商家:<input id="flagshopbaseinfoid" name="flagshopbaseinfoid" value="${news.flagshopbaseinfoid}"    class="easyui-combobox" data-options="url:'<c:url value="/flagshopinfo/getflagshopbaseinfocombobox"/>', valueField:'id', textField:'name',panelHeight:'auto',formatter:function(row){
				    var opts = $(this).combobox('options');
		            return row[opts.textField];
				}">
				</span></td>
				<td>状态:</td> <td><select id="state" value="${news.state}" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">		              
		                              <option value="1">正常</option>
						              <option value="2">删除</option>
						              <option value="3">待修改</option>		
						              <option value="4">带图修改</option>						   
		                          </select></td>
		        <td>发布时间：</td><td><input id="createdate"   name="createdate" value="${news.createdate}"  type="text" size="9" class="easyui-DateTimeBox" editable="false"/></td>
				<td>标签:<input name="label" value="${news.label}" class="easyui-validatebox" /></td>
				 <td  >
                     <div class="fieldset flash" id="fsUploadProgress">
			            </div>			    
				    <div class="flash" id="fsUploadProgress">
				    </div>
				    <div style="padding-left: 5px;">
				        <span id="spanButtonPlaceholder"></span>
				        <input id="btnCancel" type="button" value="取消" onclick="swfupload.cancelQueue()" disabled="disabled" style="margin-left: 2px; height: 22px; font-size: 8pt;" />
				    </div>
                      <p>    缩略图只能为一张。</p>
                      <span id="imagelist1"></span>
			    </td>
			</tr>
		</table><br/><br/>
 		<textarea name="content" id="myEditor">${news.content}</textarea>
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
