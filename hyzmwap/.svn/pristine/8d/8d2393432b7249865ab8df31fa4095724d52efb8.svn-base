<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
  <head>

    <title>我的上传</title>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>">
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>

<script type="text/javascript">
var currentpage = 1,
pagesize = 10,
count = -1;

$(document).ready(function(){
	loaddata(1);
});

function loaddata(page){
	if(count != -1 && ((currentpage-1) * pagesize) >= count){
		$('#more').attr('disabled',"true");
		$('#more').html("无更多数据");
	}else{
		$.ajax({
	       type: "post",
	       dataType: "json",
	       url: "<c:url value='/mine/myupload'/>",
	       data: {page:page, size:pagesize, d:new Date().getTime()},
	       beforeSend: function() {
	    	   $('#more').html("正在加载...");
	           $('#more').show();
		   },
	       success: function(data) {
	          count = data.count;
	          if (count == 0) {
	        	  $('#thelist').append("<li>暂无数据</li>");
				  $('#more').hide();
				  count = -1;
	          } else {
		          $('#more').html("更多");
		          $.each(data.list,function(index,collection){
		              if (collection.imgurl != null) {
		            	  var imgurlarray = collection.imgurl.split(',');
			        	  $('#thelist').append("<li class='zhedie' data-role='collapsible' data-iconpos='right' data-shadow='false' data-corners='false'>"
		   	        	  +"<h2>"+collection.name+"</h2>"
		   	          	  +"<img src='http://116.255.149.172:7080/wswhly/collection/"+imgurlarray[0]+"' class='ui-li-thumb' width='50%'>"
		   	        	  +"<fieldset class='myuploadclass' data-role='controlgroup' data-type='horizontal'>"
		   	  		        +"<label>藏品详情<input type='checkbox' onclick='scanCollection("+collection.id+")'></label>"
		   	  		        +"<label>删除<input type='checkbox' onclick='deleteUpload("+collection.id+")'></label>"
		   	  		      +"</fieldset>"
		   	        	  +"</li>");
		              } else {
			        	  $('#thelist').append("<li class='zhedie' data-role='collapsible' data-iconpos='right' data-shadow='false' data-corners='false'>"
			        	  +"<h2>"+collection.name+"</h2>"
			          	  +"<img src=<c:url value='/images/nopic.png'/> class='ui-li-thumb' width='30%' height='100%'>"
			        	  +"<fieldset class='myuploadclass' data-role='controlgroup' data-type='horizontal'>"
			  		        +"<label>藏品详情<input type='checkbox' onclick='scanCollection("+collection.id+")'></label>"
			  		        +"<label>删除<input type='checkbox' onclick='deleteUpload("+collection.id+")'></label>"
			  		      +"</fieldset>"
			        	  +"</li>");
		              }
		          });
	          }
			  $(".zhedie").collapsible();
	          $('#thelist').listview('refresh');
			  $(".myuploadclass").controlgroup();
	       }
		});
	}
}

function loadmore(){
    currentpage = currentpage + 1;
	loaddata(currentpage);
}

function scanCollection(id){
	location.href = "<c:url value='/collection/getCollection'/>?id="+id;
}

function deleteUpload(id){
	$('#deleteurl').attr('href',"<c:url value='/mine/deleteUpload'/>?id="+id);
	$("#deletedialog").popup();
	$("#deletedialog").popup('open');
}
</script>

  </head>

  <body>
  <div data-role="page">

	<jsp:include page="../head/header.jsp?name=我的上传"></jsp:include>

	<div role="main" class="ui-content">

	    <!-- 删除藏品提示框 -->
		<div data-role="popup" id="deletedialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">您确定要删除该藏品吗？</h3>
                <a id="deleteurl" data-ajax="false" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b">确定</a>
		        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b" data-rel="back">取消</a>
		    </div>
		</div>

        <ul id="thelist" data-role="listview" class="ui-listview-outer" data-inset="true">
        </ul>
    </div><!-- /content -->
<button id="more" class="ui-shadow ui-btn ui-corner-all" onclick="loadmore()">更多</button>
</div><!-- /page -->

  </body>
</html>
