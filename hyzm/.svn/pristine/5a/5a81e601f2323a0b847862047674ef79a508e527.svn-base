<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>旗舰商家申请表</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/sjsqb.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.queue.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/fileprogress.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/handlers.js"/>"></script>
	<!--本页面最重要的js代码-->
    <script type="text/javascript" src="<c:url value="/js/fileManager.js"/>"></script>

	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
	<script type="text/javascript">
	var swfupload, swfupload1, swfupload2, swfupload3, swfupload4, swfupload5, swfupload6, swfupload7,swfupload8;
	$(function(){
	var my_element=$(".login");
      if(my_element.length>0){
         alert("报名需先登录，请登录。若未在本站注册，请先注册。");
         return false;
       }
                    swfupload = new SWFUpload(settings);
                    swfupload1 = new SWFUpload(setting1);
                    swfupload2 = new SWFUpload(setting2);
			$("#gth").change(function(){
			  //var gth = $("#gth").attr(checked);
					$(".gth_box").show();
					$(".gs_box").hide();

			})
			$("#gs").change(function(){
				//var gth = $("#gth").attr(checked);
				$(".gth_box").hide();
					$(".gs_box").show();
					swfupload3 = new SWFUpload(setting3);
                    swfupload4 = new SWFUpload(setting4);
                    swfupload5 = new SWFUpload(setting5);
                    swfupload6 = new SWFUpload(setting6);
                    swfupload7 = new SWFUpload(setting7);
                    swfupload8 = new SWFUpload(setting8);
			})


		})

var settings = {
	       flash_url : "<%=PropertiesUtil.getPropertiesValue("swfuploadurl")%>",
	       upload_url: "<%=PropertiesUtil.getPropertiesValue("uploadFlagshop")%>",
	       file_size_limit : "3MB",
	       file_types : "*.jpg;*.gif;*.jpeg;*.bmp;*.png;",
	       file_post_name: "uploadFile",
	      // file_types_description : "藏品图片",
	       file_upload_limit : 1,
	       custom_settings : {
	           progressTarget : "fsUploadProgress",
	           cancelButtonId : "btnCancel"
	       },
	       debug: false,
	       button_image_url : "<c:url value='/swfimages/TestImageNoText_65x29.png'/>",
	       button_placeholder_id : "spanButtonPlaceholder",
	       button_width: 61,
	       button_height: 22,
	       button_text: '选择文件',
	       button_text_style: ".spanButtonPlaceholder { font-size: 12; }",
	       file_queued_handler : fileQueued,
	       file_queue_error_handler : fileQueueError,
	       file_dialog_complete_handler : fileDialogComplete,
	       upload_start_handler : uploadStart,
	       upload_progress_handler : uploadProgress,
	       upload_error_handler : uploadError,
	       upload_success_handler : uploadSuccess,
	       upload_complete_handler : uploadComplete,
	       //queue_complete_handler : queueComplete,  // Queue plugin event
	       prevent_swf_caching : false,
	       preserve_relative_urls : false
	};
