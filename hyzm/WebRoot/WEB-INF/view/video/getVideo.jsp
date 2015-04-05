<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>${video.title}_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/swfobject.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/scroll.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<meta name=keywords content="${video.title}">
	<meta name=description content="卫视文化乐园-华豫之门官方网站_${video.title}">
  	<style type="text/css">
#demo {
	background: #FFF;
	overflow: hidden;
	width: 950px;
}

#indemo {
	float: left;
	width: 800%;
}

#demo1 {
	float: left;
}

#demo2 {
	float: left;
}
</style>
  </head>

  <body>
    <jsp:include page="../head/header.jsp"></jsp:include>

   <jsp:include page="../banner/banner.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear">
   <div class="qjtjs_pic">
      <span class="bread_nav">当前位置：首页<span class="jt">></span>专家讲坛<span class="jt">></span>视频讲座<span class="jt">></span> <a href="#">${video.title}</a></span>
   </div>
   <div class="qjtjs_nr clear">
     <div class="title_box2">
       <h3>${video.title}</h3>
       <ul class="title_list2">
           <li>讲座专家：${video.proficient}</li>
           <li>上传时间：${video.uploaddate}</li>
       </ul>
     </div>

      <div class="video_box clear">
			<p id="player1"><a href="http://www.macromedia.com/go/getflashplayer">Get the Flash Player</a> to see this player.</p>
			<script type="text/javascript">
			 var s1 = new SWFObject("<c:url value='/swfvideo/FlvPlayer.swf'/>","single","700","500","7");
			 s1.addParam("allowfullscreen","true");
			 s1.addVariable("file","${video.name}");

			 s1.addVariable("image","${video.imgurl}");
			 s1.addVariable("width","700");
			 s1.addVariable("height","500");
			 s1.write("player1");
			</script>


			<!-- 分享功能 -->
            <div class="bdsharebuttonbox" style="margin-left: 514px;margin-top: 35px;"><a href="#" class="bds_more" data-cmd="more">藏品分享到：</a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博">新浪微博</a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间">QQ空间</a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博">腾讯微博</a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信">微信</a><a href="#" class="bds_kaixin001" data-cmd="kaixin001" title="分享到开心网">开心网</a></div>
            <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"24"},"share":{"bdSize":16},"image":{"viewList":["tsina","qzone","tqq","weixin","kaixin001"],"viewText":"藏品分享到：","viewSize":"24"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["tsina","qzone","tqq","weixin","kaixin001"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>

      </div>

       <ul class="next_list fl">
        <li>
          <c:choose>
             <c:when test="${pre.id == 0}">
	           <span class="content fl">
	             <a>上一篇</a>
	           </span>
	           <span class="headline fl">
	             <a>没有了</a>
	           </span>
             </c:when>
             <c:otherwise>
	           <span class="content fl">
	             <a href="<c:url value='/video/${pre.id}.dhtml'/>">上一篇</a>
	           </span>
	           <span class="headline fl">
	             <a href="<c:url value='/video/${pre.id}.dhtml'/>">${pre.title}</a>
	           </span>
             </c:otherwise>
           </c:choose>
        </li>
        <li>
          <c:choose>
             <c:when test="${next.id == 0}">
	           <span class="content fl">
	             <a>下一篇</a>
	           </span>
	           <span class="headline fl">
	             <a>没有了</a>
	           </span>
             </c:when>
             <c:otherwise>
	           <span class="content fl">
	             <a href="<c:url value='/video/${next.id}.dhtml'/>">下一篇</a>
	           </span>
	           <span class="headline fl">
	             <a href="<c:url value='/video/${next.id}.dhtml'/>">${next.title}</a>
	           </span>
             </c:otherwise>
           </c:choose>
        </li>
     </ul>
      <p class="onclick_wz fr">点击量：<span class="red">${video.clicknum}</span></p>



   </div>

   <div class="about_video"></div>

   <div class="scrollleft" id="demo">
   	<div id="indemo" style="width:800%;float:left;">
		 <ul id="demo1" class="zj_list" style="height:300px;">
		    <c:forEach items="${videoList}" var="video">
				<li>
					<a href="<c:url value='/video/${video.id}.dhtml'/>"><img src="${video.imgurl}" alt="${video.title}" width="235" height="216"/></a>
					<p><a href="<c:url value='/video/${video.id}.dhtml'/>">${video.title}</a></p>
				</li>
		    </c:forEach>
		</ul>
		 <div id="demo2" style="float:left;margin-left:10px;height:300px;" class="zj_list"></div>
	</div>
</div>
 <!-- 藏品评论  strart -->
        <div id="comments_count" class="comments_count">
            <!--高速版，加载速度快，使用前需测试页面的兼容性-->
          <jsp:include page="../comments.jsp"></jsp:include>

        </div>
        <!-- 藏品评论  END -->

</div>
<!--main style end-->

    <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
