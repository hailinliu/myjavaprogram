<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>我的上传</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.queue.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/fileprogress.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/handlers.js"/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
<style type="text/css">
div.fieldset {
	border:  1px solid #afe14c;
	margin: 10px 0;
	padding: 20px 10px;
}
div.fieldset span.legend {
	position: relative;
	background-color: #FFF;
	padding: 3px;
	top: -30px;
	font: 700 14px Arial, Helvetica, sans-serif;
	color: #73b304;
}

div.flash {
	width: 375px;
	margin: 10px 5px;
	border-color: #D9E4FF;

	-moz-border-radius-topleft : 5px;
	-webkit-border-top-left-radius : 5px;
    -moz-border-radius-topright : 5px;
    -webkit-border-top-right-radius : 5px;
    -moz-border-radius-bottomleft : 5px;
    -webkit-border-bottom-left-radius : 5px;
    -moz-border-radius-bottomright : 5px;
    -webkit-border-bottom-right-radius : 5px;

}

.progressWrapper {
	width: 357px;
	overflow: hidden;
}

.progressContainer {
	margin: 5px;
	padding: 4px;
	border: solid 1px #E8E8E8;
	background-color: #F7F7F7;
	overflow: hidden;
}
/* Message */
.message {
	margin: 1em 0;
	padding: 10px 20px;
	border: solid 1px #FFDD99;
	background-color: #FFFFCC;
	overflow: hidden;
}
/* Error */
.reed {
	border: solid 1px #B50000;
	background-color: #FFEBEB;
}

/* Current */
.green {
	border: solid 1px #DDF0DD;
	background-color: #EBFFEB;
}

/* Complete */
.blue {
	border: solid 1px #CEE2F2;
	background-color: #F0F5FF;
}

.progressName {
	font-size: 8pt;
	font-weight: 700;
	color: #555;
	width: 323px;
	height: 14px;
	text-align: left;
	white-space: nowrap;
	overflow: hidden;
}

.progressBarInProgress,
.progressBarComplete,
.progressBarError {
	font-size: 0;
	width: 0%;
	height: 2px;
	background-color: blue;
	margin-top: 2px;
}

.progressBarComplete {
	width: 100%;
	background-color: green;
	visibility: hidden;
}

.progressBarError {
	width: 100%;
	background-color: red;
	visibility: hidden;
}

.progressBarStatus {
	margin-top: 2px;
	width: 337px;
	font-size: 7pt;
	font-family: Arial;
	text-align: left;
	white-space: nowrap;
}

a.progressCancel {
	font-size: 0;
	display: block;
	height: 14px;
	width: 14px;
	background-image: url(../images/cancelbutton.gif);
	background-repeat: no-repeat;
	background-position: -14px 0px;
	float: right;
}

a.progressCancel:hover {
	background-position: 0px 0px;
}
</style>
<script type="text/javascript">
function myCollections() {
	location.href = "<c:url value='/mine/myupload'/>";
}

function gotoUpload() {
	location.href = "<c:url value='/mine/gotoupload'/>";
}

