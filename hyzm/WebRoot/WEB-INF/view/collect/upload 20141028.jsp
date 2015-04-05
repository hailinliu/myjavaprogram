<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>拍品上传</title>

  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">

  <link rel="stylesheet" type="text/css" href="<c:url value='/css/collect/upload.css'/>"/>

  <script type="text/javascript" src="<c:url value='/js/collect/collect_upload.js'/>"></script>

  <script type="text/javascript" src="<c:url value='/swfupload/swfupload.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/swfupload/swfupload.queue.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/swfupload/fileprogress.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/swfupload/handlers.js'/>"></script>
  <meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
  <meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
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
       flash_url : "<%=PropertiesUtil.getPropertiesValue("swfuploadurl")%>",
       upload_url: "<%=PropertiesUtil.getPropertiesValue("uploadCollect")%>",
       file_size_limit : "3MB",
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
});

function uploadSuccess(file, serverData) {
  try {
    var progress = new FileProgress(file, this.customSettings.progressTarget);
    progress.setComplete();
    progress.setStatus("上传成功");
    progress.toggleCancel(false);
    //alert(serverData);
    //$('#showimgs').append("<img src='http://116.255.149.172:7080/wswhly/zengjipaipin/"+serverData+"' width='100px'");
    $('#imgid').val($('#imgid').val()+serverData+",");

    alert("上传成功");
  } catch (ex) {
    this.debug(ex);
  }
}


function checkForm() {

//判断会员类型

var userlevel=${userlevel};
var yemoney=${yemoney};
var num=${num};
var shopid='${flagmap.id}';
var tag=false;

  //如果为免费会员
  if(userlevel==0){
    //如果该免费会员为旗舰商家  可以免费上传30件
        if(shopid!=""){
          if(num>30){
            if(yemoney-100<0){
              alert("余额不足请充值");
              return false;
            }
          }

        }else{
          if(yemoney-100<0){
            alert("余额不足请充值");
            return ;
          }
        }
  }
  //如果为星级会员  可以免费上传30件
  if(userlevel==1&&num>30){
     if(yemoney-100<0){
      alert("余额不足请充值");
      return ;
    }
  }
  //如果为贵宾会员  可以免费上传60件
  if(userlevel==2&&num>60){
     if(yemoney-100<0){
      alert("余额不足请充值");
      return ;
    }
  }
  //如果为高级会员  可以免费上传80件
  if(userlevel==1&&num>80){
     if(yemoney-100<0){
      alert("余额不足请充值");
      return ;
    }
  }

var specialID=$('input[name=specialID]:checked').val();
  if (specialID==undefined||specialID<= 0) {
     alert('请选择专场');
       return ;
  }
  if ($('#name').val().length <= 0) {
     alert('请选填写拍品名称');
       return ;
  }

  if ($('#ybprice').val().length <= 0) {
     alert('请选填写预备价格');
       return ;
  }
  if ($('#imgid').val().length <= 0) {
     alert('请上传图片');
       return ;
  }


  if(confirm('请确认信息无误！')){
  tag=true;
  }else{return ;}
  if(userlevel==0&&shopid==""){
    if(confirm('尊敬的免费会员${CurrentSession.username} ，确认上传将扣除100元鉴定费，确认继续上传么？')){
    tag=true;
    }else{return ;}
  }

  if(tag){
    document.myForm.submit();
  }
}
</script>
  </head>

  <body>


