<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>旗舰商家简介</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_aboutus.css'/>"/>
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
        <div class="qj_video_head">
            <span class="qj_sy_dot fl"></span>
            <a href="<c:url value='/redirect?p=index'/>" target="_blank" class="fl">首页</a>
            <span class="fl">&nbsp;>&nbsp;</span>
            <a href="<c:url value='/redirect?p=flagship/qjsj_list'/>" target="_blank" class="fl">旗舰商家</a>
            <span class="fl">&nbsp;>&nbsp;</span>
            <a href="<c:url value='/redirect?p=flagship/qjsj_aboutus'/>" target="_blank" class="fl">商家简介</a>
            <span class="qj_video_line fr"></span>
        </div>

        <!-- 简介开始 -->
        <div class="abouts_box">
          <div class="abouts_title">
            <h3>华豫官网旗舰商家</h3>
          </div>

          <div class="abouts_cont">
            <img src="http://admin.wswhly.com/wswhly/ueditor/jsp/upload/20140917/41401410933031383.jpg"  width="240" height="270" class="img_left"/>
            <p class="abtext">
            华豫官网旗舰商家是全国各地艺术品、收藏品的经营商家在网络上的展示平台。借助于《华豫之门》节目的广泛影响力和官网的传播力量，可以帮助平台商家在网络上更便捷、高效地进行推广和宣传。
            <br>旗舰商家是指与本站有合作关系的实体经营商家。本站将授予“华豫官网旗舰商家”的标牌。本站将通过经营融资、商家艺术品在线展览、现场专家活动和华豫藏品寄售等一系列方式对进驻商家进行宣传和合作。
            </p>
            <br />
            <p class="abtext">
            <a href="http://www.wswhly.com/redirect?p=benefitlist" target="_blank">查看旗舰商家的受益明细</a>
            <br>商家进驻条件：
            </p>
            <p class="abtext">
            1，在国内一线城市、省会城市或艺术品知名发源地，从事高端艺术品和奢侈品的实体店面经营，经营年限不低于两年；
            </p>
            <p class="abtext">
            2，能提供价值百万以上的艺术品，并能说明其合法来源；
            </p>
            <p class="abtext">
            3，实体店面有良好的安保设施和接待环境。
            </p>
            <br />
            <p class="abtext">
               更多详情，点击
                <a href="http://www.wswhly.com/redirect?p=zhaoshang" target="_blank">“旗舰商家诚邀加盟中”</a>
            </p>
          </div>
        </div>

        <!-- 商家动态 -->
        <jsp:include page="comment/qjsj_news.jsp"></jsp:include>

    </div>
    <!--  左半部分结束 -->

    <!-- 右半部分 -->
    <jsp:include page="comment/qjsj_right.jsp"></jsp:include>



  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
