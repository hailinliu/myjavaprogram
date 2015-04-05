<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>鉴定图片_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  <link rel="stylesheet" type="text/css" href="<c:url value='/css/collect/upload.css'/>"/>

  <script type="text/javascript" src="<c:url value='/js/collect/collect_upload.js'/>"></script>

	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.queue.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/fileprogress.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/handlers.js"/>"></script>
	<meta name=keywords content="拍品上传">
	<meta name=description content="拍品上传">
${message}
<script type="text/javascript">

var msg="${msg}";
if(msg.length>0){
  alert(msg);
  window.location.href="<c:url value='/collect/gotouplylots'/>";
}
if(msg.length<0){
  alert("对不起，上传失败，请重试");
  window.location.href="<c:url value='/collect/gotouplylots'/>";
}
function myCollections() {
  location.href = "<c:url value='/mine/myupload'/>";
}

function gotoUpload() {
  location.href = "<c:url value='/mine/gotoupload'/>";
}

var swfupload;
$(function(){
var settings = {
        flash_url : "http://admin.wswhly.com/swfupload/swfupload.swf",
       upload_url: "http://admin.wswhly.com/collect/uploadCollection",
       file_size_limit : "5MB",
       file_types : "*.jpg;*.gif;*.jpeg;*.bmp;*.png",
       file_post_name: "uploadFile",
       file_types_description : "藏品图片",
       file_upload_limit : 1000,
       custom_settings : {
           progressTarget : "fsUploadProgress",
           cancelButtonId : "btnCancel"
       },
       debug: false,
       // Button Settings
        button_image_url : "<c:url value='/swfimages/upload_bg.jpg'/>",
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
  	setimgpic();
});
function setimgpic(){
	var pics='${item.pic}';
	var picsa= new Array();
	picsa=pics.split(",");

	for(var i=0;i<picsa.length;i++){
		if(picsa[i]!=null&&picsa[i]!=''&&picsa[i]!=' '){
		 $('#fsUploadProgress').append("<div class='img_lookbox'><img src='http://admin.wswhly.com/zengjipaipin/"+picsa[i]+"' width='100' /><div class=\"pro_textsuss\"><div class=\"pro_imgname\">"+picsa[i]+"</div><div class=\"pro_status\">上传成功</div></div><div class=\"pro_imgover\"><div class=\"pro_imgline fl\"></div><b class=\"fl\">100%</b></div><div class=\"pro_delimg\" onclick=\"deleteImg(this,'"+picsa[i]+"')\">删除</div></div>");
		 $('#imgid').val($('#imgid').val()+picsa[i]+",");
         upimg_num();
		}
	}
}

function uploadProgress() {
  $('#img_nums').html("请稍后!图片正在上传中...");
}

function uploadSuccess(file, serverData) {
  try {
    var progress = new FileProgress(file, this.customSettings.progressTarget);
    progress.setComplete();
    progress.setStatus("上传成功");
    progress.toggleCancel(false);
   // alert(serverData);
    $('#fsUploadProgress').append("<div class='img_lookbox'><img src='http://admin.wswhly.com/zengjipaipin/"+serverData+"' width='100' /><div class=\"pro_textsuss\"><div class=\"pro_imgname\">"+file.name+"</div><div class=\"pro_status\">上传成功</div></div><div class=\"pro_imgover\"><div class=\"pro_imgline fl\"></div><b class=\"fl\">100%</b></div><div class=\"pro_delimg\" onclick=\"deleteImg(this,'"+serverData+"')\">删除</div></div>");
    $('#imgid').val($('#imgid').val()+serverData+",");
    upimg_num();

   // alert("上传成功");
  } catch (ex) {
    this.debug(ex);
  }
}

function deleteImg(obj1,name) {
	// $(obj).remove();
  // alert('d');
  $(obj1).closest(".img_lookbox").remove();
   upimg_num();
  // $(".img_lookbox").remove();
	var vals= $('#imgid').val();
	$('#imgid').val(vals.replace(name+",",""));

}
// 获取上传图 总数
function upimg_num() {
  var upimg_num = $('.img_lookbox').length;
  //
  $('#img_nums').html(upimg_num+" 个图片已上传.")
}

var userlevel=${userlevel};

function submit(){
		var typeid=$('input[name=typeid]:checked').val();
		var zjuserid=${item.zjuserid};
		var name=$("#name").val();
		var pic=$("#imgid").val();
		var size=$("#size").val();
		var note=$("#note").val();
		if (typeid==undefined||typeid<=0) {
		     alert('请选择藏品分类！');
		     return ;
		}
		//if (userlevel!=0&&(zjuserid==undefined||zjuserid<=0)) {
		//     alert('请选择鉴定专家！');
		//     return ;
		//}
		//if(userlevel==0){
		//	zjuserid=-1;
		//}

		if(name==''){
			alert('请选填写藏品名称！');
		     return ;
		}
		if(name.length>20){
			 alert('藏品名称不超过20个汉字！');
		     return ;
		}
		if(size==''){
			alert('请选填写尺寸/重量！');
		     return ;
		}
		if(note==''){
			alert('请选填写备注描述！');
		     return ;
		}
		if(note.length>2000){
			 alert('备注描述不超过2000个汉字！');
		     return ;
		}
		//图片 upimg_num
		if($('.img_lookbox').length==0||pic==''){
			alert('请上传图片!');
			return ;
		}
		if($('.img_lookbox').length>5){
			alert('您最多可以上传5张图片！');
			return ;
		}
			$.ajax({
	        type:'post',
	        url:"<c:url value='/onlinepic/onlinepicupdate'/>",
	        data:{
	       		 id:${item.id},
	        	 thcs:${item.thcs}+1,
	             name:name,
	             typeid:typeid,
	             zjuserid:zjuserid,
	             size:size,
	             note:note,
	             pic:pic
	    	},
	        success:function(data){
	          if(data==0){
	          	alert('修改失败，请重试!');
	          }else if(data==1){
	         	 alert('修改成功!');
	         	 window.location.href="<c:url value='/onlinepic/myUpOlinePic'/>";
	          }
	        }
		    });
}
</script>
  </head>
  <body>
<jsp:include page="../banner/banner.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear" style="margin-top:10px;background:#fff;box-shadow:1px 2px 10px #ccc;position:relative;">
    <!-- <div class="bread">
        <span>
          当前位置：
        </span>
        <span>
          <a href="<c:url value='/redirect?p=index'/>" target="_blank">首页</a>
        </span>
        <span></span>
        <span>
          <a href="javascript:void(0)" target="_blank">拍卖征集</a>
        </span>
        <span></span>
        <span>
          拍品上传
        </span>
    </div> -->
    <div class="pp_tit">
      <p class="p001">
        藏品上传
      </p>
    </div>
    <div class="xz_zc">
       <p>
         <span>选择藏品分类：</span>
         <c:forEach items="${typelist}" var="type" varStatus="cdn">
           <span style="margin-right:30px;">
            	 	  <c:choose>
                <c:when test="${item.typeid eq type.id}">
            		<label for="typeid${cdn.count}"> <input type="radio" checked="checked" name="typeid" id="typeid${cdn.count}"  value="${type.id}"/> ${type.name}</label>
            	</c:when>
            	 <c:otherwise>
            	 	<label for="typeid${cdn.count}"> <input type="radio"  name="typeid" id="typeid${cdn.count}"  value="${type.id}"/> ${type.name}</label>
            	 </c:otherwise>
            </c:choose>
            </span>
         </c:forEach>
       </p>
    </div>
    <!--
     <div class="xz_zc">
        <p>
             <span>选择鉴定专家：</span>
             <c:if test="${userlevel!=0}">
	             <c:forEach items="${proflist}" var="prof" varStatus="cdn">
		           <span style="margin-right:30px;">
		            	 	 <c:choose>
		                <c:when test="${item.zjuserid eq prof.userid}">
		            		<label for="zjuserid${cdn.count}"> <input type="radio" checked="checked" name="zjuserid" id="zjuserid${cdn.count}"  value="${prof.userid}"/> ${prof.name}</label>
		            	</c:when>
		            	 <c:otherwise>
		            	 	<label for="zjuserid${cdn.count}"> <input type="radio"  name="zjuserid" id="zjuserid${cdn.count}"  value="${prof.userid}"/> ${prof.name}</label>
		            	 </c:otherwise>
		            </c:choose>
		            </span>
		         </c:forEach>
		     </c:if>
		     <c:if test="${userlevel==0}">
		     	 <c:forEach items="${proflist}" var="prof" varStatus="cdn">${prof.name}&nbsp;&nbsp;&nbsp;</c:forEach> <font color='red'>免费会员不提供选择专家！您可以升级为会员！</font><a href="<c:url value='/mine/gotovip'/>">升级会员</a>
		     </c:if>
           </p>
        </div> -->
    <div class="pp_name">
      <span>藏品名称 ：</span>
      <span class="pp_button">
        <input type="text"   style="height: 27" type="text" name="name" id="name" value="${item.name}" maxlength="300"/>
      </span>
      <span class="huise" style="margin-left:14px;">
        <i class="red">* 必填</i> (不超过20个汉字)
      </span>
    </div>
    <div class="pp_txt">
        <p>
          <span>
            藏品介绍 ：
          </span>
          <span class="huise">
            （请尽量完善藏品介绍信息，）
          </span>
        </p>

        <p style="">
          <span>尺寸/重量：</span>
          <span class="pp_button">
          <input id="size" style="height: 27" type="text" name="size" maxlength="300" value="${item.size}" placeholder="" />
          </span>
          <span class="huise" style="margin-left:14px;">
        <i class="red">* 必填</i>
      </span>

        </p>
        <p style="overflow:hidden;">
          <span style="font-size:14px;display:block;" class="fl">备注描述 ：</span>
          <span class="text_box fl">
            <textarea name="note" id="note"  cols="30" rows="10">${item.note}</textarea>
          </span>
          <span class="huise" style="margin-left:14px;">
        <i class="red">* 必填</i>
      </span>
        </p>
    </div>

    <div style="font-size:16px;padding-left:45px;padding-right:45px;color:red;height:244px;line-height:40px;background:#F8F8F8;margin-top:15px;">
      <p>重要提示：尊敬的各位藏友，由于近期个别藏友上传的拍品图片和规定标准差别很大，对审核工作带来很大不便；请各位藏友严格按照上传须知的规定上传，点击下面查看标准示例！
</p>

      <!-- <p style="text-indent:5em;">
        ●&nbsp;&nbsp;请认真核对您的藏品是否符合本次四个专场。
      </p>
      <p style="text-indent:5em;">
        ●&nbsp;&nbsp;高古玉、高古瓷类及出土文物等拍卖法不允许拍卖藏品请勿上传，以免浪费您的鉴定费用或免费件数额度。
      </p> -->
      <p style="text-indent:5em;" class="pic_sm">●&nbsp;&nbsp;<a href="javascript:void(0)" >查看上传图片规格须知</a>
      </p>
      <div class="xuzhi_tit1">
          <p>上传图片规格须知：</p>
          <p>
                1、图片保持清晰、干净，不模糊；尽量采用黑、灰、白等纯色背景，玉器小件可使用黑色背景，瓷器、青铜器等可采用灰白背景，主题突出、背景干净，不可杂乱。 <i style="color:red;">图片尺寸：宽 800、高 800 像素以上</i>
              </p>
              <p>
                2、请对藏品进行正视、俯视、底部、侧视、局部等各个角度进行拍摄。
              </p>
              <p>
                3、对具有花纹、附件、内壁铭文、款识、装裱、缺损或其他特殊情况的藏品各相应部位进行局部拍摄。
              </p>
              <p>
                4、对于书籍，要拍摄书籍合页时的正视图、局部图（打开书籍拍摄）、底部图（书籍的背面）。
              </p>

        </div>
      <p style="text-indent:5em;">●&nbsp;&nbsp;上传图片之后，请点击页面下方确认提交按钮，才能上传成功！</p>
    </div>
    <script type="text/javascript">
      $(function(){
        $(".pic_sm").hover(function(){
          $(".xuzhi_tit1").toggle();
        });
      })
    </script>
    <div class="up_pics">
        <p class="fl">
          <span>
            上传图片：
          </span>
        </p>
        <div class=" up_box fl" style="">
           <div class="fl" id="upupup1" style="padding-left:20px;padding-top:20px;">
				        <span id="spanButtonPlaceholder"></span>
				        <input id="btnCancel" type="button" value="取消" onclick="swfupload.cancelQueue()" disabled="disabled" style="margin-left: 2px; height: 22px; font-size: 8pt;display:none;" />
				    </div>
            <div class="up_txt1 fl" style="padding-top:0;">
                <i class="newred">提示：</i>
                <i>图片大小： 支持 0 ~ 5M 图片上传</i>
                <p style="text-indent: 47px; margin-top:-15px;">图片格式： jpg，jpeg，gif，bmp等</p>
                <p style="text-indent: 47px; margin-top:-14px;color:#666;">
                  每次可以上传多张图片，使用ctrl键同时选择多张一并上传。
                </p>
            </div>
            <div class="shili_img fr">

            </div>
        </div>
        <div style="clear:both;"></div>
    </div>


        <!-- 示例图 -->
    <div class="shili_tupian">
      <img src="<c:url value='/images/collect/sl1.jpg'/>" alt="拍品示例图" />
    </div>
     <div style="clear:both;"></div>
     <div class="brbb"></div>

    <input id="imgid" type="text" name="imgid" style="display:none;" />
    <!-- 上传图片信息展示块 -->
	    <div class="upimgbox">
	    	<div id="fsUploadProgress" ></div>
        <!-- <div id="divStatus"></div> -->
        <div id="img_nums"></div>
        <div class="flash" class="upload_pic_btn" ></div>
	    </div>

      <button class="go_upload"  onclick="submit()"  type="button">确认提交</button>


  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>