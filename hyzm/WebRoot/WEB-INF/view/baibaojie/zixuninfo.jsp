<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>${news.title}</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/zixun/zixun.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_comment.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
	<meta name=keywords content="${news.label}">
	<meta name=description content="${news.label}">
    </head>

  <body>
<jsp:include page="../head/header.jsp"></jsp:include>
<!--main style ben-->
<div class="main_box clear" style="margin-top:10px;">
  <div class="zixun_box_left" style="padding-bottom:20px;">
      <div class="zixun_bread">
          <span class="gray_clor">当前位置：</span>
          <span>
            <a href="<c:url value='/index'/>" target="_blank">乐园首页</a> >
          </span>
          <span>
            <a href="<c:url value='/baibaoindex/BaiBao_getIndex'/>" target="_blank">百宝箱</a> >
          </span>
          <span class="gray_clor">${news.title}</span>
          <span>
          </span>
      </div>
      <div class="zixun_title_box">
           <h3>${news.title}</h3>
           <p class="zixun_title_boxin">
               <span>时间：${news.createdate}</span>
               <span>点击：${news.clicknum}</span>
               <span>标签：${news.label}</span>
           </p>
      </div>
      <div class="zixun_content">
        ${news.content}
      </div>
        <div class="bdsharebuttonbox" style="margin-left: 360px;margin-top: 20px;"><a href="#" class="bds_more" data-cmd="more">分享到：</a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博">新浪微博</a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间">QQ空间</a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博">腾讯微博</a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信">微信</a><a href="#" class="bds_kaixin001" data-cmd="kaixin001" title="分享到开心网">开心网</a></div>
            <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"24"},"share":{"bdSize":16},"image":{"viewList":["tsina","qzone","tqq","weixin","kaixin001"],"viewText":"藏品分享到：","viewSize":"24"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["tsina","qzone","tqq","weixin","kaixin001"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
      <ul class="next_list" style="margin-top:20px;width:760px;overflow:hidden;">
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
               <a href="<c:url value='/news/${pre.id}.dhtml'/>">上一篇</a>
             </span>
             <span class="headline fl">
               <a href="<c:url value='/news/${pre.id}.dhtml'/>" target="_blank">${pre.title}</a>
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
               <a href="<c:url value='/news/${next.id}.dhtml'/>">下一篇</a>
             </span>
             <span class="headline fl">
               <a href="<c:url value='/news/${next.id}.dhtml'/>" target="_blank">${next.title}</a>
             </span>
             </c:otherwise>
           </c:choose>
        </li>
       </ul>
       <!-- 商家动态 -->
   	    <jsp:include page="../baibaojie/commen/baibaojie_news.jsp"></jsp:include>
       <!-- 评论 -->
        <jsp:include page="../comments.jsp"></jsp:include>
  </div>
    <jsp:include page="../baibaojie/commen/zixun_right.jsp"></jsp:include>
</div>

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
