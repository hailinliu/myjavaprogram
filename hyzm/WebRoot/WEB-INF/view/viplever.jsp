<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>会员招募_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/vip.css'/>"/>

	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/vip.js'/>"></script>
	<meta name=keywords content="会员招募，会员征集">
	<meta name=description content="卫视文化乐园-华豫之门官方网站会员招募">

    <script>

    // 判断是否登录  和弹出层
      function login_btn() {


            // 是否登录
            //
            var my_element=$(".login");
            if(my_element.length>0){
               alert("开通会员需先登录，请登录。若未在本站注册，请先注册。");
               // return false;
               $('#js_N_login_wrap').css('display','block');
                window.location.href="#top"

            }else{
               window.location.href="<c:url value='/mine/gotovip'/>"
            }

      }
 </script>

  </head>


<body>
<jsp:include page="head/bmlogin.jsp"></jsp:include>


<div style="position:relative;">

    <div class="tp" style="position:relative;z-index:100;background:url(images/viplever/viplever_01.jpg) no-repeat center 0;width:100%;height:313px;">

    </div>
    <div class="tp" style="position:relative;z-index:100;background:url(images/viplever/viplever_02.jpg) no-repeat center 0;width:100%;height:580px;">

    </div>

    <div class="tp" style="position:relative;z-index:100;background:url(images/viplever/viplever_03.jpg) no-repeat center 0;width:100%;height:350px;">

    </div>
    <div class="tp" style="position:relative;z-index:100;background:url(images/viplever/viplever_04.jpg) no-repeat center 0;width:100%;height:491px;">

    </div>
    <div class="tp" style="position:relative;z-index:100;background:url(images/viplever/viplever_05.jpg) no-repeat center 0;width:100%;height:1053px;">

    </div>

    <div class="tp" style="position:relative;z-index:100;background:url(images/viplever/viplever_06.jpg) no-repeat center 0;width:100%;height:608px;">

    </div>

    <a href="javascript:void(0)" onclick="login_on('<c:url value='/mine/gotovip'/>',1)" style="background:none;display:block;width:400px;height:100px;position:absolute;bottom:25px;left:50%;z-index:999;margin-left:-150px;" onclick="login_btn()"></a>
    <a href="javascript:void(0)" onclick="login_on('<c:url value='/mine/gotovip'/>',1)" style="background:none;display:block;width:180px;height:30px;position:absolute;bottom:638px;right:50%;z-index:999;margin-right:-390px;" onclick="login_btn()"></a>

