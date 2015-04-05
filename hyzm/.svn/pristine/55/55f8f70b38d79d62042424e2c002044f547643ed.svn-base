<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>会员藏品区_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/gotohyzm/goto_hy.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/gotoactivi.js'/>"></script>

	<meta name=keywords content="会员藏品">
	<meta name=description content="卫视文化乐园-华豫之门官方网站会员藏品区">

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
	cp_State("${CurrentSession.level}","<c:url value='/vote/gotovipupload'/>","对不起，仅“星级及以上会员”才能在此页面发布藏品。")
}

//  我的发布 状态
function my_send(){
	cp_State("${CurrentSession.level}","<c:url value='/vote/myvipupload'/>","对不起，仅“星级及以上会员”才能查看我的发布！")
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

		<div id="b_top" style="margin-top:20px;">
	      <!-- <div class="banner_hb top_s"></div> -->
	      <div class="tp" style="background:url('<c:url value='/images/gotohyzm/vipcoll_banner.jpg'/>') center 0 no-repeat;width:100%;height:300px;"></div>
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
			                <h2 class="font18">藏品赏析</h2>
			            </div>
			            <ul id="hotTopicList">
			            	<li>
			            		<div class="hot-text">
			            			<h3>
			            				<a  class="font14" href="<c:url value='/collection/75.dhtml'/>" target="_blank">元代铜铸释迦摩尼像</a>
			            			</h3>
			            			<!-- <p>
			            				<a href="javascript:void(0)">编号：U85454545</a>
			            			</p> -->
			            		</div>
			            		<div class="hot-count">
			            			<a href="javascript:void(0)">&nbsp;&nbsp;珍宝台</a>
			            		</div>
			            	</li>
			            	<li>
			            		<div class="hot-text">
			            			<h3>
			            				<a  class="font14" href="<c:url value='/collection/8.dhtml'/>" target="_blank">东篱秋菊</a>
			            			</h3>
			            			<!-- <p>
			            				<a href="javascript:void(0)">编号：U85454545</a>
			            			</p> -->
			            		</div>
			            		<div class="hot-count">
			            			<a href="javascript:void(0)">&nbsp;&nbsp;专家</a>
			            		</div>
			            	</li>
			            	<li>
			            		<div class="hot-text">
			            			<h3>
			            				<a  class="font14" href="<c:url value='/collection/70.dhtml'/>" target="_blank">黄釉暗刻龙纹对碗</a>
			            			</h3>
			            			<!-- <p>
			            				<a href="javascript:void(0)">编号：U85454545</a>
			            			</p> -->
			            		</div>
			            		<div class="hot-count">
			            			<a href="javascript:void(0)">&nbsp;&nbsp;珍宝台</a>
			            		</div>
			            	</li>
			            	<li>
			            		<div class="hot-text">
			            			<h3>
			            				<a  class="font14" href="<c:url value='/collection/65.dhtml'/>" target="_blank">东汉黑漆古带铭青铜镜</a>
			            			</h3>
			            			<!-- <p>
			            				<a href="javascript:void(0)">编号：U85454545</a>
			            			</p> -->
			            		</div>
			            		<div class="hot-count">
			            			<a href="javascript:void(0)">&nbsp;&nbsp;华豫</a>
			            		</div>
			            	</li>
			            	<li>
			            		<div class="hot-text">
			            			<h3>
			            				<a  class="font14" href="<c:url value='/collection/67.dhtml'/>" target="_blank">明代鎏金观音铜造像</a>
			            			</h3>
			            			<!-- <p>
			            				<a href="javascript:void(0)">编号：U85454545</a>
			            			</p> -->
			            		</div>
			            		<div class="hot-count">
			            			<a href="javascript:void(0)">&nbsp;&nbsp;珍宝台</a>
			            		</div>
			            	</li>
			            	<li>
			            		<div class="hot-text">
			            			<h3>
			            				<a  class="font14" href="<c:url value='/collection/72.dhtml'/>" target="_blank">东汉变形四叶凤纹镜</a>
			            			</h3>
			            			<!-- <p>
			            				<a href="javascript:void(0)">编号：U85454545</a>
			            			</p> -->
			            		</div>
			            		<div class="hot-count">
			            			<a href="javascript:void(0)">&nbsp;&nbsp;珍宝台</a>
			            		</div>
			            	</li>

			            </ul>
			        </div>
		        </div>
		        <!-- right -->
		        <div class="z_rightbar">

				    <div class="z_main z_jshao" style="*padding-bottom:11px;">
				        <div class="z_mod_tit" style="width:708px;">
				            <i class="icon"></i>

				            <h2 class="font20" >“ 会员藏品区 ”活动介绍</h2>
				        </div>
				 		<div class="jshao-box" id="tabs-jshao">

				 			<!-- tab-项目介绍 -->
				 			<div class="jshao-text jshao-vipc1" id="tabs-jshao-1" style="padding-top:20px;*padding-top:10px;">
								<p>
									会员藏品区专为本站会员而设立，可上传自己的收藏精品，供藏友展览交流，以物会友。

								</p>
								<p>不同的会员级别上传藏品件数有限制：</p>
								<p> 星级会员，最多可上传2件。</p>
								<p> 贵宾会员，最多可上传4件。</p>
								<p> 高级会员，最多可上传6件。</p>
								<p> 超级会员，最多可上传8件。</p>
								<p>为了更加详细的展示您的藏品，请上传时尽量完善藏品的详细介绍和联系方式等各项信息。</p>

				 			</div>
				 			<!-- tab-节目规则 -->
				 			<div class="jshao-text" id="tabs-jshao-2" style="display:none;">
								<p>
									星级以上会员登录后点击“发布藏品”，填写上传藏品信息，即可进行展示并由所有藏友开始投票。

								</p>
								<p>
									藏品发布后还可在藏品详情页进行3次藏品信息补充说明。

								</p>
								<p>
									本期投票未进入前6名的将在本期结束后自动清除，下期需重新发布藏品。

								</p>

				 			</div>

							<!-- tab-操作说明 -->
							<div class="jshao-text" id="tabs-jshao-3" style="display:none;">
								<p>
									温馨提示：
“会员藏品区”并非《华豫之门》海选报名渠道，如需海选报名，请进入“海选报名”频道支付报名。

								</p>


				 			</div>

						</div>

    				</div>
		        </div>

	        </div>

	        <!-- top3 藏品列表 -->
	        <div class="mar_box">
	        	<div class="cp_list" id="cp_list">
	        		<div class="cp_h_tit">
	        			<h3>会员藏品区</h3>
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

							</li></li>
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
        <pg:pager url="../vote/vipCollectionList" items="${count}" maxPageItems="12" maxIndexPages="5">
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
				   <!-- 分页结束 -->
	        	</div>
	        </div>

	        <!-- 滚动菜单  right -->
	        <div class="wl_Widget vipc_Widget" >

	        		<a href="<c:url value='/vote/vipCollectionList'/>" class="cp_gotohy"style=""></a>
					<a href="javascript:void(0)" class="send_cp" id="send_cp" style="" onclick="send_cp()">发布藏品</a>
					<a href="<c:url value='/'/>" class="" id="toup_cp">回到首页</a>
					<a href="#" class="" id="cp_sees">往期回顾</a>
					<a href="javascript:void(0)" class="" id="my_send" onclick="my_send()">我的发布</a>
					<a href="#top" class="top_s" id="top_s"></a>

	        </div>
        </div>
	</div>
	
  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
