<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>商家动态详情</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_details.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
  </head>

  <body>


<br /><br /><jsp:include page="../banner/banner.jsp"></jsp:include>


    <!-- 商家菜单 -->
    <jsp:include page="comment/qjsj_nav.jsp"></jsp:include>

    <!-- 左半部分 -->
    <div class="qjsj_left fl" style="width:784px;">
        <div class="qj_video_head" style="width:784px;">
            <span class="qj_sy_dot fl"></span>
            <a href="<c:url value='/redirect?p=index'/>" target="_blank" class="fl">首页</a>
            <span class="fl">&nbsp;>&nbsp;</span>
            <a href="<c:url value='/flagshopbaseinfo/getFlagShopBaseInfo?id=${baseinfo.id}'/>" target="_blank" class="fl">旗舰商家</a>
            <span class="fl">&nbsp;>&nbsp;</span>
            <a href="<c:url value='/flagshopbaseinfo/getFlagShopdynamic?id=${baseinfo.id}'/>"  target="_blank" class="fl">商家动态</a>
            <span class="qj_video_line fr"  style="width:534px;"></span>
        </div>
        <ul class="qj_details_list">
        
        <c:forEach items="${list}" var="info" varStatus="sta">
            <li>
                <div class="details_name">
                  <p class="b"><a href="<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id=${info.id}'/>" target="_blank">${info.title}</a></p>
                </div>
                <div class="details_time">
                  <span class="clock fl"></span>
                  <span class="fl"> <c:choose>
                    <c:when test="${fn:length(info.sfcreatedate) >16}">
                           ${fn:substring(info.sfcreatedate,5,16)}
                    </c:when>
                    <c:otherwise>${info.createdate}</c:otherwise>
                  </c:choose></span>
                  <span class="fl" style="margin:0 20px;color:#EEEEEE;">|</span>
                  <span class="fl">点击：</span>
                  <span class="fl">${info.clicknum}</span>
                </div>
                <div class="qj_details_box">
                  <div class="fl qj_details_pics">
                    <a href="<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id=${info.id}'/>" target="_blank">
                      <img src="${info.imgurltitle}" alt="" />
                    </a>
                  </div>
                 
                  <div class="fr qj_details_txt" id="content${sta.index}">
                 <c:choose>
                      <c:when test="${fn:length(info.content) >150}">
                           ${fn:substring(info.content,0,150)}....
                    </c:when>
                    <c:otherwise>${info.content}</c:otherwise>
                  </c:choose>
                    <button class="goto_more" onclick="window.open('<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id=${info.id}'/>')">阅读全文</button>
                  </div>
                </div>
              </li>
          </c:forEach>
              
        </ul>
     <c:if test="${count / pageSize > 0}">
       <div class="paging clear">
        <pg:pager url="../flagshopbaseinfo/getFlagShopdynamic" items="${count}" maxPageItems="9" maxIndexPages="5">
            <pg:param name="pageSize" value="${pageSize}" />
            <pg:param name="id" value="${baseinfo.id}" />
          <ul class="paging_list">
            <pg:first>
              <li class="bg_box">
                <a href="${pageUrl}">首页</a>
              </li>
            </pg:first>
            <pg:prev>
              <li class="bg_box bg_box2">
                <a href="${pageUrl}">上一页</a>
              </li>
            </pg:prev>
            <pg:pages>
              <li>
                <a href="${pageUrl}">${pageNumber}</a>
              </li>
            </pg:pages>

            <pg:next>
              <li class="bg_box bg_box3">
                <a href="${pageUrl}">下一页</a>
              </li>
            </pg:next>
            <pg:last>
              <li class="bg_box">
                <a href="${pageUrl}">尾页</a>
              </li>
            </pg:last>
          </ul>
        </pg:pager>

   </div>
   </c:if>
    </div>
    <!--  左半部分结束 -->

    <!-- 右半部分 -->
    <jsp:include page="comment/qjsj_right.jsp"></jsp:include>



  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
