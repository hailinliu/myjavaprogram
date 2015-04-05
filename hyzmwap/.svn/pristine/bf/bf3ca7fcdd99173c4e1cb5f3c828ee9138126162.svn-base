<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html><html>
  <head>

    <title>珍品征集令</title>
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
	       url: "<c:url value='/vote/collectAllList'/>",
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
		          $.each(data.list,function(index,collection){
	            	  var imgurlarray = collection.imgurl.split(',');
		        	  $('#thelist').append("<li class='zhedie' data-role='collapsible' data-iconpos='right' data-shadow='false' data-corners='false'>"
		        	  +"<h2 style='width:100%'>"+collection.name+"<span style='float:right'>"+collection.votenum+"票</span></h2>"
	   	          	  +"<img src='http://116.255.149.172:7080/wswhly/voteactivity/"+imgurlarray[0]+"' class='ui-li-thumb' width='80' height='80'>"
	   	        	  +"<fieldset class='myuploadclass' data-role='controlgroup' data-type='horizontal'>"
	   	  		        +"<label>藏品详情<input type='checkbox' onclick='scanCollection("+collection.id+")'></label>"
	   	  		        +"<label>投票<input type='checkbox' onclick='vote("+collection.id+")'></label>"
	   	  		      +"</fieldset>"
	   	        	  +"</li>");
		          });
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

function scanCollection(id){
	location.href = "<c:url value='/vote/gotoHygem?id="+id+"&type=3'/>";
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
	 	if(ss>1){
   		window.location.href="<c:url value='/vote/gotocollectupload'/>";

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
	 	if(ss>1){
   		window.location.href="<c:url value='/redirect?p=/gemcoll/myRelease'/>";

	   }else{
	   		$("#myvipcpdialog").popup();
	    	$("#myvipcpdialog").popup('open');
	        return false;
	   }
	 }

}

function vote(collectionid) {
	if('${CurrentSession}' == ''){
	 	alert("参与投票请先登录。");
	 	location.href = "<c:url value='/redirect?p=login'/>";
	 	return false;
	 }else{
	 	$.ajax({
        type:'post',
        url:"<c:url value='/vote/vote'/>",
        data:{ collectionid:collectionid
        },
        success:function(data){
        	if(data == '0000'){
        		$('#votesuccesscontentid').html("投票成功！");
        		$("#votesuccessdialog").popup();
            	$("#votesuccessdialog").popup('open');
        	}else{
        		$('#votecontentid').html(data);
        		$("#votedialog").popup();
            	$("#votedialog").popup('open');
        	}
	        }
		});
	 }

}

function orderByNewest(){
	currentpage = 1;
	order = 1;
	loaddata(currentpage);
}

function orderByTicket(){
	currentpage = 1;
	order = 2;
	loaddata(currentpage);
}

</script>
  </head>

  <body>



	<div data-role="page">

	<jsp:include page="../head/header.jsp?name=珍品征集令"></jsp:include>

	<div role="main" class="ui-content">
	    <!-- 投票提示框-->
		<div data-role="popup" id="votedialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 id="votecontentid" class="ui-title"></h3>
		        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" data-rel="back">确定</a>
		    </div>
		</div>

		<!-- 投票成功提示框-->
		<div data-role="popup" id="votesuccessdialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 id="votesuccesscontentid" class="ui-title"></h3>
		        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" onclick="location.reload();">确定</a>
		    </div>
		</div>

		<!-- 发布提示框 -->
		<div data-role="popup" id="sendcpdialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">发布藏品，请先登录。</h3>
                <a onclick="location.href='<c:url value="/redirect?p=login"/>'" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" >确定</a>
		    </div>
		</div>

	    <!-- 我的发布提示框 -->
		<div data-role="popup" id="mycpdialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">查看我的发布请先登录。</h3>
                <a onclick="location.href='<c:url value="/redirect?p=login"/>'" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" >确定</a>
		    </div>
		</div>

	    <!-- 星级发布提示框 -->
		<div data-role="popup" id="sendvipcpdialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">对不起，仅“旗舰商家和贵宾及以上会员”才能在此页面发布藏品。</h3>
                <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" data-rel="back">确定</a>
		    </div>
		</div>

	    <!-- 星级我的发布提示框 -->
		<div data-role="popup" id="myvipcpdialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">对不起，仅“旗舰商家和贵宾及以上会员”才能查看我的发布！</h3>
                <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" data-rel="back">确定</a>
		    </div>
		</div>
		<p align="center"><a href="#huodong" data-rel="dialog" data-transition="pop">“ 珍品征集令 ”活动介绍</a></p>
        <ul id="thelist" data-role="listview" class="ui-listview-outer" data-inset="true">
        </ul>
    </div><!-- /content -->
<button id="more" class="ui-shadow ui-btn ui-corner-all" onclick="loadmore()">更多</button>

<div data-role="footer" data-position="fixed">
  <div data-role="navbar">
		<ul>
			<li><a href="#" onclick="send_cp();" data-iconpos="top" data-icon="home" data-ajax="false">发布</a></li>
			<li><a href="#" onclick="my_send();" data-iconpos="top" data-icon="star" data-ajax="false">我的发布</a></li>
			<li><a href="<c:url value="/index"/>" data-iconpos="top" data-icon="info" data-ajax="false">返回首页</a></li>
			<li><a href="<c:url value='/redirect?p=/gemcoll/gotogem'/>" data-iconpos="top" data-icon="star" data-ajax="false">往期回顾</a></li>
		</ul>
	</div><!-- /navbar -->
</div>

</div><!-- /page -->

<div data-role="page" id="huodong">
    <div data-role="header">
		<h1>活动介绍</h1>
	</div>
  	<div role="main" class="ui-content">
    <p>本站现面向广大藏家朋友，诚挚征集“市价过百万的收藏珍品”。经广大藏友投票后，得票最高的前 6 件藏品，征得藏家同意后可由官网埋单在海选期间请华豫专家团进行鉴定，专家合议确定为珍品的，官网将负责推荐登上《华豫之门》珍宝台。另外藏品还将享有本站免费提供的“大型拍卖会送拍”服务。<br/>
	该活动，仅旗舰商家，和贵宾及以上会员方可发布。<br/>
	轻风拂尘，珍品现世；<br/>
	宝剑深藏已久，总该出鞘了吧！</p>

  	</div>
	 <a data-rel="back" class="ui-shadow ui-btn ui-corner-all">返回</a>
  </div>

  </body>
</html>
