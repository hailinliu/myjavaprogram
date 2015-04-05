<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>华豫专家_卫视文化乐园-华豫之门官方网站</title>
    
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
	<meta name=keywords content="华豫之门专家，专家团">
	<meta name=description content="华豫之门专家">
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
              		<li class="none"><a target="_blank" href="<c:url value='/news/${newest.id}.dhtml'/>">${newest.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a target="_blank" href="<c:url value='/news/${newest.id}.dhtml'/>">${newest.title}</a></li>
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
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" /></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" /></p></div>
          <ul class="list_box">
              <c:forEach items="${recommendList}" var="recommend" varStatus="rdn">
                <c:choose>
                  <c:when test="${rdn.count eq 6}">
              		<li class="none"><a target="_blank" href="<c:url value='/news/${recommend.id}.dhtml'/>">${recommend.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a target="_blank" href="<c:url value='/news/${recommend.id}.dhtml'/>">${recommend.title}</a></li>
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
              		<li class="none"><a target="_blank" href="<c:url value='/news/${hot.id}.dhtml'/>">${hot.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a target="_blank" href="<c:url value='/news/${hot.id}.dhtml'/>">${hot.title}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
          </ul> 
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div> 
  </div><!--left end-->
  
  <div class="mian_right clear">
     <div class="sczj_pic"><span class="bread_nav">当前位置：首页<span class="jt">></span>华豫专家</span></div>
     <c:forEach items="${proficientList}" var="pro" varStatus="pdn">
       <c:if test="${pdn.count % 4 == 1}">
       <ul class="zj_list">
       </c:if>
          <li><a target="_blank" href="<c:url value='/proficient/${pro.id}.dhtml'/>"><img src="${pro.imgurl}" width="150" height="187" alt="${pro.name}"/></a><p><a target="_blank" href="<c:url value='/proficient/${pro.id}.dhtml'/>">${pro.name}</a></p><p style="color:#666;">${pro.speciality}</p></li>
       <c:if test="${pdn.count % 4 == 0}">
       </ul>
       </c:if>
     </c:forEach>
     
     <c:if test="${listsize % 4 != 0}">
      </ul>
      </c:if>
  
  </div><!--right end-->

</div>
<!--main style end-->  

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
