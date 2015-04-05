<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html><html>
  <head>

    <title>会员藏品区</title>
	<meta charset="utf-8">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
	<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>

	<script type="text/javascript">
var currentpage = 1,
pagesize = 10,
count = -1,
order = 2;

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
	       url: "<c:url value='/vote/vipCollectionList'/>",
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
		          $.each(data.list,function(index,hycp){
		        	  var imgurlarray = hycp.imgurl.split(',');
		        	  $('#thelist').append("<li><a data-ajax='false' href='<c:url value='/vote/gotoHyvip?id="+hycp.id+"&type=4'/>'>"
			          	+"<img src='http://116.255.149.172:7080/wswhly/voteactivity/"+imgurlarray[0]+"' width='80' height='80' />"
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

function scanCollection(id){
	location.href = "<c:url value='/vote/gotoHyvip?id="+id+"&type=4'/>";
}

//发布判断
function send_cp(){

	// login_btn('发布需先登录，请登录。若未在本站注册，请先注册。','','1');

	//请注意 ：判断登陆函数 已写到JS  直接调用 login_btn(message1,ahref1,state1)
	if('${CurrentSession}' == ''){
	 	$("#sendcpdialog").popup();
    	$("#sendcpdialog").popup('open');
	 	return false;
	 }else{
	 	var ss='${CurrentSession.level}';
	 	if(ss>0){
   		window.location.href="<c:url value='/vote/gotovipupload'/>";

	   }else{
	   		$("#sendvipcpdialog").popup();
	    	$("#sendvipcpdialog").popup('open');
	        return false;
	   }
	 }

}

// 查看我的发布
function my_send(){

	if('${CurrentSession}' == ''){
	 	$("#mycpdialog").popup();
    	$("#mycpdialog").popup('open');
	 	return false;
	 }else{
	 	var ss='${CurrentSession.level}';
	 	if(ss>0){
   		window.location.href="<c:url value='/redirect?p=/vipcollection/myRelease'/>";

	   }else{
	   		$("#myvipcpdialog").popup();
	    	$("#myvipcpdialog").popup('open');
	        return false;
	   }
	 }

}

</script>
  </head>

  <body>



	<div data-role="page">
	<jsp:include page="../head/header.jsp?name=会员藏品区"></jsp:include>
	<div role="main" class="ui-content">
	    <!-- 发布提示框 -->
		<div data-role="popup" id="cendcpdialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">发布藏品，请先登录。 若无账户，请先注册。</h3>
                <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" data-rel="back">确定</a>
		    </div>
		</div>

	    <!-- 我的发布提示框 -->
		<div data-role="popup" id="mycpdialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">查看我的发布请先登录。 若无账户，请先注册。</h3>
                <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" data-rel="back">确定</a>
		    </div>
		</div>

	    <!-- 星级发布提示框 -->
		<div data-role="popup" id="sendvipcpdialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">对不起，仅“星级及以上会员”才能在此页面发布藏品。</h3>
                <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" data-rel="back">确定</a>
		    </div>
		</div>

	    <!-- 星级我的发布提示框 -->
		<div data-role="popup" id="myvipcpdialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">对不起，仅“星级及以上会员”才能查看我的发布！</h3>
                <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" data-rel="back">确定</a>
		    </div>
		</div>
		<p align="center"><a href="#huodong" data-rel="dialog" data-transition="pop">“ 会员藏品区 ”活动介绍</a></p>
        <ul id="thelist" data-role="listview" class="ui-listview-outer" data-inset="true">
        </ul>
    </div><!-- /content -->
<button id="more" class="ui-shadow ui-btn ui-corner-all" onclick="loadmore()">更多</button>

<div data-role="footer" data-position="fixed">
  <div data-role="navbar">
		<ul>
			<li><a href="#" data-iconpos="top" data-icon="home" data-ajax="false" onclick="send_cp();">发布</a></li>
			<li><a href="#" onclick="my_send();" data-iconpos="top" data-icon="star" data-ajax="false">我的发布</a></li>
			<li><a href="<c:url value="/index"/>" data-iconpos="top" data-icon="info" data-ajax="false">返回首页</a></li>

		</ul>
	</div><!-- /navbar -->
</div>

</div><!-- /page -->

<div data-role="page" id="huodong">
    <div data-role="header">
		<h1>活动介绍</h1>
	</div>
  	<div role="main" class="ui-content">
    <p>会员藏品区专为本站会员而设立，可上传自己的收藏精品，供藏友展览交流，以物会友。<br />
不同的会员级别上传藏品件数有限制：<br />
星级会员，最多可上传2件。<br />
贵宾会员，最多可上传4件。<br />
高级会员，最多可上传6件。<br />
超级会员，最多可上传8件。<br />
为了更加详细的展示您的藏品，请上传时尽量完善藏品的详细介绍和联系方式等各项信息。</p>
  	</div>
	 <a data-rel="back" class="ui-shadow ui-btn ui-corner-all" >返回</a>
  </div>

  </body>
</html>
