<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>我要上华豫_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/gotohyzm/goto_hy.css'/>"/>

	<script type="text/javascript" src="<c:url value='/js/gotoactivi.js'/>"></script>

	<meta name=keywords content="我要上华豫，华豫之门">
	<meta name=description content="我要上华豫">

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

<style type="text/css">
	.hot-text {
		height: 32px;
		line-height: 32px;
		white-space: normal;
}
</style>
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
	    	 <!-- top2 中奖、栏目介绍 -->
	    	<div class="mar_box">

	    		<!-- left -->
			    <div class="z_leftbar">

				    <div class="hot-topic">
			            <div class="z_mod_tit">
			                <i class="icon"></i>
			                <h2 class="font18">${syissue}期得票前六名公布栏</h2>
			            </div>
			            <ul id="hotTopicList">
			            <c:forEach items="${listcycle}" var="upload" varStatus="cdn">
			            	<li>
			            		<div class="hot-text">
			            			<h3>
			            				<a  class="font14" href="http://www.wswhly.com/vote/gotoHyvote?id=${upload.id}" target="_blank">${upload.name}</a>
			            			</h3>
			            			<!-- <p>
			            				<a href="javascript:void(0)">编号：U85454545</a>
			            			</p> -->
			            		</div>
			            		<div class="hot-count">
			            			<a href="javascript:void(0)">&nbsp;&nbsp;${upload.votenum} 票</a>
			            		</div>
			            	</li>
						</c:forEach>
			            </ul>
			        </div>
		        </div>
		        <!-- right -->
		        <div class="z_rightbar">

				    <div class="z_main z_jshao">
				        <div class="z_mod_tit">
				            <i class="icon"></i>

				            <h2 class="font20">“ 我要上华豫 ”活动介绍 </h2>

				        </div>
				 		<div class="jshao-box" id="tabs-jshao">

				 			<div class="jshao-table">
				 				<ul id="jshaoTable" class="yuan_d">
				 					<li class="">
				 						<a href="#tabs-jshao-1">活动介绍</a>
				 					</li>
				 					<li class="">
				 						<a href="#tabs-jshao-2">参与流程</a>
				 					</li>
				 					<li class="">
				 						<a href="#tabs-jshao-3">活动规则</a>
				 					</li>

				 				</ul>
				 			</div>

				 			<!-- tab-项目介绍 -->
				 			<div class="jshao-text" id="tabs-jshao-1">
								<p>
									“我要上华豫”是本站推出的一项藏品展示交流活动，每期通过投票的方式筛选出广大藏友最看好、最喜爱的 <i class="newred">6</i> 件藏品。被选藏品经藏家同意后可由官网埋单在海选期间由华豫专家进行鉴定。若是通过华豫专家团合议的真品，本站将负责推荐参与节目录制；我要上华豫意在通过投票、评论的互动方式，促进藏友之间的沟通交流，活跃藏友交流氛围，弘扬收藏文化。

								</p>

								<p>欢迎参与活动、投票和评论！参与投票的藏友，每期均有抽奖和奖励。祝您好运！</p>

								<p>当前投票期为${issue}期，投票获得前6名的藏品将可参加${syissue}月海选活动。</p>

				 			</div>
				 			<!-- tab-节目规则 -->
				 			<div class="jshao-text" id="tabs-jshao-2" style="display:none;">
								<p><i class="newred">参与流程：</i></p>
								<p>
									发布藏品  --  等待投票  --  投票结果  -- （若获得前6名）安排鉴定等事宜。


								</p>
								<p>
									 仅“星级及以上会员”才能发布藏品。<a target="_blank" href="<c:url value='/mine/gotovip'/>">我要去升级会员级别。</a>

								</p>
								<p>
									  参与投票的藏友登陆后即可投票。每期针对每件藏品只能投票一次。

								</p>
								<p>
									  投票藏友的抽奖于每期投票结束后开始，并公布结果。

								</p>
								<p>
									 温馨提示： “我要上华豫”并非《华豫之门》海选报名渠道，如需海选报名，请进入,<a target="_blank" href="<c:url value='/redirect?p=haixuan'/>">“海选报名”</a>频道支付报名。
								</p>

				 			</div>

							<!-- tab-操作说明 -->
							<div class="jshao-text jshao-14px" id="tabs-jshao-3" style="display:none;">
								<p>
									1，活动按自然月进行，月初开始，月底结束。
								</p>

								<p>2，被选藏品的鉴定安排在次月的海选活动时进行。</p>
								<p>3，仅“星级及以上会员”才能发布藏品。<a target="_blank" href="<c:url value='/mine/gotovip'/>">我要去升级会员级别。</a></p>
								<p>4，藏品发布后，可在藏品详情页进行3次藏品信息补充说明。</p>
								<p>5，每期，每位“有发布资格的会员”最多可以发布5件藏品参与投票。</p>
								<p>6，仅本站的注册会员才能进行投票。每人每期针对每件藏品只能投票一次。</p>
								<p>7，投票结束后，得票最多的前6名获胜，获得“免费鉴定资格”。</p>
								<p>8，投票结束后，从“得票最多的前6名”的投票总数中随机抽取6位幸运藏友，每人获得免费海选鉴定票 1 张。</p>
								<p>9，当期投票未进入前6名的藏品，将在当期结束后清除信息，下期投票需重新发布藏品。</p>
				 			</div>
						</div>
    				</div>
		        </div>
	        </div>
	        <!-- top3 藏品列表 -->
	        <div class="mar_box">
	        	<div class="cp_list" id="cp_list">
	        		<div class="cp_h_tit">
	        			<h3>投票藏品</h3>
	        		</div>
	        		<div class="cp_sort">
	        			<span class="sort_text">排序：</span>
	        			<c:choose>
	        			  <c:when test="${order eq 1}">
		        			<span class="sort_s sort_times h_click" onclick="orderByNewest()">最新</span>
		        			<span class="sort_s sort_nums" onclick="orderByTicket()">票数</span>
	        			  </c:when>
	        			  <c:otherwise>
		        			<span class="sort_s sort_nums" onclick="orderByNewest()">最新</span>
		        			<span class="sort_s sort_times h_click" onclick="orderByTicket()">票数</span>
	        			  </c:otherwise>
	        			</c:choose>
	        		</div>

				<!-- 藏品列表 -->
	        		<div class="cplist_cont">
						<c:forEach items="${uploadList}" var="upload" varStatus="cdn">
						 <input id="collectionid${upload.id}" type="hidden" value="${upload.id}" />
						 <input id="votes${upload.id}" type="hidden" value="${upload.votenum}" />
                       <c:if test="${cdn.count % 4 == 1}">
						<ul class="cplist_ul">
						</c:if>
						    <c:choose>
						      <c:when test="${cdn.count % 4 == 0}">
								<li style="margin-right:0;">
									<div class="cp_img">
										<a class="vo_imgs" target="_blank" href="<c:url value='/vote/gotoHyvote?id=${upload.id}&type=2'/>">
						                  <img src="<%=PropertiesUtil.getPropertiesValue("uploadVoteurl")%>/${upload.imgurl}" width="235" height="216" alt="${upload.name}"/>
						         </a>
									</div>
									<div class="cp_tit">
										<a target="_blank" href="<c:url value='/vote/gotoHyvote?id=${upload.id}&type=2'/>">${upload.name}</a>
										<p>
											<span>编号：</span>
											<span>${upload.serialnum}</span>
										</p>
									</div>
									<div class="cp_toupiao">
										<span class="fl">		<!-- 投票按钮 -->
											<input type="button" value="" onclick="vote(${upload.id});" />
										</span>
										<span class="fr"><i id="vote${upload.id}">${upload.votenum}</i> 票</span>
									</div>
								</li>
						      </c:when>
						      <c:otherwise>
								<li>
									<div class="cp_img">
										<a class="vo_imgs" target="_blank" href="<c:url value='/vote/gotoHyvote?id=${upload.id}&type=2'/>">
						                  <img src="<%=PropertiesUtil.getPropertiesValue("uploadVoteurl")%>/${upload.imgurl}" width="235" height="216" alt="${upload.name}"/>
						         </a>
									</div>
									<div class="cp_tit">
										<a target="_blank" href="<c:url value='/vote/gotoHyvote?id=${upload.id}&type=2'/>">${upload.name}</a>
										<p>
											<span>编号：</span>
											<span>${upload.serialnum}</span>
										</p>
									</div>
									<div class="cp_toupiao">
										<span class="fl">		<!-- 投票按钮 -->
											<input type="button" value="" onclick="vote(${upload.id});" />
										</span>
										<span class="fr"><i id="vote${upload.id}">${upload.votenum}</i> 票</span>
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

	<!-- 分页 -->


	<c:if test="${count / pageSize > 1}">
     <div class="paging clear">

        <pg:pager url="../vote/activityAllList" items="${count}" maxPageItems="12" maxIndexPages="5">

            <pg:param name="pageSize" value="${pageSize}" />
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
		<!-- 分页结束 自动居中js -->
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

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
