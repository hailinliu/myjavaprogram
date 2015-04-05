<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>华豫之门-线下转款</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.queue.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/fileprogress.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/handlers.js"/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
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
var swfupload;
$(function(){
var settings = {
       flash_url : "<%=PropertiesUtil.getPropertiesValue("swfuploadurl")%>",
       upload_url: "<%=PropertiesUtil.getPropertiesValue("uploadOffLine")%>",
       file_size_limit : "3MB",
       file_types : "*.jpg;*.gif;*.jpeg;*.bmp;*.png",
       file_post_name: "uploadFile",
       file_types_description : "线下交易凭证图片",
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
		$('#imgid').val(serverData);
		alert("上传成功");
	} catch (ex) {
		this.debug(ex);
	}
}

function checkForm() {
	if ($('#moneyid').val() == '') {
	  alert('请输入金额！！！');
      return false;
	}
	if ($('#imgid').val() == '') {
	  alert('请上传图片！！！');
      return false;
    }
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
     <div class="onuser_tit2">充值</div>
     
     <div class="onuser_box4 clear">
         <ul class="charge_list">
           <li><a href="<c:url value='/redirect?p=mine/recharge1'/>">网银在线充值</a></li>
           <!-- <li><a href="<c:url value='/redirect?p=mine/recharge2'/>">支付宝/财付通 余额充值</a></li> -->
           <li class="red">线下转款汇款</li>
         </ul>
        <div class="bottom_line"></div>

        <div class="tab_list">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <th>银行名称</th>
                  <th>开户人</th>
                  <th>开户账号</th>
                  <th class="none">开户行地址</th>
                </tr>
                <tr>
                  <td>招商银行</td>
                  <td>河南睿人文化传媒有限公司</td>
                  <td>3719 0376 0810 301</td>
                  <td class="none">招商银行郑州市金水区花园路支行</td>
                </tr>
              </table>   
        </div>
        <p class="prompt">* 请于银行柜台或ATM机进行转账汇款操作后，保留凭条或凭证，然后将凭条或凭证拍照、扫描，如下填写，我们将尽快处理。</p>
        
        <form action="<c:url value='/mine/payOffLine'/>" method="post" onsubmit="return checkForm();">
        <input type="hidden" id="imgid" name="imgurl"/>
        <ul class="money_list">
          <li>充值金额：</li>
          <li><!--input id="moneyid" type="text" id="rechargemoney" name="money" value="" /-->
          
          <input id="moneyid" type="text"  name="money" value="" /></li>
          <li>元</li>
        </ul>
        <ul class="slip_list">
          <li>凭条或凭证上传图片：</li>
          <li>
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
          </li>
       </ul>
        
        <div class="tjan"><input type="submit" value= ""/></div>     
        </form>
            
     </div>
     
     

  </div><!--user_right end-->
  
</div>
<!--main style end-->  
<jsp:include page="../foot/footer.jsp"></jsp:include>

</body>
</html>