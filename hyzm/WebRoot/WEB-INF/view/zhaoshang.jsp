<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>旗舰商家入驻-入驻流程_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/vip.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/box111.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/swfobject.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/vip.js'/>"></script>
	<meta name=keywords content="旗舰商家入驻，入驻流程">
	<meta name=description content="卫视文化乐园-华豫之门官方网站旗舰商家入驻介绍">

    <script>

  //   // 判断是否登录  和弹出层
  //     function login_btn() {


  //           // 是否登录
  //           //
  //           var my_element=$(".login");
  //           if(my_element.length>0){
  //              alert("填写申请需先登录，请登录。若未在本站注册，请先注册。");
  //              // return false;
  //              $("#login_box").show();
  //               window.location.href="#top"

  //           }else{
  //              window.location.href="<c:url value='/flagshop/addFlagDoc'/>"
  //           }

  //     }

  //   // 判断是否登录  和弹出层 -- 会员中心

  //     function login_user1() {


  //           // 是否登录
  //           //
  //           var my_element=$(".login");
  //           if(my_element.length>0){
  //              alert("您未登录，请登录。若未在本站注册，请先注册。");
  //              // return false;
  //              $('#js_N_login_wrap').css('display','block');
  //               window.location.href="#top"

  //           }else{
  //              window.location.href="<c:url value='/user/UserCenter'/>"
  //           }

  //     }

  // }
  //
 </script>
 <style type="text/css">
    .getmores{font-family: "微软雅黑";}
    .getmores:link,.getmores:visited{color: #3299da;}
  </style>
  </head>


<body>
<jsp:include page="head/bmlogin.jsp"></jsp:include>


<div style="text-align:center;overflow:hidden;height:auto;">



    <div class="tp" style="position:relative;z-index:101;background:url(images/zhaoshang/zhaos_1.jpg) repeat center 0;width:100%;height:509px;">
        <div style="width:1150px;height:100%;overflow:hidden;position:relative;margin: 0 auto;background:none;">
          <a href="<c:url value='./'/>" style="background:none;display:block;width:170px;height:40px;position:absolute;bottom: 39px;left: 384px;z-index:999;margin-left:-150px;">
          </a>

          <a href="#xu_zhi" style="background:none;display:block;width:170px;height:40px;position:absolute;bottom: 39px;left: 640px;z-index:999;margin-left:-150px;">
          </a>
          <a href="<c:url value='/redirect?p=flagship01/qjsj_info'/>"  style="background:none;display:block;width:170px;height:40px;position:absolute;bottom: 39px;right: 237px;z-index:999;margin-left:-150px;" target="_blank">
          </a>

          <!-- <a href="javascript:void(0)" onclick="login_on('<c:url value='/user/UserCenter'/>',1)" style="background:none;display:block;width:170px;height:40px;position:absolute;bottom: 39px;right: 237px;z-index:999;margin-left:-150px;">
          </a> -->
          </a>
        </div>
    </div>
 <script type="text/javascript">
    //     $(function(){
    //       $(".getmores").click(function(){
    //         $(".getmorediv").css("display","block");
    //       });

    //     })
    //  </script>

    <div class="tp" id="xu_zhi" style="position:relative;z-index:101;background:url(images/zhaoshang/zhaos_2.jpg) no-repeat center 0;width:100%;height:523px;">
        <div style="width:1150px;height:100%;overflow:hidden;position:relative;margin: 0 auto;background:none;">
          <a href="javascript:void(0)" onclick="login_on('<c:url value='/flagshop/addFlagDoc'/>',1)" style="background:none;display:block;width:170px;height:60px;position:absolute;bottom: 65px;right: 90px;z-index:999;margin-left:-150px;">
          </a>
          <a href="<c:url value='/redirect?p=benefitlist'/> " target="_blank" style="background:none;display:block;position:absolute;bottom: 36px;left: 276px;z-index:999;margin-left:-150px;font-size:20px;" class="getmores">
          查看旗舰商家的受益明细
          </a>

      <!-- <div class="forgebox_guowai forgebox1_1 getmorediv" id="forgebox1_1" style="">
          <div class="easyDialogBox" style="margin-top:15%;z-index:9999;">
            <div id="easyDialogWrapper" class="easyDialog_wrapper" style="z-index:9999;">
              <div class="easyDialog_content" style="z-index:9999;">
                  <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;font-size:14px;background:url(images/zhaoshang/tanchubox_bg2.jpg) repeat-x;color:#fff;">
                    <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_x" id="closeBtn" style="background:#3B98C9;color:#fff;">×</a>
                      【 旗舰商家的受益明细 】
                  </h4>
                  <div style="line-height:27px;font-size:14px;text-align:left;margin:20px 0 20px 25px;">
                      <p>1、荣获“河南卫视《华豫之门》官网官方旗舰店”荣誉铜牌，有效期一年；</p>
                    <p>2、录制《探店》节目一期，网络全程在线播放；</p>
                    <p>3、赠送旗舰商家十个免费星级会员名额，须递交官网相关人员名单和联系方式；</p>
                    <p>4、可享有《华豫之门》官网旗舰商家“珍品佳作”长期展示出售的服务；</p>
                    <p>5、旗舰商家店主可享受在海选期间缴纳鉴定费用后使用星级会员通道鉴定服务；  </p>
                    <p>6、《华豫之门》官网为旗舰商家提供网络宣传（地址、电话和店面门头图片）；</p>
                    <p>7、享有举办“全国寻宝大赛”旗舰商家选拔赛的资格；</p>
                    <p>8、享有通过官网购买藏品和在官网组织藏品送大拍会时的优先权；</p>
                  </div>
              </div>
          </div>
      </div>
  </div> -->


        </div>
    </div>

    <div class="tp" style="position:relative;z-index:100;background:url(images/zhaoshang/zhaos_3.jpg) no-repeat center 0;width:100%;height:554px;">
        <div style="width:1150px;height:100%;overflow:hidden;position:relative;margin: 0 auto;background:none;">
          <a href="javascript:void(0)" onclick="login_on('<c:url value='/flagshop/addFlagDoc'/>',1)" style="background:none;display:block;width:170px;height:200px;position:absolute;bottom: 205px;left: 160px;z-index:999;margin-left:-150px;">
          </a>


        </div>
    </div>

    <div class="" style="overflow:hidden;width:100%;height:116px;background:url(images/zhaoshang/zhaos_4.jpg) no-repeat center 0;"></div>
    <div style="margin-bottom:50px;position:relative;z-index:1;">
      <p id="player1" style="position:relative;z-index:-1;"><a href="http://www.macromedia.com/go/getflashplayer">Get the Flash Player</a> to see this player.</p>
      <script type="text/javascript">
       var s1 = new SWFObject("<c:url value='/swfvideo/FlvPlayer.swf'/>","single","700","500","7");
       s1.addParam("allowfullscreen","true");
       s1.addVariable("file","http://pic.wswhly.com:8080/fileManager/userFiles/video/jiangtan/3/jinlu.flv");

       s1.addVariable("image","http://pic.wswhly.com:8080/fileManager/userFiles/video/jiangtan/3/jinlu.jpg");
       s1.addVariable("width","700");
       s1.addVariable("height","500");
       s1.write("player1");
      </script>
    </div>

</div>


</body>
</html>
