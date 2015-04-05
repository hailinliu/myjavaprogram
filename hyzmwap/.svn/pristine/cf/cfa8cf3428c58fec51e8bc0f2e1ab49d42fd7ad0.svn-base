<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html style="height: 110px; ">
<head>

<title>店铺列表</title>
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
pagesize =10,
mainscope =null,
count = -1;

$(function(){
	loaddata(1);
	$('#mainscope').change(function(){
		mainscope = $("#mainscope  option:selected").val();
		$('#thelist').empty();
		currentpage = 1;
		pagesize =10;
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
	       url: "<c:url value='/BaiBao_getShopForList'/>",
	       data: {page:page, pageSize:pagesize, mainscope:mainscope},
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
		        	  var image = info.img.split(',');
		        	  $('#thelist').append("<li><a data-ajax='false' href=<c:url value='/BaiBao_getShop?id="+info.id+"'/>>"
			          	+"<img src='http://116.255.149.172:7080/wswhly/Baibaourl/"+info.img.split(',')[0]+"' width=80 height=80/>"
			        	+"<h2>"+info.shopname+"</h2>"
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

<body >
	<div data-role="page">
	<jsp:include page="../head/header.jsp?name=店铺列表"></jsp:include>
		<div id="imageid"></div>
		<div role="main" class="ui-content">
		    <div class="ui-field-contain">
			    <select id="mainscope" >
			         <option value="">全部</option>
                     <option value="14" <c:if test="${14==type}">selected</c:if>>瓷器陶器</option>
				     <option value="15" <c:if test="${15==type}">selected</c:if>>玉器赏石</option>
				     <option value="16" <c:if test="${16==type}">selected</c:if>>青铜佛像</option>
				     <option value="17" <c:if test="${17==type}">selected</c:if>>书画古籍</option>                    
                     <option value="18" <c:if test="${18==type}">selected</c:if>>木器雕品</option>
				     <option value="19" <c:if test="${19==type}">selected</c:if>>古币钱币</option>
				     <option value="20" <c:if test="${20==type}">selected</c:if>>珠宝首饰</option>
				     <option value="21" <c:if test="${21==type}">selected</c:if>>油画雕塑</option>
                     <option value="22" <c:if test="${22==type}">selected</c:if>>邮票邮品</option>
				     <option value="23" <c:if test="${23==type}">selected</c:if>>其他藏品</option>
                     
			    </select>
			</div>
	        <ul id="thelist" data-role="listview" data-inset="true">
	        </ul>

    </div><!-- /content -->
      <button id="more" class="ui-shadow ui-btn ui-corner-all" onclick="loadmore()">更多</button>
	</div>
	<!-- /page -->
</body>
</html>
