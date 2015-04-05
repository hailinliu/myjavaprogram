<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>乐园账号-找回密码_卫视文化乐园-华豫之门官方网站</title>
<jsp:include page="../head/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/resetpwd.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/resetpwd.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<meta name=keywords content="找回密码">
  <meta name=description content="卫视文化乐园-华豫之门官方网站乐园账号找回密码">
	<script><!--
	var errorcount = 0;
	var phone="";
	$(document).ready(function() {
	$('#username').blur(function (){
	  $('#usernamep').html("");
	  	//telUserName();		
  		});
     $('#password').blur(function (){
  			verifypassword();
  			
  		});
  		
  		$('#repassword').blur(function (){
  			verifyrepassword();
  			
  		});
  		
  		$('#verifycode').blur(function (){
  		$('#verifycodep').html("");
  			//verifycode();
  		
  		});
		
	});
	
 
		
	
	
	function telUserName(){
  		var flag = false;
		var username = $('#username').empty().val();
	   if(username==""){
	      alert("请输入要重置密码的用户名!");
	      return false;
	   }else{
	   $.ajax({type: "POST",
				dataType: "text",
				async: false,
				url: "<c:url value='/resets/telUserName'/>",
				data: {username:username,d:new Date().getTime()},
				success:function(data){
					if(data == "0001"){
					$('#usernamep').empty().append("(→_→)会员名不存在");
                 	//flag = true;
					}else{
					 phone=data;
					var userpwd="您正在找回用户名"+username+"的密码.";
					$("#namecode").empty().html(userpwd); 
					$("#namecode1").empty().html(userpwd); 
					$('#mobile').empty().html(data.substring(0,data.length-8)+"****"+data.substring(7,data.length));
					$('#usernamep').empty().css("display","none");	
					$(".g_bd").stop().animate({top:"-395px"});
		            $(".main_box2").css("height","523px");
					flag = false;	
					}
				}
			});
	   
	   }
	return flag;	
}
		
		function sendsms() {
		//alert(phone);
  		$("#sendsms").html("120秒后重发");
  		$.ajax({type: "POST",
			dataType: "text",
			url: "<c:url value='/user/SendSms'/>",
			data: {mobile:phone,type:"1"},
			success:function(data){
				if(data == "0000"){
					fun_timedown(120);
					flag = true;	
					// $("#sendsms").attr("disabled","disabled");  //无效
					
				}else{
					alert("发送失败，请重新发送");
					$('#sendsms').empty().append("<a href='javascript:sendsms();'><img src='<c:url value='/images/sen_button.jpg'/>' align='middle'/></a>");
				}
			}
		});
  	}
		
		
		
		function verifycode(){
  		var flag = false;
		var verifycode = $('#verifycode').val();
		if(verifycode.length != 6){
		$('#verifycodep').empty().html("(→_→)验证码不正确");
		 flag = false;
		return;
		}else{
			$.ajax({type: "POST",
				dataType: "text",
				async: false,
				url: "<c:url value='/user/verifyMobileCode'/>",
				data: {mobile:phone,verifycode:verifycode,d:new Date().getTime()},
				success:function(data){
					if(data == "0000"){
						$('#verifycodep').empty();
						$(".g_bd").stop().animate({top:"-916px"});
		                $(".main_box2").css("height","553px");
						flag = true;
					}else{
						$('#verifycodep').empty().html("(→_→)验证码不正确");
						return;
					}
				}
			});
		}
		return flag;
	}
  	
  	function checkname(str){ 
  		return str.match(/^[a-zA-Z0-9_\u4E00-\u9FA5]+$/);
  	 }	
	function fun_timedown(time) {
		if (time == 'undefined')
			time = 10;
			
		$("#sendsms").html(time + "秒后重发");
		
		$("#mebox").css("display","block");
		
		//$('#sendsms').empty().append("发送验证码").css("background","#f0f0f0");
		
		time = time - 1;
		if (time >= 0) {
			setTimeout("fun_timedown(" + time + ")", 1000);
		} else {
			$('#sendsms').empty().append("发送验证码").css("background","#b61519");
			
			$("#mebox").css("display","none");
		}
	}
		

		function verifyrepassword(){
		var flag = false;
		var password = $('#password').val();
		var repassword = $('#repassword').val();
		if(password == repassword){
			$('#repasswordp').empty();
			$('#repasswordicon').empty().append("<img src='<c:url value='/images/icon_true.jpg'/>'/>");
			flag = true;
		}else{
			$('#repasswordp').empty().append("与登录密码不一致，请重新输入。");
			$('#repasswordicon').empty().append("<img src='<c:url value='/images/icon_flase.jpg'/>'/>");
		}
		return flag;
  	}
		function verifypassword(){
		var flag = false;
		var password = $('#password').val();
		if (password.length > 20 || password.length < 6) {
			$('#passwordp').empty().append("密码长度不符合要求，请重新输入。");
			$('#passwordicon').empty().append("<img src='<c:url value='/images/icon_flase.jpg'/>'/>");
		}else{
			var repassword = $('#repassword').val();
			if(repassword.length != 0){
				if(password == repassword){
					$('#repasswordp').empty();
					$('#repasswordicon').empty().append("<img src='<c:url value='/images/icon_true.jpg'/>'/>");
					flag = true;
				}else{
					$('#repasswordp').empty().append("与登录密码不一致，请重新输入。");
					$('#repasswordicon').empty().append("<img src='<c:url value='/images/icon_flase.jpg'/>'/>");
				}
			}else{
				$('#passwordp').empty();
				$('#passwordicon').empty().append("<img src='<c:url value='/images/icon_true.jpg'/>'/>");
				flag = true;
			}
		}
		return flag;
	}
		
		
	function submitregisterform() { 
		//if(!telUserName())
  			//return false;
  		if(!verifypassword())
  			return false;
  		if(!verifyrepassword())
  		return false;
  		if(!verifycode())
  		return false;
		  var password = $('#password').val();
		  var repassword = $('#repassword').val();
        $.ajax({
        	type:'post',
            url:"<c:url value='/resets/resetPassword'/>",
            data:{password:password,repassword:repassword},
           	success:function(data){
           //	alert(data);
                 if(data == "0000"){
                 $(".g_bd").stop().animate({top:"-1468px"});
		          $(".main_box2").css("height","400px");
                 $('#succ').empty().append("＼( ^▽^ )／ 恭喜您,找回密码成功!");
                 	
                
                 } else {
                	$('#succ').empty().append("＼( ^▽^ )／ 找回密码失败!");
                 }
            }
        });

  	} 				
   </script>
	<style type="text/css">
		.foot_hb{margin-top: 0 !important;}
    </style>
	
