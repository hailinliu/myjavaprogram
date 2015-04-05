<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>收藏资讯_卫视文化乐园-华豫之门官方网站</title>

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
  <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
	<meta name=keywords content="收藏资讯">
	<meta name=description content="卫视文化乐园-华豫之门官方网站收藏资讯">
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
           <li><a href="<c:url value='/news/getCollectionInfoByStyle'/>?style=${style.id}" >${style.name}</a></li>
            </c:when> </c:choose>
         </c:forEach>
      </ul>
    </div>

    <div class="zx_box2 clear">
      <div class="bt_box"><span class="fl zxzx"></span></div>
       <div class="zx_nr">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p></div>
          <ul class="list_box">
              <c:forEach items="${newestList}" var="newest" varStatus="ndn">
                <c:choose>
                  <c:when test="${ndn.count eq 6}">
              		<li class="none"><a href="<c:url value='/news/${newest.id}.dhtml'/>" target="_blank">${newest.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a href="<c:url value='/news/${newest.id}.dhtml'/>" target="_blank">${newest.title}</a></li>
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
              		<li class="none"><a href="<c:url value='/news/${recommend.id}.dhtml'/>" target="_blank">${recommend.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a href="<c:url value='/news/${recommend.id}.dhtml'/>" target="_blank">${recommend.title}</a></li>
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
              		<li class="none"><a href="<c:url value='/news/${hot.id}.dhtml'/>" target="_blank">${hot.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a href="<c:url value='/news/${hot.id}.dhtml'/>" target="_blank">${hot.title}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
          </ul>
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div>

  </div><!--left end-->

<div class="mian_right clear">
     <div class="zxlb_pic"><span class="bread_nav">当前位置：首页<span class="jt">></span>收藏资讯<span class="jt">></span><a>${stylename}</a></span></div>
     <ul class="new_list">
        <c:forEach items="${newsList}" var="news">
	        <li>
	            <p><span class="blod fl"><a href="<c:url value='/news/${news.id}.dhtml'/>" target="_blank">${news.title}</a></span><span class="fr">发表于：${news.createdate}<span class="clickout">点击：${news.clicknum}</span><span class="red"><a href="<c:url value='/news/${news.id}.dhtml'/>" target="_blank">阅读全文</a></span></span></p>
	            <p>
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
        </c:forEach>
     </ul>

     <c:if test="${count / pageSize > 1}">
     <div class="paging clear">
        <pg:pager url="../news/getCollectionInfoByStyle" items="${count}" maxPageItems="9" maxIndexPages="5">
            <pg:param name="pageSize" value="${pageSize}" />
            <pg:param name="style" value="${style}" />
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

  </div><!--right end-->

</div>
<script type="text/javascript" language="javascript">

        $(document).ready(function() {


          var urlsval = url_request("pager.offset");   // 获取 offset参数

           var urlsval2 = parseInt(urlsval/9)+1;


            $(".paging_list>li>a").each(function(){
                if ($(this).text()==urlsval2) {
                    $(this).addClass('ymseled')
                }
            });
        });
    </script>
<!--main style end-->
  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