<jsp:include page="../banner/banner.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear" style="margin-top:10px;background:#fff;box-shadow:1px 2px 10px #ccc;position:relative;">
    <div class="bread">
        <span>
          当前位置：
        </span>
        <span>
          <a href="<c:url value='/redirect?p=index'/>" target="_blank">首页</a>
        </span>
        <span>></span>
        <span>
          <a href="javascript:void(0)" target="_blank">拍卖征集</a>
        </span>
        <span>></span>
        <span>
          拍品上传
        </span>
    </div>
    <div class="pp_tit">
      <p class="p001">
        拍品上传
      </p>
    </div>
    <form action="<c:url value='/collect/uplylots'/>" method="post"   id="myForm" name="myForm" >
    <div class="xz_zc">
       <p>
         <span>选择专场：</span>
          <c:forEach items="${lyzclist}" var="info" varStatus="cdn">
         <span style="margin-right:30px;">
           <input type="radio"  value="${info.id}" name=specialID id="specialID${cdn.index}" />
           <label for="specialID${cdn.index}">${info.specialname}</label>
         </span>
         </c:forEach>
       </p>
       <script type="text/javascript">

                /*$(document).ready(function(){


                alert('sdsdss');

                // 如果复选框被选中
                //

                });*/
            </script>

    </div>
    <div class="pp_name">
      <span>拍品名称：</span>
      <span class="pp_button">
        <input type="text"   style="height: 27" type="text" name="name" id="name" value="" maxlength="300"/>
      </span>
      <span class="huise" style="margin-left:14px;">
        (不超过20个汉字)
      </span>
    </div>
    <div class="pp_txt">
        <p>
          <span>
            拍品介绍：
          </span>
          <span class="huise">
            （为了最大限度的促进拍卖成交，请尽量完善拍卖介绍信息，本站亦有权对拍品信息做出适当修改）
          </span>
        </p>
        <p style="margin-left:28px;">
          <span>作者：</span>
          <span class="pp_button">
            <input id="autorid" style="height: 27" type="text" name="autor" maxlength="300" value="" placeholder="" />
          </span>
          <span style="margin-left:47px;">年代：</span>
          <span class="pp_button">
           <input id="yearid" style="height: 27" type="text" name="year" value="" maxlength="300"  placeholder="" />
          </span>
        </p>
        <p style="margin-left:28px;">
          <span>尺寸：</span>
          <span class="pp_button">
          <input id="sizeid" style="height: 27" type="text" name="size" maxlength="300" value="" placeholder="" />
          </span>
        </p>
        <p style="margin-left:28px;overflow:hidden;">
          <span style="font-size:14px;display:block;" class="fl">描述：</span>
          <span class="text_box fl">
            <textarea name="suggest" id="suggestid" value="" cols="30" rows="10"></textarea>
          </span>
        </p>
    </div>
    <div class="pp_name" style="height:84px;">
      <p>
        <span>
          预备价格：
        </span>
        <span class="huise">
          （为了最大限度的促进拍卖成交，请慎重考虑，提交您的心理价位。该价格是扣除各项费用之后，您最终得到的金额）
        </span>
      </p>
      <p style="margin:15px 0 15px 74px;">
        <span class="pp_button">
           <input type="text" style="" value="" name="ybprice" id="ybprice" maxlength="300"/>
        </span>(元)
      </p>
    </div>
    <div style="font-size:16px;padding-left:45px;padding-right:45px;color:red;height:80px;line-height:40px;background:#F8F8F8;">
      <p>重要提示：尊敬的各位藏友，由于近期个别藏友上传的拍品图片和规定标准差别很大，对审核工作带来很大不便；请各位藏友尽量严格按照上传须知的规定上传，点击下面查看标准示例！</p>
    </div>
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
            <div class="up_txt1 fl">
                <i class="newred">提示：</i>
                <i>图片大小： 支持 0 ~ 5M 图片上传</i>
                <p style="text-indent: 47px; margin-top:-10px">图片格式： jpg，jpeg，gif，bmp等</p>
            </div>
            <div class="shili_img fr">

            </div>
        </div>
        <div style="clear:both;"></div>

        <!-- <div class="huise pic_require fl" style="">
          （<i style="color:red;">图片拍摄要求？</i>）
        </div> -->
        <!-- <div class="pic_shuoming">
              <p>
                1、图片保持清晰、干净，不模糊。
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
              <p>
                5、<i style="color:red;">
                    出土文物（含高古瓷、青铜器、铜镜、唐三彩等）请提供完善的交易记录凭证或相关拍卖证书。
                </i>
              </p>
            </div> -->
    </div>
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
              <p>
                5、<i style="color:red;">
                    藏品如有交易记录凭证或相关拍卖证书，请务必提供。
                </i>
              </p>
        </div>

        <!-- 示例图 -->
    <div class="shili_tupian">
    <!-- <img src="<c:url value='/images/collect/sl2.jpg'/>" alt="拍品示例图" /> -->
      <img src="<c:url value='/images/collect/sl1.jpg'/>" alt="拍品示例图" />

      <!-- <img src="<c:url value='/images/collect/sl3.jpg'/>" alt="拍品示例图" /> -->
    </div>
 <div style="clear:both;"></div>
 <div class="brbb"></div>
    <input id="imgid" type="hidden" name="image"/>

      <div style="background:#fbffdc;color:#333;margin-left:45px;marign-top:20px;">
        <div id="fsUploadProgress" >
                  </div>
              <div id="divStatus"></div>
               <div class="flash" class="upload_pic_btn" >
            </div>

      </div>



  <button class="go_upload"  onclick="checkForm()"  type="button">确认提交</button>
    </form>


</div>

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
