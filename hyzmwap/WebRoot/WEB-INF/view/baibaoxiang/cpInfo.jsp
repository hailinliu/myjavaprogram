<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String id="";
if(request.getParameter("id")!=null && !"".equals(request.getParameter("id"))){
  id=request.getParameter("id");
}
 %>
<!DOCTYPE HTML>
<html>
<head>
<title>藏品详情</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<style type="text/css">
body {
	padding: 0;
	margin: 0;
	background: #fff;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	color: #444340;
}
h1 {
	font-size: 1.3em;
	padding: 10px 10px;
	margin: 0;
}
img {
	border: none;
}
a {
	color: #444340;
}

#Footer {
	padding: 10px;
	border-top: none;
}
#SocialLinks {
	padding: 10px 0 0 0;
}
#SocialLinks:after {
	clear: both;
	content: ".";
	display: block;
	height: 0;
	visibility: hidden;
}
#SocialLinks a {
	display: block;
	float: left;
	padding-right: 15px;
}
div.gallery-row:after {
	clear: both;
	content: ".";
	display: block;
	height: 0;
	visibility: hidden;
}
div.gallery-item {
	float: left;
	width: 33.333333%;
}
div.gallery-item a {
	display: block;
	margin: 5px;
	border: 1px solid #3c3c3c;
}
div.gallery-item img {
	display: block;
	width: 150px;
	height: 100px;
	max-width: 100%;
}
.cpList p span{ margin-right:2em}
.cpList p em{ font-size:.9em; font-style:normal; color:#aaa}
.cpjs_img11 img{ width:100%}
.info-show{ cursor:pointer}
</style>
<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>">
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.6.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/simple-inheritance.min.js'/>"></script>

<!-- NOTE: including the jQuery engine version -->
<script type="text/javascript" src="<c:url value='/jquery/code-photoswipe-jQuery-1.0.11.min.js'/>"></script>
<script type="text/javascript">
function BaiBao_AddTransfer(shopuserid,collectionid){
var my_element=$(".login");
		        if(my_element.length>0){				 //如果’会员登录‘dom 存在
		           	$("#login_box").addClass('mod_show');
		           	return false;

		        } else {
					if(shopuserid=='${CurrentSession.id}'){
						alert('您不能购买自己的藏品');
						// 您不能申请自己藏品的交易中转
						return false;
					}else{
						$.ajax({
					         type:'post',
url:"<c:url value='/BaiBao_AddTransfer'/>?shopuserid="+shopuserid+"&collectionid="+collectionid,
					         success:function(data){
					         if(data=='0000'){
					         	alert("您已确认使用交易中转功能，可拨打0371-60110891，稍候工作人员将与您取得联系！");
					         	//window.location.href="<c:url value='/BaiBao_getUserSellerCenter'/>";
					         }else{
					         	alert(data);
					         }
					        }
					     });
					}
 			}
}

	function AddAttention(id){
				var my_element=$(".login");
    			 if(my_element.length>0){			 //如果’会员登录‘dom 存在
		           	// $('#login_box').show();				// 未登录 弹出登陆框！
		           	$("#login_box").addClass('mod_show');
		           	return false;
		        } else {
					 $.ajax({
			         type:'post',
			         url:"<c:url value='/BaiBao_AddAttention'/>?collectionid="+id,
			         success:function(data){
			         if(data=='0000'){
			         	alert("成功关注！");
			         }else{
			         	alert(data);
			         }
			        }
			     });
				}
			}
</script>
</head>

<body>
<div data-role="page" class="ui-page ui-page-theme-a ui-page-active" style="display:block">
  <div data-role="header" role="banner" class="ui-header ui-bar-inherit">
    <h1 class="ui-title" role="heading" aria-level="1">${item.name}</h1>
  </div>
  <div data-role="content" class="ui-content cpList" role="main">
  <a href="javascript:;" class="cp_lpics">
  <img width="100%" src="http://116.255.149.172:7080/wswhly/Baibaourl//${fn:split(item.imgurl,',')[0]}"  alt="" />
  </a>
   <p>
<em>藏品类型：</em>
<c:if test="${fn:indexOf(item.type,'14')>=0}"><span>瓷器陶器</span></c:if>

<c:if test="${fn:indexOf(item.type,'15')>=0}"><span>玉器赏石</span></c:if>

<c:if test="${fn:indexOf(item.type,'16')>=0}"><span>青铜金器</span></c:if>

<c:if test="${fn:indexOf(item.type,'17')>=0}"><span>书画古籍</span></c:if>

<c:if test="${fn:indexOf(item.type,'18')>=0}"><span>木器雕品</span></c:if>

<c:if test="${fn:indexOf(item.type,'19')>=0}"><span>古币钱币</span></c:if>

<c:if test="${fn:indexOf(item.type,'20')>=0}"><span>珠宝首饰</span></c:if>

<c:if test="${fn:indexOf(item.type,'21')>=0}"><span>油画雕塑</span></c:if>

<c:if test="${fn:indexOf(item.type,'22')>=0}"><span>邮票邮品</span></c:if>

<c:if test="${fn:indexOf(item.type,'23')>=0}"><span>其他藏品</span></c:if>
<em>编号：</em>${item.baibaonum} <span> <a href="javascript:;" onclick="AddAttention(${item.id})">+加关注</a></span></p>
    <hr>
    <p> <em>价格：</em><span><b>￥${item.price}元</b> </span>
	<em>状态：</em>
      <c:if test="${item.state ==1}"><span>审核中</span></c:if>
      <c:if test="${item.state ==2}"><span>待售</span></c:if>
      <c:if test="${item.state ==3}"><span>正在交易中转</span></c:if>
      <c:if test="${item.state ==4}"><span>已售罄</span></c:if>
      </p>
    <hr>
    <p><em>店铺：</em> <span>${item.shopname}</span><em>联系人：</em><span>${itemshop.realname}</span></p>
	<hr>
    <p><em>联系方式：</em> <span class="info-show" onclick="javascript:$(this).html(${itemshop.mobile});" >点击显示</span></p>
    <hr>
<p class="infos2_p"><em>交易中转：</em><span>
      <c:if test="${item.isagree=='1'}">同意</c:if>
      <c:if test="${item.isagree=='2'}">不同意</c:if>
      </span><em>上传时间：</em><span>${item.formatcreatedate}</span></p>
    <hr>
    <p>地址：<span>${itemshop.shopaddress}</span></p>
    <hr>
    <p><em style="color:#f96">本站只展示店主上传的各种信息，并不保证其真实性，请谨慎交易</em></p>
    <c:if test="${item.opentrade ==1&&item.state==2}">
      <p class="for_zhonzhuan">
        <a class="for_zhonzhuan_s ui-bar ui-bar-a btn btn-positive btn-block ui-btn ui-shadow ui-corner-all" onclick="BaiBao_AddTransfer(${itemshop.userid},${item.id});">立即购买</a>
      </p>
    </c:if>
     <hr>
    <div>
      <H3>藏品介绍:</H3>
      <P>${item.note}</P>

    <div class="cpjs_img11">
      <c:forTokens items="${item.imgurl}" delims="," var="val"> <img src="http://116.255.149.172:7080/wswhly/Baibaourl/${val}" alt="" /> </c:forTokens>
    </div>
    <p style="font-size:14px;color:#9E9E9E;margin-left:28px;margin-top:10px;"><span id="collectionsuc"></span></p>
    <p style="font-size:14px;color:#9E9E9E;margin:20px 0 0 28px;"><span id="time"></span></p>
  </div></div>
</div>
</div>
<jsp:include page="../foot/footer.jsp"></jsp:include>
</body>
</html>
