<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>华豫之门APP下载</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
    <script src="<c:url value='/jquery/jquery-1.6.1.min.js'/>"></script>
    <script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
<style type="text/css">
    body{margin:0;padding:0;font-size:12px;}
    p{margin:0;padding:0;}
    .main_box{width:100%;text-align:center;}
    .top p{font-size:2em;text-align:center;width:100%;}
    .logo{text-align:center;margin-top:20px;padding:0 10%;}
    .txt{text-align:center;font-size:2em;line-height:1.3em;padding:0.8em 1em;}
    .download{text-align:center;}
    .ssnone{display: none;}
    #uczhebi{position: fixed; left:0; top:0; background: rgba(0,0,0,0.8); filter:alpha(opacity=80); width: 100%; height:100%; z-index: 100;display: none;}
    #uczhebi p{text-align: center; margin-top: 10%; padding:0 5%;}
</style>



        <script language="javascript" type="text/javascript">

            /*

             * 智能机浏览器版本信息:

             *

             */
            var myDate = new Date();
            var apkdate= myDate.getTime();

                window.onload = function () {
                    var u = navigator.userAgent;
        if (u.indexOf('Android') > -1 || u.indexOf('Linux') > -1) {//安卓手机
            var ua = navigator.userAgent.toLowerCase();
                if(ua.match(/MicroMessenger/i)=="micromessenger") {//微信
                    // window.location="http://wap.wswhly.com/anzhuoapp.html";
                    $('#uczhebi').show();
                    // $('#weixinsss').show();
                    // $('#hyapp').hide();


                } else {
                        $('#uczhebi').hide();
                      window.location.href = "http://www.wswhly.com/wswhly1.7.apk";
                      // $('#hyapp').show();

                }


        } else if (u.indexOf('iPhone') > -1) {//苹果手机
        window.location.href = "https://itunes.apple.com/cn/app/hua-yu-zhi-men/id912137110?l=en&mt=8";

        } else if (u.indexOf('Windows Phone') > -1) {//winphone手机
        alert("版本正在开发中！");
        }
        }

        </script>
  </head>
  <body>
    <div id="uczhebi">
        <p><img src="<c:url value='/images/live_weixin.png'/>" width="100%"/></p>
    </div>
    <!-- <div class="main_box ssnone" id="weixinsss">
        <div class="top">
            <p>您好，检测出您使用的是微信扫描，微信暂不支持直接下载。</p>
        </div>
        <div class="txt">

            <p>您需要点击微信右上角图标  <img src="<c:url value='/images/weixin_bit.jpg'/>" width="30"/>  后，选择“在浏览器中打开”，任选一款浏览器，即可下载此APP。</p>
        </div>

        <div class="download">
            <img src="<c:url value='/images/tishi001.gif'/>" width="100%" />
        </div>

    </div> -->
    <div class="main_box" id="hyapp">
        <div class="top">
            <p>华豫之门APP</p>
        </div>
        <div class="logo">
            <img src="<c:url value='/images/logo2.png'/>" />
        </div>
        <div class="txt">
            <p>随时随地掌握最新收藏资讯，玩转收藏，你也可以成为大师。</p>
        </div>

        <div class="download">
            <a href="http://www.wswhly.com/wswhly1.7.apk">
                <img src="<c:url value='/images/download2.png'/>" />
            </a>
        </div>
        <div class="download">
            <a href="https://itunes.apple.com/cn/app/hua-yu-zhi-men/id912137110?l=en&mt=8">
                <img src="<c:url value='/images/download3.png'/>" />
            </a>
        </div>
    </div>
</body>
</html>