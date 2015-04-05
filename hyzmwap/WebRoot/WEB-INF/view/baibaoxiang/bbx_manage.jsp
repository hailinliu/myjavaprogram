<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>店铺管理</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<style type="text/css">
body {
	padding: 0;
	margin: 0;
	background: #fff;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	color: #444340;
}
h1 {
	font-size: 1.3em;
	padding: 10px 10px;
	margin: 0;
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
.shopSetting {
	width: 90%;
	overflow: hidden;
	margin: 0 auto;
}

.shopSetting a {
	display: block;
}
.shopSetting em {
	margin-right: 24px
}
.moreSeclect{ clear:both}
.moreSeclect span{ width:30%; display: inline; float:left}

</style>
<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.6.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/simple-inheritance.min.js'/>"></script>
<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
<!-- NOTE: including the jQuery engine version -->
<script type="text/javascript" src="<c:url value='/jquery/code-photoswipe-jQuery-1.0.11.min.js'/>"></script>
<script src="<c:url value='/js/ajaxfileupload.js'/>"></script>
<script src="<c:url value='/js/address.js'/>"></script>
<script type="text/javascript">
$(document).ready(function() {
	  getAddress('${item.addresscode}',"addressdiv");
	  $("input[name='mainscope']").each(function () {
	                    if('${item.mainscope}'.indexOf(this.value)>=0){
	                    	  this.checked=true;
	                    }
	                })

    });

function inputFileChange(){
		if($('#img').val().indexOf('.')>=0){
			alert('只能上传一张图片！');
			return ;
		}else{
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
			                   $('#img').val($('#img').val()+yyyyMMdd+newfilename+agofilename);
			                   $('#upimgstate').html("图片上传成功！");
			                } ,
				            error: function (msg) {
				               $('#upimgstate').html("图片上传失败！请重试！");
				            }
					  	})
		}

   			}
 function deleteImg(obj1,name) {
			  $(obj1).closest(".img_lookbox").remove();
				var vals= $('#imgid').val();
				$('#img').val("");
}





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

function setInfo(){
	if($('#infodiv').css('display')=='none'){
		$('#infodiv').show();
		$('#szbt').text('取消');
	}else{
		$('#infodiv').hide();
		$('#szbt').text('设置');
	}
}
</script>
</head>

<body>
<!--
本页面主要是用户查看、修改店铺信息。
最下方有导航 店铺——店铺管理 藏品——藏品管理 上传——上传藏品

