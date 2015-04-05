<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html style="height: 110px; ">
<head>

<title>网拍预展</title>
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
pricearea = null,
specialID = null,
ly=1,
count = -1;

$(function(){
	loaddata(1);
	$('#mySelect2').change(function(){
		pricearea = $("#mySelect2  option:selected").val();
		$('#thelist').empty();
		currentpage = 1;
		loaddata(currentpage);
	});
	$('#mySelect1').change(function(){
		specialID = $("#mySelect1  option:selected").val();
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
	       url: "<c:url value='/collect/getlylots'/>",
	       data: {page:page, size:pagesize, specialID:specialID, pricearea:pricearea},
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
		        	  var image = info.image.split(',');

		        	  $('#thelist').append("<li><a data-ajax='false' href=<c:url value='/collect/getlylotsById?id="+info.id+"'/>>"
			          	+"<img src='http://116.255.149.172:7080/wswhly/zengjipaipin/"+info.image.split(',')[0]+"' width=80 height=80/>"
			        	+"<h2>"+info.name+"</h2>"
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
function getlylots(specialID,ly,pricearea){
  var url="<c:url value='/collect/getlylotslist'/>?specialID="+specialID+"&ly="+1;
  if(pricearea!=''&&pricearea.length>0){
  url+="&pricearea="+pricearea;
  }
  window.location.href=url;
}
</script>
</head>

<body>
	<div data-role="page">
	<jsp:include page="../head/header.jsp?name=拍卖预展"></jsp:include>
		<div id="imageid"></div>
		<div role="main" class="ui-content">

		    <div class="ui-field-contain">
			    <select id="mySelect1" onchange='getlylots(this.options[this.selectedIndex].value)'>
			         <option value="">请选择网拍专场</option>
                     <option value="3" <c:if test="${3==specialID}">selected</c:if>>国画精粹-11月21日在淘宝网开拍</option>
				     <option value="2" <c:if test="${2==specialID}">selected</c:if>>古瓷集萃-11月在淘宝网开拍</option>
				     <option value="1" <c:if test="${1==specialID}">selected</c:if>>佛器玄览-11月在淘宝网开拍</option>
				     <option value="4" <c:if test="${4==specialID}">selected</c:if>>传世玉饰-11月在淘宝网开拍</option>
			    </select>
			</div>
			 	 <div class="ui-field-contain">
			    <select id="mySelect2" onchange='getlylots(this.options[this.selectedIndex].value)'>
			         <option value="">价格区间</option>
                     <option value="0" <c:if test="${pricearea==0}">selected</c:if>>5万以内</option>
				     <option value="1" <c:if test="${pricearea==1}">selected</c:if>>5至10万</option>
				     <option value="2" <c:if test="${pricearea==2}">selected</c:if>>10至20万</option>
				     <option value="3" <c:if test="${pricearea==3}">selected</c:if>>20至50万</option>
				     <option value="4" <c:if test="${pricearea==4}">selected</c:if>>50至100万</option>
				     <option value="5" <c:if test="${pricearea==5}">selected</c:if>>100万以上</option>
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
