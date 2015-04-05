<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>${info.name}_拍品征集_卫视文化乐园-华豫之门官方网站</title>

  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
   <link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
   <link rel="stylesheet" type="text/css" href="<c:url value='/css/pmyuzhan/pmyuzhan.css'/>"/>
  <script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>

<meta name=keywords content="${info.name}">
<meta name=description content="${info.name}">

 <style type="text/css">
    .qujp,.qujp2{
      width:100px;
      height:28px;
      color:#fff;
      font-size:14px;
      cursor:pointer;
      border-radius:6px;
      font-weight:bold;
    }
    .qujp2{
      background: #999;
    }
    .qujp{
       background:#CD3200;
    }
    .qujp:hover{
      background: #ED3900;
    }
 </style>
  </head>

  <body>
<jsp:include page="../banner/banner.jsp"></jsp:include>
<div class="main_box clear" style="position:relative;">
   <div class="scpjs_pic" style="background:url(<c:url value='/images/collect/pp_xiangqing_bg.jpg'/>) no-repeat left center;">
      <span class="bread_nav">当前位置：首页<span class="jt">&gt;</span>拍品征集<span class="jt">&gt;</span> 拍品介绍</span>
   </div>
   <div class="scpjs_nr clear">
  <img src="http://admin.wswhly.com/wswhly/zengjipaipin/${fn:split(info.image,",")[0]}" alt="${info.name} ">
     <div class="scpjs_list" >

       <div style="margin-bottom:15px;margin-left:36px;">
        <span style="font-size:18px;font-weight:bold;">${info.name} </span>
       </div>
         <table width="100%" border="0" cellspacing="1" cellpadding="1" style="text-align:left;margin-left:10px;">

              <tbody><tr>
                <td class="red">作者：</td>
                <td>${info.autor}&nbsp;&nbsp;</td>
              </tr>
              <tr>
                <td class="red">尺寸：</td>
                <td>${info.size}</td>
              </tr>
              <tr style="border-bottom:1px dotted  #ccc;">
                <td class="red">年代：</td>
                <td>${info.year}</td>
              </tr>
              <tr>
                <td class="red" style="padding-top:12px;">拍卖专场：</td>
                <td style="padding-top:12px;">${info.specialname}</td>
              </tr>
              <tr>
                <td class="red">起拍价格：</td>
                <td style="color:#ff0000">${info.qpprice}元</td>
              </tr>
            </tbody></table>

            <c:if test="${info.taobaourl!=''}">
            <div style="position:absolute;top: 364px;left: 411px;">   <!-- 可点击 -->
              <button class="qujp" onclick="window.open('${info.taobaourl}')">前去竞拍</button>
              <div style="width:35px;height:35px;background:url(<c:url value='/images/qtzs/chuizi1.png'/>) no-repeat 0 0 ; position: absolute;left: 115px;top: -2px;"></div>
            </div>
            </c:if>
             <c:if test="${info.taobaourl==''}">
            <div style="position:absolute;top: 364px;left: 411px;"> <!-- 不可点击按钮 -->
              <button class="qujp2">前去竞拍</button>
              <div style="width:35px;height:35px;background:url(<c:url value='/images/qtzs/chuizi1.png'/>) no-repeat 0 0 ; position: absolute;left: 115px;top: -2px;"></div>
            </div>
             </c:if>

             <!-- 分享功能 -->
            <div class="bdsharebuttonbox fl" style="margin-left: 38px;margin-top: 50px;"><a href="#" class="bds_more" data-cmd="more">藏品分享到：</a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博">新浪微博</a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间">QQ空间</a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博">腾讯微博</a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信">微信</a><a href="#" class="bds_kaixin001" data-cmd="kaixin001" title="分享到开心网">开心网</a></div>
            <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"24"},"share":{"bdSize":16},"image":{"viewList":["tsina","qzone","tqq","weixin","kaixin001"],"viewText":"藏品分享到：","viewSize":"24"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["tsina","qzone","tqq","weixin","kaixin001"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>

       </div>
   </div>

  <!-- 拍品详情 -->

      <div class="scpjs_cont">
       <p>${info.suggest}</p>
       <a>
       <c:forEach items="${fn:split(info.image,',')}" var="val" >
    <img src="http://admin.wswhly.com/wswhly/zengjipaipin/${val}" width="1140px" onclick="window.open('http://admin.wswhly.com/wswhly/zengjipaipin/${val}')">
     </c:forEach>

       </a>
   </div>

  </div>

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
