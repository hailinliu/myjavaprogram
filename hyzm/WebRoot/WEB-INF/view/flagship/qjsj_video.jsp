<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>商家视频</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_video.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>


	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
  </head>

  <body>


<jsp:include page="../banner/banner.jsp"></jsp:include>


    <!-- 商家菜单 -->
    <jsp:include page="comment/qjsj_nav.jsp"></jsp:include>

    <!-- 左半部分 -->
    <div class="qjsj_left fl">
        <div class="qj_video_head">
            <span class="qj_sy_dot fl"></span>
            <a href="<c:url value='/redirect?p=index'/>" target="_blank" class="fl">首页</a>
            <span class="fl">&nbsp;>&nbsp;</span>
            <a href="<c:url value='/flagshopbaseinfo/getFlagShopBaseInfo?id=${baseinfo.id}'/>" target="_blank" class="fl">旗舰商家</a>
            <span class="fl">&nbsp;>&nbsp;</span>
            <a href="<c:url value='/flagshopbaseinfo/getFlagShopvideo?id=${baseinfo.id}'/>" target="_blank" class="fl">商家视频</a>
            <span class="qj_video_line fr"></span>
        </div>
   
        <ul class="qj_video_list">
              <c:forEach items="${list}" var="info" varStatus="sta">
         <c:if test="${(sta.index+1)%3!=0}">
          <li>
          </c:if>
          <c:if test="${(sta.index+1)%3==0}">
          <li class="qj_video_no">
          </c:if>
              <div class="qj_video_lispic">
                  <a href="<c:url value='/flagshopbaseinfo/getFlagShopvideodetail?baseid=${baseinfo.id}&id=${info.id}'/>" target="_blank">
                      <img src="${info.imgurltitle}" alt="" />
                  </a>
              </div>
              <p>
                <a href="<c:url value='/flagshopbaseinfo/getFlagShopvideodetail?baseid=${baseinfo.id}&id=${info.id}'/>" target="_blank">${info.title}</a>
              </p>
          </li>
        </c:forEach>
           
        </ul>
 
    </div>
    <!--  左半部分结束 -->

    <!-- 右半部分 -->
    <jsp:include page="comment/qjsj_right.jsp"></jsp:include>



  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
