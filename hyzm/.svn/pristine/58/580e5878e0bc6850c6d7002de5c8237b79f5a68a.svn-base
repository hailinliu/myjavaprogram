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
	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
  </head>
  
  <body>
  <jsp:include page="../head/header.jsp"></jsp:include>

<jsp:include page="../banner/banner.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear">

<div class="mian_left clear">
     <div class="left_bt">收藏学院</div>
     <div class="scpk_box clear">
       <ul class="scpk_list">
         <c:forEach items="${styleList}" var="style">
           <li><a href="<c:url value='/news/getSchoolInfo'/>?style=${style.id}&currentPage=1&pageSize=10">${style.name}</a></li>
         </c:forEach>
      </ul>
    </div>
    
     <div class="zx_box clear">
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
       <div class="bt_box"><span class="fl scpk"></span></div> 
       <div class="zx_nr">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p></div>
         <div class="tu_pic"><a href="<c:url value='/collection/getCollection?id=${col.id}'/>"><img src="${col.imgurl}" alt="${col.name}"/></a><p><a href="<c:url value='/collection/getCollection?id=${col.id}'/>">${col.name}</a></p></div>
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div>

  </div><!--left end-->
  
  <div class="mian_right clear">
     <ul class="zxjh_list clear">
         <li>
             <div class="tit_box"><span class="fl"><img src="<c:url value='/images/xy_pic1.jpg'/>" alt="瓷器陶器"/></span><span class="more fr"><a href="<c:url value='/news/getSchoolInfo'/>?style=201&currentPage=1&pageSize=10">更多 &gt;&gt;</a></span></div>
             <div class="zxjh_nr">
                <div class="fl hb_left3"><p class="hb_top"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p></div>
                <div class="ask_nr fl">
                  <ul class="nr_list">
                     <c:forEach items="${list1}" var="news" varStatus="ndn">
                        <c:choose>
                           <c:when test="${ndn.count eq 1}">
                     		   <li class="none_bg">
                     		     <p class="blod">
                     		       <a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a>
                     		     </p>
                     		     <p class="wz">
                     		       <c:choose>
			                         <c:when test="${fn:length(news.content) > 45}">
			                           ${fn:substring(news.content,0,45)}...
			                         </c:when>
			                         <c:otherwise>
			                           ${news.content}
			                         </c:otherwise>
			                       </c:choose>
                     		     </p> 
                     		   </li>
                           </c:when>
                           <c:when test="${ndn.count eq 7}">
	                           <li class="none"><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:when>
                           <c:otherwise>
                     		   <li><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
                  </ul>
              </div>  
             <div class="fr hb_right3"><p class="hb_top"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
             </div>
         </li>
         
         
         <li>
           <div class="tit_box"><span class="fl"><img src="<c:url value='/images/xy_pic2.jpg'/>" alt="玉器赏石"/></span><span class="more fr"><a href="<c:url value='/news/getSchoolInfo'/>?style=202&currentPage=1&pageSize=10">更多 &gt;&gt;</a></span></div>
           <div class="zxjh_nr">
                <div class="fl hb_left3"><p class="hb_top"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p></div>
                <div class="ask_nr fl">
                  <ul class="nr_list">
                     <c:forEach items="${list2}" var="news" varStatus="ndn">
                        <c:choose>
                           <c:when test="${ndn.count eq 1}">
                     		   <li class="none_bg">
                     		     <p class="blod">
                     		       <a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a>
                     		     </p>
                     		     <p class="wz">
                     		       <c:choose>
			                         <c:when test="${fn:length(news.content) > 45}">
			                           ${fn:substring(news.content,0,45)}...
			                         </c:when>
			                         <c:otherwise>
			                           ${news.content}
			                         </c:otherwise>
			                       </c:choose>
                     		     </p> 
                     		   </li>
                           </c:when>
                           <c:when test="${ndn.count eq 7}">
	                           <li class="none"><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:when>
                           <c:otherwise>
                     		   <li><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
                  </ul>
              </div>  
             <div class="fr hb_right3"><p class="hb_top"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
             </div>
         </li>
     </ul> 
   
   <ul class="zxjh_list clear">
         <li>
             <div class="tit_box"><span class="fl"><img src="<c:url value='/images/xy_pic3.jpg'/>" alt="铜铁金属"/></span><span class="more fr"><a href="<c:url value='/news/getSchoolInfo'/>?style=203&currentPage=1&pageSize=10">更多 &gt;&gt;</a></span></div>
             <div class="zxjh_nr">
                <div class="fl hb_left3"><p class="hb_top"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p></div>
                <div class="ask_nr fl">
                  <ul class="nr_list">
                     <c:forEach items="${list3}" var="news" varStatus="ndn">
                        <c:choose>
                           <c:when test="${ndn.count eq 1}">
                     		   <li class="none_bg">
                     		     <p class="blod">
                     		       <a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a>
                     		     </p>
                     		     <p class="wz">
                     		       <c:choose>
			                         <c:when test="${fn:length(news.content) > 45}">
			                           ${fn:substring(news.content,0,45)}...
			                         </c:when>
			                         <c:otherwise>
			                           ${news.content}
			                         </c:otherwise>
			                       </c:choose>
                     		     </p> 
                     		   </li>
                           </c:when>
                           <c:when test="${ndn.count eq 7}">
	                           <li class="none"><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:when>
                           <c:otherwise>
                     		   <li><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
                  </ul>
              </div>  
             <div class="fr hb_right3"><p class="hb_top"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
             </div>
         </li>
         
         
         <li>
           <div class="tit_box"><span class="fl"><img src="<c:url value='/images/xy_pic4.jpg'/>" alt="古币钱币"/></span><span class="more fr"><a href="<c:url value='/news/getSchoolInfo'/>?style=204&currentPage=1&pageSize=10">更多 &gt;&gt;</a></span></div>
           <div class="zxjh_nr">
                <div class="fl hb_left3"><p class="hb_top"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p></div>
                <div class="ask_nr fl">
                  <ul class="nr_list">
                     <c:forEach items="${list4}" var="news" varStatus="ndn">
                        <c:choose>
                           <c:when test="${ndn.count eq 1}">
                     		   <li class="none_bg">
                     		     <p class="blod">
                     		       <a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a>
                     		     </p>
                     		     <p class="wz">
                     		       <c:choose>
			                         <c:when test="${fn:length(news.content) > 45}">
			                           ${fn:substring(news.content,0,45)}...
			                         </c:when>
			                         <c:otherwise>
			                           ${news.content}
			                         </c:otherwise>
			                       </c:choose>
                     		     </p> 
                     		   </li>
                           </c:when>
                           <c:when test="${ndn.count eq 7}">
	                           <li class="none"><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:when>
                           <c:otherwise>
                     		   <li><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
                  </ul>
              </div>  
             <div class="fr hb_right3"><p class="hb_top"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
             </div>
         </li>
     </ul> 
   
   <ul class="zxjh_list clear">
         <li>
             <div class="tit_box"><span class="fl"><img src="<c:url value='/images/xy_pic5.jpg'/>" alt="字画古籍"/></span><span class="more fr"><a href="<c:url value='/news/getSchoolInfo'/>?style=205&currentPage=1&pageSize=10">更多 &gt;&gt;</a></span></div>
             <div class="zxjh_nr">
                <div class="fl hb_left3"><p class="hb_top"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p></div>
                <div class="ask_nr fl">
                  <ul class="nr_list">
                     <c:forEach items="${list5}" var="news" varStatus="ndn">
                        <c:choose>
                           <c:when test="${ndn.count eq 1}">
                     		   <li class="none_bg">
                     		     <p class="blod">
                     		       <a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a>
                     		     </p>
                     		     <p class="wz">
                     		       <c:choose>
			                         <c:when test="${fn:length(news.content) > 45}">
			                           ${fn:substring(news.content,0,45)}...
			                         </c:when>
			                         <c:otherwise>
			                           ${news.content}
			                         </c:otherwise>
			                       </c:choose>
                     		     </p> 
                     		   </li>
                           </c:when>
                           <c:when test="${ndn.count eq 7}">
	                           <li class="none"><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:when>
                           <c:otherwise>
                     		   <li><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
                  </ul>
              </div>  
             <div class="fr hb_right3"><p class="hb_top"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
             </div>
         </li>
         
         
         <li>
           <div class="tit_box"><span class="fl"><img src="<c:url value='/images/xy_pic6.jpg'/>" alt="木器雕品"/></span><span class="more fr"><a href="<c:url value='/news/getSchoolInfo'/>?style=206&currentPage=1&pageSize=10">更多 &gt;&gt;</a></span></div>
           <div class="zxjh_nr">
                <div class="fl hb_left3"><p class="hb_top"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p></div>
                <div class="ask_nr fl">
                  <ul class="nr_list">
                     <c:forEach items="${list6}" var="news" varStatus="ndn">
                        <c:choose>
                           <c:when test="${ndn.count eq 1}">
                     		   <li class="none_bg">
                     		     <p class="blod">
                     		       <a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a>
                     		     </p>
                     		     <p class="wz">
                     		       <c:choose>
			                         <c:when test="${fn:length(news.content) > 45}">
			                           ${fn:substring(news.content,0,45)}...
			                         </c:when>
			                         <c:otherwise>
			                           ${news.content}
			                         </c:otherwise>
			                       </c:choose>
                     		     </p> 
                     		   </li>
                           </c:when>
                           <c:when test="${ndn.count eq 7}">
	                           <li class="none"><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:when>
                           <c:otherwise>
                     		   <li><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
                  </ul>
              </div>  
             <div class="fr hb_right3"><p class="hb_top"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
             </div>
         </li>
     </ul> 
     
     <ul class="zxjh_list clear">
         <li>
             <div class="tit_box"><span class="fl"><img src="<c:url value='/images/xy_pic7.jpg'/>" alt="珠宝首饰"/></span><span class="more fr"><a href="<c:url value='/news/getSchoolInfo'/>?style=207&currentPage=1&pageSize=10">更多 &gt;&gt;</a></span></div>
             <div class="zxjh_nr">
                <div class="fl hb_left3"><p class="hb_top"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p></div>
                <div class="ask_nr fl">
                  <ul class="nr_list">
                     <c:forEach items="${list7}" var="news" varStatus="ndn">
                        <c:choose>
                           <c:when test="${ndn.count eq 1}">
                     		   <li class="none_bg">
                     		     <p class="blod">
                     		       <a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a>
                     		     </p>
                     		     <p class="wz">
                     		       <c:choose>
			                         <c:when test="${fn:length(news.content) > 45}">
			                           ${fn:substring(news.content,0,45)}...
			                         </c:when>
			                         <c:otherwise>
			                           ${news.content}
			                         </c:otherwise>
			                       </c:choose>
                     		     </p> 
                     		   </li>
                           </c:when>
                           <c:when test="${ndn.count eq 7}">
	                           <li class="none"><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:when>
                           <c:otherwise>
                     		   <li><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
                  </ul>
              </div>  
             <div class="fr hb_right3"><p class="hb_top"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
             </div>
         </li>
         
         
         <li>
           <div class="tit_box"><span class="fl"><img src="<c:url value='/images/xy_pic8.jpg'/>" alt="邮票邮品"/></span><span class="more fr"><a href="<c:url value='/news/getSchoolInfo'/>?style=208&currentPage=1&pageSize=10">更多 &gt;&gt;</a></span></div>
           <div class="zxjh_nr">
                <div class="fl hb_left3"><p class="hb_top"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p></div>
                <div class="ask_nr fl">
                  <ul class="nr_list">
                     <c:forEach items="${list8}" var="news" varStatus="ndn">
                        <c:choose>
                           <c:when test="${ndn.count eq 1}">
                     		   <li class="none_bg">
                     		     <p class="blod">
                     		       <a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a>
                     		     </p>
                     		     <p class="wz">
                     		       <c:choose>
			                         <c:when test="${fn:length(news.content) > 45}">
			                           ${fn:substring(news.content,0,45)}...
			                         </c:when>
			                         <c:otherwise>
			                           ${news.content}
			                         </c:otherwise>
			                       </c:choose>
                     		     </p> 
                     		   </li>
                           </c:when>
                           <c:when test="${ndn.count eq 7}">
	                           <li class="none"><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:when>
                           <c:otherwise>
                     		   <li><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
                  </ul>
              </div>  
             <div class="fr hb_right3"><p class="hb_top"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
             </div>
         </li>
     </ul> 
   
   <ul class="zxjh_list clear">
         <li>
             <div class="tit_box"><span class="fl"><img src="<c:url value='/images/xy_pic9.jpg'/>" alt="油画雕塑"/></span><span class="more fr"><a href="<c:url value='/news/getSchoolInfo'/>?style=209&currentPage=1&pageSize=10">更多 &gt;&gt;</a></span></div>
             <div class="zxjh_nr">
                <div class="fl hb_left3"><p class="hb_top"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p></div>
                <div class="ask_nr fl">
                  <ul class="nr_list">
                     <c:forEach items="${list9}" var="news" varStatus="ndn">
                        <c:choose>
                           <c:when test="${ndn.count eq 1}">
                     		   <li class="none_bg">
                     		     <p class="blod">
                     		       <a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a>
                     		     </p>
                     		     <p class="wz">
                     		       <c:choose>
			                         <c:when test="${fn:length(news.content) > 45}">
			                           ${fn:substring(news.content,0,45)}...
			                         </c:when>
			                         <c:otherwise>
			                           ${news.content}
			                         </c:otherwise>
			                       </c:choose>
                     		     </p> 
                     		   </li>
                           </c:when>
                           <c:when test="${ndn.count eq 7}">
	                           <li class="none"><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:when>
                           <c:otherwise>
                     		   <li><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
                  </ul>
              </div>  
             <div class="fr hb_right3"><p class="hb_top"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
             </div>
         </li>
         
         
         <li>
           <div class="tit_box"><span class="fl"><img src="<c:url value='/images/xy_pic10.jpg'/>" alt="其他藏品"/></span><span class="more fr"><a href="<c:url value='/news/getSchoolInfo'/>?style=210&currentPage=1&pageSize=10">更多 &gt;&gt;</a></span></div>
           <div class="zxjh_nr">
                <div class="fl hb_left3"><p class="hb_top"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p></div>
                <div class="ask_nr fl">
                  <ul class="nr_list">
                     <c:forEach items="${list10}" var="news" varStatus="ndn">
                        <c:choose>
                           <c:when test="${ndn.count eq 1}">
                     		   <li class="none_bg">
                     		     <p class="blod">
                     		       <a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a>
                     		     </p>
                     		     <p class="wz">
                     		       <c:choose>
			                         <c:when test="${fn:length(news.content) > 45}">
			                           ${fn:substring(news.content,0,45)}...
			                         </c:when>
			                         <c:otherwise>
			                           ${news.content}
			                         </c:otherwise>
			                       </c:choose>
                     		     </p> 
                     		   </li>
                           </c:when>
                           <c:when test="${ndn.count eq 7}">
	                           <li class="none"><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:when>
                           <c:otherwise>
                     		   <li><a href="<c:url value='/news/getOneNews?id=${news.id}'/>">${news.title}</a></li>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
                  </ul>
              </div>  
             <div class="fr hb_right3"><p class="hb_top"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p><p class="hb_botom"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
             </div>
         </li>
     </ul> 

  </div><!--right end-->

</div>
<!--main style end-->  

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
