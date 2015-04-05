<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>

<title>收藏资讯</title>
<meta charset="utf-8">
<meta name="viewport"
  content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>">
<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
  <style type="text/css">
  p img {width: 100%;}

  #scroll {
  position:fixed; bottom:50px; right:50px;
  }

  .scrollItem {
    width:20px; height:20px; cursor:pointer; text-align:center; padding-top:10px;
  }
  </style>
  <script type="text/javascript">
  $(function () {
        var speed = 800;//滚动速度
        //回到顶部
        $("#toTop").click(function () {
        $('html,body').animate({
        scrollTop: '0px'
      },
      speed);
        });
    });
  </script>
</head>

<body>
  <div data-role="page" id="demo-page" class="my-page">

    <jsp:include page="../head/header.jsp?name=收藏资讯"></jsp:include>
    <script type="text/javascript">
      $(function() {
        var tv_height = window.screen.height;
          var tv_width = window.screen.width;
          var vedio_height1920 = tv_height*0.15;
          var vedio_height1280 = tv_height*0.2;
          var vedio_height800 = tv_height*0.3;

          // alert(tv_height);
          if (tv_height<=3000 && tv_height>=1800) {   // 1920 - 2560
            $('.edui-faked-video').css({
              width: '100%',
              height: vedio_height1920
            });

          }
          if (tv_height<=1800&& tv_height>=1000) { // 1280  -   1024 -  1134
            $('.edui-faked-video').css({
              width: '100%',
              height: vedio_height1280
            });

          }
          if (tv_height<=1000 && tv_height>=700) {  // 960  -  854 -800
            $('.edui-faked-video').css({
              width: '100%',
              height: vedio_height800
            });

          }
          if (tv_height<=700 && tv_height>=300) {  // 640 -  480
            $('.edui-faked-video').css({
              width: '100%',
              height: vedio_height800
            });

          }

      })

    </script>
    <div role="main" class="ui-content">

          <div align="center">
            ${news.title}<br>
            ${news.createdate}
            <hr/>
          </div>
          ${news.content}

    </div><!-- /content -->
    <div id="scroll">
        <div class="scrollItem" id="toTop"><img src="<c:url value='/images/returntop.gif'/>"></div>
    </div>
  </div>
  <!-- /page -->
</body>
</html>
