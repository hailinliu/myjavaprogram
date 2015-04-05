<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>商家图展</title>

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
		<a>旗舰商家</a>
	</div>
	<jsp:include page="../flagship/ship/flagship_left.jsp"></jsp:include>
	                              <!-- 右半部分 -->
	<div class="pmjg_right fr">
		<div class="jg_right_top">
			<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>">首页</a>
			<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo01'/>" >商家简介</a>
			<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo02'/>" >商家资讯</a>
			<p>商家图展</p>
			<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo05'/>">商家视频</a>
		</div>
		<div class="jg_right_center">
			<!-- 拍卖预展 -->
			<div class="jg_right_bottom2" style="margin-top:0;background: url(images/flagship/qjsj_pic.jpg) top center no-repeat;"></div>
			<ul class="jg_right_pm">
				<li>
					<a href="<c:url value='/redirect?p=flagship/getFlagshipOnetuzhan'/>" target="_blank">
						<img src="<c:url value='/images/getAuction/jg_pic1.jpg'/>"/>
					</a>
					<p>
						<a href="<c:url value='/redirect?p=flagship/getFlagshipOnetuzhan'/>" target="_blank">
							111111
						</a>
					</p>
					<p>2014.08.01</p>
				</li>
				<li>
					<a href="<c:url value='/redirect?p=flagship/getFlagshipOnetuzhan'/>" target="_blank">
						<img src="<c:url value='/images/getAuction/jg_pic1.jpg'/>"/>
					</a>
					<p>
						<a href="<c:url value='/redirect?p=flagship/getFlagshipOnetuzhan'/>" target="_blank">
							111111
						</a>
					</p>
					<p>2014.08.01</p>
				</li>
				<li>
					<a href="<c:url value='/redirect?p=flagship/getFlagshipOnetuzhan'/>" target="_blank">
						<img src="<c:url value='/images/getAuction/jg_pic1.jpg'/>"/>
					</a>
					<p>
						<a href="<c:url value='/redirect?p=flagship/getFlagshipOnetuzhan'/>" target="_blank">
							111111
						</a>
					</p>
					<p>2014.08.01</p>
				</li>
				<li>
					<a href="<c:url value='/redirect?p=flagship/getFlagshipOnetuzhan'/>" target="_blank">
						<img src="<c:url value='/images/getAuction/jg_pic1.jpg'/>"/>
					</a>
					<p>
						<a href="<c:url value='/redirect?p=flagship/getFlagshipOnetuzhan'/>" target="_blank">
							111111
						</a>
					</p>
					<p>2014.08.01</p>
				</li>
				
			</ul>
		</div>
		<div class="paging clear">
        <pg:pager url="../news/getCollectionInfoByStyle" items="${count}" maxPageItems="9" maxIndexPages="5">
            <pg:param name="pageSize" value="${pageSize}" />
            <pg:param name="style" value="${style}" />
	        <ul class="paging_list" style="width:360px;">
            <pg:first>
              <li class="bg_box">
                <a href="${pageUrl}">首页</a>
              </li>
            </pg:first>
            <pg:prev>
              <li class="bg_box bg_box2">
                <a href="${pageUrl}">上一页</a>
              </li>
            </pg:prev>
            <pg:pages>
              <li>
                <a href="${pageUrl}">${pageNumber}</a>
              </li>
            </pg:pages>

            <pg:next>
              <li class="bg_box bg_box3">
                <a href="${pageUrl}">下一页</a>
              </li>
            </pg:next>
            <pg:last>
              <li class="bg_box">
                <a href="${pageUrl}">尾页</a>
              </li>
            </pg:last>
          </ul>
        </pg:pager>
   </div>
		<jsp:include page="../flagship/ship/flagship_zixun.jsp"></jsp:include>
		
	</div>
	
</div>

<!--main style end-->

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
