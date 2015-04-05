<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>商家资讯-详情页</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/getAuctionsinfo.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
  <style type="text/css">
  		.jg_right_top p, .jg_right_top a {float: left;margin-left: 93px;}
  	</style>
  </head>


  <body>
  <jsp:include page="../head/header.jsp"></jsp:include>

	<div class="jg_pic">
		<img src="<c:url value='/images/getAuction/sfb_banner.jpg'/>"/>
	</div>

<!--main style ben-->
<div class="main_box clear jgxq">
	<div class="jg_bread">
		当前位置&nbsp;>&nbsp;首页&nbsp;>&nbsp;
		<a>商家资讯</a>
	</div>
	<jsp:include page="../Auction/pmjg/getAuction_left.jsp"></jsp:include>
	                              <!-- 右半部分 -->
	<div class="pmjg_right fr">
		<div class="jg_right_top">
			<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>">首页</a>
			<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo01'/>" >商家简介</a>
			<p>商家资讯</p>
			<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo03'/>" >商家图展</a>
			<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo05'/>" >商家视频</a>
		</div>
		<div class="jg_right_center">
			<div class="title_box">
       <h3>1111111111</h3>
       <ul class="title_list">
           <li>时间：11111</li>     
           <li>点击：12</li>     
           <li>标签：1221111</li>
       </ul>
     </div>
     
     <div class="nr_box clear">
       <p class="line2"></p>
        <div class="sczx_nr">
                          111111111111111111111111111111111111111111111111111111111111111111111
         </div>
       <p class="line2"></p>   
     </div>
     <ul class="next_list">
        <li>
	          <!--   <span class="content fl">
	             <a>上一篇</a>
	           </span>
	           <span class="headline fl">
	             <a>没有了</a>
	           </span>-->
	           <span class="content fl">
	             <a href="#">上一篇</a>
	           </span>
	           <span class="headline fl">
	             <a href="#">3333333</a>
	           </span>
        </li>
        <li>
	          <!--   <span class="content fl">
	             <a>下一篇</a>
	           </span>
	           <span class="headline fl">
	             <a>没有了</a>
	           </span>-->
	           <span class="content fl">
	             <a href="#">下一篇</a>
	           </span>
	           <span class="headline fl">
	             <a href="#">1111111111</a>
	           </span>
        </li>
     </ul>
		</div>
		<jsp:include page="../Auction/pmjg/getAuction_zixun.jsp"></jsp:include>
		
	</div>
	
</div>

<!--main style end-->

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
