<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>已上传藏品</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<style type="text/css">
body {padding: 0;margin: 0;background: #fff;font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;color: #444340;}
h1 {font-size: 1.3em;padding: 10px 10px;margin: 0;}
img {border: none;}
a {color: #444340;}

#MainContent {background: #ffffff;padding-bottom: 30px;}
#Footer {padding: 10px;border-top: none;}
.ui-page {-webkit-backface-visibility: hidden;}
.cpList {margin:0 auto;text-align: left;}
.cpList ul {list-style: none; padding:0; margin:0;}
.cpList ul li {padding: 20px 0;border-bottom: dashed 1px #bbb;}
.cpList ul li:first-child{ padding:0 0 20px 0}
.cpList .imgA {display: block;float: left;}
.cpInfo {float: left;margin: 0 0 12px 12px;line-height: 1.2;font-size: 14px}
.cpInfo P{ padding:0; margin:0 0 12px 0}
.cpInfo span {margin-right: 24px}
.cpSetting {clear: both;padding-top:1em;}
.cpSetting a {text-decoration: none;margin-right: 1em;font-size:.9em;padding: 6px; background:#fff;}
</style>
<link href="<c:url value='/css/photoswipe.css'/>" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.6.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/simple-inheritance.min.js'/>"></script>
<meta charset="utf-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>">
<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
<!-- NOTE: including the jQuery engine version -->
<script type="text/javascript" src="<c:url value='/jquery/code-photoswipe-jQuery-1.0.11.min.js'/>"></script>
<script type="text/javascript">
var currentpage = 1,
pagesize = 6,
count = -1;
$(function(){
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
	       url: "<c:url value='BaiBaoMine_getShopList'/>",
	       data: {page:page, size:pagesize},
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
	          	    var str="";
	          	    str+="<li><a class='imgA' data-ajax='false' href=<c:url value='/BaiBao_getCollection?redirect=baibaoxiang/cpInfo&id="+info.id+"'/>>"+"<img src='http://116.255.149.172:7080/wswhly/Baibaourl//"+info.imgurl.split(',')[0]+"' width=\"100px\" height=\"100px\"/></a><div class='cpInfo'><p><strong>"+info.name+"</strong></p>";
	          	    if(info.state==1) {
	          	    	str+="<p>审核中</p>";
	          	    }else if(info.state==2){
	          	     str+="<p>待售</p>";
	          	    }else if(info.state==3){
	          	     str+="<p>正在交易中转</p>";
	          	    }else{
	          	     str+="<p>已售罄</p>";
	          	    }
	          	    str+="</div>";

	          	    str+="<div class=\"cpSetting\">";
	          	    str+="<a class='ui-bar-a btn btn-positive  ui-corner-all ui-shadow' style='color:#666;font-weight:normal' href=<c:url value='/BaiBao_getCollection?redirect=baibaoxiang/cpInfo&id="+info.id+"'/>>查看</a>";
			         if(info.state==1){
			          str+="<a class='ui-bar-a btn btn-positive  ui-corner-all ui-shadow' style='color:#666;font-weight:normal' href=\"javascript:void(0)\" onclick=\"deleteUpload("+info.id+" )\">删除</a>";
			         }
			         if(info.state!=1){
			          str+="<a class='ui-bar-a btn btn-positive  ui-corner-all ui-shadow' style='color:#666;font-weight:normal' href=\"javascript:alert('审核通过不能删除!') \">删除</a>";
			         }
			          if(info.state==1){
			          str+="<a class='ui-bar-a btn btn-positive  ui-corner-all ui-shadow' style='color:#666;font-weight:normal' href='<c:url value='/gotoBaiBaoMine_UpdateCollection?id="+info.id+"'/>' >修改</a>";
			         }
			         if(info.state!=1){
			          str+="<a class='ui-bar-a btn btn-positive  ui-corner-all ui-shadow' style='color:#666;font-weight:normal' href=\"javascript:alert('审核通过不能修改!')\" >修改</a>";
			         }
		             if (info.state==1||info.state==2){
		              if (info.opentrade ==1){
		                str+="<a class='ui-bar-a btn btn-positive  ui-corner-all ui-shadow' style='color:#666;font-weight:normal' href=\"javascript:void(0)\" onclick='closeCollection("+info.id+")'>关闭交易中转</a>";
		              }
		             }
		             if (info.opentrade==null||info.opentrade==2){
		                str+="<a class='ui-bar-a btn btn-positive  ui-corner-all ui-shadow' style='color:#666;font-weight:normal' href=\"javascript:void(0)\" onclick='openCollection("+info.id+")'>开启交易中转</a>";
		              }
		               str+="</div></li>";
		                $('#thelist').append(str);
		          });
	          }
	          $('#thelist').listview('refresh');
	       }
		});
	}
}
function deleteUpload(value) {
    if (confirm("确认要删除该藏品！")) {
		  $.ajax({
	         type:'post',
	         url:"<c:url value='/BaiBaoMine_DeleteCollection'/>?id="+value,
	         success:function(data){
	         var jsonData = eval(data);
	         if(data=='0000'){
	         	alert("删除成功！");
	         	location.reload();
	         }else{
	         	alert(data);
	         }
	        }
	     });
    }
}
function openCollection(id) {
	if (confirm("确认要开启该藏品的交易中转吗？ 确定将代表您同意交易中转！")) {
		  $.ajax({
	         type:'post',
	         url:"<c:url value='/BaiBaoMine_OpenCollection'/>?opentrade=1&id="+id,
	         success:function(data){
	         var jsonData = eval(data);
	         if(data=='0000'){
	         	alert("开启成功！");
	         	location.reload();
	         }else{
	         	alert(data);
	         }
	        }
	     });
    }
}
function closeCollection(id) {
	if (confirm("确认要关闭该藏品的交易中转吗？")) {
		  $.ajax({
	         type:'post',
	         url:"<c:url value='/BaiBaoMine_OpenCollection'/>?opentrade=2&id="+id,
	         success:function(data){
	         var jsonData = eval(data);
	         if(data=='0000'){
	         	alert("关闭成功！");
	         	location.reload();
	         }else{
	         	alert(data);
	         }
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
<!--
本页面显示卖家已上传的藏品。
	1.用户可以查看藏品的信息、状态；
    2.点击进入上传页面修改藏品信息；
    3.关闭交易中转；
    4.删除藏品。
-->
<div data-role="page" class="ui-page ui-page-theme-a ui-page-active" style="display:block">
  <div data-role="header" role="banner" class="ui-header ui-bar-inherit">
    <h1 class="ui-title" role="heading" aria-level="1">已上传藏品</h1>
  </div>
  <div data-role="content" class="ui-content cpList" role="main">
    <ul id="thelist" data-role="listview" data-inset="true">
    </ul>
    <button id="more" class="ui-shadow ui-btn ui-corner-all" onclick="loadmore()">更多</button>
  </div>
</div>
</body>
</html>
