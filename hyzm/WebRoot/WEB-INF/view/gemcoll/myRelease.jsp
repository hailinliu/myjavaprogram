<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>我的珍品征集令_珍品征集令_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	  <link rel="stylesheet" type="text/css" href="<c:url value='/css/gotohyzm/goto_hy.css'/>"/>

	<meta name=keywords content="我的珍品征集令">
	<meta name=description content="我的珍品征集令">

	<script type="text/javascript">

		//TAB  切换
	  	$(function() {
	  		//  tab  切换
	  		$("#tabs-jshao").tabs().tabs('option', 'event', 'mouseover');

	  		// cp_State("${CurrentSession.level}", "<c:url value='/vote/myCollectRelease'/>", "对不起，仅“旗舰商家和贵宾及以上会员”才能查看我的发布！");

	  	});

	  	 //  方法写到 gotoactivi.js 全局调用
		// 发布藏品 状态
		function send_cp(){
			cp_State("${CurrentSession.level}","<c:url value='/vote/gotocollectupload'/>","对不起，仅“旗舰商家和贵宾及以上会员”才能在此页面发布藏品。")
		}

		//  我的发布 状态
		function my_send(){
			cp_State("${CurrentSession.level}","<c:url value='/vote/myCollectRelease'/>","对不起，仅“旗舰商家和贵宾及以上会员”才能查看我的发布！")
		}
		//  投票
		function vote (collectionid) {
			my_vote(collectionid,"<c:url value='/vote/vote'/>")
		}
		function orderByNewest(){
			location.href="<c:url value='/vote/collectAllList?order=1'/>";
		}

		function orderByTicket(){
			location.href="<c:url value='/vote/collectAllList?order=2'/>";
		}
	</script>
  </head>

  <body>



	<div class="count_box">

		<!-- top1 -->


	    <div class="content_s">


	        <!-- top3 藏品列表 -->
	        <div class="mar_box">
	        	<div class="cp_list" id="cp_list">
	        		<div class="cp_h_tit">
	        			<h3>我的珍品</h3>
	        		</div>

				<!-- 藏品列表 -->
	        		<div class="cplist_cont">
	        		   <c:forEach items="${uploadList}" var="upload" varStatus="cdn">
                       <c:if test="${cdn.count % 4 == 1}">
						<ul class="cplist_ul">
						</c:if>

							<c:choose>
                            <c:when test="${cdn.count % 4 == 0}">
                            	<li style="margin-right:0;">

								<div class="cp_img">
								<a class="vo_imgs" target="_blank" href="<c:url value='/vote/${upload.id}.dhtml'/>">
						        <img src="<%=PropertiesUtil.getPropertiesValue("uploadVoteurl")%>/${upload.imgurl}" width="235" height="216" alt="${upload.name}"/>
						         </a>
									</div>
									<div class="cp_tit">
										<a target="_blank" href="<c:url value='/vote/${upload.id}.dhtml'/>">${upload.name}</a>
										<p>
											<span>编号：</span>
											<span>${upload.serialnum}</span>
										</p>
									</div>
									<!-- 投票按钮 -->
									<div class="cp_toupiao my_toupnum">
										<span class="">
											票数：
										</span>
										<span class=""><i>${upload.votenum}</i> 票</span>
									</div>
								</li>
                            </c:when>
                            <c:otherwise>
								<li>

								<div class="cp_img">
								<a class="vo_imgs" target="_blank" href="<c:url value='/vote/${upload.id}.dhtml'/>">
						        <img src="<%=PropertiesUtil.getPropertiesValue("uploadVoteurl")%>/${upload.imgurl}" width="235" height="216" alt="${upload.name}"/>
						         </a>
									</div>
									<div class="cp_tit">
										<a target="_blank" href="<c:url value='/vote/${upload.id}.dhtml'/>">${upload.name}</a>
										<p>
											<span>编号：</span>
											<span>${upload.serialnum}</span>
										</p>
									</div>
									<div class="cp_toupiao my_toupnum">
										<span class="">		<!-- 投票按钮 -->
											票数：
										</span>
										<span class=""><i>${upload.votenum}</i> 票</span>
									</div>
								</li>
                            </c:otherwise>
                          </c:choose>

							 <c:if test="${cdn.count % 4 == 0}">
                             </ul>
                            </c:if>

						</c:forEach>
						  <c:if test="${listsize % 4 != 0}">
                            </ul>
                            </c:if>
	        		</div>

	        	</div>
	        </div>



	        <!-- 滚动菜单  right -->
	        <div class="wl_Widget gem_Widget" >
        		<a href="<c:url value='/redirect?p=gemcoll/gotogem'/>" class="cp_gotohy"style=""></a>
					<a href="<c:url value='/vote/gotocollectupload'/>" class="send_cp" id="send_cp" style="" onclick="send_cp()">发布藏品</a>
					<a href="<c:url value='/vote/collectAllList#cp_list'/>" class="" id="toup_cp">我要投票</a>
					<a href="#" class="" id="cp_sees">往期回顾</a>
					<a href="javascript:void(0)" class="" id="my_send" onclick="my_send()">我的发布</a>
					<a href="#top" class="top_s" id="top_s"></a>
	        </div>
        </div>
	</div>
  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
