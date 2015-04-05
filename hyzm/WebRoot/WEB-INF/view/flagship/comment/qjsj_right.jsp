<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title></title>

 	 <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_comment.css'/>"/>

	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>

  </head>

  <body>

	<!-- 右半部分 -->
     <div class="qjsj_right fr">
        <div class="shop_news">
            <div class="relation_box">
              <img src="<c:url value='/images/flagship/qj_qq.jpg'/>"  width="88px" height="88px"  alt="QQ"  title="QQ"/>
              <img src="${baseinfo.weixin}" width="88px" height="88px"  alt="微信" title="微信" class="center_img"/>
              <img src="${baseinfo.sinlwblog}"  width="88px" height="88px" alt="新浪微博" title="新浪微博" />
            </div>
            <p class="shop_name">
             ${baseinfo.name}
            </p>
            <img src="${baseinfo.logo}" alt="" class="shop_namepic" height="85" width="260px"/>
            <ul class="shop_details">
              <li>
                主营：
                <span>${baseinfo.mainscope}</span>
              </li>
              <li>
                电话：
                <span>${baseinfo.contacttel}</span>
              </li>
              <li>
                地址：
                <span>${baseinfo.addresss}</span>
              </li>
            </ul>
        </div>

        <div class="map_box">
            <img src="${baseinfo.map}" alt="地图" width="280px" height="241px"/>
            <button  onclick="window.open('${baseinfo.map}')">查看大图</button>
        </div>
        <div class="shop_info">
              <p class="shop_infos">商家简介</p>
              <p class="shop_infoss">
                 <c:if test="${fn:length(baseinfo.introduce) > 300}">
                           ${fn:substring(baseinfo.introduce,0,300)}...
                  </c:if>
                  <c:if test="${fn:length(baseinfo.introduce)<= 300}">
                           ${baseinfo.introduce}
                  </c:if>
              </p>
        </div>

    </div>
 </div>

 </body>
</html>