</div>
<div class="user_right" style="margin:20px auto;width:890px;height:680px;overflow:hidden">
   <div class="onuser_tit2" style="margin-bottom:40px">会员等级介绍</div>

        <table class="table" cellspacing="1">
            <tr>
                <td colspan="6"  class="tr01">会员级别服务及收费标准</td>
            </tr>
            <tr>
                <td class="red">会员等级</td>
                <td class="red">免费会员</td>
                <td class="red">星级会员</td>
                <td class="red">贵宾会员</td>
                <td class="red">高级会员</td>
                <td class="red">超级会员</td>
            </tr>
            <tr>
                <td>服务</td>
                <td>免费</td>
                <td>1000元</td>
                <td>10000元</td>
                <td>20000元</td>
                <td>30000元</td>
            </tr>
            <tr  class="tr1">
                <td class="lvse ws">网上报名&nbsp;&nbsp;<span>?</span></td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
            </tr>
            <tr  class="tr2">
                <td class="lvse LL">浏览藏品&nbsp;&nbsp;<span>?</span></td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
            </tr>
            <tr  class="tr3">
                <td class="lvse sp">视频观看&nbsp;&nbsp;<span>?</span></td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
            </tr>

            <tr  class="tr4">
                <td class="lvse jd">直达鉴定&nbsp;&nbsp;<span>?</span></td>
                <td></td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
            </tr>
            <tr  class="tr5">
                <td class="lvse fb">自有藏品展示&nbsp;&nbsp;<span>?</span></td>
                <td></td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
            </tr>
            <tr  class="tr6">
                <td class="lvse jp">藏品观摩交流&nbsp;&nbsp;<span>?</span></td>
                <td></td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
            </tr>
            <tr  class="tr7">
                <td class="lvse tg">国内团购&nbsp;&nbsp;<span>?</span></td>
                <td></td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
            </tr>
            <tr  class="tr8">
                <td height="81" class="lvse guoneipaimai">国内拍卖&nbsp;&nbsp;<span>?</span></td>
                <td></td>
                <td></td>
                <td>2次</td>
                <td></td>
                <td rowspan="2" class="td_4">4次</td>
            </tr>
            <tr  class="tr9">
                <td class="lvse guowaipaimai">国外拍卖&nbsp;&nbsp;<span>?</span></td>
                <td></td>
                <td></td>
                <td></td>
                <td>2次</td>
            </tr>
            <tr  class="tr12">
                <td class="lvse wangpai">网拍藏品送拍&nbsp;&nbsp;<span>?</span></td>

                <td>N件</td>
                <td>3N件</td>
                <td>6N件</td>
                <td>10N件</td>
                <td>不限</td>
            </tr>
            <tr  class="tr13">
                <td class="lvse dapaihui">大拍会藏品送拍&nbsp;&nbsp;<span>?</span></td>
                <td></td>
                <td></td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
            </tr>
            <!-- <tr  class="tr10">
                <td class="lvse lz">特邀嘉宾&nbsp;&nbsp;<span>?</span></td>
                <td></td>
                <td></td>
                <td></td>
                <td>1次</td>
                <td>2次</td>
            </tr>   -->


         </table>
         <div class="zs_jt"><img src="<c:url value='/images/jiantou7.gif'/>" /></div>

         <!--浮动层-start-->
         <div class="fd_baoming bg" style="display:none"><p>可在本站进行《华豫之门》的鉴定海选报名。</p></div>
       <div class="fd_liulan bg" style="display:none"><p>浏览本站收藏品库的所有信息。</p></div>
       <div class="fd_guankan bg" style="display:none"><p>免费观看《华豫之门》专家团的视频讲座。
</p></div>
       <div class="fd_jianding bg"  style="display:none"><p>参加华豫海选，凭借编号直接换票鉴定，无需排队领号等待。
</p></div>
       <div class="fd_chushou bg"  style="display:none"><p> 藏品通过专家团鉴定、合议、推荐，或登上《华豫之门》电视节目之后，会在“华豫藏品”频道下长期展示，直至交易之后。</p></div>
       <div class="fd_jingpai bg" style="display:none"><p>针对“华豫藏品”频道下展示的所有藏品，您与本站商务专员预约后，可到本站合作的旗舰商家实体店中，实物查看，上手观摩，或实物交易。
</p></div>
       <div class="fd_tuangou bg" style="display:none"><p>参加本站组织的华豫专家带团团购会， 目的地为国内各类艺术品市场发源地知名商家和藏家店铺（旅行费用由旅游公司收取，仅收取藏友团出行期间住宿和交通费用的成本价，且参团合同中明确承诺：组织方在团购活动中绝不收取商家任何回扣和佣金，绝没有任何强迫性购物）。</p></div>
       <div class="fd_paimai bg" style="display:none"><p>参与国内顶级拍卖行一年两次的春秋大拍会，届时华豫专家现场陪同，提供指导咨询服务。</p></div>
       <div class="fd_paimai2 bg" style="display:none"><p>参与国外及港澳地区一年两次的顶级春秋大拍会，届时华豫专家现场陪同，提供指导咨询服务。</p></div>
       <!-- <div class="fd_cpsp bg" style="display:none"><p>参加国内或国外大拍会活动后，同时享有在下次对应大拍会开始前送拍经由华豫和拍卖公司专家团鉴定后的藏品送拍权。</p></div> -->
       <div class="fd_wangpai bg" style="display:none;bottom: 97px;">
           <p>“淘宝” “华豫之门”两大品牌联合，网拍专场征集的藏品送拍权</p>
       </div>
       <div class="fd_dapaihui bg" style="display:none;bottom: 34px;">
           <p>参加国内或国外大拍会活动后，同时享有在下次对应大拍会开始前送拍经由华豫和拍卖公司专家团鉴定后的藏品送拍权。</p>
       </div>
       <!-- <div class="fd_lz bg" style="display:none"><p>作为特邀嘉宾带上自己的一件收藏品（须经华豫专家团合议通过）参加《华豫之门》现场节目录制。</p></div> -->
     </div>
  </div><!--user_right end-->


</body>
</html>
