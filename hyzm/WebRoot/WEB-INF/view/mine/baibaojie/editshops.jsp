<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.hyzm.util.PropertiesUtil"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:include page="../../head/header.jsp"></jsp:include>
  <head>
    <title>店铺设置_百宝箱_卫视文化乐园-华豫之门官方网站</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/bbmycenter.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/uploadpic.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/userCenter.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/js/address.js'/>"></script>
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
       file_types_description : "藏品图片",
       file_upload_limit : 1,
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
		$('#img').val(serverData);
		  upimg_num();
    // alert("上传成功");
	} catch (ex) {
		this.debug(ex);
	}
}

function deleteImg(obj1,name) {
        $(obj1).closest(".img_lookbox").remove();
         upimg_num();
        var vals= $('#img').val();
        $('#img').val(vals.replace(name,""));

      }
      // 获取上传图 总数
      function upimg_num() {
        var upimg_num = $('.img_lookbox').length;
        $('#img_nums').html(upimg_num+" 个图片已上传.")
      }

	$(document).ready(function() {
	  getAddress('${item.addresscode}',"addressdiv");
	  $("input[name='mainscope']").each(function () {
	                    if('${item.mainscope}'.indexOf(this.value)>=0){
	                    	  this.checked=true;
	                    }
	                })
	  
    });


function addShop(){
	var addresscode=getCountyCode();
	if($('#shopname').val()==""){
	alert('请填写店铺名！');
	return false;

	}else{
    var shopname = $('#shopname').val().replace(/[^\x00-\xff]/g, 'xx');
    if (shopname.length > 15 || shopname.length < 3) {
      alert('店铺名称介于3-15个字符');
     return false;
    }
  }
	if(addresscode==""){
	alert('请选择地址！');
	return false;
	}
	if($('#shopaddress').val()==""){
	alert('请填写详细地址！');
	return false;
	}
	if($('#desction').val()==""){
	alert('请填写店铺介绍！');
	return false;
	}

	var mainscope="";
	 $('input[name="mainscope"]:checked').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数
            mainscope+=$(this).val()+",";
     });
     if(mainscope==""){
     	alert('请选择经营范围！');
		return false;
     }
	if($('#desction').val()==""){
	alert('请填写店主宣言！');
	return false;
	}
	var upimg_num = $('.img_lookbox').length;
	if(upimg_num!=1){
	alert('请上传图片，店铺LOGO！图片最多1张！');
	return false;
	}
	if($('#img').val()==''){
		$('#img').val('${item.img}');
	}
		 $.ajax({type: "POST",
	      dataType: "text",
	      url: "<c:url value='/BaiBaoMine_AddShop'/>",
	      data: {
	      id:'${item.id}',
	      shopname:$('#shopname').val(),
	      weixin:$('#weixin').val(),
	      addresscode:addresscode,
	      shopaddress:$('#shopaddress').val(),
	      desction:$('#desction').val(),
	      img:$('#img').val(),
	      mainscope:mainscope,
	      manifesto:$('#manifesto').val()
	      },
	      success:function(data){
	        if(data == "0000"){
	          window.location.href="<c:url value='/BaiBaoMine_getShop'/>";
	        }else{
	        	alert(data);
	        }
	      }
	    });
	}

</script>
<style type="text/css">
  .pro_delimg{
    right: -25px;
  }
</style>
</head>

<body>


