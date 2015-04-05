<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>旗舰商家<c:if test="${newinfo.style ==214}">动态 </c:if><c:if test="${newinfo.style ==215}">图展</c:if>详情</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- <link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/> -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_onenew.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>

	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
  </head>

  <body>


<jsp:include page="../banner/banner.jsp"></jsp:include>


    <!-- 商家菜单 -->
    <jsp:include page="comment/qjsj_nav.jsp"></jsp:include>

    <!-- 左半部分 -->
    <div class="qjsj_left fl" style="width: 810px;">
        <div class="qj_video_head">
            <span class="qj_sy_dot fl"></span>
            <a href="<c:url value='/redirect?p=index'/>" target="_blank" class="fl">首页</a>
            <span class="fl">&nbsp;>&nbsp;</span>
            <a href="<c:url value='/flagshopbaseinfo/getFlagShopBaseInfo?id=${baseinfo.id}'/>" target="_blank" class="fl">旗舰商家</a>
            <span class="fl">&nbsp;>&nbsp;</span>
            <a href="<c:url value='/flagshopbaseinfo/getFlagShopvideo?id=${baseinfo.id}'/>" target="_blank" class="fl">商家视频</a>

            <span class="qj_video_line fr"></span>
        </div>

        <!-- 新闻开始 -->
        <div class="sjnew_box nr_box clear">
        	<div class="title_box">
		       <h3>${newinfo.title}</h3>
		       <ul class="title_list">
		           <li>时间：${newinfo.sfcreatedate}</li>
		           <li>点击：${newinfo.clicknum}</li>
		           <li>标签：${newinfo.label}</li>
		       </ul>
		     </div>
		     <p class="line"></p>


          <div class="sczx_nr">

            ${newinfo.content}

          </div>

        	<p class="line"></p>
        </div>

        <!-- 上一篇，， -->
            <ul class="next_list">
		             <li>
		           <c:choose>
		             <c:when test="${previnfo.id ==null}">
		             <span class="content fl">
		               <a>上一篇</a>
		             </span>
		             <span class="headline fl">
		               <a>没有了</a>
		             </span>
		             </c:when>
		             <c:otherwise>
		             <span class="content fl">
		               <a href="<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id=${previnfo.id}'/>">上一篇</a>
		             </span>
		             <span class="headline fl">
		               <a href="<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id=${previnfo.id}'/>">${previnfo.title}</a>
		             </span>
		             </c:otherwise>
		           </c:choose>
		        </li>
                <li>
                   <c:choose>
	             <c:when test="${nextinfo.id==null}">
	             <span class="content fl">
	               <a>下一篇</a>
	             </span>
	             <span class="headline fl">
	               <a>没有了</a>
	             </span>
	             </c:when>
	             <c:otherwise>
	             <span class="content fl">
	               <a href="<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id=${nextinfo.id}'/>">下一篇</a>
	             </span>
	             <span class="headline fl">
	               <a href="<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id=${nextinfo.id}'/>">${nextinfo.title}</a>
	             </span>
	             </c:otherwise>
	           </c:choose>
                </li>
             </ul>

        <!-- 商家动态 -->
        <jsp:include page="comment/qjsj_news.jsp"></jsp:include>

        <!-- 评论 -->
        <jsp:include page="../comments.jsp"></jsp:include>

    </div>
    <!--  左半部分结束 -->

    <!-- 右半部分 -->
    <jsp:include page="comment/qjsj_right.jsp"></jsp:include>



  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
