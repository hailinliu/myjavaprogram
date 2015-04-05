<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>珍宝台藏品</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="<c:url value='/css/ratchet.css'/>" rel="stylesheet" />
    <link rel="stylesheet" href="<c:url value='/css/ratchet-theme-ios.min.css'/>">
    <script src="<c:url value='/js/ratchet.min.js'/>"></script>
    <script src="<c:url value='/js/zepto.min.js'/>"></script>

  </head>

  <body>
    <div id="popover" class="popover">
	    <header class="bar bar-nav">
	        <h1 class="title">分类列表</h1>
	    </header>
	    <ul class="table-view">
	       <c:forEach items="${liststyle}" var="style">
	        <li class="table-view-cell" onclick="location.href='<c:url value="/collection/getZjcp?typeid=3&styleid=${style.id}"/>'">${style.name}</li>
	       </c:forEach>
	    </ul>
	</div>

	<header class="bar bar-nav">
	    <a href="#popover">
	        <h1 class="title">
	            专家推荐藏品
	            <span class="icon icon-caret"></span>
	        </h1>
	    </a>
	</header>
	<div class="content">
	   <ul class="table-view">
	     <c:forEach items="${collectionList}" var="collection">
          <li class="table-view-cell media">
            <a class="navigate-right">
                  <img class="media-object pull-left" src="<c:url value='${collection.imgurl}'/>" width="64" height="64">
                  <div class="media-body" onclick="location.href='<c:url value="/collection/getCollectionus?id=${collection.id}"/>'">
                           ${collection.name}
                  </div>
            </a>
          </li>
	     </c:forEach>
       </ul>
	</div>
    <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
