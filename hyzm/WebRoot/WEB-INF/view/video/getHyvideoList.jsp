<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>华豫视频_卫视文化乐园-华豫之门官方网站</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<meta name=keywords content="华豫之门视频，华豫视频">
	<meta name=description content="华豫之门视频">
  </head>
  
  <body>
  <jsp:include page="../head/header.jsp"></jsp:include>
  
<jsp:include page="../banner/banner.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear">

  <div class="mian_left clear">
    
    <div class="zx_box2 clear">
      <div class="bt_box"><span class="fl zxzx"></span></div>
       <div class="zx_nr">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p></div>
          <ul class="list_box">
              <c:forEach items="${newestList}" var="newest" varStatus="ndn">
                <c:choose>
                  <c:when test="${ndn.count eq 6}">
              		<li class="none"><a href="<c:url value='/news/${newest.id}.dhtml'/>">${newest.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a href="<c:url value='/news/${newest.id}.dhtml'/>">${newest.title}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </ul> 
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div> 

    <div class="zx_box clear">
      <div class="bt_box"><span class="fl tjzx"></span></div>
       <div class="zx_nr">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p></div>
          <ul class="list_box">
              <c:forEach items="${recommendList}" var="recommend" varStatus="rdn">
                <c:choose>
                  <c:when test="${rdn.count eq 6}">
              		<li class="none"><a href="<c:url value='/news/${recommend.id}.dhtml'/>">${recommend.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a href="<c:url value='/news/${recommend.id}.dhtml'/>">${recommend.title}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </ul> 
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div> 

    <div class="zx_box clear">
      <div class="bt_box"><span class="fl rdzx"></span></div>
       <div class="zx_nr">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p></div>
          <ul class="list_box">
              <c:forEach items="${hotList}" var="hot" varStatus="hdn">
                <c:choose>
                  <c:when test="${hdn.count eq 6}">
              		<li class="none"><a href="<c:url value='/news/${hot.id}.dhtml'/>">${hot.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a href="<c:url value='/news/${hot.id}.dhtml'/>">${hot.title}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </ul> 
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div> 
  </div><!--left end-->
  
  <div class="mian_right clear">
     <div class="qjt_pic" style="background: url(../images/hysp_bg.jpg);"><span class="bread_nav">当前位置：首页<span class="jt">></span>华豫视频</span></div>
     <p class="scpk_wz">当前共有<a href="#">${count}</a>个视频!</p>
     <c:forEach items="${videoList}" var="video" varStatus="vdn">
       <c:if test="${vdn.count % 3 == 1}">
           <ul class="pic_list3 clear">
          	 </c:if>
		      <li>
		           <a href="<c:url value='/video/${video.id}.dhtml'/>"><img src="${video.imgurl}" width="235" height="216" alt="${fn:substring(video.title,0,18)}" /></a>
		            <div class="tab2 clear">
		               <ul>
		                  <li><a href="<c:url value='/video/${video.id}.dhtml'/>">视频名称：<c:choose><c:when test="${fn:length(video.title) > 18}">
                           ${fn:substring(video.title,0,18)}...
                         </c:when>
                         <c:otherwise>
                           ${video.title}
                         </c:otherwise></c:choose></a></li>
		                  <li><a href="#">专家名字：${video.proficient}</a></li>
		                  <li>上传时间：${video.uploaddate}</li>
		               </ul>
		            </div>
		    </li>
		    <c:if test="${vdn.count % 3 == 0}">
          		</ul>
          	</c:if>
     </c:forEach>
     <c:if test="${listsize % 3 != 0}">
      </ul>
      </c:if>
       
    <c:if test="${count / pageSize > 1}">
     <div class="paging clear">
        <pg:pager url="../video/getVideoList" items="${count}" maxPageItems="9" maxIndexPages="5">
            <pg:param name="pageSize" value="${pageSize}" /> 
	        <ul class="paging_list">
	             <pg:first><li class="bg_box"><a href="${pageUrl}">首页</a></li></pg:first>  
                 <pg:pages><li><a href="${pageUrl}">${pageNumber}</a></li></pg:pages>
                 <pg:last><li class="bg_box"><a href="${pageUrl}">尾页</a></li></pg:last>  
	        </ul> 
        </pg:pager>
   </div>
  </c:if>

  </div><!--right end-->

</div>
<!--main style end-->  
  
  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
