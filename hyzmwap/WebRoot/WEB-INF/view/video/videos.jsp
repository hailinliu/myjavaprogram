<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>专家讲坛</title>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>">
	<link rel="stylesheet" href="<c:url value='/css/listview-grid.css'/>">
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
		return false;
	}
	$.ajax({
       type: "post",
       dataType: "json",
       url: "<c:url value='/video/getVideoList'/>",
       data: {page:page, size:pagesize, d:new Date().getTime()},
       success: function(data) {
          count = data.count;
          if (count == 0) {
        	  $('#thelist').append("<li>暂无数据</li>");
			  $('#more').remove();
          }
          $.each(data.list,function(index, video){
        	  var imgurlarray = video.imgurl.split(',');
        	  $('#thelist').append("<li><a data-ajax='false' href='<c:url value='/video/getVideo?id="+video.id+"'/>'>"
	          	+"<img src='<c:url value='"+imgurlarray[0]+"'/>' width='80' height='80' />"
	        	+"<h2>"+video.title+"</h2>"
	            +"</a></li>");
          });
          $('#thelist').listview('refresh');
       }
	});
}

function loadmore(){
    currentpage = currentpage + 1;
	loaddata(currentpage);
}

</script>
  </head>
  
  <body>
  
  <div data-role="page" data-theme="b" id="demo-page" class="my-page">

	<jsp:include page="../head/header.jsp?name=专家讲坛"></jsp:include>

	<div role="main" class="ui-content">
	    
        <ul id="thelist" data-role="listview" data-inset="true">
        </ul>

    </div><!-- /content -->
<button id="more" class="ui-shadow ui-btn ui-corner-all" onclick="loadmore()">更多</button>
</div><!-- /page -->

  </body>
</html>
