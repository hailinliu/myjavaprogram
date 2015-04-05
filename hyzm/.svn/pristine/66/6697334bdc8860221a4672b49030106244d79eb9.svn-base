<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>联系我们_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/help_us/help_us.css'/>"/>

	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<meta name=keywords content="联系我们">
	<meta name=description content="卫视文化乐园-华豫之门官方网站联系方式">

    <script>

    // 判断是否登录  和弹出层
      function login_btn() {


            // 是否登录
            //
            var my_element=$(".login");
            if(my_element.length>0){
               alert("填写申请需先登录，请登录。若未在本站注册，请先注册。");
               // return false;
               $('#js_N_login_wrap').css('display','block');
                window.location.href="#top"

            }else{
               window.location.href="<c:url value='/flagshop/addFlagDoc'/>"
            }

      }

    // 判断是否登录  和弹出层 -- 会员中心

      function login_user1() {


            // 是否登录
            //
            var my_element=$(".login");
            if(my_element.length>0){
               alert("您未登录，请登录。若未在本站注册，请先注册。");
               // return false;
               $('#js_N_login_wrap').css('display','block');
                window.location.href="#top"

            }else{
               window.location.href="<c:url value='/user/UserCenter'/>"
            }

      }
 </script>

  </head>


<body>
<jsp:include page="head/header.jsp"></jsp:include>


<div style="overflow:hidden;height:auto;height:450px;">

      <div class="help_main_box">
<div class="help_left">
<div class="help_title"><p>关于我们</p></div>
<div class="help_nav_box">
<ul>
  <li>
    <div class="nav_1ji">
      <p style="background-position: 13px -79px; background-repeat: no-repeat no-repeat;">关于我们</p>
    </div>
    <div style="display: block;" class="nav_2ji">
      <ul>
        <li>
          <a href="<c:url value='/redirect?p=about_us'/>">公司简介</a>
        </li>
        <li>
        <a href="<c:url value='/redirect?p=tel_us'/>" class="hover">联系我们</a>
      </li>
       <!--  <li>
          <a href="javascript:void(0)">管理团队</a>
        </li>
        <li>
          <a href="javascript:void(0)">发展历程</a>
        </li>
        <li>
          <a href="javascript:void(0)">媒体报道</a>
        </li> -->

    </ul>
  </div>
</li>

</ul>
</div>
</div>
<div class="help_right">
<div class="content_box"><span>联系我们<em>CONTACT</em></span>
<div class="tel">
<p>0371 - 60110891</p>
<strong>华豫之门官方网站-卫视文化乐园 真诚为您服务！</strong></div>

<div class="note">
<p>客服 QQ：800098776</p>

<p>邮箱：2539829391@qq.com</p>
<p>地址：河南省郑州市东风南路 东站南街升龙广场1号楼2单元711</p>


</div>
</div>

</div>

<div class="clear">&nbsp;</div>
</div>
</div>

<div style="position: absolute;width: 100%;left: 0;bottom:0;">
    <jsp:include page="foot/footer.jsp"></jsp:include>
  </div>
</body>
</html>
