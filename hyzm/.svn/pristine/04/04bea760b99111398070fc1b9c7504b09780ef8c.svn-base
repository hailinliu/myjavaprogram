<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String id="";
if(request.getParameter("id")!=null && !"".equals(request.getParameter("id"))){
  id=request.getParameter("id");
}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>${yclots.name}_卫视文化乐园-华豫之门官方网站</title>

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
  <meta name=keywords content="预展藏品，拍品">
  <meta name=description content="拍品信息">
  </head>
  <body>


<jsp:include page="../banner/banner.jsp"></jsp:include>

<a style="color:blue"></a>
<!--main style ben-->
<div class="main_box clear">
   <div class="scpjs_pic" style="background: url(<c:url value='/images/pmyuzhan/paipinc_bg.jpg'/>) top center no-repeat;">
      <span class="bread_nav">当前位置：首页<span class="jt">></span>拍卖预展<span class="jt">></span> <a href="#" target="_blank">拍品名称</a></span>
   </div>
   <div class="scpjs_nr clear">
  <img src="http://admin.wswhly.com/wswhly/zengjipaipin/${fn:split(yclots.image,',')[0]}" alt="${yclots.name}" />
     <div class="scpjs_list">

       <div style="margin-bottom:15px;margin-left:36px;">
        <span  style="font-size:18px;font-weight:bold;">${yclots.name}</span>
       </div>
         <table width="100%" border="0" cellspacing="1" cellpadding="1" style="text-align:left;margin-left:10px;">

              <tr>
                <td class="red">作者：</td>
                <td>${yclots.autor}</td>
              </tr>
              <tr>
                <td class="red">作品分类：</td>
                <td>${yclots.classes}</td>
              </tr>
              <tr>
                <td class="red">创作年代：</td>
                <td>${yclots.year}</td>
              </tr>

              <tr>
                <td class="red">估价：</td>
                <td>${yclots.price}</td>
              </tr>

               <c:if test="${yclots.cjprice!=''}">
                <tr>
                <td class="red">成交价：</td>
                <td>${yclots.cjprice}</td>
               </tr>
              </c:if>




              <tr style="border-top:1px dotted  #ccc;">

                <td class="red" style="padding-top:12px;">专场：</td>
                <td style="padding-top:12px;">${yclots.specialname}</td>
              </tr>
              <tr>
                <td class="red">时间：</td>
                <td>${yclots.actiontime}</td>
              </tr>
              <tr>
                <td class="red">拍卖会：</td>
                <td>${yclots.auctionname}</td>
              </tr>
              <tr>
                <td class="red">拍卖公司：</td>
                <td>${yclots.as_name}</td>
              </tr>
               <tr>
                <td colspan="2" style="padding-top:12px;"> <a href="<c:url value='/redirect/?p=daigou/DaiGouInfo&lotsid='/>${yclots.id}" style="background: #a80000;color: #fff;padding: 8px 12px;border-radius: 5px;margin-left: 20px">申请代购</a></td>
              </tr>

            </table>

       </div>
        <!-- 分享功能 -->
            <div class="bdsharebuttonbox fl" style="margin-left: 28px;margin-top: 15px;"><a href="#" class="bds_more" data-cmd="more">藏品分享到：</a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博">新浪微博</a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间">QQ空间</a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博">腾讯微博</a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信">微信</a><a href="#" class="bds_kaixin001" data-cmd="kaixin001" title="分享到开心网">开心网</a></div>
            <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"24"},"share":{"bdSize":16},"image":{"viewList":["tsina","qzone","tqq","weixin","kaixin001"],"viewText":"藏品分享到：","viewSize":"24"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["tsina","qzone","tqq","weixin","kaixin001"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>


   </div>

  <!-- 拍品详情 -->

      <div class="scpjs_cont">
       <p>${yclots.suggest}${yclots.note}</p>
       <a>
       <c:forTokens items="${yclots.image}" delims="," var="val">
				    <img src="http://admin.wswhly.com/wswhly/zengjipaipin/${val}" alt="" width="1140px" onclick="window.open('http://admin.wswhly.com/wswhly/zengjipaipin/${val}')"/>
				</c:forTokens>
       </a>
   </div>



  </div>

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
