<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>藏品上传_珍品征集令_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name=keywords content="藏品上传">
	<meta name=description content="卫视文化乐园-华豫之门官方网站，珍品征集藏品上传">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>

    <link rel="stylesheet" type="text/css" href="<c:url value='/css/gotohyzm/goto_hy.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	 <script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.queue.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/fileprogress.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/handlers.js"/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
<style type="text/css">

</style>
<script type="text/javascript">
function myCollections() {
	location.href = "<c:url value='/vote/gotoMyupload'/>";
}

function gotoUpload() {
	location.href = "<c:url value='/vote/gotoupload'/>";
}

var swfupload;
$(function(){
var settings = {
       flash_url : "<%=PropertiesUtil.getPropertiesValue("swfuploadurl")%>",
       upload_url: "<%=PropertiesUtil.getPropertiesValue("uploadVote")%>",
       file_size_limit : "3MB",
       file_types : "*.jpg;*.gif;*.jpeg;*.bmp;*.png",
       file_post_name: "uploadFile",
       file_types_description : "藏品图片",
       file_upload_limit : 5,
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


function getSub(){

	/*var ss='${CurrentSession.level}';
	alert(ss);
   if('${CurrentSession.level}'=='0'){
   alert("对不起，仅星级以上会员才能观摩预约！");
         return false;
   }*/

   var typeid=$('#typeid').val();
  //alert(typeid);
  if ($('#typeid').val() == 0) {
	   alert('请选择藏品类型');
       return false;
	}
  var name=$('#nameid').val();
 if ($.trim($('#nameid').val()).length <= 0) {
	   alert('请输入藏品名称');
       return false;
	}
	var imgurl=$('#imgid').val();
  if ($('#imgid').val().length <= 0) {
	   alert('请上传藏品图片');
       return false;
	}
var memo=document.getElementById("memo").value;
		//alert(memo);
$.ajax({type: "POST",
      dataType: "text",
      url: "<c:url value='/vote/uploadCollectionMsg'/>",
      data: {typeid:typeid,imgurl:imgurl,name:name,memo:memo,type:3},
      success:function(data){
        if(data == "0000"){

        	alert("上传成功");
         	location.href="<c:url value='/vote/myCollectRelease'/>";
        }else{
          alert(data);
         // alert(data);
        }
      }
    });


}


</script>


  </head>

  <body>

	<div class="count_box">

		<!-- top1 -->
	    <div class="content_s" style="width:1140px;">
	    	 <!-- top2 中奖、栏目介绍 -->
	    	<div class="main_box clear">
  				<jsp:include page="common/myMenu.jsp"></jsp:include>

				<div class="user_right fr clear" style="background:#fff;">
				     <div class="onuser_tit2">我要发布</div>
				     <div class="onuser_box4 clear">

				         <!-- <ul class="charge_list">
				         <li class="red" onclick="gotoUpload()" style="cursor: pointer;">我要发布</li>
				            <li onclick="myCollections()" style="cursor: pointer;">查看已上传</li>
				         </ul>
				        <div class="bottom_line"></div> -->

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
				                      <p ><font color="red"> 每件藏品最多上传5张图片，每张不超过3M。</font></p>
				                  </td>
				                </tr>
				              </table>

				              <ul class="textarea_list">
				                 <li>收藏品介绍：(5000字以内)</li>
				                 <li>
				                   <textarea name="memo" id="memo" placeholder="">${col.note}</textarea>
				                 </li>
				              </ul>
				           <div class="tjan" onclick="getSub();">
				             <input type="submit" value="" />
				           </div>

				         </div><!--upload_box end-->


				       </div>

				  </div><!--user_right end-->

				</div>


        </div>
	</div>
  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
