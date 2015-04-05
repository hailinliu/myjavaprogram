<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>网上支付_卫视文化乐园-华豫之门官方网站</title>
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
	<meta name=keywords content="充值，网银在线充值，网银">
	<meta name=description content="卫视文化乐园-华豫之门官方网站，网银在线充值">
	<script type="text/javascript">

	$(function(){
			$("#ye-money").click(function(){
				if($('#j-balance-box').is(':checked')){
				$('#linepaymoney').html($('#paymoney').html());
				}else{
					if($('#paymoney').html()-${money}<=0){
					$('#linepaymoney').html(0);
					}else{
					$('#linepaymoney').html(fmoney($('#paymoney').html()-${money},2));
					}
				}
			});
	})

  //   获取  传过来的 充值价钱
    /**$(document).ready(function(){
      getMoney();
       var moneys = parseInt(url_request("moneys"));
       // alert(moneys);
       if (moneys>0) {

          $("#rechargemoney").val(moneys);
        }else{
          $("#rechargemoney").val('');
        }
    })**/
    function fmoney(s, n)   
	{   
	   n = n > 0 && n <= 20 ? n : 2;   
	   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";   
	   var l = s.split(".")[0].split("").reverse(),   
	   r = s.split(".")[1];   
	   t = "";   
	   for(i = 0; i < l.length; i ++ )   
	   {   
	      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");   
	   }   
	   return t.split("").reverse().join("") + "." + r;   
	} 
  </script>


