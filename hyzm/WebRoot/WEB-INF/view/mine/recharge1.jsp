<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>华豫之门-网银在线充值</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/box111.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/wy_cz.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
	<script type="text/javascript">
	function submitrecharge() {
		var money = $("#rechargemoney").val();
		if(money == ""){
			alert("请输入充值金额");
			return false;
		}
		if($("input[name=radiobutton]:checked").length==0){
		    alert("对不起,您未选择网上银行!");
		   return false;
		}else{
		 var radiobutton =$("input[name='radiobutton']:checked").val();
		 }

		if(!isPriceNumber(money)){
			alert("请输入正确的充值金额");
			return false;
		}


		$(".forgebox_guowai").show();


		return true;
		//$("#alipayment").attr('action', "<c:url value='/bankpay'/>");
  		//$("#alipayment").submit();
  	}

	function isPriceNumber(_keyword){
	    if(_keyword == "0" || _keyword == "0." || _keyword == "0.0" || _keyword == "0.00"){
	        _keyword = "0"; return true;
	    }else{
	        var index = _keyword.indexOf("0");
	        var length = _keyword.length;
	        if(index == 0 && length>1){/*0开头的数字串*/
	            var reg = /^[0]{1}[.]{1}[0-9]{1,2}$/;
	            if(!reg.test(_keyword)){
	                return false;
	            }else{
	                return true;
	            }
	        }else{/*非0开头的数字*/
	            var reg = /^[1-9]{1}[0-9]{0,10}[.]{0,1}[0-9]{0,2}$/;
	            if(!reg.test(_keyword)){
	                return false;
	            }else{
	                return true;
	            }
	        }
	        return false;
	    }
	}
	$(function(){
		$(".gbck").click(function(){
			$(".forgebox_guowai").hide();
		});
	})

  //   获取  传过来的 充值价钱
    $(document).ready(function(){
      getMoney();
       var moneys = parseInt(url_request("moneys"));
       // alert(moneys);
       if (moneys>0) {

          $("#rechargemoney").val(moneys);
        }else{
          $("#rechargemoney").val('');
        }
    })
     function getMoney(){
     $.ajax({
		type:'post',
        url:"<c:url value='/mine/getMoney'/>",
        success:function(data){
          if(data =='0000'){
           $("#leftmoney").html('');
          }else{
           $("#leftmoney").html(data);
        }
        }
	});

     }
  	</script>


<style type="text/css">
  label{
    overflow: hidden;
display: block;
cursor: pointer;
  }
  .yhim_bg{
    display: inline-block;
    width: 120px;
    height: 30px;
    float: right;
  }
</style>
</head>

