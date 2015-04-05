<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>珍宝台藏品</title>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>">
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>

<script type="text/javascript">
var currentpage = 1,
pagesize = 10,
typeid = 3,
styleid = 0,
count = -1;

$(document).ready(function(){
	loaddata(1);
	$('#mySelect3').change(function(){
		styleid = $("#mySelect3  option:selected").val();
		$('#thelist').empty();
		currentpage = 1;
		loaddata(currentpage);
	});
});

function loaddata(page){
	if(count != -1 && ((currentpage-1) * pagesize) >= count){
		$('#more').attr('disabled',"true");
		$('#more').html("无更多数据");
	}else{
		$.ajax({
	       type: "post",
	       dataType: "json",
	       url: "<c:url value='/collection/getZjcp'/>",
	       data: {page:page, size:pagesize, d:new Date().getTime(), typeid:typeid, styleid:styleid},
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
		          $.each(data.list,function(index,hycp){
		        	  var imgurlarray = hycp.imgurl.split(',');
		        	  $('#thelist').append("<li><a data-ajax='false' href='<c:url value='/collection/getCollectionus?id="+hycp.id+"'/>'>"
			          	+"<img src='<c:url value='"+imgurlarray[0]+"'/>' width='80' height='80' />"
			        	+"<h2>"+hycp.name+"</h2>"
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

</script>
  </head>
  
  <body>
  
  <div data-role="page">
<jsp:include page="../head/header.jsp?name=专家推荐藏品"></jsp:include>

	<div role="main" class="ui-content">
	
	    <div class="ui-field-contain">
		    <select id="mySelect3">
		        <option value="0">全部</option>
		        <c:forEach items="${liststyle}" var="style">
			       <option value="${style.id}" <c:if test="${type eq style.id}">selected</c:if>>${style.name}</option>
			    </c:forEach>
		    </select>
		</div>

        <ul id="thelist" data-role="listview" data-inset="true">
        </ul>

    </div><!-- /content -->
   <button id="more" class="ui-shadow ui-btn ui-corner-all" onclick="loadmore()">更多</button>
</div><!-- /page -->
  
  </body>
</html>
