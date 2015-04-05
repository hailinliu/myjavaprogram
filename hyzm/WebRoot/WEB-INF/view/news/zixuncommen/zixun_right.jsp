<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title></title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  <script type="text/javascript" src="<c:url value='/js/jquery-1.8.2.min.js'/>"></script>
	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
  </head>

  <body>
  <div class="zixun_box_right">         <!-- 藏品展示 -->
      <div class="zixun_right_box">  
        <span class="fl zixun_right_tit">藏品展示</span>
        <span class="more fr">
          <a href="#" target="_blank">更多</a>
        </span>
      </div>
      <div class="zixun_right_adbox">
        <div id="demo01" class="flexslider">
        <ul class="slides">
          <li><div class="img"><img src="<c:url value='/images/zixun/1.jpg'/>" height="271" width"360" alt="" /></div></li>
          <li><div class="img"><img src="<c:url value='/images/zixun/2.jpg'/>" height="271" width"360" alt="" /></div></li>
          <li><div class="img"><img src="<c:url value='/images/zixun/3.jpg'/>" height="271" width"360" alt="" /></div></li>
          <li><div class="img"><img src="<c:url value='/images/zixun/4.jpg'/>" height="271" width"360" alt="" /></div></li>
          <li><div class="img"><img src="<c:url value='/images/zixun/3.jpg'/>" height="271" width"360" alt="" /></div></li>
        </ul>
        </div><!--flexslider end-->
        <script type="text/javascript" src="<c:url value='/js/slider.js'/>"></script> 
          <script type="text/javascript">
          $(function(){
          
              $('#demo01').flexslider({
                  animation: "slide",
                  direction:"horizontal",
                  easing:"swing"
              });
              
              $('#demo02').flexslider({
                  animation: "slide",
                  direction:"vertical",
                  easing:"swing"
              });
              
          });
          </script>
      </div>
                                         <!-- 最新资讯 -->
      <div class="zixun_right_box" style="margin-top:20px;">
        <span class="fl zixun_right_tit">最新资讯</span>
        <span class="more fr">
          <a href="#" target="_blank">更多</a>
        </span>
      </div>
      <div class="new_news_box">
        <div class="new_news">
          <a href="#" target="_blank">
            <img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
          </a>
          <p>
            <a href="#">1111111111111111111111111111111111</a>
          </p>
        </div>
        <div class="new_news" style="float:right;">
          <a href="#" target="_blank">
            <img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
          </a>
          <p>
            <a href="#" target="_blank">1111111111111111111111111111111111</a>
          </p>
        </div>
      </div>
                                     <!-- 资讯列表 -->
      <ul class="new_news_list">
        <li>
          <a href="#" target="_blank">是是拉近了是是是是的是是是是是是是是的的是是的的是的的
          </a>
        </li>
        <li>
          <a href="#" target="_blank">是是拉近了是是是是的是是是是是是是是的的是是的的是的的
          </a>
        </li>
        <li>
          <a href="#" target="_blank">是是拉近了是是是是的是是是是是是是是的的是是的的是的的
          </a>
        </li>
        <li>
          <a href="#" target="_blank">
          是是拉近了是是是是的是是是是是是是是的的是是的的是的的
          </a>
        </li>
      </ul>
                  <!-- 专题活动 -->
      <div class="zixun_right_box" style="margin-top:20px;">
        <span class="fl zixun_right_tit">专题活动</span>
        <span class="more fr">
          <a href="#" target="_blank">更多</a>
        </span>
      </div>
      <div class="zhuanti_box">
        <a href="#" target="_blank">
          <img src="#" alt="" />
        </a>
        <a href="#" target="_blank">
          <img src="#" alt="" style="margin-top:20px;"/>
        </a>
      </div>
  </div>
  </body>
</html>
