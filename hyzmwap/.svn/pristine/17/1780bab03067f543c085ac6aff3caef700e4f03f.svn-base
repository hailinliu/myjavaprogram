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
	       url: "<c:url value='/yclots/getYclots'/>",
	       data: {page:page, pagesize:pagesize, specialID:<%=request.getParameter("specialID")%>},
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

		          $.each(data.list,function(index,yclots){
		            var image = yclots.image.split(',')[0];
		             if(yclots.cjprice!=null&&yclots.cjprice!='null'&&yclots.cjprice!=''){
		            		 $('#thelist').append("<li><a data-ajax='false' href='<c:url value='/yclots/getYclotsListByid?id="+yclots.id+"'/>'>"
				          	+"<img src='http://116.255.149.172:7080/wswhly/zengjipaipin/"+image+"' width='80' height='80' />"
				        	+"<h2 style='width:100%'>"+"<span style='float:left;'>"+yclots.name+"</span>"+"<span style='float:right;color:#a10000;font-size:.8em'> 成交价："+yclots.cjprice+"</span></h2>"
			            	+"</a></li>");
		             }else{
			        	    $('#thelist').append("<li><a data-ajax='false' href='<c:url value='/yclots/getYclotsListByid?id="+yclots.id+"'/>'>"
				          	+"<img src='http://116.255.149.172:7080/wswhly/zengjipaipin/"+image+"' width='80' height='80' />"
				        	+"<h2 style='width:100%'>"+"<span style='float:left;'>"+yclots.name+"</span>"+"<span style='float:right;color:#a10000;font-size:.8em'> 估价："+yclots.price+"</span></h2>"
			            	+"</a></li>");
			           }

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
loaddata(currentpage);
     })



</script>
</head>

<body>
	<div data-role="page">
	<jsp:include page="../head/header.jsp?name=${title}"></jsp:include>
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
