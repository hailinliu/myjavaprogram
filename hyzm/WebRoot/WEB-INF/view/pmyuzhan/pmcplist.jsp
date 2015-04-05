<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>专场_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/pmyuzhan/zhuanchang.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>

	<meta name=keywords content="拍卖专场">
	<meta name=description content="北京瀚海拍卖有限公司拍卖专场">
  </head>

  <body>


<jsp:include page="../banner/banner.jsp"></jsp:include>
  <div class="zhuanchang_box">
      <div class="zc_de_tit fl">
        <div class="zc_name">
          <span class="fl">专场</span>
          <span class="fl">&nbsp;|&nbsp;</span>
          <span class="fl">${yclots.name}</span>
          <span class="fl" style="margin-left:10px;">
          <span style="color:#016bce;">22</span>&nbsp;件</span>
        </div>
        <div class="fr">
           <a href="<c:url value='/redirect?p=pmyuzhan/pmyuzhan'/>" target="_blank" class="fl">2014秋季拍卖会</a>
           <span class="fl">&nbsp;>&nbsp;</span>
           <span>北京瀚海拍卖有限公司</span>
        </div>
          
      </div>
      <ul class="zc_more zc_left fl">
       <c:forEach items="${yclots}" var="yclots" varStatus="cdn">
        <li class="zc_one">
          <dl>
            <dt class="zc_img fl">
              <a href="<c:url value='/redirect?p=pmyuzhan/pmcollection'/>" target="_blank">
                  <img src="${yclots.image}" alt="" />
              </a>
            </dt>
            <dd class="fl zc_one_de">
              <p class="zc_one_tit"><a href="<c:url value='/redirect?p=pmyuzhan/pmcollection'/>" target="_blank">${yclots.name}</a></p>
              <p>
                <span class="huise">估价：</span>
                <span class="red">${yclots.price}</span>
              </p>
              <p>
                <span class="huise">尺寸：</span>
                <span class="huise">${yclots.size}</span>
              </p>
              <p>
                <span class="huise">说明：</span>
                <span class="huise">  
                 <c:choose>
                         <c:when test="${fn:length(yclots.suggest) > 45}">
                           ${fn:substring(yclots.suggest,0,45)}...
                         </c:when>
                         <c:otherwise>
                           ${yclots.suggest}
                         </c:otherwise>
                       </c:choose>
               </p>
</span>
              </p>
            </dd>
          </dl>
        </li>
        </c:forEach>
       
        
      </ul>
      <div class="zc_ye">
        <a href="#">首页</a>
        <a href="#">上一页</a>
        <a href="#" class="page_on">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">下一页</a>
        <a href="#">尾页</a>
        <a href="#">共三页</a>
      </div>
  </div>

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
