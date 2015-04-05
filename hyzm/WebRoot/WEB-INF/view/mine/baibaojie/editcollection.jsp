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
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/uploadpic.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/swfupload/swfupload.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/swfupload/swfupload.queue.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/swfupload/fileprogress.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/swfupload/handlers.js'/>"></script>
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
.pro_delimg{
  right: 4px;
}
</style>
<script type="text/javascript">
function myCollections() {
	location.href = "<c:url value='/BaiBaoMine_getShopList'/>";
}

function gotoUpload() {
	location.href = "<c:url value='/gotoBaiBaoMine_UpdateCollection'/>";
}

var swfupload;
$(function(){
var settings = {
       flash_url : "<%=PropertiesUtil.getPropertiesValue("swfuploadurl")%>",
       upload_url: "<%=PropertiesUtil.getPropertiesValue("uploadBaibaourl")%>",
       file_size_limit : "5MB",
       file_types : "*.jpg;*.gif;*.jpeg;*.bmp;*.png",
       file_post_name: "uploadFile",
       file_types_description : "藏品图片",
       file_upload_limit : 100,
       custom_settings : {
           progressTarget : "fsUploadProgress",
           cancelButtonId : "btnCancel"
       },
       debug: false,
       // Button Settings
       button_image_url : "<c:url value='/swfimages/upload_bg0.jpg'/>",
       button_placeholder_id : "spanButtonPlaceholder",
       button_width: 158,
       button_height: 50,
       button_text: '',
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
		 $('#fsUploadProgress').append("<div class='img_lookbox'><img src='http://116.255.149.172:7080/wswhly/Baibaourl//"+serverData+"' width='100' /><div class=\"pro_textsuss\"><div class=\"pro_imgname\">"+file.name+"</div><div class=\"pro_status\">上传成功</div></div><div class=\"pro_imgover\"><div class=\"pro_imgline fl\"></div><b class=\"fl\">100%</b></div><div class=\"pro_delimg\" onclick=\"deleteImg(this,'"+serverData+"')\">删除</div></div>");
		$('#imgid').val($('#imgid').val()+serverData+",");
     upimg_num();
		// alert("上传成功");
	} catch (ex) {
		this.debug(ex);
	}
}

function deleteImg(obj1,name) {
			  $(obj1).closest(".img_lookbox").remove();
			   upimg_num();
				var vals= $('#imgid').val();
				$('#imgid').val(vals.replace(name+",",""));

			}
			// 获取上传图 总数
			function upimg_num() {
			  var upimg_num = $('.img_lookbox').length;
			  $('#img_nums').html(upimg_num+" 个图片已上传.")
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
	if ($('#priceid').val().length <= 0) {
	   alert('请填写价格');
       return false;
	}else{
		var reg = new RegExp('^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$');
	    if(!reg.test($('#priceid').val())){
	        alert("价格只能为数字!");
	         return false;
	    }
	}
	if ($('#imgid').val().length <= 0) {
	   alert('请上传藏品图片');
       return false;
	}
	if ($('#nameid').val().length>20) {
	   alert('藏品名称最多为20个字！');
       return false;
	}
	if ($('#advertisementid').val().length>18) {
	   alert('广告语最多为18个字！');
       return false;
	}
	return true;
}
</script>
  </head>

  <body>
<jsp:include page="../../head/header.jsp"></jsp:include>

    <!--main style ben-->
<div class="main_box clear">

  <jsp:include page="../common/myMenu.jsp"></jsp:include>

<div class="user_right fr clear">
     <div class="onuser_tit2">百宝箱-我的上传</div>
     <div class="onuser_box4 clear">
<%--     <p class="tiile_wz">您已上传了<span class="red">${count}</span>件收藏品信息</p>--%>
         <ul class="charge_list">
         <li class="red" onclick="gotoUpload()" style="cursor: pointer;">我要上传</li>
           <li onclick="myCollections()" style="cursor: pointer;">查看已上传</li>

         </ul>
        <div class="bottom_line"></div>

         <form action="<c:url value='/BaiBaoMine_AddCollection'/>" method="post" onsubmit="return checkForm()">
         <input type="hidden" name="id" value="${baibao.id}"/>
         <input id="imgid" type="hidden" name="imgurl" value="${baibao.imgurl}"/>
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
                                 <option <c:if test="${baibao.type eq type.id}">selected="selected"</c:if> value="${type.id}">${type.name}</option>
                               </c:forEach>
                             </select>
                          </li>
                          <li>*一次仅限上传一件（套、对）藏品。</li>
                      </ul>
                  </td>
                </tr>
                <tr>
                  <td class="mc">藏品名称：</td>
                  <td>
                     <ul class="text_list">
                       <li><input id="nameid" style="" type="text" name="name" maxlength="300" value="${baibao.name}" placeholder="" /></li>
                       <li>*1-20个汉字</li>
                     </ul>
                  </td>
                </tr>

                <tr>
                  <td class="mc">价格：</td>
                  <td>
                     <ul class="text_list">
                       <li><input id="priceid" style="width:100px;" type="text" name="price" maxlength="300" value="${baibao.price}" placeholder="" /></li>
                       <li>*价格</li>
                     </ul>
                  </td>
                </tr>

                <tr>
                  <td class="mc">交易中转：</td>
                  <td>
                      <ul class="radio_list">
                          <li><input type="radio" checked="checked" name="isagree" <c:if test="${baibao.isagree ==1}">checked="checked"</c:if> value="1"/>同意</li>
                          <li><input type="radio" name="isagree" <c:if test="${baibao.isagree==2}">checked="checked"</c:if> value="2"/>不同意</li>

                      </ul>
                  </td>
                </tr>
                <tr>
                  <td class="mc">广告语：</td>
                  <td>
                     <ul class="text_list">
                       <li><input id="advertisementid" style="" type="text" name="advertisement" maxlength="300" value="${baibao.advertisement}" placeholder="" /></li>
                       <li>*1-18个汉字</li>
                     </ul>
                  </td>
                </tr>
                <tr>
                  <td class="mc2" style="padding-top: 15px;">上传图片：</td>
                  <td class="slip">
					         <!-- 上传 -->
                    <div class="mycode_pic">
                      <div class="up_pics" style="padding-left:0;width:790px;">
                        <div class=" up_box" style="width: 782px;">
                           <div class="fl" id="upupup1" style="padding-left:20px;padding-top:20px;">
                                <span id="spanButtonPlaceholder"></span>
                                <input id="btnCancel" type="button" value="取消" onclick="swfupload.cancelQueue()" disabled="disabled" style="margin-left: 2px; height: 22px; font-size: 8pt;display:none;" />
                            </div>
                            <div class="up_txt1 fl" style="padding-top:0;">
                                <i class="newred">提示：</i>
                                <i>图片大小： 支持 0 ~ 5M 图片上传</i>
                                <p style="text-indent: 47px; margin-top:-15px;">图片格式： jpg，jpeg，gif，bmp等</p>
                                <p style="text-indent: 47px; margin-top:-14px;color:#666;">
                      重要：为了更好的展示，建议图片尺寸比例为：1:1。
                    </p>
                            </div>
                            <!-- <div class="shili_img fr">

                            </div> -->
                        </div>
                        <div style="clear:both;"></div>
                    </div>

                    <!-- 上传图片信息展示块 -->
                      <div class="upimgbox" style="width:747px;margin-left:0;">
                        <div id="fsUploadProgress" ></div>
                        <!-- <div id="divStatus"></div> -->
                        <div id="img_nums"></div>
                        <div class="flash" class="upload_pic_btn" ></div>
                      </div>
                    </div>
                  </td>
                </tr>
              </table>
              <div style="font-size:14px;padding:0 40px 0 45px;border-bottom:1px dotted #ccc;">
                  <p class="newred" style="line-height:40px;">
                  提示：
                  高古玉、高古瓷类及出土文物等拍卖法不允许拍卖藏品请勿上传。藏品图片，不得上传带有敏感信息的图片，如：含有违反法律法规的内容等。否则，卖家承担一切责任。 
                  </p>
               </div>
              <ul class="textarea_list">
                 <li>收藏品介绍：(5000字以内)</li>
                 <li>
                   <textarea name="note" placeholder="" style="max-width:794px;">${baibao.note}</textarea>
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

<jsp:include page="../../foot/footer.jsp"></jsp:include>
  </body>
</html>
