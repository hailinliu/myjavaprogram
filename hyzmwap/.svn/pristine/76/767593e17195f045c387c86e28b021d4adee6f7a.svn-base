<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>申请开店</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<style type="text/css">
body {
	padding: 0;
	margin: 0;
	background: #fff;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	color: #444340;
}
img {
	border: none;
}
a {
	color: #444340;
}
#Header {
	background: #000;
	height: 42px;
	border-bottom: 1px solid #3c3c3c;
	text-align: center;
}
#Header .leftdiv {
	float: left;
	padding: 10px 10px;
}
#Header .centerdiv {
	display: inline;
}
#MainContent {
	background: #ffffff;
	padding-bottom: 30px;
}
#Footer {
	padding: 10px;
	border-top: none;
}
.upLoad {
	display: none
}
.upLoad, .statusTips {
	width: 90%;
	overflow: hidden;
	margin: 0 auto;
	text-align: center;
}
.statusTips a, .upLoad a {
	display: block;
	margin: 30px auto 0 auto;
}
.upLoad p {
	text-align: left
}
.upLoad em {
	margin-right: 24px
}
.tips {
	font-size: 0.8em;
	color: #F96;
	line-height: 1
}
</style>
<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.6.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/simple-inheritance.min.js'/>"></script>
<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
<!-- NOTE: including the jQuery engine version -->
<script type="text/javascript" src="<c:url value='/jquery/code-photoswipe-jQuery-1.0.11.min.js'/>"></script>
<script src="<c:url value='/js/ajaxfileupload.js'/>"></script>
<script>
$(function(){
	//点击【点击申请】后，显示隐藏的DIV
	$("#applyClick").click(function(){
		$(".statusTips").hide();
		$(".upLoad").show();
		});
})
function inputFileChange(){
	var newfilename=<%=request.getSession().hashCode()%>+""+new Date().getTime();
	var fi=$("#uploadFile").val();
	var agofilename=fi.substring(fi.lastIndexOf('.') );
	var mydate = new Date();
	var month=mydate.getMonth()+1;
			var day=mydate.getDate();
			if(month<10){
				month="0"+(mydate.getMonth()+1);
			}
			if(day<10){
				day="0"+mydate.getDate();
			}
			var yyyyMMdd=mydate.getFullYear()+""+month+""+day+"/";
	$('#upimgstate').html("正在上传图片...");
   				$.ajaxFileUpload({
	                url:"http://116.255.149.172:7080/wswhly/baibao/uploadBaibaourl/?newfilename="+newfilename,//用于文件上传的服务器端请求地址
	                secureuri:false,//一般设置为false
	                fileElementId:'uploadFile',//文件上传空间的id属性  <input type="file" id="file" name="file" />
	                dataType: 'text',//返回值类型 一般设置为json
	                contentType: "multipart/form-data",
	                success: function (data)  //服务器成功响应处理函数
	                {
	                   $('#imglist').append("<img  class='img_lookbox'src='http://116.255.149.172:7080/wswhly/Baibaourl//"+yyyyMMdd+newfilename+agofilename+"' width=80 height=80 onclick=\"deleteImg(this,'"+yyyyMMdd+newfilename+agofilename+"')\"  />");
	                   $('#imgid').val($('#imgid').val()+yyyyMMdd+newfilename+agofilename+",");
	                   $('#upimgstate').html("图片上传成功！");
	                } ,
		            error: function (msg) {
		             $('#upimgstate').html("图片上传失败！请重试！");
		            }
			  	})
   			}
 function deleteImg(obj1,name) {
			  $(obj1).closest(".img_lookbox").remove();
				var vals= $('#imgid').val();
				$('#imgid').val(vals.replace(name+",",""));
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
                location.href='<c:url value='/redirect?p=baibaoxiang/bbx_apply'/>';
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
</head>

<body  class="ui-mobile-viewport ui-overlay-a">
<!--
本页面从1.我要开店 或者 2. 店铺管理 点击进入。
如果是 1.我要开店，则显示<div class="statusTips">
		一共有4种状态。
       如果是第一种状态，点击“点击申请”，<div class="statusTips">隐藏，<div class="upLoad">显示；
       如果是 第四种状态，点击 “店铺管理” 跳转到 店铺管理页面
-->
<div data-role="page" class="ui-page ui-page-theme-a ui-page-active" style="display:block">
  <div data-role="header" role="banner" class="ui-header ui-bar-inherit">
    <h1 class="ui-title" role="heading" aria-level="1">申请开店</h1>
  </div>
  <div data-role="content" class="ui-content" role="main">
    <div class="statusTips">
      <c:if test="${CurrentSession.baibaoshopstate==null}">
        <p>对不起，您当前并未申请“百宝箱商家”资格。</p>
        <a href="javascript:;" id="applyClick" class="ui-bar ui-bar-a btn btn-positive btn-block ui-btn ui-shadow ui-corner-all ">点击申请</a> </c:if>
      <c:if test="${CurrentSession.baibaoshopstate==0}"> 您已申请 [百宝箱] 商家资格，3个工作日内乐园客服会进行审核，请耐心等待审核结果。 </c:if>
      <c:if test="${CurrentSession.baibaoshopstate==1}"> 您的审核未通过! </c:if>
      <c:if test="${CurrentSession.baibaoshopstate==2}">
        <p>您已经通过 [百宝箱] 商家资格审核，赶快开通店铺吧！</p>
        <a href="<c:url value='/BaiBaoMine_getShop'/>" class="shezhishop ui-bar ui-bar-a btn btn-positive btn-block ui-btn ui-shadow ui-corner-all ">店铺管理</a> </c:if>
    </div>
    <div class="upLoad">
      <p>
        <label for="username">用户名：</label>
      </p>
     <!-- <p class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
        <input type="text" placeholder="长度3-16位，支持中文" name="username" id="username" maxlength="16"  value="${CurrentSession.username}">
      </p>-->
      <p> <span>${CurrentSession.username}</span> </p>
      <p>
        <label for="realname">真实姓名：</label>
      </p>
     <!-- <p class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
        <input type="text" placeholder="请输入您的真实姓名" name="realname" id="realname" maxlength="16"  value="${CurrentSession.realname}">
      </p>-->
      <p> <span>${CurrentSession.realname}</span> </p>
      <p>
        <label for="email">邮箱：</label>
      </p>
     <!-- <p class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
        <input type="text" placeholder="请输入您的邮箱" name="email" id="email" maxlength="20"  value="${CurrentSession.email}">
      </p>-->
      <p> <span>${CurrentSession.email}</span> </p>
      <p>
        <label>注册时间：</label>
      </p>
      <p> <span>${CurrentSession.createdate}</span> </p>
      <p>
        <label for="mobile">手机号：</label>
      </p>
      <!--<p class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
        <input type="text" placeholder="请输入您的手机号" name="mobile" id="mobile" maxlength="11"  value="${CurrentSession.mobile}">
      </p>-->
      <p> <span>${CurrentSession.mobile}</span> </p>
      <p>
        <label for="idcard">身份证号码：</label>
      </p>
     <!-- <p class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
        <input type="text" placeholder="请输入您的身份证号码" name="idcard" id="idcard" maxlength="18"  value="${CurrentSession.idcard}">
      </p>-->
      <p> <span>${CurrentSession.idcard}</span> </p>
      <p>
        <label for="address">详细地址：</label>
      </p>
      <!--<p>
        <textarea placeholder="请输入您的详细地址" name="address" id="address"   class="ui-bar btn-positive   ui-shadow ui-corner-all" style="width:85%; text-align:left; "  rows="3" >${CurrentSession.address}</textarea>
      </p>-->
      <p> <span>${CurrentSession.address}</span> </p>
      <p>
        <label for="uploadFile">身份照片</label>
      </p>
      <p class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
        <input type="file" name="uploadFile" id="uploadFile" onchange="inputFileChange()" />
        <input type="hidden" id="imgid" name="imgid" />
      <div id="imglist"></div>
      <div id="upimgstate"></div>
      </p>
      <div class="tips">
        <p><strong>提示：</strong> </p>
        <p>上传成功之后在列表中显示！</p>
        <p>点击图片可以删除！</p>
        <p>图片大小： 支持 0 ~ 5M 图片上传</p>
        <p>图片格式： jpg，jpeg，gif，bmp等</p>
        <p>重要：请分别上传 身份证 正、反面清晰照片。</p>
        <a href="javascript:checkForm();" class="ui-bar ui-bar-a btn btn-positive btn-block ui-btn ui-shadow ui-corner-all ">确认申请</a> </div>
    </div>
  </div>
</div>
</body>
</html>
