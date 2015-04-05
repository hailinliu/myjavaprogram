<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
  <head>

    <title>我要上华豫</title>
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
	       url: "<c:url value='/vote/activityAllList'/>",
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
		        	  +"<h2 style='width:100%'>"+"<span style='float:left;'>"+collection.name+"</span>"+"<span style='float:right;color:#a10000;'>"+collection.votenum+"票</span></h2>"
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
	location.href = "<c:url value='/vote/gotoHyvote?id="+id+"&type=3'/>";
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
   		window.location.href="<c:url value='/vote/gotoupload'/>";

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
   		window.location.href="<c:url value='/redirect?p=/gotohyzm/myRelease'/>";

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

	<jsp:include page="../head/header.jsp?name=我要上华豫"></jsp:include>
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
                <a  onclick="location.href='<c:url value="/redirect?p=login"/>'" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" >确定</a>
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
	    <div class="ui-grid-b">
	    <div class="ui-block-a"><a href="#huodong" data-rel="dialog" data-transition="pop">活动介绍</a></div>
	    <div class="ui-block-b"><a href="#liucheng" data-rel="dialog" data-transition="pop">参与流程</a></div>
	    <div class="ui-block-c"><a href="#guize" data-rel="dialog" data-transition="pop">活动规则</a></div>
		</div>
        <ul id="thelist" data-role="listview" class="ui-listview-outer" data-inset="true">
        </ul>
    </div><!-- /content -->
<button id="more" class="ui-shadow ui-btn ui-corner-all" onclick="loadmore()">更多</button>

<div data-role="footer" data-position="fixed">
  <div data-role="navbar">
		<ul>
			<li><a href="#" data-iconpos="top" data-icon="home" onclick="send_cp();" data-ajax="false">发布</a></li>
			<li><a href="#" data-iconpos="top" data-icon="star" onclick="my_send();" data-ajax="false">我的发布</a></li>
			<li><a href="<c:url value="/index"/>" data-iconpos="top" data-icon="info" data-ajax="false">返回首页</a></li>
			<li><a href="<c:url value='/redirect?p=/gotohyzm/gotohyzm'/>" data-iconpos="top" data-icon="star" data-ajax="false">往期回顾</a></li>
		</ul>
	</div><!-- /navbar -->
</div>

</div><!-- /page -->

<div data-role="page" id="huodong">
    <div data-role="header">
		<h1>活动介绍</h1>
	</div>
  	<div role="main" class="ui-content">
    <p>“我要上华豫”是本站推出的一项藏品展示交流活动，每期通过投票的方式筛选出广大藏友最看好、最喜爱的 6 件藏品。被选藏品经藏家同意后可由官网埋单在海选期间由华豫专家进行鉴定。若是通过华豫专家团合议的真品，本站将负责推荐参与节目录制；我要上华豫意在通过投票、评论的互动方式，促进藏友之间的沟通交流，活跃藏友交流氛围，弘扬收藏文化。<br/>
欢迎参与活动、投票和评论！参与投票的藏友，每期均有抽奖和奖励。祝您好运！<br/>
当前投票期为201412期，投票获得前6名的藏品将可参加201412月海选活动。</p>
  	</div>
	 <a data-rel="back" class="ui-shadow ui-btn ui-corner-all">返回</a>
  </div>

<div data-role="page" id="liucheng">
    <div data-role="header">
		<h1>参与流程</h1>
	</div>
  	<div role="main" class="ui-content">
    <p>参与流程：<br/>
发布藏品 -- 等待投票 -- 投票结果 -- （若获得前6名）安排鉴定等事宜。<br/>
仅“星级及以上会员”才能发布藏品。<a href="<c:url value='/mine/gotovip'/>">我要去升级会员级别。</a><br/>
参与投票的藏友登陆后即可投票。每期针对每件藏品只能投票一次。<br/>
投票藏友的抽奖于每期投票结束后开始，并公布结果。<br/>
温馨提示： “我要上华豫”并非《华豫之门》海选报名渠道，如需海选报名，请进入,“海选报名”频道支付报名。</p>
  	</div>
	 <a data-rel="back" class="ui-shadow ui-btn ui-corner-all">返回</a>
  </div>

<div data-role="page" id="guize">
    <div data-role="header">
		<h1>活动规则</h1>
	</div>
  	<div role="main" class="ui-content">
    <p>1，活动按自然月进行，月初开始，月底结束。<br/>
2，被选藏品的鉴定安排在次月的海选活动时进行。<br/>
3，仅“星级及以上会员”才能发布藏品。我要去升级会员级别。<br/>
4，藏品发布后，可在藏品详情页进行3次藏品信息补充说明。<br/>
5，每期，每位“有发布资格的会员”最多可以发布5件藏品参与投票。<br/>
6，仅本站的注册会员才能进行投票。每人每期针对每件藏品只能投票一次。<br/>
7，投票结束后，得票最多的前6名获胜，获得“免费鉴定资格”。<br/>
8，投票结束后，从“得票最多的前6名”的投票总数中随机抽取6位幸运藏友，每人获得免费海选鉴定票 1 张。<br/>
9，当期投票未进入前6名的藏品，将在当期结束后清除信息，下期投票需重新发布藏品。</p>
  	</div>
	 <a data-rel="back" class="ui-shadow ui-btn ui-corner-all">返回</a>
  </div>

  </body>
</html>
