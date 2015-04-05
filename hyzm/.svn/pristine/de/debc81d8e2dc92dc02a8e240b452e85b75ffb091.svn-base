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
          <c:forEach items="${baibaonews}" var="newsInfo" varStatus="cdn" begin="0" end="5">     
             <c:choose>
                 <c:when test="${cdn!=null}">     
              <ul>
          		<li>
             <a target="_blank" href="<c:url value='/baibaoindex/${newsInfo.id}.dhtml'/>">${newsInfo.title}</a>
              </li>             
            </ul>
         </c:when>
       </c:choose>   
      </c:forEach>    
        </div> 
 </body>
</html>