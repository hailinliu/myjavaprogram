<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>活动规则</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<style type="text/css">
body {
	padding: 0;
	margin: 0;
	background: #fff;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	color: #444340;

}
h1 {
	font-size: 1.3em;
	padding: 10px 10px;
	margin: 0;
}
img {
	border: none;
}
a {
	color: #444340;
}
#content3 a,#content4 a{ display: block; margin-bottom:1em; }
#content4 a{padding:2em;color: #fff;text-shadow: none;}
.jsdBlock01{ background: #905F17;}
.jsdBlock02{ background: #549017;}
.jsdBlock03{ background: #176990;}
.jsdBlock04{ background: #DB819E;}
.jsdBlock05{ background: #8CDB81;}
.jsdBlock06{ background: #81A2DB;}
.jsdBlock07{ background: #DBA881;}
.jsdBlock08{ background: #6A9F86;}
.jsdBlock09{ background: #75658A;}
.jsdBlock10{ background: #8A7765;}


</style>
<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />

<script type="text/javascript">

function check(){
var userlevel=${userlevel};
var yemoney=${yemoney};
var num=${num};
var money=100;
	//免费会员
			if(userlevel==0){
				money=100;
			}else if(userlevel==1){//星级会员
					money=50;
				if(yemoney-money<0){
					return 0;
				}
			}else if(userlevel==2){//贵宾会员
				if(num>10){//贵宾鉴定10件  超出每件50
					money=50;
					if(yemoney-money<0){
						return 0;
					}
				}else{
					money=0;
				}
			}else if(userlevel==3){//高级会员
				if(num>20){//高级鉴定20件  超出每件50
					money=50;
					if(yemoney-money<0){
						return 0;
					}
				}else{
					money=0;
				}
			}else if(userlevel==4){//超级会员
				if(num>30){//免费鉴定30件  超出每件50
					money=50;
					if(yemoney-money<0){
						return 0;
					}
				}else{
					money=0;
				}
			}
			return 1;
}
  // 判断登陆
      function pnlogin() {
        // ids专家的id号

        if('${CurrentSession.username}' == ''){
              alert("上传藏品,请先登录");
              location.href = "<c:url value='/redirect?p=login'/>";
              return false;
         }else{
               //if(check()==0){
				  //	if(confirm('余额不足！请先充值！')){
				 	//	window.location.href="<c:url value='/redirect?p=/mine/recharge'/>";
				 	//}else{
				 	//	window.location.href="<c:url value='/onlinepic/gotoonlinepicupload'/>";
				 	//}
				// }else{
					 window.location.href="<c:url value='/onlinepic/gotoonlinepicupload'/>";
				// }
         }

      }

</script>
</head>

<body>
<div data-role="page" id="pageone">
  <div data-role="header" role="banner" class="ui-header ui-bar-inherit">
    <h1 class="ui-title" role="heading" aria-level="1">活动规则</h1>
  </div>
  <div id="content" data-role="content" class="ui-content" role="main">

  <a data-role="button" data-transition="slide" onclick="pnlogin();" style="color: #fff;text-shadow: none;background: #810B0B;">我要图片鉴定(上传)</a>
  <a data-role="button" data-transition="slide" href="#pagethree" style="color: #fff;text-shadow: none;background: #810B0B;">查看送拍藏品</a>
  <!-- <a href="#pagetwo" data-transition="slide"><img src="../../../images/dgBanner.jpg" width="100%" /></a> -->
  <!-- <p>【<strong>活动详情</strong>】</p> -->
  <p>【<strong>会员服务</strong>】</p>
  <div id="chusok" style=";font-size:16px;
line-height: 2;background:#f3f3f3;padding:20px;" class="viotabl1">
        <!-- <p style="font-weight:bold;">会员须知：</p> -->
        <!-- <img src="<c:url value='/images/vip/viper_ontab.jpg'/>" width="100%" alt=""> -->
       <p>1.普通会员：（会员费 无），每件鉴定费用 <font color='red'>100元/件</font>，实物复审不收取费用，鉴定时间为 <font color='red'>10个工作日以内</font>，网络拍卖佣金为 10%！</p>

       <p>2.星级会员：（会员费 1000元 一年制），每件鉴定费用 <font color='red'>50元/件</font>，实物复审收费 <font color='red'>50元/件</font>，鉴定时间为 <font color='red'>5个工作日以内</font>，网络拍卖佣金为：佣金为8%！</p>
       <p>3.贵宾会员：（会员费 1万 元一年制），免费鉴定： <font color='red'>10件</font>，超出每件鉴定费用 <font color='red'>50元</font>，鉴定时间为 <font color='red'>72小时</font>以内，提供估值服务！网络拍卖佣金为 7%！</p>
       <p>4.高级会员：（会员费 2万 元一年制），免费鉴定 <font color='red'>20件</font>，超出每件鉴定费用 <font color='red'>50元</font>，鉴定时间为 <font color='red'>48小时</font>内，提供估值服务！网络拍卖佣金为 6%！</p>
       <p>5.超级会员：（会员费 3万 元一年制），免费鉴定 <font color='red'>30件</font>，超出每件鉴定费用 <font color='red'>50元</font>，鉴定时间为 <font color='red'>24小时</font>内，提供估值服务！网络拍卖佣金为 5%！</p>

       <p></p>
       <p style="font-weight:bold;">* 更多服务 请看下表</p>



            <!-- CSS goes in the document HEAD or added to your external stylesheet -->
            <style type="text/css">
            .viotabl1 p{
              line-height: 2.5;
            }
            table.imagetable {
              font-family: verdana,arial,sans-serif;
              font-size:11px;
              color:#333333;
              border-width: 1px;
              border-color: #999999;
              border-collapse: collapse;
              width: 100%;
            }
            table.imagetable th {
              background:#b5cfd2 url('cell-blue.jpg');
              border-width: 1px;
              padding: 8px 0;
              border-style: solid;
              border-color: #999999;
            }
            table.imagetable td {
              background:#dcddc0 url('cell-grey.jpg');
              border-width: 1px;
              padding: 8px;
              border-style: solid;
              border-color: #999999;
              text-align: center;
              line-height: 30px;
            }
            .fred{
              color: red;
            }
            </style>

            <!-- Table goes in the document BODY -->
            <table class="imagetable">
            <tr>
              <th>享受服务</th>
              <th>普通会员</th>
              <th>星级会员</th>
              <th>贵宾会员</th>
              <th>高级会员</th>
              <th>超级会员</th>
            </tr>
            <tr>
              <td>会员费用</td>
              <td class="fred">无</td>
              <td class="fred">1000元/年</td>
              <td class="fred">1万元/年</td>
              <td class="fred">2万元/年</td>
              <td class="fred">3万元/年</td>
            </tr>
            <tr>
              <td>免费图片鉴定</td>
              <td class="fred">0件</td>
              <td class="fred">0件</td>
              <td class="fred">10件</td>
              <td class="fred">20件</td>
              <td class="fred">30件</td>
            </tr>
            <tr>
              <td>图片鉴定费用</td>
              <td class="fred">100元/件</td>
              <td class="fred">50元/件</td>
              <td class="fred">50元/件<br />(超出免费件数)</td>
              <td class="fred">50元/件<br />(超出免费件数)</td>
              <td class="fred">50元/件<br />(超出免费件数)</td>
            </tr>
            <tr>
              <td>实物复审</td>
              <td class="fred">0元/件</td>
              <td class="fred">50元/件</td>
              <td class="fred">0元/件</td>
              <td class="fred">0元/件</td>
              <td class="fred">0元/件</td>
            </tr>
            <tr>
              <td>图片鉴定时间</td>
              <td class="fred">10个工作日以内</td>
              <td class="fred">5个工作日以内</td>
              <td class="fred">72个小时以内</td>
              <td class="fred">48个小时以内</td>
              <td class="fred">24个小时以内</td>
            </tr>
            <tr>
              <td>实物鉴定</td>
              <td class="fred">x</td>
              <td class="fred">x</td>
              <td class="fred">可预约鉴定地点</td>
              <td class="fred">可预约鉴定地点</td>
              <td class="fred">可预约鉴定地点</td>
            </tr>
            <tr>
              <td>网络送拍佣金</td>
              <td class="fred">10%</td>
              <td class="fred">8%</td>
              <td class="fred">7%</td>
              <td class="fred">6%</td>
              <td class="fred">5%</td>
            </tr>
            <tr>
              <td>估值服务</td>
              <td class="fred">x</td>
              <td class="fred">x</td>
              <td class="fred">提供</td>
              <td class="fred">提供</td>
              <td class="fred">提供</td>
            </tr>
            <tr>
              <td>藏品送拍<br>(每年享受对国内外大拍行送拍藏品)</td>
              <td class="fred">x</td>
              <td class="fred">x</td>
              <td class="fred">1件</td>
              <td class="fred">3件</td>
              <td class="fred">5件</td>
            </tr>


            </table>
          </div>




  <!-- <p>【<strong>佣金收取</strong>】</p>
  <p>无</p> -->

  <a data-role="button" data-transition="slide" onclick="pnlogin();" style="color: #fff;text-shadow: none;background: #810B0B;">我要图片鉴定(上传)</a>
  <a data-role="button" data-transition="slide" href="#pagethree" style="color: #fff;text-shadow: none;background: #810B0B;">查看送拍藏品</a>

 </div>
</div>



<div data-role="page" id="pagethree">
  <div data-role="content" id="content3" >

  <!-- 正常送拍 藏品显示  -->
  <!-- <a data-transition="slide" onclick="location='<c:url value='/redirect?p=onlinepic/onlinepiclist&isshangpai=3'/>'"><img src="<c:url value='/images/1guowaipai.jpg'/>" width="100%"></a> -->

  <!-- 暂时显示 佳士得 苏富比国外专场  -->
  <a data-transition="slide" onclick="location='<c:url value='/redirect?p=daigou/rules#pagetwo'/>'"><img src="<c:url value='/images/1guowaipai.jpg'/>" width="100%"></a>

  <a data-transition="slide" onclick="location='<c:url value='/redirect?p=onlinepic/onlinepiclist&isshangpai=4'/>'"><img src="<c:url value='/images/2guoneipai.jpg'/>" width="100%"></a>
  <a data-transition="slide" onclick="location='<c:url value='/redirect?p=onlinepic/onlinepiclist&isshangpai=5'/>'"><img src="<c:url value='/images/3taobaopai.jpg'/>" width="100%"></a>
  <a data-transition="slide" onclick="location='<c:url value='/redirect?p=onlinepic/onlinepiclist&isshangpai=6'/>'"><img src="<c:url value='/images/4weipaipai.jpg'/>" width="100%"></a>

  </div>
</div>

<script>
$(document).on("pageload",function(event,data){
  alert("触发 pageload 事件！\nURL: " + data.url);
});
$(document).on("pageloadfailed",function(event,data){
  alert("抱歉，被请求页面不存在。");
});
</script>

<div data-role="page" id="page4">
  <div data-role="content" id="content4" style="height:100%">

      <iframe src="http://eqxiu.com/s/G4nv9E2t" width="100%" height="100%"></iframe>

  </div>
</div>

</div>
<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
</body>
</html>