var setting1 = {
	       flash_url : "<%=PropertiesUtil.getPropertiesValue("swfuploadurl")%>",
	       upload_url: "<%=PropertiesUtil.getPropertiesValue("uploadFlagshop")%>",
	       file_size_limit : "3MB",
	       file_types : "*.jpg;*.gif;*.jpeg;*.bmp;*.png",
	       file_post_name: "uploadFile",
	     //  file_types_description : "藏品图片",
	       file_upload_limit : 1,
	       custom_settings : {
	           progressTarget : "fsUploadProgress1",
	           cancelButtonId : "btnCancel"
	       },
	       debug: false,
	       // Button Settings
	       button_image_url : "<c:url value='/swfimages/TestImageNoText_65x29.png'/>",
	       button_placeholder_id : "spanButtonPlaceholder1",
	       button_width: 61,
	       button_height: 22,
	       button_text: '选择文件',
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

var setting2 = {
	       flash_url : "<%=PropertiesUtil.getPropertiesValue("swfuploadurl")%>",
	       upload_url: "<%=PropertiesUtil.getPropertiesValue("uploadFlagshop")%>",
	       file_size_limit : "3MB",
	       file_types : "*.jpg;*.gif;*.jpeg;*.bmp;*.png;*.zip",
	       file_post_name: "uploadFile",
	       file_upload_limit : 1,
	       custom_settings : {
	           progressTarget : "fsUploadProgress2",
	           cancelButtonId : "btnCancel"
	       },
	       debug: false,
	       // Button Settings
	       button_image_url : "<c:url value='/swfimages/TestImageNoText_65x29.png'/>",
	       button_placeholder_id : "spanButtonPlaceholder2",
	       button_width: 61,
	       button_height: 22,
	       button_text: '选择文件',
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

var setting3 = {
	       flash_url : "<%=PropertiesUtil.getPropertiesValue("swfuploadurl")%>",
	       upload_url: "<%=PropertiesUtil.getPropertiesValue("uploadFlagshop")%>",
	       file_size_limit : "3MB",
	       file_types : "*.jpg;*.gif;*.jpeg;*.bmp;*.png",
	       file_post_name: "uploadFile",
	       //file_types_description : "藏品图片",
	       file_upload_limit : 3,
	       custom_settings : {
	           progressTarget : "fsUploadProgress3",
	           cancelButtonId : "btnCancel"
	       },
	       debug: false,
	       // Button Settings
	       button_image_url : "<c:url value='/swfimages/TestImageNoText_65x29.png'/>",
	       button_placeholder_id : "spanButtonPlaceholder3",
	       button_width: 61,
	       button_height: 22,
	       button_text: '选择文件',
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
var setting4 = {
	       flash_url : "<%=PropertiesUtil.getPropertiesValue("swfuploadurl")%>",
	       upload_url: "<%=PropertiesUtil.getPropertiesValue("uploadFlagshop")%>",
	       file_size_limit : "3MB",
	       file_types : "*.jpg;*.gif;*.jpeg;*.bmp;*.png",
	       file_post_name: "uploadFile",
	       //file_types_description : "藏品图片",
	       file_upload_limit : 1,
	       custom_settings : {
	           progressTarget : "fsUploadProgress4",
	           cancelButtonId : "btnCancel"
	       },
	       debug: false,
	       // Button Settings
	       button_image_url : "<c:url value='/swfimages/TestImageNoText_65x29.png'/>",
	       button_placeholder_id : "spanButtonPlaceholder4",
	       button_width: 61,
	       button_height: 22,
	       button_text: '选择文件',
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
	var setting5 = {
	       flash_url : "<%=PropertiesUtil.getPropertiesValue("swfuploadurl")%>",
	       upload_url: "<%=PropertiesUtil.getPropertiesValue("uploadFlagshop")%>",
	       file_size_limit : "3MB",
	       file_types : "*.jpg;*.gif;*.jpeg;*.bmp;*.png",
	       file_post_name: "uploadFile",
	       //file_types_description : "藏品图片",
	       file_upload_limit : 1,
	       custom_settings : {
	           progressTarget : "fsUploadProgress5",
	           cancelButtonId : "btnCancel"
	       },
	       debug: false,
	       // Button Settings
	       button_image_url : "<c:url value='/swfimages/TestImageNoText_65x29.png'/>",
	       button_placeholder_id : "spanButtonPlaceholder5",
	       button_width: 61,
	       button_height: 22,
	       button_text: '选择文件',
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
	var setting6 = {
	       flash_url : "<%=PropertiesUtil.getPropertiesValue("swfuploadurl")%>",
	       upload_url: "<%=PropertiesUtil.getPropertiesValue("uploadFlagshop")%>",
	       file_size_limit : "3MB",
	       file_types : "*.jpg;*.gif;*.jpeg;*.bmp;*.png",
	       file_post_name: "uploadFile",
	      // file_types_description : "藏品图片",
	       file_upload_limit : 1,
	       custom_settings : {
	           progressTarget : "fsUploadProgress6",
	           cancelButtonId : "btnCancel"
	       },
	       debug: false,
	       // Button Settings
	       button_image_url : "<c:url value='/swfimages/TestImageNoText_65x29.png'/>",
	       button_placeholder_id : "spanButtonPlaceholder6",
	       button_width: 61,
	       button_height: 22,
	       button_text: '选择文件',
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
	var setting7 = {
	       flash_url : "<%=PropertiesUtil.getPropertiesValue("swfuploadurl")%>",
	       upload_url: "<%=PropertiesUtil.getPropertiesValue("uploadFlagshop")%>",
	       file_size_limit : "3MB",
	       file_types : "*.jpg;*.gif;*.jpeg;*.bmp;*.png;*.zip",
	       file_post_name: "uploadFile",
	      // file_types_description : "藏品图片",
	       file_upload_limit : 1,
	       custom_settings : {
	           progressTarget : "fsUploadProgress7",
	           cancelButtonId : "btnCancel"
	       },
	       debug: false,
	       // Button Settings
	       button_image_url : "<c:url value='/swfimages/TestImageNoText_65x29.png'/>",
	       button_placeholder_id : "spanButtonPlaceholder7",
	       button_width: 61,
	       button_height: 22,
	      button_text: '选择文件',
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
	var setting8 = {
	       flash_url : "<%=PropertiesUtil.getPropertiesValue("swfuploadurl")%>",
	       upload_url: "<%=PropertiesUtil.getPropertiesValue("uploadFlagshop")%>",
	       file_size_limit : "3MB",
	       file_types : "*.jpg;*.gif;*.jpeg;*.bmp;*.png;*.zip",
	       file_post_name: "uploadFile",
	       file_upload_limit : 1,
	       custom_settings : {
	           progressTarget : "fsUploadProgress8",
	           cancelButtonId : "btnCancel"
	       },
	       debug: false,
	       // Button Settings
	       button_image_url : "<c:url value='/swfimages/TestImageNoText_65x29.png'/>",
	       button_placeholder_id : "spanButtonPlaceholder8",
	       button_width: 61,
	       button_height: 22,
	       button_text: '选择文件',
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
function uploadSuccess(file, serverData) {
	try {
	//alert(serverData);
		var progress = new FileProgress(file, this.customSettings.progressTarget);
		progress.setComplete();
		progress.setStatus("上传成功");
		progress.toggleCancel(false);
		if(this.settings.button_placeholder_id=='spanButtonPlaceholder'){
		//alert("1");
		$('#imgid1').val($('#imgid1').val()+serverData+",");
		$('#imgid10').html(serverData);
		}else if(this.settings.button_placeholder_id=='spanButtonPlaceholder1'){
		//alert("2");
		$('#imgid2').val($('#imgid2').val()+serverData+",");
		$('#imgid20').html(serverData);
		}else if(this.settings.button_placeholder_id=='spanButtonPlaceholder2'){
		$('#imgid3').val($('#imgid3').val()+serverData+",");
		$('#imgid30').html(serverData);
		}else if(this.settings.button_placeholder_id=='spanButtonPlaceholder3'){
		$('#imgid4').val($('#imgid4').val()+serverData+",");
		$('#imgid40').html(serverData);
		}else if(this.settings.button_placeholder_id=='spanButtonPlaceholder4'){
		$('#imgid5').val($('#imgid5').val()+serverData+",");
		$('#imgid50').html(serverData);
		}else if(this.settings.button_placeholder_id=='spanButtonPlaceholder5'){
		$('#imgid6').val($('#imgid6').val()+serverData+",");
		$('#imgid60').html(serverData);
		}else if(this.settings.button_placeholder_id=='spanButtonPlaceholder6'){
		$('#imgid7').val($('#imgid7').val()+serverData+",");
		$('#imgid70').html(serverData);
		}else if(this.settings.button_placeholder_id=='spanButtonPlaceholder7'){
		$('#imgid8').val($('#imgid8').val()+serverData+",");
		$('#imgid80').html(serverData);
		}else if(this.settings.button_placeholder_id=='spanButtonPlaceholder8'){
		$('#imgid9').val($('#imgid9').val()+serverData+",");
		$('#imgid90').html(serverData);
		}
		alert("上传成功");
	} catch (ex) {
		this.debug(ex);
	}
}

  function getUserInfo(id){
  $.ajax({
        type:'post',
        url:"<c:url value='/flagshop/queryFlagshop'/>",
       success:function(data){
           if(data =="0"){
            if(id=='1')	{
            addFlagshopInfo();
            }else{
            addFlagshopCom();
            }
            }else{
                alert("已经申请,不可重复申请。");
        }
        }
    });



  }
	var info="内容不能为空,请输入!";
	function addFlagshopInfo(){
	var comName=$('#comName').val();
	if(comName==""){alert(info); return false;}
	var code=$('#comcode').val();
	// if(code==""){alert(info); return false;}
	var scan=$('#imgid1').val();
	// if(scan==""){alert(info); return false;}
	var address=$('#comaddress').val();
	if(address==""){alert(info); return false;}
	var name=$('#comName').val();
	if(name==""){alert(info); return false;}
	var idcard=$('#comidcode').val();
	if(idcard==""){alert(info); return false;}
	var idscan=$('#imgid2').val();
	if(idscan==""){alert(info); return false;}
	var mobile=$('#commobile').val();
	if(mobile==""){alert(info); return false;}
	var email=$('#comemail').val();
	if(email==""){alert(info); return false;}
	var manage=$('#commange').val();
	if(manage==""){alert(info); return false;}
	var comarea=$('#comarea').val();
	if(comarea==""){alert(info); return false;}
	var uploadimg=$('#imgid3').val();
	if(uploadimg==""){alert(info); return false;}
	var style="2";
	var desction=document.getElementById("desction1").value;
    $.ajax({
        type:'post',
        url:"<c:url value='/flagshop/flagshopInfo'/>",
        data:{
            comName:comName,
            code: code,
            scan:scan,
            address:address,
            name:name,
            idcard:idcard,
            idscan:idscan,
            mobile:mobile,
            email:email,
            manage:manage,
            comarea:comarea,
            uploadimg:uploadimg,
            style:style,
            desction:desction
        },
       success:function(data){
            if(data = "0000"){
            	$(".popms2").css("display","block")
            	$(".zhezhao").css("display","block")
           // alert("申请信息提交成功，3个工作日内将有商务专员与您联系，请保持通讯畅通。");
            }else{
                alert("申请失败");
        }
        }
    });
  }

  function addFlagshopCom(){
	var comName=$('#orgname1').val();
	if(comName==""){alert(info); return false;}
	//var comabb=$('#name').val();
	var code=$('#orgcode1').val();

	if(code==""){alert(info); return false;}
	var scan=$('#imgid4').val();
	if(scan==""){alert(info); return false;}
	var comcode=$('#orgcode').val();
	// if(comcode==""){alert(info); return false;}
	var comscan=$('#imgid5').val();
	// if(comscan==""){alert(info); return false;}
	var address=$('#orgaddress').val();
	if(address==""){alert(info); return false;}
	var money=$('#orgmoney').val();
	if(money==""){alert(info); return false;}
	var fname=$('#flader').val();
	if(fname==""){alert(info); return false;}
	var fidcode=$('#fidcode').val();
	if(fidcode==""){alert(info); return false;}
	var fscan=$('#imgid6').val();
	if(fscan==""){alert(info); return false;}
	var name=$('#orgname').val();
	if(name==""){alert(info); return false;}
	//var idcard=$('#name').val();
	var idscan=$('#imgid7').val();
	if(idscan==""){alert(info); return false;}
	var mobile=$('#orgmobile').val();
	if(mobile==""){alert(info); return false;}
	var email=$('#orgemail').val();
	if(email==""){alert(info); return false;}
	var manage=$('#orgmanage').val();
	if(manage==""){alert(info); return false;}
	var comarea=$('#orgarea').val();
	if(comarea==""){alert(info); return false;}
	var uploadimg1=$('#imgid8').val();
	var uploadimg2=$('#imgid9').val();
	if(uploadimg1==""){alert(info); return false;}
	if(uploadimg2==""){alert(info); return false;}
	var uploadimg = uploadimg1+","+uploadimg2;
	var style="1";
	//alert("11");
	var desction=document.getElementById("desction").value;
	//if(desction==""){alert(info); return false;}
    $.ajax({
        type:'post',
        url:"<c:url value='/flagshop/flagshopInfo'/>",
        data:{
            comName:comName,
            code: code,
            scan:scan,
            comcode:comcode,
            comscan:comscan,
            address:address,
            money:money,
            fname:fname,
            fidcode:fidcode,
            fscan:fscan,
            name:name,
            idscan:idscan,
            mobile:mobile,
            email:email,
            manage:manage,
            comarea:comarea,
            uploadimg:uploadimg,
            style:style,
            desction:desction
        },
        success:function(data){
            if(data = "0000"){
            	$(".popms2").css("display","block")
            	$(".zhezhao").css("display","block")
            //alert("申请信息提交成功，3个工作日内将有商务专员与您联系，请保持通讯畅通。");
            }else{
                alert("申请失败");
        }
        }
    });

  }
	</script>
  </head>

  <body>

  <jsp:include page="../head/bmlogin.jsp"></jsp:include>

<div id="b_box">
        <div class="tit_bt">——旗舰商家申请表——</div>
        <ul>
            <li>带<span class="red_star">&nbsp;*&nbsp;</span>为必填内容，请务必填写，填写完成之后，请点击提交按钮提交。</li>
            <li>
            	请选择经营单位性质:&nbsp;&nbsp;
                <input type="radio" name="gs" value="" id="gth" checked="checked"/>
                个人
                <input type="radio" name="gs" value="" id="gs" />
                公司
            </li>
        </ul>
    </div>
    <!--个体户表单-->
    <div id="gth_box" class="gth_box" style="display:block;">

    	<table>
        	<tr>
            	<td>商家名称：</td>
                <td >
                	<input type="text" id="comName"/>
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	 <td>营业执照号码：</td>
                <td>
                	<input type="text" id="comcode"/>
                    <span class="red_star">&nbsp;</span>
                </td>
            </tr>
            <tr>
            	<td>营业执照图片：</td>
                <td class="tu_p"  style="height:40px;">
                 <input id="imgid1" type="hidden" />
                  <div class="fieldset flash" id="fsUploadProgress"><span id="imgid10"></span>
                    <p id="spanButtonPlaceholder" ></p>
                    <input id="btnCancel" style="display:none;" type="button"  onclick="swfupload.cancelQueue()"  />
                	<!--input type="file" id="comimg"/-->
                    <span class="red_star">&nbsp;</span>
                    </div>

                </td>
            </tr>
            <tr>
            	<td>地址：</td>
                <td>
                	<input type="text" id="comaddress"/>
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	<td>经营者姓名：</td>
                <td>
                	<input type="text" id="comName" />
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	<td>经营者身份证号码：</td>
                <td>
                	<input type="text"  id="comidcode"/>
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	<td>经营者身份证号码图片：</td>
                <td class="tu_p">
                <input id="imgid2" type="hidden" name="imgurl"/>
                	<div class="fieldset flash" id="fsUploadProgress1"> <span id="imgid20"></span>
                    <p align="right"  id="spanButtonPlaceholder1" ></p>
                    <input id="btnCancel" style="display:none;" type="button"  onclick="swfupload.cancelQueue()"  />
                	<!--input type="file" id="comimg"/-->
                    <span class="red_star">*</span>
                    </div>
                </td>
            </tr>
            <tr>
            	<td>联系电话：</td>
                <td>
                	<input type="text" id="commobile" />
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	<td>邮箱：</td>
                <td>
                	<input type="text" id="comemail" />
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	<td>经营范围：</td>
                <td>
                	<input type="text" id="commange" />
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	<td>店铺面积：</td>
                <td>
                	<input type="text"  id="comarea"/>
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	<td>店铺图片：</td>
                <td class="tu_p">
                   <input id="imgid3" type="hidden" name="imgurl"/>
                	<div class="fieldset flash" id="fsUploadProgress2">
                	<span id="imgid30"></span>
                    <p  id="spanButtonPlaceholder2" ></p>
                    <input id="btnCancel" style="display:none;" type="button"  onclick="swfupload.cancelQueue()"  />
                	<!--input type="file" id="comimg"/-->
                    <span class="red_star">*</span>
                    </div>
                </td>
            </tr>
        </table>
        <div class="red_star ts">
        	温馨提示：店铺图片（请将图片打包压缩，上传压缩包即可）。
        </div>
        <div class="xxjs">
        	<p>详细介绍</p>
        	<textarea id ="desction1"></textarea>
        </div>
        <div class="tj_btn">
        	<button onclick="getUserInfo('1');">提&nbsp;&nbsp;交</button>
        </div>
    </div>


    <!--公司表单-->
    <div id="gth_box" class="gs_box" style="display:none;padding-top:10px;position:relative;">
    	<div style="text-align:center;padding-left:132px;font-size:14px;width:668px;height:40px;line-height:40px;">
    		<p style="color:red;float:left;">旗舰商家联系人需提供法人授权书，请先下载填写扫描，再进行申请操作。</p>
    		<a href="<c:url value='/uploadWX/proxyLetter.doc'/>" class="xzdoc" style="float:left;">模板下载.doc</a>
    	</div>
    	<table class="table2">
        	<tr>
            	<td>公司名称：</td>
                <td >
                	<input type="text" id="orgname1" />
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	<td>营业执照号码：</td>
                <td>
                	<input type="text" id="orgcode1" />
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	<td>营业执照扫描件：</td>
                <td class="tu_p">
                    <input id="imgid4" type="hidden" />
                	<div class="fieldset flash" id="fsUploadProgress3">
                	<span id="imgid40"></span>
                    <p align="right"  id="spanButtonPlaceholder3" ></p>
                    <input id="btnCancel" style="display:none;" type="button"  onclick="swfupload.cancelQueue()"  />
                	<!--input type="file" id="comimg"/-->
                    <span class="red_star">*</span>
                    </div>
                </td>
            </tr>
            <!-- <tr>
            	<td>组织机构代码：</td>
                <td>
                	<input type="text" id="orgcode" />
                    <span class="red_star">*</span>
                </td>
            </tr> -->
            <tr style="display:none">
            	<td>组织机构代码扫描件：</td>
                <td class="tu_p">
                <input id="imgid5" type="hidden" name="imgurl"/>
                	<div class="fieldset flash" id="fsUploadProgress4">
                	<span id="imgid50"></span>
                    <p align="right"  id="spanButtonPlaceholder4" ></p>
                    <input id="btnCancel" style="display:none;" type="button"  onclick="swfupload.cancelQueue()"  />
                	<!--input type="file" id="comimg"/-->
                    <span class="red_star">*</span>
                    </div>
                </td>
            </tr>
            <tr>
            	<td>注册地址：</td>
                <td>
                	<input type="text" id="orgaddress"/>
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	<td>注册资金：</td>
                <td>
                	<input type="text" id="orgmoney" />
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr></tr>
            <tr>
            	<td>法定代表人名称：</td>
                <td>
                	<input type="text" id="flader"/>
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	<td>法人代表身份证号码：</td>
                <td>
                	<input type="text" id="fidcode"/>
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	<td>法人代表身份证扫描件：</td>
                <td class="tu_p">
                <input id="imgid6" type="hidden" name="imgurl"/>
                 <div class="fieldset flash" id="fsUploadProgress5">
                 <span id="imgid60"></span>
                    <p align="right"  id="spanButtonPlaceholder5" ></p>
                    <input id="btnCancel" style="display:none;" type="button"  onclick="swfupload.cancelQueue()"  />
                	<!--input type="file" id="comimg"/-->
                    <span class="red_star">*</span>
                    </div>
                </td>
            </tr>
            <tr>
            	<td>联系人名称：</td>
                <td>
                	<input type="text" id="orgname"/>
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	<td>联系人电话：</td>
                <td>
                	<input type="text" id="orgmobile"/>
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            <td>邮箱：</td>
                <td>
                	<input type="text" id="orgemail" />
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	<td>联系人身份证扫描件：</td>
                <td class="tu_p">
                <input id="imgid7" type="hidden" name="imgurl"/>
                	<div class="fieldset flash" id="fsUploadProgress6">
                    <p align="right"  id="spanButtonPlaceholder6" ></p>
                    <input id="btnCancel" style="display:none;" type="button"  onclick="swfupload.cancelQueue()"  />
                	<!--input type="file" id="comimg"/-->
                	<span class="red_star">*</span>
                	</div>
                </td>
            </tr>
            <tr>
            	<td>授权委托书扫描件：</td>
                <td class="tu_p">
                <input id="imgid9" type="hidden" name="imgurl"/>
                	<div class="fieldset flash" id="fsUploadProgress8">
                	<span id="imgid90"></span>
                    <p id="spanButtonPlaceholder8" ></p>
                    <input id="btnCancel" style="display:none;" type="button"  onclick="swfupload.cancelQueue()"  />
                    <span class="red_star">*</span>
                    </div>
                </td>
            </tr>
			<tr></tr>
            <tr>
            	<td>经营范围：</td>
                <td>
                	<input type="text" id="orgmanage"/>
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	<td>店铺面积：</td>
                <td>
                	<input type="text" id="orgarea"/>
                    <span class="red_star">*</span>
                </td>
            </tr>
            <tr>
            	<td>店铺图片：</td>
                <td class="tu_p">
                <input id="imgid8" type="hidden" name="imgurl"/>
                	<div class="fieldset flash" id="fsUploadProgress7">
                	<span id="imgid80"></span>
                    <p align="right"  id="spanButtonPlaceholder7" ></p>
                    <input id="btnCancel" style="display:none;" type="button"  onclick="swfupload.cancelQueue()"  />
                	<!--input type="file" id="comimg"/-->
                    <span class="red_star">*</span>
                    </div>
                </td>
            </tr>

        </table>

        <div class="red_star ts">
        	温馨提示：店铺图片（请将图片打包压缩，上传压缩包即可）。
        </div>
        <div class="xxjs">
        	<p>详细介绍</p>
        	<textarea id="desction"></textarea>
        </div>
        <div class="tj_btn">
        	<button onclick="getUserInfo('2');">提&nbsp;&nbsp;交</button>
        </div>
        <div style="height:20px;width:800px;border-bottom:1px dotted #3CC;position:absolute;top:254px;left:0;"></div>
        <div style="height:20px;width:800px;border-bottom:1px dotted #3CC;position:absolute;top:611px;left:0;"></div>
    </div>
    <!--信息不完善弹出框-->
    <div class="popms popms1" style="display:none;" >
    	<p>请完善申请信息后再提交</p>
    </div>
    <!--提交弹出框-->
    <div class="popms popms2" style="display:none;">
    	<p id>申请信息提交成功，3个工作日内将有商务专员与您联系，请保持通讯畅通。</p>
    	<a href="http://www.wswhly.com/index">返回首页</a>&nbsp;&nbsp;
    	<a href="<c:url value='/user/UserCenter'/>">进入个人中心</a>
    </div>
    <!-- 遮罩 -->
    <div class="zhezhao"></div>


  </body>
</html>
