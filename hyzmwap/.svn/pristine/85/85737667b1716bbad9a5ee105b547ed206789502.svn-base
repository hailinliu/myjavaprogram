<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>

<title>拍卖预展</title>
<meta charset="utf-8">
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>">
<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
<style type="text/css">
.ui-page { -webkit-backface-visibility: hidden; }
</style>
<script type="text/javascript">
var currentpage = 1,
pagesize = 10,
count = -1;
var specialID=-1;
function loaddata(page){
	if(count != -1 && ((currentpage-1) * pagesize) >= count){
		$('#more').attr('disabled',"true");
		$('#more').html("无更多数据");
	} else {
		$.ajax({
	       type: "post",
	       dataType: "json",
	       url: "<c:url value='/onlinepic/onlinePiclist'/>",
	       data: {page:page, pagesize:pagesize, isshangpai:${isshangpai}},
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

		          $.each(data.list,function(index,info){
		            var image = info.pic.split(',')[0];
			        	    $('#thelist').append("<li><a href='<c:url value='/onlinepic/olinePicByinfo'/>?id="+info.id+"'><img src='http://admin.wswhly.com/zengjipaipin/"+image+"' width='80' height='80' />"
				        	+"<h2 style='width:100%'>"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style='float:left;'>"+info.name+"</span>"+"<span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span ></span><span style='float:right;color:#a10000;font-size:.8em'> </span></h2>"
			            	+"</a></li>");

		          });
	          }
	          $('#thelist').listview('refresh');
	       }
		});
	}
}

function loadmore(){
    currentpage = currentpage + 1;
	loaddata(currentpage);
}

$(function(){
	loaddata(1);
	$('#isshangpai').change(function(){
		$('#thelist').empty();
		currentpage = 1;
		pagesize =10;
		loaddata(currentpage);
	});
});

</script>
</head>

<body>
	<div data-role="page">
	<script>
	function memu(){
		var memu = $("#memu option:selected").val();
		if(memu == 1){
			location.href="/hyzmwap/user/UserCenter";
		}
		if(memu == 2){
			location.href="/hyzmwap/index";
		}
		if(memu == 3){
			location.reload();
		}
	}
	function test(){
		alert(123);
	};
</script>
<style type="text/css">
h1 {
	font-size: 1.3em;
	padding: 10px 10px;
	margin: 0;
}

</style>
<div data-role="header" data-position="fixed" class="ui-header ui-bar-inherit ui-header-fixed slidedown">
	<h1 class="ui-title" role="heading" aria-level="1"><c:if test="${3==isshangpai}">国外大排行送拍藏品展示</c:if><c:if test="${4==isshangpai}">国内大排行送拍藏品展示</c:if><c:if test="${5==isshangpai}">淘宝平台网拍藏品展示</c:if><c:if test="${6==isshangpai}">华豫官网微拍藏品展示</c:if></h1>
  </div>
	
		<div id="imageid"></div>
		<div role="main" class="ui-content">
 			 
		    <div class="ui-field-contain">
	        <ul id="thelist" data-role="listview" data-inset="true">
	        </ul>

    </div><!-- /content -->
      <button id="more" class="ui-shadow ui-btn ui-corner-all" onclick="loadmore()">更多</button>
	</div>
	<!-- /page -->
</body>
</html>
