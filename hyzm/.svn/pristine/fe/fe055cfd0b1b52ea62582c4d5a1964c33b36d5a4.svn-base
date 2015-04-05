<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
  <script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  <meta name=keywords content="${news.label}">
  <meta name=description content="${news.label}">
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
           <li><a href="<c:url value='/news/getCollectionInfoByStyle'/>?style=${style.id}&currentPage=1&pageSize=10" target="_blank">${style.name}</a></li>
            </c:when> </c:choose>
         </c:forEach>
      </ul>
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

    <div class="zx_box clear">
       <div class="bt_box"><span class="fl sczj"></span></div>
       <div class="zx_nr2">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p></div>
         <div class="tu_pic2"><a href="<c:url value='/proficient/${pro.id}.dhtml'/>" target="_blank"><img src="${pro.imgurl}" alt="${pro.name}"/></a><p><a href="<c:url value='/proficient/${pro.id}.dhtml'/>" target="_blank">${pro.name}</a></p><p style="color:#666;">${pro.speciality}</p></div>
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div>

    <div class="zx_box clear">
       <div class="bt_box"><span class="fl scpk"></span></div>
       <div class="zx_nr">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" ${pro.name}/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" ${pro.name}/></p></div>
         <div class="tu_pic">
            <a href="<c:url value='/collection/${col.id}.dhtml'/>" target="_blank"><img src="<%=PropertiesUtil.getPropertiesValue("collectionurl")%>small/${col.imgurl}" alt="${col.name}" /></a><p><a href="<c:url value='/collection/${col.id}.dhtml'/>" target="_blank">${col.name}</a></p>
         </div>
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div>

  </div><!--left end-->

  <div class="mian_right clear">
     <div class="sczx_pic"><span class="bread_nav">当前位置：首页<span class="jt">></span>收藏资讯<span class="jt">></span><a>${news.stylename}</a></span></div>
     <div class="title_box">
       <h3>${news.title}</h3>
       <ul class="title_list">
           <li>时间：${news.createdate}</li>
           <li>点击：${news.clicknum}</li>
           <li>标签：${news.label}</li>
       </ul>
     </div>

    <script type="text/javascript">

      $(function() {
        var tv_height = window.screen.height;
          var tv_width = window.screen.width;

            $('.edui-faked-video').css('margin-left','-28px');


      })

    </script>

     <div class="nr_box clear">
       <p class="line"></p>
        <div class="sczx_nr">
              ${news.content}
         </div>
         <!-- 分享到 -->
         <div class="bdsharebuttonbox" style="margin-left: 360px;margin-top: 20px;"><a href="#" class="bds_more" data-cmd="more">藏品分享到：</a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博">新浪微博</a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间">QQ空间</a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博">腾讯微博</a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信">微信</a><a href="#" class="bds_kaixin001" data-cmd="kaixin001" title="分享到开心网">开心网</a></div>
            <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"24"},"share":{"bdSize":16},"image":{"viewList":["tsina","qzone","tqq","weixin","kaixin001"],"viewText":"藏品分享到：","viewSize":"24"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["tsina","qzone","tqq","weixin","kaixin001"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>

       <p class="line"></p>
     </div>
     <ul class="next_list">
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
     <!-- 藏品评论  strart -->
        <div id="comments_count" class="comments_count">
            <!--高速版，加载速度快，使用前需测试页面的兼容性-->
          <jsp:include page="../comments.jsp"></jsp:include>

        </div>
        <!-- 藏品评论  END -->
    <div class="about_zx"></div>
      <ul class="about_list fl">
         <c:forEach items="${list1}" var="news">
           <li><a href="<c:url value='/news/${news.id}.dhtml'/>" target="_blank">${news.title}</a></li>
         </c:forEach>
      </ul>
  </div><!--right end-->
</div>
<!--main style end-->
  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
