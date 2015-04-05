<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>旗舰商家</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- <link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/> -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_info.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_tuzhan.css'/>"/>
  <script type="text/javascript" src="<c:url value='/js/slideshow.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>


	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
  </head>

  <body>


<jsp:include page="../banner/banner.jsp"></jsp:include>


    <!-- 商家菜单 -->
    <jsp:include page="comment/qjsj_nav.jsp"></jsp:include>

    <!-- 左半部分 -->
    <div class="qjsj_left fl">
        <dl class="qj_lefttop">
          <dt class="qj_adbox fl">
            <!-- banner1  开始 -->
                <div class="comiis_wrapad" id="slideContainer" style="width:413px;height:334px;">
                  <div id="frameHlicAe" class="cl">
                    <div class="temp"></div>
                    <div class="block" style="width:auto;">
                      <div class="cl">
                        <ul class="slideshow" id="slidesImgs" style="height:334px">
                        
                        <c:forEach items="${tuijianinfo}" var="tuijian" varStatus="sta">
                         <li style="background:url(${tuijian.imgurltitle}) no-repeat top center;height:334px;">
                         <a href="<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id=${tuijian.id}'/>" target="_blank" style="width:100%;height:100%;cursor:pointer;display:block;">${tuijian.title}</a>
                         </li>
                        
                        </c:forEach>
                        </ul>
                      </div>
                      <div class="butbg_box"></div>
                      <div class="slidebar slidebar_qjsjinfo" id="slideBar">
                        <ul>
                          <li class="on" id="">1</li>
                          <li class="ie_pngs" id="">2</li>
                          <li class="ie_pngs" id="">3</li>
                          <li class="ie_pngs" id="">4</li>
                           <li class="ie_pngs" id="">5</li>
                            <li class="ie_pngs" id="">6</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
            <!--banenr end-->
          </dt>
          <dd class="qj_newsbox fr">
            <p class="qj_tits">新闻</p>
            <ul>
             <c:forEach items="${newinfo}" var="new" varStatus="sta">
              <li>
                  <a href="<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id=${new.id}'/>" target="_blank" class="fl">${new.title}</a>
                  <span class="fr"> 
                  <c:choose>
                    <c:when test="${fn:length(new.sfcreatedate) >10}">
                           ${fn:substring(new.sfcreatedate,5,10)}
                    </c:when>
                    <c:otherwise>${new.createdate}</c:otherwise>
                  </c:choose></span>
              </li>
              </c:forEach>
            </ul>
            <div class="qjnews_more">
              <a href="<c:url value='/flagshopbaseinfo/getFlagShopdynamic?id=${baseinfo.id}'/>" target="_blank">查看更多新闻&nbsp;>&nbsp;></a>
            </div>
          </dd>
        </dl>
         <!-- 商家视频 -->
        <div class="qj_tit1">
           <span class="red">商</span>家视频
           <span class="more_pics"><a href="<c:url value='/flagshopbaseinfo/getFlagShopvideo?id=${baseinfo.id}'/>" target="_blank">更多<span style="font-size:16px;">>></span></a></span>
        </div>
        <div style="height:340px;">
        
        <c:forEach items="${voidinfo}" var="void" varStatus="sta">
		  <c:if test="${sta.index== 0}">
		          <div class="big_video">
		           <img class="video_icon2"  src="<c:url value='/images/zt0910_img/zt_butt.png'/>"/>
		              <a href="<c:url value='/flagshopbaseinfo/getFlagShopvideodetail?baseid=${baseinfo.id}&id=${void.id}'/>" target="_blank">
		                  <img src="${void.imgurltitle}" width="389"height="340" alt="" />
		              </a>
		              <div class="video_tit_box"></div>
		              <p class="video_tit">
		                    <a href="<c:url value='/flagshopbaseinfo/getFlagShopvideodetail?baseid=${baseinfo.id}&id=${void.id}'/>" target="_blank">${void.title}</a>
		              </p>
		          </div>
		   </c:if>
		 </c:forEach>
		 <ul class="qj_videos">    <!-- 小视频列表 -->
        <c:forEach items="${voidinfo}" var="void" varStatus="sta">
		  <c:if test="${sta.index>=1}">
	            <li>
	              <div class="qj_video_top"></div>
	              <img class="video_icon2"  src="<c:url value='/images/zt0910_img/zt_butt.png'/>"/>
	              <div class="lit_video">
	                <a href="<c:url value='/flagshopbaseinfo/getFlagShopvideodetail?baseid=${baseinfo.id}&id=${void.id}'/>" target="_blank">
	                  <img src="${void.imgurltitle}" width="216"height="162" alt="" />
	              </a>
	              </div>
	              <div class="video_tit_box2">
	              </div>
	              <p class="video_tit2">
	                    <a href="<c:url value='/flagshopbaseinfo/getFlagShopvideodetail?baseid=${baseinfo.id}&id=${void.id}'/>" target="_blank">${void.title}</a>
	              </p>
	            </li>
            </c:if> 
          </c:forEach>
           </ul>
        </div>

                                         <!-- 商家图展 -->
        <div class="qj_tit1">
           <span class="red">商</span>家图展
           <span class="more_pics"><a href="<c:url value='/flagshopbaseinfo/getFlagShopPic?id=${baseinfo.id}'/>" target="_blank">更多<span style="font-size:16px;">>></span></a></span>
        </div>
        
        <div class="qj_picss">
                         <!-- 第一列图片 -->
          <ul class="fl qj_pic_lit">
           <c:forEach items="${picinfo}" var="pic" varStatus="sta">
           <c:if test="${sta.index<=1}">
            <li>
               <a href="<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id=${pic.id}'/>" target="_blank">
                  <img src="${pic.imgurltitle}" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id=${pic.id}'/>" target="_blank">${pic.title}</a>
              </div>
            </li>
            </c:if>
            </c:forEach>
          </ul>
                          <!-- 第二列图片 -->
          <ul class="fl qj_pic_lit qj_pic_lit2">
           <c:forEach items="${picinfo}" var="pic" varStatus="sta">
           <c:if test="${sta.index>1&&sta.index<=3}">
            <li>
              <a href="<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id=${pic.id}'/>" target="_blank">
                  <img src="${pic.imgurltitle}" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id=${pic.id}'/>" target="_blank">${pic.title}</a>
              </div>
            </li>
            </c:if>
            </c:forEach>
          </ul>
               <!-- 第三列图片 -->
          <ul class="fl qj_pic_lit">
            <c:forEach items="${picinfo}" var="pic" varStatus="sta">
           <c:if test="${sta.index>3&&sta.index<=5}">
            <li>
              <a href="<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id=${pic.id}'/>" target="_blank">
                  <img src="${pic.imgurltitle}" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id=${pic.id}'/>" target="_blank">${pic.title}</a>
              </div>
            </li>
           </c:if>
            </c:forEach>
          </ul>

        </div>

    </div>
    <!--  左半部分结束 -->

    <!-- 右半部分 -->
    <jsp:include page="comment/qjsj_right.jsp"></jsp:include>



  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
