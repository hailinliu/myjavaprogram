<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>旗舰商家 列表页</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_list.css'/>"/>

	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>


	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
	<script type="text/javascript">



	</script>
  </head>

  <body>


<jsp:include page="../banner/banner.jsp"></jsp:include>

<!--main style ben-->
  <div class="qj_list_box">
  		<div class="qj_list_head">
  			<p>旗舰商家</p>
  			<span>共${count}个商家</span>
  		</div>
  		
  		 <c:forEach items="${list}" var="info">
  		<ul class="qj_shop_list">
  			<li>
  				<div class="shops_name">
  					<p class="fl b">${info.name}</p>
  					<span class="fr">${info.daoyu}</span>
  				</div>
  				<div class="shop_box">
  					<div class="fl shop_box_left">
  					
						<div class="fl qj_list_pics">
						<a href="<c:url value='/flagshopbaseinfo/getFlagShopBaseInfo?id=${info.id}'/>" target="_blank">
								<img src="${info.logo}" alt=""  width="200px" height="200px"/>
								</a>
						</div>
						
						<div class="fl qj_list_txt">
							<div class="qj_shop_lb">
								<span class="fl b">主营：</span>
								<span class="fl">${info.mainscope}</span>
							</div>
							<div class="qj_shop_ls">
								<span class="fl b">
								简介：
								</span>
								<p class="fl">
								 <c:choose>
                         <c:when test="${fn:length(info.introduce) > 60}">
                           ${fn:substring(info.introduce,0,60)}...
                         </c:when>
                         <c:otherwise>
                           ${info.introduce}
                         </c:otherwise>
                       </c:choose>
								</p>
							</div>	
							<button class="goto_shop b" onclick="window.open('<c:url value='/flagshopbaseinfo/getFlagShopBaseInfo?id=${info.id}'/>')">进入商家</button>
						</div>
  					</div>
  					<div class="fr qj_shop_right_box">
  					<c:forEach items="${info.new}" var="newinfo">
  							<div class="qj_listpic">
							<a href="<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${info.id}&id=${newinfo.id}'/>" target="_blank">
								<img src="${newinfo.imgurltitle}" alt="" width="170px" height="170px" />
							</a>
  						</div>
  					</c:forEach>
  					</div>
  				</div>
  			</li>
  			 <c:if test="${info.count % 3 == 0}">
          		</ul>
          	</c:if>
  			</c:forEach>
  		 <c:if test="${fn:length(list) % 3 != 0}">
      </ul>
      </c:if>
   <c:if test="${count / pageSize > 0}">
     <div class="paging clear">
        <pg:pager url="../flagshopbaseinfo/getFlagShopBaseInfoList" items="${count}" maxPageItems="9" maxIndexPages="5">
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
  </div>
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
