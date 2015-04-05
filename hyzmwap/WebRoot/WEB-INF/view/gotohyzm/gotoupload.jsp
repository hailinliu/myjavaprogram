<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
  <head>

    <title>我要上华豫-藏品上传</title>

	<meta charset="utf-8">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
	<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
<script type="text/javascript">
$(function(){
if('${errorinfo}' == ''){
	    
	}else if('${errorinfo}' == '0000'){
		alert("操作成功！");
	}else{
		alert('${errorinfo}');
	}
});
function myCollections() {
	location.href = "<c:url value='/vote/gotoMyupload'/>";
}

function gotoUpload() {
	location.href = "<c:url value='/vote/gotoupload'/>";
}


function getSub(){
   var typeid=document.getElementById("typeid").value;
   alert(typeid);
  var name=$('#nameid').val();
	var imgurl=$('#imgid').val();
var memo=document.getElementById("memo").value;
$.ajax({type: "POST",
      dataType: "text",
      url: "<c:url value='/vote/uploadCollectionMsg'/>",
      data: {typeid:typeid,imgurl:imgurl,name:name,memo:memo, type:2},
      success:function(data){
        if(data == "0000"){

        	alert("上传成功");
         location.href="<c:url value='/redirect?p=gotohyzm/myRelease'/>";
        }else{
          alert(data);
         // alert(data);
        }
      }
    });


}

function checkForm() {
	if (document.getElementById("typeid").value == '0') {
		$("#typedialog").popup();
    	$("#typedialog").popup('open');
		return false;
	} 
	if ($('#nameid').val() == '') {
		$("#collectionnamedialog").popup();
    	$("#collectionnamedialog").popup('open');
		return false;
	}
	var imagearray = "";
	$('.uploadimage').each(function (){
		imagearray = imagearray + $(this).val(); 
	});
	if (imagearray == '' && $('#oldimageid').val() == '') {
		$("#imagedialog").popup();
    	$("#imagedialog").popup('open');
		return false;
	}
	return true;
}


</script>


  </head>

  <body>
	<div data-role="page">
  	<jsp:include page="../head/header.jsp?name=藏品发布"></jsp:include>
  	<div data-role="content">
  	
  	    <!-- 选择类型提示框-->
		<div data-role="popup" id="typedialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">请选择藏品类型！</h3>
		        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" data-rel="back">确定</a>
		    </div>
		</div>
		
		<!-- 藏品名称提示框-->
		<div data-role="popup" id="collectionnamedialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">请输入藏品名称！</h3>
		        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" data-rel="back">确定</a>
		    </div>
		</div>
		
		<!-- 藏品图片提示框-->
		<div data-role="popup" id="imagedialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">添加藏品必须上传图片！</h3>
		        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" data-rel="back">确定</a>
		    </div>
		</div>
  	
		<form id="uploadform" method="post" action="<c:url value='/vote/uploadCollectionMsg'/>" onsubmit="return checkForm();" enctype="multipart/form-data" data-ajax="false">
			<input type="hidden" name="type" value="2"/>
			<div>
		      <label>分类</label>
		      <select id="typeid" name="typeid">
	            <option value="0">-- 请选择 --</option>
	            <c:forEach items="${typeList}" var="type">
	              <option <c:if test="${col.type eq type.id}">selected="selected"</c:if> value="${type.id}">${type.name}</option>
	            </c:forEach>
	          </select>
		    </div>
		    <div>
		      <label>藏品名称</label>
		      <input id="nameid" type="text" name="name" maxlength="300" placeholder="1-20个汉字" />
		    </div>
		    <div>
		      <label>图片</label>
		      <input type="file" accept="image/png" name="fileField" id="fileField1" class="uploadimage"/>
		      <input type="file" accept="image/png" name="fileField" id="fileField2" class="uploadimage"/>
		      <input type="file" accept="image/png" name="fileField" id="fileField3" class="uploadimage"/>
		      <input type="file" accept="image/png" name="fileField" id="fileField4" class="uploadimage"/>
		      <input type="file" accept="image/png" name="fileField" id="fileField5" class="uploadimage"/>
		      <input type="hidden" id="oldimageid" value="${activity.imgurl}"/>
		    </div>
		    <div>
		      <label>藏品介绍</label>
		      <textarea name="memo" placeholder="200个汉字" rows="10"></textarea>
		    </div>
		    <input id="submitbutton" type="submit" name="submit" class="btn" value="提交" />
		</form>
	</div>
  	<jsp:include page="../foot/footer.jsp"></jsp:include>
  </div>
  </body>
</html>
