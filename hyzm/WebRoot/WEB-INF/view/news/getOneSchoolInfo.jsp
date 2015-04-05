<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>收藏学院</title>
    
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
	<meta name=keywords content="${news.label}">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
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
              		<li class="none"><a href="<c:url value='/news/getOneNews?id=${newest.id}'/>">${newest.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a href="<c:url value='/news/getOneNews?id=${newest.id}'/>">${newest.title}</a></li>
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
              		<li class="none"><a href="<c:url value='/news/getOneNews?id=${recommend.id}'/>">${recommend.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a href="<c:url value='/news/getOneNews?id=${recommend.id}'/>">${recommend.title}</a></li>
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
              		<li class="none"><a href="<c:url value='/news/getOneNews?id=${hot.id}'/>">${hot.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a href="<c:url value='/news/getOneNews?id=${hot.id}'/>">${hot.title}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </ul> 
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div> 
    
    <div class="zx_box clear">
       <div class="bt_box"><span class="fl sczj"></span></div> 
       <div class="zx_nr2">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p></div>
         <div class="tu_pic2"><a href="<c:url value='/proficient/getProficient?id=${pro.id}'/>"><img src="${pro.imgurl}" alt="${pro.name}"/></a><p><a href="<c:url value='/proficient/getProficient?id=${pro.id}'/>">${pro.name}</a></p><p><a href="#">${pro.speciality}</a></p></div>
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div>
    
    <div class="zx_box clear">
       <div class="bt_box"><span class="fl scpk"></span></div> 
       <div class="zx_nr">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p></div>
         <div class="tu_pic"><a href="<c:url value='/colleciton/getCollection?id=${col.id}'/>"><img src="<%=PropertiesUtil.getPropertiesValue("collectionurl") %>small/${col.imgurl}" alt="${col.name}"/></a><p><a href="<c:url value='/collection/getCollection'/>?id=${col.id}">${col.name}</a></p></div>
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div>
    
  </div><!--left end-->
  
  <div class="mian_right clear">
     <div class="scxy_pic"><span class="bread_nav">当前位置：首页<span class="jt">></span>收藏学院<span class="jt">></span><a href="#" target="_blank">${news.title}</a></span></div>
     <div class="title_box">
       <h3>${news.title}</h3>
       <ul class="title_list">
           <li>时间：${news.createdate}</li>     
           <li>点击：${news.clicknum}</li>     
           <li>标签：${news.label}</li>
       </ul>
     </div>
     
     <div class="nr_box clear">
       <p class="line"></p>
        <div class="sczx_nr">
         ${news.content}
         </div>
       <p class="line"></p>   
     </div>
     <ul class="next_list">
        <li>
	        <c:choose>
             <c:when test="${pre.id == 0}">
	           <span class="content fl">
	             <a>上一篇</a>
	           </span>
	           <span class="headline fl">
	             <a>没有了</a>
	           </span>
             </c:when>
             <c:otherwise>
	           <span class="content fl">
	             <a href="<c:url value='/news/getOneNews?id=${pre.id}'/>">上一篇</a>
	           </span>
	           <span class="headline fl">
	             <a href="<c:url value='/news/getOneNews?id=${pre.id}'/>">${pre.title}</a>
	           </span>
             </c:otherwise>
           </c:choose>
        </li>
        <li>
	        <c:choose>
             <c:when test="${next.id == 0}">
	           <span class="content fl">
	             <a>下一篇</a>
	           </span>
	           <span class="headline fl">
	             <a>没有了</a>
	           </span>
             </c:when>
             <c:otherwise>
	           <span class="content fl">
	             <a href="<c:url value='/news/getOneNews?id=${next.id}'/>">下一篇</a>
	           </span>
	           <span class="headline fl">
	             <a href="<c:url value='/news/getOneNews?id=${next.id}'/>">${next.title}</a>
	           </span>
             </c:otherwise>
           </c:choose>
        </li>
     </ul>
    
    <div class="about_xy"></div>
      <ul class="about_list fl">
         <c:forEach items="${list1}" var="news">
           <li><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
         </c:forEach>
      </ul>
      <ul class="about_list fl">
         <c:forEach items="${list2}" var="news">
           <li><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
         </c:forEach>

      </ul>
     
  </div><!--right end-->
  
</div>
<!--main style end-->  

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