var swfupload;
$(function(){
var settings = {
       flash_url : "<%=PropertiesUtil.getPropertiesValue("swfuploadurl")%>",
       upload_url: "<%=PropertiesUtil.getPropertiesValue("uploadCollection")%>",
       file_size_limit : "3MB",
       file_types : "*.jpg;*.gif;*.jpeg;*.bmp;*.png",
       file_post_name: "uploadFile",
       file_types_description : "藏品图片",
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

       file_queued_handler : fileQueued,
       file_queue_error_handler : fileQueueError,
       file_dialog_complete_handler : fileDialogComplete,
       upload_start_handler : uploadStart,
       upload_progress_handler : uploadProgress,
       upload_error_handler : uploadError,
       upload_success_handler : uploadSuccess,
       upload_complete_handler : uploadComplete,
       queue_complete_handler : queueComplete,  // Queue plugin event
       prevent_swf_caching : false, 
       preserve_relative_urls : false
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
		alert("上传成功");
	} catch (ex) {
		this.debug(ex);
	}
}

function checkForm() {
	if ($('#typeid').val() == 0) {
	   alert('请选择藏品类型');
       return false;
	}
	if ($.trim($('#nameid').val()).length <= 0) {
	   alert('请输入藏品名称');
       return false;
	}
	//if ($('#imgid').val().length <= 0) {
	  // alert('请上传藏品图片');
      // return false;
	//}
	return true;
}
</script>
  </head>
  
  <body>
<jsp:include page="../head/header.jsp"></jsp:include>

    <!--main style ben-->
<div class="main_box clear">

  <jsp:include page="common/myMenu.jsp"></jsp:include>

<div class="user_right fr clear">
     <div class="onuser_tit2">我的上传</div>   
     <div class="onuser_box4 clear">
     <!--<p class="tiile_wz">您已上传了<span class="red">${count}</span>件收藏品信息，感谢您为中国的收藏品文化传播所做的贡献！</p>-->
         <ul class="charge_list">
         <li class="red" onclick="gotoUpload()" style="cursor: pointer;">我要上传</li> 
           <li onclick="myCollections()" style="cursor: pointer;">查看已上传</li>
           
         </ul>
        <div class="bottom_line"></div>
         
         <form action="<c:url value='/mine/uploadCollectionMsg'/>" method="post" onsubmit="return checkForm()">
         <input type="hidden" name="id" value="${col.id}"/>
         <input id="imgid" type="hidden" name="imgurl"/>
         <div class="upload_box clear">
             <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="mc">分类：</td>
                  <td>
                      <ul class="select_list">
                          <li>
                             <select id="typeid" name="type">
                               <option value="0">-- 请选择 --</option>
                               <c:forEach items="${typeList}" var="type">
                                 <option <c:if test="${col.type eq type.id}">selected="selected"</c:if> value="${type.id}">${type.name}</option>
                               </c:forEach>
                             </select>
                          </li>
                          <li>*一次仅限上传一件（套、对）藏品。</li>
                      </ul>
                  </td>
                </tr>
                <tr>
                  <td class="mc">收藏品名称：</td>
                  <td>
                     <ul class="text_list">
                       <li><input id="nameid" style="height: 27" type="text" name="name" maxlength="300" value="${col.name}" placeholder="" /></li>
                       <li>*1-20个汉字</li>
                     </ul>
                  </td>
                </tr>
                <tr>
                  <td class="mc">归属：</td>
                  <td>
                      <ul class="radio_list">
                          <li><input type="radio" checked="checked" name="owner" <c:if test="${col.owner eq '自有'}">checked="checked"</c:if> value="自有"/>自有</li>
                          <li><input type="radio" name="owner" <c:if test="${col.owner eq '受人委托'}">checked="checked"</c:if> value="受人委托"/>受人委托</li>
                          <li><input type="radio" name="owner" <c:if test="${col.owner eq '他人拥有'}">checked="checked"</c:if> value="他人拥有"/>他人拥有</li>
                      </ul>
                  </td>
                </tr>
                <tr>
                  <td class="mc">来源：</td>
                  <td>
                      <ul class="radio_list">
                          <li><input type="radio" checked="checked" name="source" <c:if test="${col.source eq '家传'}">checked="checked"</c:if> value="家传"/>家传</li>
                          <li><input type="radio" name="source" <c:if test="${col.source eq '普通买卖'}">checked="checked"</c:if> value="普通买卖"/>普通买卖</li>  
                          <li><input type="radio" name="source" <c:if test="${col.source eq '拍卖'}">checked="checked"</c:if> value="拍卖"/>拍卖</li>
                          <li><input type="radio" name="source" <c:if test="${col.source eq '其他方式'}">checked="checked"</c:if> value="其他方式"/>其他方式</li>
                      </ul>
                  </td>
                </tr>
                <tr>
                  <td class="mc2" style="padding-top: 15px;">上传图片：</td>
                  <td class="slip">  
					<div class="fieldset flash" id="fsUploadProgress">
			            <span class="legend">图片列表：</span>
			            </div>
			        <div id="divStatus">上传了0个图片</div>
			    
				    <div class="flash" id="fsUploadProgress">
				    </div>
				    <div style="padding-left: 5px;">
				        <span id="spanButtonPlaceholder"></span>
				        <input id="btnCancel" type="button" value="取消" onclick="swfupload.cancelQueue()" disabled="disabled" style="margin-left: 2px; height: 22px; font-size: 8pt;" />
				    </div>
                      <p ><font color="red"> 海选报名图片非必须上传，您也可以在报名后修改“查看已上传”的藏品图片。海选图片上传仅限1张，大小不超过3M。</font></p>
                  </td>
                </tr>
              </table>
              
              <ul class="textarea_list">
                 <li>收藏品介绍：(5000字以内)</li>
                 <li>
                   <textarea name="memo" placeholder="">${col.note}</textarea>
                 </li>
              </ul>
           <div class="tjan">
             <input type="submit" value=""/>
           </div>   
           
         </div><!--upload_box end-->
         </form>
         
            
       </div>

  </div><!--user_right end-->
  
</div>
<!--main style end-->  

<jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
