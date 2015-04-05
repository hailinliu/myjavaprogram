<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>资讯_百宝箱_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/zixun/zixun.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/style.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/bbstyle.css'/>"/>

	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/baibao/slideshow.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/baibao/jquery-1.4.2.min.js'/>"></script>
	<meta name=keywords content="资讯">
	<meta name=description content="百宝箱资讯">
  </head>

  <body>
<jsp:include page="../head/header.jsp"></jsp:include>

<!--main style ben-->
    <div class="daohang_tit">
      <span class="gray_clor">当前位置</span> >
      <span><a href="<c:url value='/index'/>" target="_blank">乐园首页</a></span> >
      <span><a href="<c:url value='/baibaoindex/BaiBao_getIndex'/>" target="_blank">百宝箱</a></span> >
      <span class="gray_clor">资讯</span>
    </div>
    <div class="main_con">
        <div class="main_con_box">
            <div class="main_ad_box" id="js_ads_banner_top" style="display:block;">
              <a style="" href="javascript:void(0)" onclick="login_on('<c:url value='/redirect?p=mine/baibaojie/forshop'/>',1);">
                <img src="<c:url value='/images/baibaojie/sqsj_bbx.jpg'/>" width="770" height="400" />
              </a>
            </div>
            <div class="hot_collection_box">   <!-- 热门藏品 5 -->
                <div class="rm_tit">
                   <p>热门藏品</p>
                </div>

                  <div class="rm_clects">
                    <ul>
                      <c:forEach items="${randcollectionlist}" var="randInfo" varStatus="cdn" >
                      <c:if test="${cdn.index<3}">
                      <li>
                        <div class="rm_num">
                            ${randInfo.clicknum}
                        </div>
                        <div class="rm_cp">
                          <p>
                            <a href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${randInfo.id}" target="_blank"> ${randInfo.name}
                            </a>
                            <!-- <span class="red_clor">>></span> -->
                          </p>
                          <p>
                            <span style="margin-left:155px;" class="gray_clor">价格：</span>
                            <span class="gray_clor">${randInfo.price}</span>
                          </p>
                        </div>
                      </li>
                      </c:if>
                    </c:forEach>
                    </ul>

                    <!-- anniu -->
                    <div class="shqbtn">
                      <a hhref="javascript:void(0)" onclick="login_on('<c:url value='/redirect?p=mine/baibaojie/forshop'/>',1)" class="openshop"></a>
                      <a class="findshop" href="<c:url value='/BaiBao_getShopForList?redirect=baibaojie/sellers'/>" target="_blank"></a>
                    </div>
                    <div class="shops_ah">
                      <a class="" href="<c:url value='/redirect?p=baibaojie/bbx_zhuanti'/>" target="_blank">入驻百宝箱介绍</a>
                      <span class="fl">|</span>
                      <a class="" href="<c:url value='/redirect?p=baibaojie/servicerflow'/>" target="_blank">百宝箱使用指南</a>
                      <span class="fl">|</span>
                      <a class="" href="<c:url value='/redirect?p=baibaojie/servicerflow2'/>" target="_blank">交易中转使用</a>

                    </div>

                </div> <!-- 热门藏品结束 5-->
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function(){
          $(".tuijian_clets").find("li:last").css("margin-right","0");
        })
    </script>

    <div class="content_box">   <!-- 推荐藏品 5 -->
        <div class="tuijian_colet">
            <div class="tuijian_clet_tit">
              <p>华豫官网精品推荐</p>
            </div>
            <div class="tuijian_clets">
              <ul>
               <c:forEach items="${randcollectionlist3}" var="collInfo" varStatus="cdn" >
                <li>
                  <a href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${collInfo.id}" class="tuijian_clet_img" target="_blank">
                    <img src="http://116.255.149.172:7080/wswhly/Baibaourl//${fn:split(collInfo.imgurl,',')[0]}" alt=" ${collInfo.name}" class="tuijian_big_img"/>
                  </a>
                  <p>
                   <a href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${collInfo.id}" target="_blank" class="fl add_wids">
                    ${collInfo.name}
                    </a>
                  </p>
                  <div class="zz_tj_logo">
                  </div>
                </li>
               </c:forEach>
              </ul>

            </div>
        </div>   <!-- 华豫官网精品推荐 5-->

        <div class="tuijian_colet">
            <div class="tuijian_clet_tit">
              <p>推荐藏品</p>
            </div>
            <div class="tuijian_clets" style="height:282px;">
              <ul>
               <c:forEach items="${randcollectionlist2}" var="collInfo" varStatus="cdn" >
                <li>
                  <a href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${collInfo.id}" class="tuijian_clet_img" target="_blank">
                    <img src="http://116.255.149.172:7080/wswhly/Baibaourl//${fn:split(collInfo.imgurl,',')[0]}" alt=" ${collInfo.name}" class="tuijian_big_img"/>
                  </a>
                  <p>
                   <a href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${collInfo.id}" target="_blank" class="fl add_wids">
                    ${collInfo.name}
                    </a>
                  </p>
                </li>
               </c:forEach>
              </ul>

            </div>
        </div>   <!-- 推荐藏品 5-->

        <div class="tuijian_colet">
            <div class="tuijian_clet_tit">
              <p>入驻商家</p>
            </div>
            <div class="tuijian_clets">
              <ul>
               <c:forEach items="${maxcolllist}" var="collInfo" varStatus="cdn" >
                <li>
                  <a href="<c:url value='/BaiBao_getShop?redirect=/baibaojie/seller&id='/>${collInfo.id}" class="tuijian_clet_img" target="_blank">
                    <img src="http://116.255.149.172:7080/wswhly/Baibaourl//${fn:split(collInfo.img,',')[0]}" alt=" ${collInfo.shopname}" class="tuijian_big_img"/>
                  </a>
                  <p>
                   <a href="<c:url value='/BaiBao_getShop?redirect=/baibaojie/seller&id='/>${collInfo.id}" target="_blank" class="fl add_wids">
                    ${collInfo.shopname}
                    </a>
                  </p>
                </li>
               </c:forEach>
                 <li>
                  <a href="<c:url value='/redirect?p=baibaojie/bbx_zhuanti'/>" class="tuijian_clet_img" target="_blank">
                    <img src="<c:url value='/images/flagship/qjsj_zhaomeng.jpg'/>" class="tuijian_big_img"/>
                  </a>
                  <p>
                   <a href="<c:url value='/redirect?p=baibaojie/bbx_zhuanti'/>"  class="fl add_wids" target="_blank">
                    虚位以待
                    </a>
                  </p>
               </li>
              </ul>

            </div>
        </div>   <!-- 推荐藏品 5-->



        </div>

    </div>
  <div style="clear:both;"></div>
  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
