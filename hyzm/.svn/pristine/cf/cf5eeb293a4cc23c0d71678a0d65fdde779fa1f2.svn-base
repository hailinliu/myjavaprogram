<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>海选藏品_卫视文化乐园-华豫之门官方网站</title>

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
	<meta name=keywords content="海选藏品">
	<meta name=description content="卫视文化乐园-华豫之门官方网站，海选藏品">
    <script type="text/javascript">
	function queryOneCollection(value){
      location.href = "<c:url value='/collection/getCollection'/>?id="+value;
	}

	function collectThis(value){
	  if ('${CurrentSession}' != '') {
	    if (confirm('确定要收藏该藏品吗？')) {
		  alert('收藏成功');
          location.href = "<c:url value='/mine/collect'/>?collectionid="+value;
        }
	  } else {
		alert('您还没有登录，请先登录');
      }
	}
	</script>
  </head>

  <body>
  <jsp:include page="../head/header.jsp"></jsp:include>

<jsp:include page="../banner/banner.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear">
   <div class="scpjs_pic">
      <span class="bread_nav">当前位置：首页<span class="jt">></span>海选品库<span class="jt">></span>${collection.typename}<span class="jt">></span> <a href="#" target="_blank">${collection.name}</a></span>
   </div>
   <div class="scpjs_nr clear">
     <img src="<%=PropertiesUtil.getPropertiesValue("collectionurl")%>small/${collection.imgurl}" alt="${collection.name}"/>
     <div class="scpjs_list">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="red">收藏品名称：</td>
                <td>${collection.name}</td>
              </tr>
              <tr>
                <td class="red">收藏品编号：</td>
                <td>${collection.serialnum}</td>
              </tr>
              <tr>
                <td class="red">所属类别：</td>
                <td>${collection.typename}</td>
              </tr>
              <tr>
                <td class="red">来源：</td>
                <td>${collection.source}</td>
              </tr>
              <tr>
                <td class="red">上传者：</td>
                <td>${collection.uploadusername}</td>
              </tr>
            </table>
       </div>
        <ul class="sc_new fl">
           <li>已被 <span class="red">${collection.clicknum}</span> 人浏览过</li>
       </ul>
   </div>

   <div class="scpjs_cont">
       <p>${collection.note}</p>
       <%
         String[] imgarray = (String[])request.getAttribute("imgsarray");
         for (int i=0;i<imgarray.length;i++) {
       %>
	     <p align="center"><img src="<c:url value='<%=PropertiesUtil.getPropertiesValue("collectionurl")+imgarray[i]%>'/>" width="1140" alt="${collection.name}"/></p>
       <%
         }
       %>
   </div>

   <div class="about_sc"></div>
    <ul class="pic_list2">
      <c:forEach items="${colList}" var="col" varStatus="cdn">
          <c:choose>
            <c:when test="${cdn.count eq 4}">
		      <li class="none">
		           <img src="<%=PropertiesUtil.getPropertiesValue("collectionurl")%>small/${col.imgurl}" width="235" height="216" alt="${fn:substring(col.name,0,14)}" />
		            <div class="tab">
		               <table width="100%" border="0" cellspacing="0" cellpadding="0">
		                  <tr>
		                    <td class="name">收藏品名称：</td>
		                    <td><c:choose><c:when test="${fn:length(col.name) > 14}">
                           ${fn:substring(col.name,0,14)}...
                         </c:when>
                         <c:otherwise>
                           ${col.name}
                         </c:otherwise></c:choose></td>
		                  </tr>
		                  <tr>
		                    <td class="name">收藏品编号：</td>
		                    <td>${col.serialnum}</td>
		                  </tr>
		                  <tr>
		                    <td class="name">所属类别：</td>
		                    <td>${col.typename}</td>
		                  </tr>
		                  <tr>
		                    <td class="name">上 传 者：</td>
		                    <td>${col.uploadusername}</td>
		                  </tr>
		                </table>
		          </div>
		          <input type="button" value="" class="checkout" onclick="queryOneCollection(${col.id});"  />
		     </li>
            </c:when>
            <c:otherwise>
		      <li>
		           <img src="<%=PropertiesUtil.getPropertiesValue("collectionurl")%>small/${col.imgurl}" width="235" height="216" alt="${fn:substring(col.name,0,14)}"/>
		            <div class="tab">
		               <table width="100%" border="0" cellspacing="0" cellpadding="0">
		                  <tr>
		                    <td class="name">收藏品名称：</td>
		                    <td><c:choose><c:when test="${fn:length(col.name) > 14}">
                           ${fn:substring(col.name,0,14)}...
                         </c:when>
                         <c:otherwise>
                           ${col.name}
                         </c:otherwise></c:choose></td>
		                  </tr>
		                  <tr>
		                    <td class="name">收藏品编号：</td>
		                    <td>${col.serialnum}</td>
		                  </tr>
		                  <tr>
		                    <td class="name">所属类别：</td>
		                    <td>${col.typename}</td>
		                  </tr>
		                  <!-- <tr>
		                    <td class="name">上传时间：</td>
		                    <td>${col.uploaddate}</td>
		                  </tr> -->
		                  <tr>
		                    <td class="name">上 传 者：</td>
		                    <td>${col.uploadusername}</td>
		                  </tr>
		                </table>
		          </div>
		          <input type="button" value="" class="checkout" onclick="queryOneCollection(${col.id});"  />
		     </li>
            </c:otherwise>
          </c:choose>
      </c:forEach>
     </ul>

</div>
<!--main style end-->

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
