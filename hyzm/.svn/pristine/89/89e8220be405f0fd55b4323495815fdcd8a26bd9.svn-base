<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>海选藏品首页_卫视文化乐园-华豫之门官方网站</title>

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


	<meta name=keywords content="海选藏品">
	<meta name=description content="卫视文化乐园-华豫之门官方网站，海选藏品">
	<script type="text/javascript">
	function queryOneCollection(value){
      // location.href = "<c:url value='/collection/getCollection'/>?id="+value+"&userid=${CurrentSession.id}";
      open( "<c:url value='/collection/getCollection'/>?id="+value+"&userid=${CurrentSession.id}");
	}
	</script>
  </head>

  <body>
  <jsp:include page="../head/header.jsp"></jsp:include>

<jsp:include page="../banner/banner.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear">

  <div class="mian_left clear">
     <div class="left_bt">海选藏品分类</div>
     <div class="scpk_box clear">
       <ul class="scpk_list">
         <c:forEach items="${typelist}" var="type">
           <li><a href="<c:url value='/collection/${type.id}.dhtml'/>">${type.name}</a></li>
         </c:forEach>
      </ul>
    </div>

    <div class="zx_box clear">
      <div class="bt_box"><span class="fl zxzx"></span></div>
       <div class="zx_nr">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p></div>
          <ul class="list_box">
              <c:forEach items="${newestList}" var="newest" varStatus="ndn">
                <c:choose>
                  <c:when test="${ndn.count eq 6}">
              		<li class="none"><a target="_blank" href="<c:url value='/news/${newest.id}.dhtml'/>">${newest.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a target="_blank" href="<c:url value='/news/${newest.id}.dhtml'/>">${newest.title}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </ul>
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt="" /></p></div>
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
              		<li class="none"><a target="_blank" href="<c:url value='/news/${recommend.id}.dhtml'/>">${recommend.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a target="_blank" href="<c:url value='/news/${recommend.id}.dhtml'/>">${recommend.title}</a></li>
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
              		<li class="none"><a target="_blank" href="<c:url value='/news/${hot.id}.dhtml'/>">${hot.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a target="_blank" target="_blank" href="<c:url value='/news/${hot.id}.dhtml'/>">${hot.title}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </ul>
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" /></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" /></p></div>
        </div>
    </div>
  </div><!--left end-->

  <div class="mian_right clear">
     <div class="scpk_pic"><span class="bread_nav">当前位置：首页<span class="jt">></span>海选品库<c:if test="${not empty typename}"><span class="jt">></span><a target="_blank" href="#">${typename}</a></c:if></span></div>
     <p class="scpk_wz" style="padding-top:10px;">感谢藏友们为中国的收藏品文化传播所做的贡献！</p>
     <div class="clear111">
      <c:forEach items="${collectionList}" var="collection" varStatus="cdn" begin="0" end="99">

          <c:if test="${cdn.count % 3 == 1}">
          	<ul class="pic_list">
          	 </c:if>
		      	<li>
		        	<a href="javascript:void(0);" onclick="queryOneCollection(${collection.id});"><img src="<%=PropertiesUtil.getPropertiesValue("collectionurl")%>small/${collection.imgurl}" width="235" height="235" alt="${fn:substring(collection.name,0,14)}"/></a>
		            <div class="tab">
		               <table width="100%" border="0" cellspacing="0" cellpadding="0">
		                  <tr>
		                    <td class="name">收藏品名称：</td>
		                    <td><c:choose><c:when test="${fn:length(collection.name) > 14}">
                           ${fn:substring(collection.name,0,14)}...
                         </c:when>
                         <c:otherwise>
                           ${collection.name}
                         </c:otherwise></c:choose></td>
		                  </tr>
		                  <!-- <tr>
		                    <td class="name">收藏品编号：</td>
		                    <td>${collection.serialnum}</td>
		                  </tr> -->
		                  <tr>
		                    <td class="name">所属类别：</td>
		                    <td>${collection.typename}</td>
		                  </tr>
		                  <tr>
		                    <td class="name">上 传 者：</td>
		                    <td>${collection.uploadusername}</td>
		                  </tr>
		                </table>
		          </div>
		    </li>
		    <c:if test="${cdn.count % 3 == 0}">
          		</ul>
          	</c:if>

      </c:forEach>

      <c:if test="${listsize % 3 != 0}">
      </ul>
      </c:if>
      </div>
    <c:if test="${count / pageSize > 1}">
     <div class="paging clear">
        <pg:pager url="../collection/getCollections" items="${count}" maxPageItems="9" maxIndexPages="5">
            <pg:param name="pageSize" value="${pageSize}" />
            <pg:param name="type" value="${type}" />
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
<!--main style end-->

  <!-- 判断 url参数 页码用** -->
  <script type="text/javascript" language="javascript">

        $(document).ready(function() {
           var urlsval = url_request("pager.offset");   // 获取 offset参数

           var urlsval2 = parseInt(urlsval/9)+1;

          // var ahrs =  $(".paging_list>li>a").attr("href");

          // var sd2=ahrs.indexOf(urlsval);  // 比较字符串 看是否存在相同

            $(".paging_list>li>a").each(function(){
                if ($(this).text()==urlsval2) {
                    $(this).addClass('ymseled')
                }
            });
        });
    </script>

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