</head>

<body>
	
    
 
	<!--找回密码中间内容-->
	<div id="g_doc">
    	<div class="g_hd">
        	<div class="g_in">
            	<h1 class="f_ff1">乐园账号</h1>
                <div class="shuxian">|</div>
                <h2 class="f_ff1">找回密码</h2>
            </div>
        </div>
        <div class="main_box2">
            <div class="g_bd">
                <div class="g_in bg">
                    <div class="g_box">
                        <h3 class="boxHd f_ff1">请输入您要找回密码的会员名</h3>
                        <div class="btn_box">
                            <div class="boxBd">
                                <input type="text" myholder="请输入帐号" autocapitalize="off" id="username" name="username" placeholder="请输入帐号" class="input_text ip1">
                                <p class="u-tips">
                                    <span id="usernamep"></span>
                                </p>
                            </div>
                            <button type="submit" onclick="telUserName();" class="btn2 f_ff1 btn01">下一步</button>
                        </div>
                    </div>
                </div>
                
                <!--resetpwd-two-->
                <div class="g_in">
                    <div class="g_box">
                        <h3 class="boxHd f_ff1" ><span id="namecode"></span><span class="change">[切换其他用户名]</span></h3>
                        <div class="btn_box btn_3box">
                            <div class="yz_box" style="position:relative">
                            	<img src='<c:url value='/images/phone.png'/>' class="ph_img" />
                                <p class="phone">您预留的手机号:<p id="mobile" style="margin-left:10px;float:left;"></p></p>
                                
                               <span class="fasong fs" onclick="sendsms();" id="sendsms"  style="text-align:center;">发送验证码</span> 
                               <div id="mebox" style="width: 130px;height: 36px;display:none;background:rgba(0,0,0,0);position:absolute;right:280px;top:0;"></div>
                                   
								<span id="sendsms"></span>
                            </div>
                            <div class="boxBd">
                                <input type="text" myholder="请输入验证码" autocapitalize="off" id="verifycode" name="username" placeholder="请输入验证码" class="input_text lock ip2" onkeyup="this.value=this.value.replace(/[^\d]/g,'') " onafterpaste="this.value=this.value.replace(/[^\d]/g,'') " value=""/>
                                <p class="u-tips">
                                    <span id="verifycodep"></span>
                                </p>
                            </div>
                            <button type="submit" onclick="verifycode();" class="btn2 f_ff1 btn02">下一步</button>
                        </div>
                        <div class="resetm">
                        	<p>如果您预留的手机号已停用，请联系客服</p>
                        	<a href="http://wpa.qq.com/msgrd?v=3&uin=2539829391&site=qq&menu=yes" rel="nofollow" target="_blank"><img src='<c:url value='/images/top_pic.jpg'/>'/></a>
                        </div>
                    </div>
                </div>
                
                <!--resetpwd--three-->
                <div class="g_in">
                    <div class="g_box">
                        <h3 class="boxHd f_ff1"><span id="namecode1"></span><span class="change">[切换其他用户名]</span></h3>
                        <div class="btn_box btn_3box">
                            <div class="yz_box">
                                <p>验证成功，请设置新密码：</p>
                            </div>
                            
                            <div class="boxBd">
                                <input type="password" myholder="请输入密码" autocapitalize="off"  id="password" name="username" placeholder="请输入密码" class="input_text lock ip3" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')">
                              <span class="pic_box" id="passwordicon"></span><span >6到20个字符，字母区分大小写</span><p id="passwordp"></p>
                            </div>
                            <div class="boxBd">
                                <input type="password" myholder="请再次输入密码" autocapitalize="off" id="repassword" name="username" placeholder="请再次输入密码" class="input_text lock ip4" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')">
                                <p class="u-tips">
                                    <span class="pic_box" id="repasswordicon">(→_→)&nbsp;&nbsp; 输入不一致</span><span>请再次输入密码</span><p id="repasswordp"></p>
                                </p>
                            </div>
                            <button type="submit" onclick="submitregisterform();" class="btn2 f_ff1 btn03">提&nbsp;&nbsp;&nbsp;&nbsp;交</button>
                            
                            
                        </div>
                    </div>
                 </div>
                    <!--resetpwd--four-登陆-->
                    
                <div class="g_in">
                    <div class="g_box">
                        <h3 class="boxHd f_ff1">卫视文化乐园欢迎您</h3>
                        <div id ="succ" class="tishi"><p></p></div>
                        <div class="boxBd jiekou">
							<a href="http://www.wswhly.com">返回首页</a>
                            <a href="http://www.wswhly.com/user/UserCenter" class="user">进入会员中心</a> 
                        </div>   
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../foot/footer.jsp"></jsp:include>
</body>
</html>
