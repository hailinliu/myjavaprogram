<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>百宝箱专题_卫视文化乐园-华豫之门官方网站</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/style.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/slideshow.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<meta name=keywords content="百宝箱">
	<meta name=description content="华豫之门百宝箱">
  <style type="text/css">
    .foot_hb{
      margin-top: 0 !important;
    }
  </style>
  </head>

  <body>
  <jsp:include page="../head/header.jsp"></jsp:include>
    <div class="bbx_zt_content">
        <div class="bbx_zt01"></div>
        <div class="bbx_zt02">
          <div class="bbx_zt02_in">
              <a hhref="javascript:void(0)" onclick="login_on('<c:url value='/redirect?p=mine/baibaojie/forshop'/>',1)"></a>
          </div>
        </div>
        <div class="bbx_zt03"></div>
        <div class="bbx_zt04">
          <div class="bbx_zt04_in">
              <a href="<c:url value='/redirect?p=baibaojie/servicerflow'/>" target="_blank"></a>
          </div>
        </div>
        <div class="bbx_zt05">
           <div class="bbx_zt05_in">
              <a href="<c:url value='/baibaoindex/BaiBao_getIndex'/>" target="_blank"></a>
          </div>
        </div>
    </div>
  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