<!--main style ben-->
<div class="main_box clear">

  <jsp:include page="../common/myMenu.jsp"></jsp:include>

  <div class="user_right fr clear">
    <div class="onuser_tit2">
      店铺管理
      <span class="fr online_user"></span>
    </div>
    <div class="myr_box2 forshops_box2 clear">
    <c:if test="${item==null}">
      <div class="forshop_stat" id="shops_stat1">
        您尚未设置店铺
      </a>
    </div>
    </c:if>
    <c:if test="${item!=null&&item.state==4}">
    <div class="forshop_stat shops_stat2" id="shops_stat2">您的店铺已经提交审核，3个工作日乐园客服会进行审核，请耐心等待审核结果。</div>
    </c:if>
     <c:if test="${item!=null&&item.state==5}">
    <div class="forshop_stat shops_stat2" id="shops_stat2">您的审核未通过，请重新填写信息！。</div>
    </c:if>
     <c:if test="${item!=null&&item.state==1}">
    <div class="forshop_stat shops_stat3" id="shops_stat3">
      您已通过店铺审核，您的店铺：${item.shopname}
      <a href="<c:url value='/BaiBao_getShop?redirect=/baibaojie/seller&id='/>${item.id}" class="forshop_cbtn" target="_blank" >点击进入
    </a>
    </div>
    </c:if>
    </div>
    <div class="onuser_tit2 mr_t10">店铺设置<span class="fr online_user"></span></div>
      <div class="myr_box2 forshops_box2 clear">

      <div class="pp_name">
        <span>店铺名称：</span>
        <span class="pp_button">
        <c:if test="${item==null||item.state==5||dosth=='edits'}">
          <input type="text" type="text" name="shopname" id="shopname" value="${item.shopname}" maxlength="300"/>
        </c:if>
        <c:if test="${item!=null&&(item.state==1||item.state==4)&&dosth!='edits'}">${item.shopname}</c:if>
        </span>
      </div>
      <c:if test="${item==null||item.state==5||dosth=='edits'}">
       <div class="pp_name">
        <span>地址：</span>
        <span class="pp_button" id="addressdiv" >
        </span>
      </div>
       </c:if>
       <div class="pp_name">
        <span>详细地址：</span>
        <span class="pp_button">
         <c:if test="${item==null||item.state==5||dosth=='edits'}">
          <input type="text" type="text" name="shopaddress" id="shopaddress" value="${item.shopaddress}" maxlength="300"/>
          </c:if>
          <c:if test="${item!=null&&(item.state==1||item.state==4)&&dosth!='edits'}">${item.shopaddress}</c:if>
        </span>
      </div>
       <div class="pp_name">
        <span>微  信：</span>
        <span class="pp_button" style="margin-left:20px;">
        <c:if test="${item==null||item.state==5||dosth=='edits'}">
          <input type="text" type="text" name="weixin" id="weixin" value="${item.weixin}" maxlength="300"/>
          </c:if>
          <c:if test="${item!=null&&(item.state==1||item.state==4)&&dosth!='edits'}">${item.weixin}</c:if>
        </span>
      </div>
      <div class="pp_txt">
          <span style="font-size:14px;display:block;">店铺介绍：</span>
          <span class="text_box">
          <c:if test="${item==null||item.state==5||dosth=='edits'}">
            <textarea name="desction" id="desction"  cols="30" rows="10">${item.desction}</textarea>
              </c:if>
          <c:if test="${item!=null&&(item.state==1||item.state==4)&&dosth!='edits'}">${item.desction}</c:if>
          </span>
      </div>
       <c:if test="${item==null||item.state==5||dosth=='edits'}">
      <div class="xz_zc" style="margin-top:20px;padding-bottom:20px;">
         <span class="fl">经营范围：（可多选）</span>
         <div class="fl">
           <span style="margin-right:30px;">
          <label for="mainscope1"> <input type="checkbox" name="mainscope" id="mainscope1"  value="14"/>
            瓷器陶器</label>
                </span>
             <span style="margin-right:30px;">
           <label for="mainscope2"><input type="checkbox" name="mainscope" id="mainscope2"  value="15"/>
            玉器赏石</label>
                </span>
             <span style="margin-right:30px;">
               <label for="mainscope3">
                 <input type="checkbox" name="mainscope"  id="mainscope3" value="16"/>
                 书画古籍
               </label>
             </span>
              <span style="margin-right:30px;">
               <label for="mainscope4">
                 <input type="checkbox" name="mainscope"  id="mainscope4" value="17"/>
                 青铜佛像
               </label>
             </span>
             <span style="margin-right:30px;">
               <label for="mainscope5">
                 <input type="checkbox" name="mainscope"  id="mainscope5" value="18"/>
                 木器雕品

               </label>
             </span>
             <br>
             <br>
             <span style="margin-right:30px;">
               <label for="mainscope6">
                 <input type="checkbox" name="mainscope"  id="mainscope6" value="19"/>
                 古币钱币

               </label>
             </span>

             <span style="margin-right:30px;">
               <label for="mainscope7">
                 <input type="checkbox" name="mainscope"  id="mainscope7" value="20"/>
                 珠宝首饰

               </label>
             </span>
             <span style="margin-right:30px;">
               <label for="mainscope8">
                 <input type="checkbox" name="mainscope"  id="mainscope8" value="21"/>
                 油画雕塑

               </label>
             </span>
             <span style="margin-right:30px;">
               <label for="mainscope9">
                 <input type="checkbox" name="mainscope"  id="mainscope9" value="22"/>
                 邮票邮品

               </label>
             </span>
             <span style="margin-right:30px;">
               <label for="mainscope10">
                 <input type="checkbox" name="mainscope"  id="mainscope10" value="23"/>
                  其他藏品
               </label>
             </span>
             </div>
    </div>
	 </c:if>
         				 <c:if test="${item!=null&&(item.state==1||item.state==4)&&dosth!='edits'}">
         				  <div class="xz_zc" style="margin-top:20px;padding-bottom:20px;">
        					 <span class="fl">经营范围：</span>
          								<span><c:if test="${fn:indexOf(item.mainscope,'14')>=0}">瓷器陶器</c:if></span>
										<span><c:if test="${fn:indexOf(item.mainscope,'15')>=0}">玉器赏石</c:if></span>
										<span><c:if test="${fn:indexOf(item.mainscope,'16')>=0}">青铜金器</c:if></span>
										<span><c:if test="${fn:indexOf(item.mainscope,'17')>=0}">书画古籍</c:if></span>
										<span><c:if test="${fn:indexOf(item.mainscope,'18')>=0}">木器雕品</c:if></span>
										<span><c:if test="${fn:indexOf(item.mainscope,'19')>=0}">古币钱币</c:if></span>
										<span><c:if test="${fn:indexOf(item.mainscope,'20')>=0}">珠宝首饰</c:if></span>
										<span><c:if test="${fn:indexOf(item.mainscope,'21')>=0}">油画雕塑</c:if></span>
										<span><c:if test="${fn:indexOf(item.mainscope,'22')>=0}">邮票邮品</c:if></span>
										<span><c:if test="${fn:indexOf(item.mainscope,'23')>=0}">其他藏品</c:if></span>
							</div>
     </c:if>
     
    <div class="pp_txt" style="margin-top:20px;">

          <span style="font-size:14px;display:block;">店主宣言：</span>
          <span class="text_box">
          <c:if test="${item==null||item.state==5||dosth=='edits'}">
            <textarea name="manifesto" id="manifesto"  cols="30" rows="10">${item.manifesto}</textarea>
            </c:if>
            <c:if test="${item!=null&&(item.state==1||item.state==4)&&dosth!='edits'}">${item.manifesto}</c:if>
          </span>
      </div>
      <div style="font-size:14px;padding:0 40px 0 45px;margin-top:12px;">
        <p class="newred" style="line-height:32px;">
        提示：
        店铺图片即商家展示图片，不得使用带有敏感信息的图片，如：身份证复印件、含有违反法律法规的内容等。否则将无法显示，这将影响到您的店铺的展示。
        </p>
     </div>
       <div class="pp_txt" >
       <c:if test="${item==null||item.state==5||dosth=='edits'}">
          <!-- 上传 -->
        <div class="mycode_pic">
        <input id="img" type="text" name="img" style="display:none;" value="${item.img}" />
          <div class="up_pics" style="padding-left:0;">
            <p class="fl">
              <span>
                上传图片：
              </span>
            </p>
            <div class=" up_box fl" style="width: 720px;">
               <div class="fl" id="upupup1" style="padding-left:20px;padding-top:20px;">
                    <span id="spanButtonPlaceholder"></span>
                    <input id="btnCancel" type="button" value="取消" onclick="swfupload.cancelQueue()" disabled="disabled" style="margin-left: 2px; height: 22px; font-size: 8pt;display:none;" />
                </div>
                <div class="up_txt1 fl" style="padding-top:0;">
                    <i class="newred">提示：</i>
                    <i>图片大小： 支持 0 ~ 5M 图片上传</i>
                    <p style="text-indent: 47px; margin-top:-15px;">图片格式： jpg，jpeg，gif，bmp等</p>
                    <p style="text-indent: 47px; margin-top:-14px;color:#666;">
                      重要：店铺LOGO图片，只能上传一张图片。
                    </p>
                </div>
                <!-- <div class="shili_img fr">

                </div> -->
            </div>
            <div style="clear:both;"></div>
        </div>

        <!-- 上传图片信息展示块 -->
          <div class="upimgbox" style="width:689px;">
            <div id="fsUploadProgress" >
           <c:if test="${dosth=='edits'}">
            <div class='img_lookbox'><img src='http://116.255.149.172:7080/wswhly/Baibaourl//${item.img}' width='100' /><div class="pro_textsuss"><div class="pro_imgname">${item.img}</div><div class="pro_status">上传成功</div></div><div class="pro_imgover"><div class="pro_imgline fl"></div><b class="fl">100%</b></div><div class="pro_delimg" onclick="deleteImg(this,'${item.img}')">删除</div></div>
            </c:if>
            </div>
            <!-- <div id="divStatus"></div> -->
            <div id="img_nums"></div>
            <div class="flash" class="upload_pic_btn" ></div>
          </div>
        </div>
        </c:if>
        <c:if test="${item!=null&&(item.state==1||item.state==4)&&dosth!='edits'}">
		<img src="http://116.255.149.172:7080/wswhly/Baibaourl/${item.img}" alt="" />
		</c:if>
 	    </div>
 <c:if test="${item==null||item.state==5||dosth=='edits'}">
       <button class="go_upload"  onclick="addShop()"  type="button">确认提交</button>
</c:if>
<c:if test="${item!=null&&(item.state==1||item.state==4)&&dosth!='edits'}">
       <button class="go_upload"  onclick="window.location.href='<c:url value='/BaiBaoMine_getShop'/>?dosth=edits'"  type="button">修改</button>
</c:if>
    </div>


  </div><!--user_right end-->

</div>
<!--main style end-->

<div style="clear:both;"></div>
<jsp:include page="../../foot/footer.jsp"></jsp:include>

</body>
</html>