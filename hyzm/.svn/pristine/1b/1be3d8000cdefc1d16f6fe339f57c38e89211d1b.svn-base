<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title></title>

 	 <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_comment.css'/>"/>

	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>

  </head>

  <body>

 <!-- 商家动态 -->
	<div class="sjtit_news">

            <h3>商家动态:</h3>

          <ul>
          		<c:forEach items="${topinfo}" var="top" varStatus="sta">
              <li>
                  <a href="<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id=${top.id}'/>" target="_blank" class="fl">${top.title}</a>
                  <span class=""><c:choose>
                    <c:when test="${fn:length(top.sfcreatedate) >10}">
                           ${fn:substring(top.sfcreatedate,0,10)}
                    </c:when>
                    <c:otherwise>${top.createdate}</c:otherwise>
                  </c:choose></span>
              </li>
              </c:forEach>
            </ul>
        </div>

 </body>
</html>