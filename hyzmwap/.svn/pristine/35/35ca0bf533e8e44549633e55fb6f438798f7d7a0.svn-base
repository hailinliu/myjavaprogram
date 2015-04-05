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
pagesize = 10000,
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
	       url: "<c:url value='/onlinepic/myUpOlinePic'/>",
	       data: {page:page,pageSize:pagesize, d:new Date().getTime()},
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
		          var cons="";
		          $.each(data.list,function(index,collection){
		            	  var imgurlarray = collection.pic.split(',');
			        	  cons+="<li class='zhedie' data-role='collapsible' data-iconpos='right' data-shadow='false' data-corners='false'>";
		   	        	  cons+="<h2>"+collection.name+"("+getState(collection.id,collection.state,collection.thcs)+")</h2>";
		   	          	  cons+="<img width='100px'  src='http://admin.wswhly.com/zengjipaipin/"+imgurlarray[0]+"' class='ui-li-thumb' width='50%'>";
		   	        	  cons+="<fieldset class='myuploadclass' data-role='controlgroup' data-type='horizontal'>";
		   	  		       cons+="<label>藏品鉴定详情<input type='checkbox' onclick='todetail("+collection.id+")'></label>";
		   	  		        if(collection.state==3||collection.state==4||collection.state==5){
			   	  		         if(collection.thcs<3){
			   	  		       		cons+="<label>修改<input type='checkbox' onclick='toupdate("+collection.id+")'></label>";
			   	  		         }else{
			   	  		           cons+="<label>您的3次修改机会已用完！<input type='checkbox' ></label>";
			   	  		         }
		   	  		         }
		   	  		      cons+="</fieldset>"
		   	        	  cons+="</li>";
		          });
		          $('#thelist').append(cons)
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
function todetail(id){
	location.href = "<c:url value='/onlinepic/olinePicByid?id='/>"+id;
}

function toupdate(id){
	location.href = "<c:url value='/onlinepic/gotoolinePicupdate?id='/>"+id;
}


function getState(id,state,thcs){
var rs="";
	if(state==1){return "待鉴定";}
	if(state==2){return "正在鉴定";}
	if(state==3){
		rs="审核未通过，图片清晰度不够，请修改!";
		return rs;
	}
	if(state==4){
		rs=" 审核未通过，该藏品所选门类与实际不符，请修改!";
		return rs;
	}
	if(state==5){
		rs=" 审核未通过，请您核对藏品数量,请修改!";
		return rs;
	}
	if(state==6){return "正在鉴定";}
	if(state==8){return "已鉴定";}
	if(state==9){return "待鉴定";}
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
		</div>

        <ul id="thelist" data-role="listview" class="ui-listview-outer" data-inset="true">
        </ul>
    </div><!-- /content -->
<button id="more" class="ui-shadow ui-btn ui-corner-all" onclick="loadmore()">更多</button>

<div data-role="footer" data-position="fixed">
	<div data-role="navbar">
		<ul>
			<li><a href="<c:url value='/index'/>" data-iconpos="top" data-icon="home" data-ajax="false">首页</a></li>
			<li><a href="<c:url value='/redirect?p=/mine/recharge'/>" data-iconpos="top" data-icon="star" data-ajax="false">充值</a></li>

			<li><a href="<c:url value='/onlinepic/gotoonlinepicupload'/>" data-iconpos="top" data-icon="star" data-ajax="false">我要上传</a></li>
		</ul>
	</div><!-- /navbar -->
  </div><!-- /footer -->
</div><!-- /page -->

  </body>
</html>
