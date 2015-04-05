<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.hyzm.util.PropertiesUtil"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:include page="../../head/header.jsp"></jsp:include>
  <head>
    <title>申请商家_百宝箱_卫视文化乐园-华豫之门官方网站</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/bbmycenter.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/uploadpic.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/userCenter.js'/>"></script>

	<script type="text/javascript" src="<c:url value='/swfupload/swfupload.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/swfupload/swfupload.queue.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/swfupload/fileprogress.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/swfupload/handlers.js'/>"></script>
	<meta name=keywords content="申请商家_百宝箱">
	<meta name=description content="卫视文化乐园-华豫之门官方网站，，百宝箱，申请商家">
	<script type="text/javascript">
var swfupload;
$(function(){
var settings = {
       flash_url : "<%=PropertiesUtil.getPropertiesValue("swfuploadurl")%>",
       upload_url: "<%=PropertiesUtil.getPropertiesValue("uploadBaibaourl")%>",
       file_size_limit : "5MB",
       file_types : "*.jpg;*.gif;*.jpeg;*.bmp;*.png",
       file_post_name: "uploadFile",
       file_types_description : "身份证图片",
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
	//  上传插件

			function uploadSuccess(file, serverData) {
			  try {
			    var progress = new FileProgress(file, this.customSettings.progressTarget);
			    progress.setComplete();
			    progress.setStatus("上传成功");
			    progress.toggleCancel(false);
			   // alert(serverData);
			    $('#fsUploadProgress').append("<div class='img_lookbox'><img src='http://116.255.149.172:7080/wswhly/Baibaourl//"+serverData+"' width='100' /><div class=\"pro_textsuss\"><div class=\"pro_imgname\">"+file.name+"</div><div class=\"pro_status\">上传成功</div></div><div class=\"pro_imgover\"><div class=\"pro_imgline fl\"></div><b class=\"fl\">100%</b></div><div class=\"pro_delimg\" onclick=\"deleteImg(this,'"+serverData+"')\">删除</div></div>");
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
			  // alert(upimg_num);
			}


	function checkForm(){
		if("${CurrentSession.username}"!=''&&"${CurrentSession.realname}"!=''&&"${CurrentSession.email}"!=''&&"${CurrentSession.idcard}"!=''&&"${CurrentSession.address}"!=''){
      var upimg_num = $('.img_lookbox').length;
			if(upimg_num>=1){
			$.ajax({
		         type:'post',
		         url:'<c:url value='/user/ModifyBaibao'/>?idcardimg='+$('#imgid').val(),
		         success:function(data){
		         if(data=='0000'){
		          	alert("恭喜您，申请提交成功！");
                location.href='<c:url value='/BaiBaoMine_getShop'/>';
		         }else{
		         	alert("申请失败！");
		         }
		        }
		     });
		    }else{
		    	alert("请上传身份证正式照！");
		    }
		}else{
			alert("您的个人信息不完整，请到个人信息中完善！");
		}
	}
  	</script>
    <style type="text/css">
      .shezhishop{
        width: 120px;
        height: 28px;
        background: #FF7C00;
        color: #fff;
        display: block;
        line-height: 28px;
        margin-top: 15px;
        border-radius: 4px;
        margin-left: 20px;
      }
      .shezhishop:link,.shezhishop:visited{
        color: :#fff;
      }
      .shezhishop:hover{
        text-decoration: none;
        color: #fff;
      }
    </style>

</head>

<body>


<!--main style ben-->
<div class="main_box clear">

  <jsp:include page="../common/myMenu.jsp"></jsp:include>

  <div class="user_right fr clear">
    <div class="onuser_tit2">申请商家<span class="fr online_user"></span></div>
    <div class="myr_box2 forshops_box2 clear">
    <c:if test="${CurrentSession.baibaoshopstate==null}">
		<div class="forshop_stat" id="shops_stat1">
			对不起，您当前并未申请“百宝箱商家”资格。
<%--			<a href="javascript:void(0)" class="forshop_cbtn" onclick="location.href='<c:url value='/redirect?p=mine/baibaojie/editshops'/>'">点击申请</a>--%>
		</div>
	</c:if>
	<c:if test="${CurrentSession.baibaoshopstate==0}">
		<div class="forshop_stat shops_stat2" id="shops_stat2">
			您已申请 [百宝箱] 商家资格，3个工作日内乐园客服会进行审核，请耐心等待审核结果。
		</div>
	</c:if>
	<c:if test="${CurrentSession.baibaoshopstate==1}">
		<div class="forshop_stat shops_stat2" id="shops_stat2">
			您的审核未通过!
		</div>
	</c:if>
	<c:if test="${CurrentSession.baibaoshopstate==2}">
		<div class="forshop_stat shops_stat3" id="shops_stat3" >
			<p class="fl" style="margin-left:165px;">您已经通过 [百宝箱] 商家资格审核，赶快开通店铺吧！</p>
      <p class="fl "><a href="<c:url value='/BaiBaoMine_getShop'/>" class="shezhishop">店铺管理</a></p>
		</div>
	</c:if>

   	</div>
   	<c:if test="${CurrentSession.baibaoshopstate==null||CurrentSession.baibaoshopstate==1}">
   	<!-- 个人商家信息 -->
    <div class="onuser_tit2 mr_t10">
      您的个人信息：
      <span class="fr online_user">
        <a style="color:#fff;" href="<c:url value='/user/UserCenter'/>
        ">点此-修改个人信息
      </a>
    </span>
   	</div>
   	<div class="myshop_1info">
   		<div class="onuser_cont">
   			<img src="<c:url value='/images/touxiang.jpg'/>
   			" alt=""/>
   			<div class="user_lis_right">
   				<div>
   					<ul class="onuser_list fl clear">
   						<li>
   							<span class="red">用户名：</span>
   							${CurrentSession.username}
   						</li>
   						<li>
   							<span class="red">真实姓名：</span>
   							<span class="revise forget3_1">
   							</span>
   							<span id="realname">${CurrentSession.realname}</span>
   						</li>
   						<li>
   							<span class="red">邮箱：</span>
   							<span class="revise forget1_1">
   							</span>
   							<span id="email">${CurrentSession.email}</span>
   						</li>

   					</ul>
   					<ul class="onuser_list fl clear">
   						<li>
   							<span class="red">注册时间：</span>
   							${CurrentSession.createdate}
   						</li>

   						<li class="none">
   							<span class="red">手机号：</span>
   							<span class="revise forget2">
   							</span>
   							<span id="mobile">${CurrentSession.mobile}</span>
   						</li>
   						<li>
   							<span class="red">身份证号码：</span>
   							<span class="revise forget4_1">
   							</span>
   							<span id="idcard">${CurrentSession.idcard}</span>

   						</li>

   					</ul>
   				</div>
   				<div class="onuser_list fl clear onuser_list_bottom">
   					<ul>
   						<li>
   							<span class="red">家庭住址：</span>
   							<span class="revise forget6_1">
   							</span>
   							<span id="address">${CurrentSession.address}</span>
   						</li>
   					</ul>
   				</div>
   			</div>
   		</div>
   	</div>

   	<!-- 上传身份证 -->
   	<div class="mycode_pic">
   	<input id="imgid" type="text" name="imgid" style="display:none;" value="${CurrentSession.idcardimg}" />

      <div class="up_pics" style="padding-left:0;">
        <p class="fl">
          <span>
            上传图片：
          </span>
        </p>
        <div class=" up_box fl" style="width: 815px;">
           <div class="fl" id="upupup1" style="padding-left:20px;padding-top:20px;">
                <span id="spanButtonPlaceholder"></span>
                <input id="btnCancel" type="button" value="取消" onclick="swfupload.cancelQueue()" disabled="disabled" style="margin-left: 2px; height: 22px; font-size: 8pt;display:none;" />
            </div>
            <div class="up_txt1 fl" style="padding-top:0;">
                <i class="newred">提示：</i>
                <i>图片大小： 支持 0 ~ 5M 图片上传</i>
                <p style="text-indent: 47px; margin-top:-15px;">图片格式： jpg，jpeg，gif，bmp等</p>
                <p style="text-indent: 47px; margin-top:-14px;color:#666;">
                  重要：请分别上传 身份证 正、反面清晰照片。
                </p>
            </div>
            <!-- <div class="shili_img fr">

            </div> -->
        </div>
        <div style="clear:both;"></div>
    </div>

    <!-- 上传图片信息展示块 -->
      <div class="upimgbox">
        <div id="fsUploadProgress" ></div>
        <!-- <div id="divStatus"></div> -->
        <div id="img_nums"></div>
        <div class="flash" class="upload_pic_btn" ></div>
      </div>

   	<button class="go_upload"  onclick="checkForm()"  type="button">确认申请</button>



   	</div>

  </div><!--user_right end-->

</div>
<!--main style end-->

</c:if>
</body>
</html>