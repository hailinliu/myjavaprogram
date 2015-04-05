<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>收藏资讯</title>
    
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
     <div class="left_bt">资讯导航</div>
     <div class="scpk_box clear">
       <ul class="scpk_list">
         <c:forEach items="${styleList}" var="style">
         	<c:choose><c:when test="${style.id!=214&&style.id!=215&&style.id!=216}">
           <li><a href="<c:url value='/news/getCollectionInfoByStyle'/>?style=${style.id}&currentPage=1&pageSize=10">${style.name}</a></li>
           </c:when> </c:choose>
         </c:forEach>
      </ul>
    </div>
    
    <div class="zx_box clear">
       <div class="bt_box"><span class="fl scpk"></span></div> 
       <div class="zx_nr">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p></div>
         <div class="tu_pic"><a href="<c:url value='/collection/getCollection?id=${col.id}'/>"><img src="<%=PropertiesUtil.getPropertiesValue("collectionurl")%>small/${col.imgurl}" alt="${col.name}" /></a><p><a href="<c:url value='/collection/getCollection?id=${col.id}'/>">${col.name}</a></p></div>
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div>
    
    <div class="zx_box clear">
       <div class="bt_box"><span class="fl sczj"></span></div> 
       <div class="zx_nr2">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt="" /></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt="" /></p></div>
         <div class="tu_pic2"><a href="<c:url value='/proficient/getProficient?id=${pro.id}'/>"><img src="${pro.imgurl}" alt="${pro.name}"/></a><p><a href="<c:url value='/proficient/getProficient?id=${pro.id}'/>">${pro.name}</a></p><p><a href="#">${pro.speciality}</a></p></div>
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div>
    
  </div><!--left end-->
  
  <div class="mian_right clear">
     <ul class="zxjh_list clear">
         <li>
             <div class="tit_box"><span class="fl"><img src="<c:url value='/images/pmzx_pic.jpg'/>" alt="拍卖资讯" /></span><span class="more fr"><a href="<c:url value='/news/getCollectionInfoByStyle'/>?style=101&currentPage=1&pageSize=10">更多 &gt;&gt;</a></span></div>
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
           <div class="tit_box"><span class="fl"><img src="<c:url value='/images/yjdt_pic.jpg'/>" alt="业界动态"/></span><span class="more fr"><a href="<c:url value='/news/getCollectionInfoByStyle'/>?style=102&currentPage=1&pageSize=10">更多 &gt;&gt;</a></span></div>
           <div class="zxjh_nr">
                <div class="fl hb_left3"><p class="hb_top"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt="" /></p><p class="hb_botom"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p></div>
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
             <div class="tit_box"><span class="fl"><img src="<c:url value='/images/zcjs_pic.jpg'/>" alt="珍藏鉴赏"/></span><span class="more fr"><a href="<c:url value='/news/getCollectionInfoByStyle'/>?style=103&currentPage=1&pageSize=10">更多 &gt;&gt;</a></span></div>
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
           <div class="tit_box"><span class="fl"><img src="<c:url value='/images/plfx_pic.jpg'/>" alt="评论分析"/></span><span class="more fr"><a href="<c:url value='/news/getCollectionInfoByStyle'/>?style=104&currentPage=1&pageSize=10">更多 &gt;&gt;</a></span></div>
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
             <div class="tit_box"><span class="fl"><img src="<c:url value='/images/zlzx_pic.jpg'/>" alt="展览资讯"/></span><span class="more fr"><a href="<c:url value='/news/getCollectionInfoByStyle'/>?style=105&currentPage=1&pageSize=10">更多 &gt;&gt;</a></span></div>
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
           <div class="tit_box"><span class="fl"><img src="<c:url value='/images/zlcg_pic.jpg'/>" alt="展览场馆"/></span><span class="more fr"><a href="<c:url value='/news/getCollectionInfoByStyle'/>?style=106&currentPage=1&pageSize=10">更多 &gt;&gt;</a></span></div>
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
   
     
     

  </div><!--right end-->

</div>
<!--main style end-->  

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
