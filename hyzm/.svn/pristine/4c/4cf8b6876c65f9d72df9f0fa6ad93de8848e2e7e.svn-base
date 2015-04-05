<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>往期回顾_我要上华豫_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	  <link rel="stylesheet" type="text/css" href="<c:url value='/css/gotohyzm/goto_hy.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/gotoactivi.js'/>"></script>

	<meta name=keywords content="往期回顾">
	<meta name=description content="往期回顾">
	<script type="text/javascript">

//TAB  切换
  $(function(){


      //  tab  切换
      $("#tabs-jshao").tabs().tabs('option', 'event', 'mouseover');

      // $("#tabs-jp").tabs().tabs('disabled');

      //       设置什么事件将触发选中一个标签页。
      // 初始：$('.selector').tabs({ event: 'mouseover' });
      // 获取：var event = $('.selector').tabs('option', 'event');
      // 设置：$('.selector').tabs('option', 'event', 'mouseover');


    });

//  方法写到 gotoactivi.js 全局调用
// 发布藏品 状态
function send_cp(){
	cp_State("${CurrentSession.level}","<c:url value='/vote/gotoupload'/>","对不起，仅“星级及以上会员”才能在此页面发布藏品。")
}

//  我的发布 状态
function my_send(){
	cp_State("${CurrentSession.level}","<c:url value='/vote/myActivityRelease'/>","对不起，仅“星级及以上会员”才能查看我的发布！")
}
//  投票
function vote (collectionid) {
	my_vote(collectionid,"<c:url value='/vote/vote'/>")
}

// 排序 【票数 & 最新】
function orderByNewest(){
	location.href="<c:url value='/vote/activityAllList?order=1'/>";
}

function orderByTicket(){
	location.href="<c:url value='/vote/activityAllList?order=2'/>";
}


</script>

  </head>

  <body>



	<div class="count_box">

		<!-- top1 -->

		<div id="b_top" style="margin-top:20px;">
	      <!-- <div class="banner_hb top_s"></div> -->
	      <div class="tp" style="background:url('<c:url value='/images/gotohyzm/banner2.jpg'/>') center 0 no-repeat;width:100%;height:300px;"></div>
	      <!-- <div class="banner_hb top_x"></div> -->
	    </div>


	    <div class="content_s">

	        <!-- top3 藏品列表 -->
	        <div class="mar_box">
	        	<div class="cp_list" id="cp_list">
	        		<div class="cp_h_tit">
	        			<h3>往期回顾</h3>
	        		</div>
	        		<div class="cp_sort">
	        			<span class="sort_text">活动期数：</span>

		        		<span class="" style="width:auto;">${syissue}前【 6 】 名</span>


	        		</div>

				<!-- 藏品列表 -->
	        		<div class="cplist_cont">

						<ul class="cplist_ul">
						 <c:forEach items="${listcycle}" var="upload" varStatus="cdn">
								<li>
									<div class="cp_img">
										<a target="_blank" class="vo_imgs" href="http://www.wswhly.com/vote/gotoHyvote?id=${upload.id}">
								        	 <img src="<%=PropertiesUtil.getPropertiesValue("uploadVoteurl")%>/${upload.imgurl}" width="235" height="216" alt="${upload.name}"/>
								         </a>
									</div>
									<div class="cp_tit">
										<a  class="font14" href="http://www.wswhly.com/vote/gotoHyvote?id=${upload.id}" target="_blank">${upload.name}</a>
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
								</c:forEach>
                             </ul>
	        		</div>

	        	</div>
	        </div>



	        <!-- 滚动菜单  right -->
	        <div class="wl_Widget" >
        		<a href="<c:url value='/vote/activityAllList'/>" class="cp_gotohy"style=""></a>
				<a href="javascript:void(0)" class="send_cp" id="send_cp" style="" onclick="send_cp()">发布藏品</a>
				<a href="<c:url value='/vote/activityAllList#cp_list'/>" class="" id="toup_cp">我要投票</a>
				<a href="<c:url value='/vote/agoactivityAllList'/>" class="" id="cp_sees">往期回顾</a>
				<a href="javascript:void(0)" class="" id="my_send" onclick="my_send()">我的发布</a>
				<a href="#top" class="top_s" id="top_s"></a>

	        </div>
        </div>

	</div>

	<!-- <div class="footer_box"> -->
	  	<jsp:include page="../foot/footer.jsp"></jsp:include>
	<!-- </div> -->


  </body>
</html>
