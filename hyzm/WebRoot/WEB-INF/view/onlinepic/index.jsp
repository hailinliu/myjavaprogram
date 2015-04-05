<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>拍品征集_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/box111.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/collect/index.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/collect/collect_upload.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
	<meta name=keywords content="拍品征集">
	<meta name=description content="卫视文化乐园-华豫之门官方网站，拍品征集首页">
    <script type="text/javascript">
var userlevel=${userlevel};
var yemoney=${yemoney};
var num=${num};
var money=100;
function check(){
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

	  function login_btn2() {
          var userlevel='${userlevel}';
          var yemoney='${yemoney}';
          var num='${num}';
          var shopid='${flagmap.id}';

            // 是否登录
            var my_element=$(".login");
            if(my_element.length>0){
                $("#login_box").addClass('mod_show');
                return false;
            }
            //验证余额
	// if(check()==0){
	 // if(confirm('余额不足！请先充值！')){
	 	//	window.location.href="<c:url value='/redirect?p=/mine/recharge1'/>";
	 	//}else{
	 	//	window.location.href="<c:url value='/onlinepic/gotoonlinepicupload'/>";
	 	//}
	 //}else{
	 		window.location.href="<c:url value='/onlinepic/gotoonlinepicupload'/>";
	// }

}


	</script>
	</head>

  <body>

<div class="banner" style="background:url(<c:url value='/images/absimg/onlinepic_jd1.jpg'/>) center center no-repeat;height:320px;">

</div>
<!--main style ben-->
<div class="main_box clear" style="background:#F5E5C1;padding-top:20px;position:relative;">

    <!-- <div class="pp_tits">
            征集流程图
    </div>
    <div>
      <img src="<c:url value='/images/collect/pp_liucheng.png'/>" alt="拍品征集流程图" />
    </div> -->

        <!-- 介绍 弹出框 -->
  <!-- <div class="pop_upbox mod_show" id="login_box" style="">

      <div style="margin: 0 auto;width:322px;height:640px;margin-top:10%;">

          <iframe style="margin: 0 auto;" src="http://eqxiu.com/s/G4nv9E2t" width="322" height="641"></iframe>

      </div>


      <div class="pop_bgs box_100" id="pop_bgs">&nbsp;</div>

  </div> -->



    <div class="pp_tits">
            上传资格和费用标准
    </div>
    <div class="pp_requires" style="padding-top: 24px;padding:30px;">

         <div id="chusok" style=";font-size:16px;
line-height: 2;background:#f3f3f3;padding:20px;" class="viotabl1">
        <p style="font-weight:bold;">会员须知：</p>
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
              width: 1040px;
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
            <div class="up_load">
                <button onclick="login_on('<c:url value='/mine/gotovip'/>',1)">我要升级会员</button>
          </div>
          </div>


    </div>
    <div class="up_load">
          <button  onclick="login_btn2();">我要图片鉴定(上传)</button>
    </div>
                <!--免费会员弹出框 -->
    <div  id="freeopen" class="forgebox_guowai" style="">
      <div class="easyDialogBox" style="margin-top:15%;">
        <div  class="easyDialog_wrapper">
          <div class="easyDialog_content" style="">
                  <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                      <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_guowai" id="closeBtn">×</a>
                        【 信息提示 】
                  </h4>

                    <div  style="font-size:16px;text-align:center;margin-top:15px;">
                      尊敬的免费会员<span style="color:red;">${CurrentSession.username}</span>，上传拍品每件需支付100元。
                    </div>

                    <div class="info_text" style="height:67px;text-align:left;padding:20px 128px 0;">
                      <button onclick="location.href='<c:url value='/collect/gotouplylots'/>'" style="border:1px solid #ccc;height:30px;width:120px;font-size:14px;color:#000;border-radius:4px;float:left;cursor:pointer;" >继续上传拍品</button>
                      <p class="gbck" style="text-decoration:underline;cursor:pointer;float:left;margin-left:72px;font-size:14px;color:#00A9FF;display:block;width:100px;"><a href="<c:url value='/mine/gotovip'/>" style="color:#00A9FF;">我要去升级</a></p>
                    </div>
              </div>
              </div>
          </div>
      </div>
                      <!--余额不足弹出框 -->
    <div id="yueopen" class="forgebox_guowai" style="">
      <div class="easyDialogBox" style="margin-top:15%;">
        <div  class="easyDialog_wrapper">
          <div class="easyDialog_content" style="">
                  <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                      <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_guowai" id="closeBtn">×</a>
                        【 信息提示 】
                  </h4>

                    <div  style="font-size:16px;text-align:center;margin:62px 0;">
                      对不起，余额不足，请先&nbsp;<a href="<c:url value='/redirect?p=mine/recharge1'/>" target="_blank" style="color:#00A9FF;">充值</a>&nbsp;。
                    </div>
              </div>

              </div>
          </div>
      </div>

                   <!--收费会员，上传30件达到上限，弹出框 -->
    <div   id="vipopen" class="forgebox_guowai" style="">
      <div class="easyDialogBox" style="margin-top:15%;">
        <div class="easyDialog_wrapper">
          <div class="easyDialog_content" style="">
                  <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                      <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_guowai" id="closeBtn">×</a>
                        【 信息提示 】
                  </h4>

                    <div  style="font-size:16px;text-align:center;margin-top:20px;">
                      尊敬的<span style="color:red;">会员</span><span style="color:red;">${CurrentSession.username}</span>，您的送拍数量已达限制。
                    </div>
                    <div  style="font-size:16px;text-align:center;margin-top:15px;">
                      <a href="<c:url value='/collect/gotouplylots'/>" style="color:#00A9FF;">继续上传拍品</a>
                    </div>
                    <div  style="font-size:16px;text-align:center;margin-top:15px;margin-bottom:30px;">
                      <span>
                        <a href="<c:url value='/collect/gotomylylots'/>" style="color:#00A9FF;">查看送拍记录</a>
                      </span>
                      <span>每件需支付100元鉴定费</span>
                    </div>

              </div>

              </div>
          </div>
      </div>

</div>

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
