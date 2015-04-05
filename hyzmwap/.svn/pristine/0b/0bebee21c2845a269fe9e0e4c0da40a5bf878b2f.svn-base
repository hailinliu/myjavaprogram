<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
  <head>

    <title>华豫专家</title>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>">
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>

  </head>

  <body>

<div data-role="page" data-theme="a" id="demo-page" class="my-page">
<jsp:include page="../head/header.jsp?name=华豫专家"></jsp:include>

	<div role="main" class="ui-content">

        <ul data-role="listview" data-inset="true" data-split-theme="g">
          <c:forEach items="${proficientList}" var="pro">
		    <li><a data-ajax="false" href="<c:url value='/proficient/getProficient?id=${pro.id}'/>">
		        <img src="${pro.imgurl}" width="25%" height="100%">
		    <h2>${pro.name}</h2>
		    <p>${pro.speciality}</p></a>
		    </li>
          </c:forEach>
		</ul>

    </div><!-- /content -->

</div><!-- /page -->

  </body>
</html>
