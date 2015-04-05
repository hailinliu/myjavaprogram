<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>

<title>收藏资讯</title>
<meta charset="utf-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>">
<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
<script type="text/javascript">
var currentpage = 1,
pagesize = 10,
styleid = "${styleid}",
count = -1;

$(document).ready(function(){
	loaddata(1);
	$('#mySelect').change(function(){
		styleid = $("#mySelect  option:selected").val();
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
	       url: "<c:url value='/news/getCollectionInfo'/>",
	       data: {page:page, size:pagesize, d:new Date().getTime(), styleid:styleid},
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
		          $.each(data.list,function(index,news){
		        	  $('#thelist').append("<li><a data-ajax='false' href='<c:url value='/news/getOneNews?id="+news.id+"'/>'>"
			        	+"<h2>"+news.title+"</h2>"
			        	+"<p>"+news.createdate+"</p>"
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
	<div data-role="page" id="demo-page" class="my-page">
	<jsp:include page="../head/header.jsp?name=收藏资讯"></jsp:include>
		
		<div role="main" class="ui-content">
	
		    <div class="ui-field-contain">
			    <select id="mySelect">
			        <option value="">全部</option>
			        <c:forEach items="${nesStyleList}" var="style">
			        <c:choose><c:when test="${style.id!=214&&style.id!=215&&style.id!=216}">
				       <option value="${style.id}" <c:if test="${type eq style.id}">selected</c:if>>${style.name}</option>
				       </c:when> </c:choose>
				    </c:forEach>
			    </select>
			</div>
	
	        <ul id="thelist" data-role="listview" data-inset="true">
	        </ul>

    </div><!-- /content -->
      <button class="ui-shadow ui-btn ui-corner-all" onclick="loadmore()">更多</button>
	</div>
	<!-- /page -->
</body>
</html>