<style type="text/css"> 
  label{
    overflow: hidden;
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
<!--main style ben-->
<div class="main_box clear" style="width:900px">

  <div class="user_right fr clear" style="position: relative;">

  		<!-- 支付 说明 -->
  		<div class="p-key">

            <!-- 支付方式选择 -->

            <!-- 支付方式选择 end -->
        </div>
  		<div class="order-title">
  			卫视文化乐园
                -- <i class="iconfont fn-yellow" title="信用卡"></i>
  			<span id="linepayname" ></span>
  		</div>
  		<div class="order-amount">

  			<div class="order-real-amount"> <em class=""><span id="paymoney" class="red">0.00</span></em>
  				元
  				<!-- <a href="javascript:void(0)">刷新</a> -->
  			</div>

  		</div>

  		<!-- 余额支付 -->
  		<div class="row-container row-container-focus">
  			<div class="j-row row-basic" >
  				<input id="j-balance-box" class="channel-input" type="checkbox"  name="compositeWithBalance" >
  				<label for="j-balance-box" class="channel-label" id="ye-money">
  					<span class="label-item">
  						乐园账户 余额： <em class="amount-font-G16">${money}</em>元
  					</span>
					<!-- 
  					<span class="j-pay-amount label-item pay-amount">
  						支付 <em class="amount-font-R16 j-amount-font">10.00</em>
  						元
  					</span>
  					 -->
  				</label>
  			</div>

  		</div>

		<!-- 网银支付 -->
		<div class="row-container-focus row-bank-focus">
  			<div class="j-row row-basic">
  				<!-- <input id="j-balance-box1" class="channel-input" type="checkbox" value="true" name="compositeWithBalance" > -->
  				<label for="j-balance-box1" class="channel-label">
  					<span class="label-item">
  						网银支付
  					</span>

  					<span class="j-pay-amount label-item pay-amount">
  						需在线支付 <em class="amount-font-R16 j-amount-font"><span id="linepaymoney" class="red">0.00</span></em>
  						元
  					</span>
  				</label>
  			</div>

  		</div>
  		

     <div class="bank_box1 clear" style="height:320px;margin-bottom:20px">
          
		   <ul class="wycz_con">

            <li class="wycz_con_tit">充值方式：</li>
            <li class="wycz_con_nr">请选择您开通的网上银行或第三方账户<span class="redfont">(在您使用网上银行充值前，请确认已开通网银)</span> </li>
        </ul>
        <div class="wy_bank">
        	<!--工商-->
        	<div class="bankList">
          <label for="label4_1">
            	<input id="label4_1" type="radio" name="radiobutton" value="ICBCB2C">
                  <span class="yhim_bg" style="background:url(<c:url value='/images/logo_1.gif'/>);"></span>
                </label>
            </div>
            <!--建设银行-->
            <div class="bankList">
            <label for="label4_2">
            	<input id="label4_2" type="radio" name="radiobutton" value="CCB">
                  <span class="yhim_bg" style="background:url(<c:url value='/images/logo_4.gif'/>);"></span>
                </label>
            </div>
            <!--农业银行-->
            <div class="bankList">
             <label for="label4_3">
            	<input id="label4_3" type="radio" name="radiobutton" value="ABC">
                  <span class="yhim_bg" style="background:url(<c:url value='/images/logo_2.gif'/>);"></span>
                </label>
            </div>
            <!--招商银行-->
            <div class="bankList">
            <label for="label4_4">
            	<input id="label4_4" type="radio" name="radiobutton" value="CMB">
                  <span class="yhim_bg" style="background:url(<c:url value='/images/logo_11.gif'/>);"></span>
                </label>
            </div>
            <!--交通银行-->
            <div class="bankList">
            <label for="label4_5">
            	<input id="label4_5" type="radio" name="radiobutton" value="COMM">
                  <span class="yhim_bg" style="background:url(<c:url value='/images/logo_5.gif'/>);"></span>
                </label>
            </div>
            <!--中国银行-->
            <div class="bankList">
             <label for="label4_6">
            	<input id="label4_6" type="radio" name="radiobutton" value="BOCB2C">
                  <span class="yhim_bg" style="background:url(<c:url value='/images/logo_3.gif'/>);"></span>
                </label>
            </div>
            <!--广发银行-->
            <div class="bankList">
            <label for="label4_7">
            	<input id="label4_7" type="radio" name="radiobutton" value="GDB">
                  <span class="yhim_bg" style="background:url(<c:url value='/images/logo_12.gif'/>);"></span>
                </label>
            </div>
            <!--中信银行-->
            <div class="bankList">
            <label for="label4_8">
            	<input id="label4_8" type="radio" name="radiobutton" value="CITIC">
                  <span class="yhim_bg" style="background:url(<c:url value='/images/zhongxin.jpg'/>);"></span>
                </label>
            </div>
            <!--民生银行-->
            <div class="bankList">
            <label for="label4_9">
            	<input id="label4_9" type="radio" name="radiobutton" value="CMBC">
                  <span class="yhim_bg" style="background:url(<c:url value='/images/minsheng.jpg'/>);"></span>
                </label>
            </div>
            <!--光大银行-->
            <div class="bankList">
            <label for="label4_10">
            	<input id="label4_10" type="radio" name="radiobutton" value="CEB-DEBIT">
                  <span class="yhim_bg" style="background:url(<c:url value='/images/guangda.jpg'/>);"></span>
                </label>
            </div>
            <!--浦发银行-->
            <div class="bankList">
             <label for="label4_11">
            	<input id="label4_11" type="radio" name="radiobutton" value="SPDB">
                	<span class="yhim_bg" style="background:url(<c:url value='/images/pufa.jpg'/>);"></span>
                </label>
            </div>
            <!--兴业银行-->
            <div class="bankList">
            <label for="label4_12">
            	<input id="label4_12" type="radio" name="radiobutton" value="CIB">
                  <span class="yhim_bg" style="background:url(<c:url value='/images/xingye.jpg'/>);"></span>
                </label>
            </div>
            <!--邮政储蓄-->
            <div class="bankList">
            <label for="label4_13">
            	<input id="label4_13" type="radio" name="radiobutton" value="POSTGC">
                   <span class="yhim_bg" style="background:url(<c:url value='/images/post.jpg'/>);"></span>
                </label>
            </div>
            <!--平安银行-->
            <div class="bankList pa_bank">
            <label for="label4_14">
            	<input id="label4_14" type="radio" name="radiobutton" value="SPABANK">
                   <span class="yhim_bg" style="background:url(<c:url value='/images/pingan.jpg'/>);"></span>
                </label>
            </div>
            <!--支付宝-->
            <div class="bankList">
            <label for="label4_15">
            	<input id="label4_15" type="radio" name="radiobutton" value="zfb"/>
                  <span class="yhim_bg" style="background:url(<c:url value='/images/logo_90001.gif'/>);"></span>
                </label>
            </div>
            <!--财付通-->
              <div class="bankList">
            	<input id="label4_16" type="radio" name="radiobutton" value="cft"/>
                <label for="label4_16">
                	 <span class="yhim_bg" style="background:url(<c:url value='/images/logo_90003.gif'/>);"></span>
                </label>
            </div>
        </div>
        
       
     </div>
      <input type="button" class="cz_btn"  id="ispaybutton" value="确认支付" style="margin: 20px auto;" onclick="submitrecharge()"/>
</div><!--user_right end-->
 </div>
  <script type="text/javascript">


			$(".bankList").click(function(){
				$(this).css("border","1px solid #B61519").siblings(".bankList").css("border","1px solid #dbdbdb");
			});

     </script>
</body>
</html>