<body>
 <jsp:include page="../head/header.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear">

   <jsp:include page="common/myMenu.jsp"></jsp:include>

  <div class="user_right fr clear">
     <div class="onuser_tit2">充值</div>

     <div class="onuser_box3 clear" style="height:593px;">
        <ul class="charge_list">
           <li class="red">网银在线充值</li>
           <li><a href="<c:url value='/redirect?p=mine/recharge3'/>">线下转款汇款</a></li>
         </ul>
        <div class="bottom_line" style="margin-bottom:0;"></div>
          <div class="onuser_mc" style="margin:7px 0 10px 38px;">当前余额：&nbsp;<span id="leftmoney" class="red"></span>&nbsp;元 </div>
          <form id="alipayment" action="<c:url value='/bankpay'/>" method="post" target="_blank" onsubmit="return submitrecharge();">
		   <ul class="wycz_con">
        	<li class="wycz_con_tit">充值金额：</li>
            <li class="wycz_con_nr">
            	<input type="text" id ="rechargemoney" name="money" onkeyup="value=value.replace(/[^\d.]/g,'')" value="" />

                元
            </li>
            <li class="wycz_con_tit">充值方式：</li>
            <li class="wycz_con_nr">请选择您开通的网上银行或第三方账户<span class="redfont">(在您使用网上银行充值前，请确认已开通网银)</span> </li>
        </ul>
        <div class="wy_bank">
        	<!--工商-->
        	<div class="bankList">
          <label for="label4_1">
            	<input id="label4_1" type="radio" name="radiobutton" value="ICBCB2C">

                  <span class="yhim_bg" style="background:url(images/logo_1.gif);"></span>
                </label>
            </div>
            <!--建设银行-->
            <div class="bankList">
            <label for="label4_2">
            	<input id="label4_2" type="radio" name="radiobutton" value="CCB">

                  <span class="yhim_bg" style="background:url(images/logo_4.gif);"></span>
                </label>
            </div>
            <!--农业银行-->
            <div class="bankList">
             <label for="label4_3">
            	<input id="label4_3" type="radio" name="radiobutton" value="ABC">

                  <span class="yhim_bg" style="background:url(images/logo_2.gif);"></span>
                </label>
            </div>
            <!--招商银行-->
            <div class="bankList">
            <label for="label4_4">
            	<input id="label4_4" type="radio" name="radiobutton" value="CMB">

                  <span class="yhim_bg" style="background:url(images/logo_11.gif);"></span>
                </label>
            </div>
            <!--交通银行-->
            <div class="bankList">
            <label for="label4_5">
            	<input id="label4_5" type="radio" name="radiobutton" value="COMM">

                  <span class="yhim_bg" style="background:url(images/logo_5.gif);"></span>
                </label>
            </div>
            <!--中国银行-->
            <div class="bankList">
             <label for="label4_6">
            	<input id="label4_6" type="radio" name="radiobutton" value="BOCB2C">

                  <span class="yhim_bg" style="background:url(images/logo_3.gif);"></span>
                </label>
            </div>
            <!--广发银行-->
            <div class="bankList">
            <label for="label4_7">
            	<input id="label4_7" type="radio" name="radiobutton" value="GDB">

                  <span class="yhim_bg" style="background:url(images/logo_12.gif);"></span>
                </label>
            </div>
            <!--中信银行-->
            <div class="bankList">
            <label for="label4_8">
            	<input id="label4_8" type="radio" name="radiobutton" value="CITIC">

                  <span class="yhim_bg" style="background:url(images/zhongxin.jpg);"></span>
                </label>
            </div>
            <!--民生银行-->
            <div class="bankList">
            <label for="label4_9">
            	<input id="label4_9" type="radio" name="radiobutton" value="CMBC">

                  <span class="yhim_bg" style="background:url(images/minsheng.jpg);"></span>
                </label>
            </div>
            <!--光大银行-->
            <div class="bankList">
            <label for="label4_10">
            	<input id="label4_10" type="radio" name="radiobutton" value="CEB-DEBIT">

                  <span class="yhim_bg" style="background:url(images/guangda.jpg);"></span>
                </label>
            </div>
            <!--浦发银行-->
            <div class="bankList">
             <label for="label4_11">
            	<input id="label4_11" type="radio" name="radiobutton" value="SPDB">

                	<span class="yhim_bg" style="background:url(images/pufa.jpg);"></span>
                </label>
            </div>
            <!--兴业银行-->
            <div class="bankList">
            <label for="label4_12">
            	<input id="label4_12" type="radio" name="radiobutton" value="CIB">

                  <span class="yhim_bg" style="background:url(images/xingye.jpg);"></span>
                </label>
            </div>
            <!--邮政储蓄-->
            <div class="bankList">
            <label for="label4_13">
            	<input id="label4_13" type="radio" name="radiobutton" value="POSTGC">

                   <span class="yhim_bg" style="background:url(images/post.jpg);"></span>
                </label>
            </div>
            <!--平安银行-->
            <div class="bankList pa_bank">
            <label for="label4_14">
            	<input id="label4_14" type="radio" name="radiobutton" value="SPABANK">

                   <span class="yhim_bg" style="background:url(images/pingan.jpg);"></span>
                </label>
            </div>
            <!--支付宝-->
            <div class="bankList">
            <label for="label4_15">
            	<input id="label4_15" type="radio" name="radiobutton" value="zfb">

                  <span class="yhim_bg" style="background:url(images/logo_90001.gif);"></span>
                </label>
            </div>
            <!--财付通-->
            <!--  div class="bankList">
            	<input id="label4_16" type="radio" name="radiobutton" value="cft">
                <label for="label4_16">
                	<img src="images/logo_90003.gif" />
                </label>
            </div-->
        </div>
         <input type="submit" class="cz_btn" value="确认无误，充值"/>


        </form>
        <div class="tixing">
        	<p>★&nbsp;个别所列银行仅支持借记卡，如您所选银行无法支付或未开通网银，请选择支付宝支付</p>
        	        <p>&nbsp;&nbsp;&nbsp;&nbsp;或使用支付宝"有卡就能付"进行快捷付款。</p>
            <p>★&nbsp;大部分银行要求使用IE浏览器进行充值，为确保充值成功，建议您更换后继续操作。</p>

        </div>
     </div>
     <script type="text/javascript">


			$(".bankList").click(function(){
				$(this).css("border","1px solid #B61519").siblings(".bankList").css("border","1px solid #dbdbdb");
			});

     </script>
  </div><!--user_right end-->

  <!--弹出框 --><div class="forgebox_guowai">
      <div class="easyDialogBox" style="margin-top:15%;">
      <div id="easyDialogWrapper" class="easyDialog_wrapper">
          <div class="easyDialog_content">
              <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                  <a href="javascript:void(0)" onclick="location.href='<c:url value="/mine/mymoneylist"/>'" title="关闭窗口" class="close_btn off_guowai" id="closeBtn">×</a>
                    【 信息提示 】
              </h4>

              <div class="easyDialog_text" style="width:120px;">
                <font color="red" style="font-size:18px;">充值已提交！</font>
              </div>

              <div class="info_text" style="height:67px;text-align:left;padding:20px 128px 0;">
              	<button onclick="location.href='<c:url value="/mine/mymoneylist"/>'" style="border:1px solid #ccc;height:30px;width:120px;font-size:14px;color:#000;border-radius:4px;float:left;cursor:pointer;" >已完成充值</button>
              	<p class="gbck" style="text-decoration:underline;cursor:pointer;float:left;margin-left:72px;font-size:14px;color:#00A9FF;display:block;width:100px;">返回重新充值</p>
              </div>

              <!-- <a href="javascript:void(0)" onclick="location.href='<c:url value="/mine/applicationHistory"/>'">关闭窗口</a> -->
              </div>



         <!--  <div class="easyDialog_footer">
              <button class="btn_normal" id="easyDialogNoBtn">取消</button>
              <button class="btn_highlight" id="easyDialogYesBtn">确定</button>
          </div> -->
              </div>
          </div>
      </div>
  </div>




<!--main style end-->
	<jsp:include page="../foot/footer.jsp"></jsp:include>

</body>
</html>