-->
<div data-role="page" class="ui-page ui-page-theme-a ui-page-active" style="display:block; padding-bottom:58px">
  <div data-role="header" role="banner" class="ui-header ui-bar-inherit">
    <h1 class="ui-title" role="heading" aria-level="1">店铺管理</h1>
  </div>
  <div class="shopSetting ui-content" data-role="content" role="main">
    <div>
      <div >
        <c:if test="${item==null}">
          <div style="text-align:center"> 您尚未设置店铺 </div>
        </c:if>
        <c:if test="${item!=null&&item.state==4}">
          <div  id="shops_stat2">您的店铺已经提交审核，3个工作日乐园客服会进行审核，请耐心等待审核结果。</div>
        </c:if>
        <c:if test="${item!=null&&item.state==5}">
          <div id="shops_stat2">您的审核未通过，请重新填写信息！。</div>
        </c:if>
        <c:if test="${item!=null&&item.state==1}">
          <div  id="shops_stat3"> 您已通过店铺审核，您的店铺：${item.shopname} <a href="<c:url value='/BaiBao_getShop?redirect=/baibaojie/seller&id='/>${item.id}" class="ui-bar ui-bar-a btn btn-positive btn-block ui-btn ui-shadow ui-corner-all ">点击进入 </a> </div>
        </c:if>
        <a id="szbt" href="javascript:setInfo()" class="ui-bar ui-bar-a btn btn-positive btn-block ui-btn ui-shadow ui-corner-all " >设置</a> <br/>
      </div>
      <div id="infodiv"  style="display: none;" >
        <p><label for="shopname">店铺名称：</label></p>
        <p class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
          <input type="text" type="text" name="shopname" id="shopname" value="${item.shopname}" maxlength="300"/>
        </p>
        <p>地址:</p>
        <p> <span class="pp_button" id="addressdiv" > </span> </p>
        <p><label for="shopaddress">详细地址：</label></p>
        <p class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
          <input type="text" type="text" name="shopaddress" id="shopaddress" value="${item.shopaddress}" maxlength="300"/>
        </p>
        <p><label for="weixin">微  信：</label></p>
        <p class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
          <input type="text" type="text" name="weixin" id="weixin" value="${item.weixin}" maxlength="300"/>
        </p>
        <p><label for="desction">店铺介绍：</label></p>
        <p>
          <textarea name="desction" id="desction"   rows="3" class="ui-bar btn-positive   ui-shadow ui-corner-all" style="width:85%; text-align:left; ">${item.desction}</textarea>
        </p>
        <p style="clear:both"><label for="mainscope">经营范围：（可多选）</label></p>
        <div class="moreSeclect">
        <span>
          <label for="mainscope1">
            <input type="checkbox" name="mainscope" id="mainscope1"  value="14"/>
            瓷器陶器</label>
          </span> <span>
          <label for="mainscope2">
            <input type="checkbox" name="mainscope" id="mainscope2"  value="15"/>
            玉器赏石</label>
          </span> <span>
          <label for="mainscope3">
            <input type="checkbox" name="mainscope"  id="mainscope3" value="16"/>
            书画古籍 </label>
          </span> <span>
          <label for="mainscope4">
            <input type="checkbox" name="mainscope"  id="mainscope4" value="17"/>
            青铜佛像 </label>
          </span> <span>
          <label for="mainscope5">
            <input type="checkbox" name="mainscope"  id="mainscope5" value="18"/>
            木器雕品 </label>
          </span> <span>
          <label for="mainscope6">
            <input type="checkbox" name="mainscope"  id="mainscope6" value="19"/>
            古币钱币 </label>
          </span> <span>
          <label for="mainscope7">
            <input type="checkbox" name="mainscope"  id="mainscope7" value="20"/>
            珠宝首饰 </label>
          </span> <span>
          <label for="mainscope8">
            <input type="checkbox" name="mainscope"  id="mainscope8" value="21"/>
            油画雕塑 </label>
          </span> <span>
          <label for="mainscope9">
            <input type="checkbox" name="mainscope"  id="mainscope9" value="22"/>
            邮票邮品 </label>
          </span> <span>
          <label for="mainscope10">
            <input type="checkbox" name="mainscope"  id="mainscope10" value="23"/>
            其他藏品 </label>
        </div>
        <p style="clear:both; padding-top:20px"><label for="manifesto">店主宣言：</label></p>
        <p>
          <textarea name="manifesto" id="manifesto"  rows="2" class="ui-bar btn-positive   ui-shadow ui-corner-all" style="width:85%; text-align:left; ">${item.manifesto}</textarea>
        </p>
        <div >
          <p><label for="uploadFile">店铺Logo：</label></p>
          <p class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
            <input type="file" name="uploadFile" id="uploadFile" onchange="inputFileChange()" />
            <input type="hidden" id="img" name="img" value="${item.img}"/>
          </p>
          <div id="imglist">
            <c:if test="${item.img!=null}"> <img  class='img_lookbox'src='http://116.255.149.172:7080/wswhly/Baibaourl//${item.img}' width=80 height=80 onclick="deleteImg(this,'${item.img}')"  /> </c:if>
          </div>
          </p>
          <div id="upimgstate"></div>
          <p style="font-size:0.8em"><strong>提示：</strong> 上传成功之后在列表中显示！<br>
点击图片可以删除！<br>图片大小： 支持 0 ~ 5M 图片上传<br>图片格式： jpg，jpeg，gif，bmp等。<p style="font-size:0.8em; color:#F96">店铺图片即商家展示图片，不得使用带有敏感信息的图片，如：身份证复印件、含有违反法律法规的内容等。否则将无法显示，这将影响到您的店铺的展示。</p>
        </div>
        <button  onclick="addShop()"  type="button" class="ui-bar ui-bar-a btn btn-positive btn-block ui-btn ui-shadow ui-corner-all">确认提交</button>
      </div>
    </div>
    <!--user_right end-->
    <c:if test="${item!=null&&item.state==1}">
      <div data-role="footer" data-position="fixed" role="contentinfo" class="ui-footer ui-bar-inherit ui-footer-fixed slideup">
        <div data-role="navbar" class="ui-navbar" role="navigation">
          <ul class="ui-grid-c">
            <li class="ui-block-b" style="width:50%"><a href="<c:url value='/redirect?p=baibaoxiang/bbx_cp'/>" data-iconpos="top" data-icon="star" data-ajax="false" class="ui-link ui-btn ui-icon-star ui-btn-icon-top">藏品管理</a></li>
            <li class="ui-block-c" style="width:50%"><a href="<c:url value='/gotoBaiBaoMine_UpdateCollection'/>" data-iconpos="top" data-icon="info" data-ajax="false" class="ui-link ui-btn ui-icon-info ui-btn-icon-top">上传</a></li>
          </ul>
        </div>
        <!-- /navbar -->
      </div>
    </c:if>
  </div>
</div>
</body>
</html>
