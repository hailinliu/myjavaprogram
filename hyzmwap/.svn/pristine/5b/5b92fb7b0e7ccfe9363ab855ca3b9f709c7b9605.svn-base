<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
  <head>
    
    <title>我的收藏</title>
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
		return false;
	}
	$.ajax({
       type: "post",
       dataType: "json",
       url: "<c:url value='/mine/mycollect'/>",
       data: {page:page, size:pagesize, d:new Date().getTime()},
       success: function(data) {
          count = data.count;
          if (count == 0) {
        	  $('#thelist').append("<li>暂无数据</li>");
			  $('#more').remove();
          }
          $.each(data.list,function(index,collection){
              if (collection.imgurl != null) {
	        	  var imgurlarray = collection.imgurl.split(',');
	        	  $('#thelist').append("<li><a data-ajax='false' href=<c:url value='/collection/getCollection?id="+collection.id+"'/>>"
	          	  +"<img src='http://116.255.149.172:7080/wswhly/collection/"+imgurlarray[0]+"' class='ui-li-thumb' width='30%' height='100%'>"
	        	  +"<h2>"+collection.name+"</h2></a></li>");
              } else {
	        	  $('#thelist').append("<li><a data-ajax='false' href=<c:url value='/collection/getCollection?id="+collection.id+"'/>>"
	          	  +"<img src=<c:url value='/images/nopic.png'/> class='ui-li-thumb' width='30%' height='100%'>"
	        	  +"<h2>"+collection.name+"</h2></a></li>");
              }
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
  <div data-role="page">

	<jsp:include page="../head/header.jsp?name=我的收藏"></jsp:include>

	<div role="main" class="ui-content">

        <ul id="thelist" data-role="listview" data-inset="true">
        </ul>

    </div><!-- /content -->
<button id="more" class="ui-shadow ui-btn ui-corner-all" onclick="loadmore()">更多</button>
</div><!-- /page -->
  
  </body>
</html>
