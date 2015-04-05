<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>用户注册_卫视文化乐园-华豫之门官方网站</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<meta name=keywords content="用户注册，账号注册" />
	<meta name=description content="卫视文化乐园-华豫之门官方网站账号注册" />
  	<script type="text/javascript">
  	$(document).ready(function() {
  		$('#username').blur(function (){
  			verifyusername();
  		});

  		$('#password').blur(function (){
  			verifypassword();
  		});

  		$('#repassword').blur(function (){
  			verifyrepassword();
  		});

  		$('#mobile').blur(function (){
  			verifymobile();
  		});

  		$('#verifycode').blur(function (){
  			verifycode();
  		});
	});

  	function verifyusername(){
  		var flag = false;
		var username = $('#username').val();
		if (username.length > 16 || username.length < 3) {
			$('#usernamep').empty().append("该用户名长度不符合要求，请重新输入。");
			$('#usernameicon').empty().append("<img src='<c:url value='/images/icon_flase.jpg'/>'/>");
		}else if(!checkname(username)){
			$('#usernamep').empty().append("该用户名包含字符受屏蔽限制，请使用其他用户名。");
			$('#usernameicon').empty().append("<img src='<c:url value='/images/icon_flase.jpg'/>'/>");
		}else{
			$.ajax({type: "POST",
				dataType: "text",
				async: false,
				url: "<c:url value='/user/verifyUserName'/>",
				data: {username:username,d:new Date().getTime()},
				success:function(data){
					if(data == "0000"){
						$('#usernamep').empty();
						$('#usernameicon').empty().append("<img src='<c:url value='/images/icon_true.jpg'/>'/>");
						flag = true;
					}else{
						$('#usernamep').empty().append("该用户名已存在，请使用其他用户名。");
						$('#usernameicon').empty().append("<img src='<c:url value='/images/icon_flase.jpg'/>'/>");
					}
				}
			});
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

	//TODO 改函数原函数已丢失
	function checkmobile(mobile)	{
		return new RegExp("^1\\d{10}$").test(mobile);
	}

  	function verifymobile(){
  		var flag = false;
 		var mobile = $('#mobile').val();
 		if(!checkmobile(mobile)){
			$('#mobilep').empty().append("请输入正确11位有效的手机号码。");
			$('#mobileicon').empty().append("<img src='<c:url value='/images/icon_flase.jpg'/>'/>");
			$('#sendsms').empty().append("<img src='<c:url value='/images/send_pic2.jpg'/>' align='middle'/>");
 		}else{
			$.ajax({type: "POST",
				dataType: "text",
				async: false,
				url: "<c:url value='/user/verifyMobile'/>",
				data: {mobile:mobile,d:new Date().getTime()},
				success:function(data){
					if(data == "0000"){
						$('#mobilep').empty();
						$('#mobileicon').empty().append("<img src='<c:url value='/images/icon_true.jpg'/>'/>");
						$('#sendsms').empty().append("<a href='javascript:sendsms();'><img src='<c:url value='/images/sen_button.jpg'/>' align='middle'/></a>");
						flag = true;
					}else{
						$('#mobilep').empty().append("该手机号已经注册过了，请使用其他手机号。");
						$('#mobileicon').empty().append("<img src='<c:url value='/images/icon_flase.jpg'/>'/>");
						$('#sendsms').empty().append("<img src='<c:url value='/images/send_pic2.jpg'/>' align='middle'/>");
					}
				}
			});
		}
 		return flag;
  	}

  	function verifycode(){
  		var flag = false;
		var verifycode = $('#verifycode').val();
		if(verifycode.length != 6){
			$('#verifycodep').empty().append("请输入正确6位有效的手机验证码。");
			$('#verifycodeicon').empty().append("<img src='<c:url value='/images/icon_flase.jpg'/>'/>");
		}else{
			$.ajax({type: "POST",
				dataType: "text",
				async: false,
				url: "<c:url value='/user/verifyMobileCode'/>",
				data: {mobile:$('#mobile').val(),verifycode:verifycode,d:new Date().getTime()},
				success:function(data){
					if(data == "0000"){
						$('#verifycodep').empty();
						$('#verifycodeicon').empty().append("<img src='<c:url value='/images/icon_true.jpg'/>'/>");
						flag = true;
					}else{
						$('#verifycodep').empty().append("验证码不正确，请重新输入。");
						$('#verifycodeicon').empty().append("<img src='<c:url value='/images/icon_flase.jpg'/>'/>");
					}
				}
			});
		}
		return flag;
	}

  	function checkname(str){
  		return str.match(/^[a-zA-Z0-9_\u4E00-\u9FA5]+$/);
  	 }


  	function sendsms() {
  		$("#sendsms").html("已向您"+ $('#mobile').val() +"的手机号发送了验证码，180秒后可再次发送");
  		$.ajax({type: "POST",
			dataType: "text",
			url: "<c:url value='/user/SendSms'/>",
			data: {mobile:$('#mobile').val(),type:"1"},
			success:function(data){
				if(data == "0000"){
					fun_timedown(180);
				}else{
					alert(data);
					$('#sendsms').empty().append("<a href='javascript:sendsms();'><img src='<c:url value='/images/sen_button.jpg'/>' align='middle'/></a>");
				}
			}
		});
  	}

  	function submitregisterform() {
  		if(!verifyusername())
  			return false;
  		if(!verifypassword())
  			return false;
  		if(!verifyrepassword())
  			return false;
  		if(!verifymobile())
  			return false;
  		if(!verifycode())
  			return false;
  		$("#registerform").attr('action', "<c:url value='/user/Register'/>");
  		$("#registerform").submit();
  		$("#registerbutton").attr('disabled',"true");
  	}


	function fun_timedown(time) {
		if (time == 'undefined')
			time = 60;
		$("#sendsms").html("已向您"+ $('#mobile').val() +"的手机号发送了验证码，" + time + "秒后可再次发送");
		time = time - 1;
		if (time >= 0) {
			setTimeout("fun_timedown(" + time + ")", 1000);
		} else {
			$('#sendsms').empty().append("<a href='javascript:sendsms();'><img src='<c:url value='/images/sen_button.jpg'/>' align='middle'/></a>");
		}
	}

	function checkMobileSendVerifyCode(){

	}
	</script>
  </head>
  <body>
  <jsp:include page="head/header.jsp"></jsp:include>

<div class="main_box clear">
   <div class="user_zc"></div>
   <form action="" method="post" id="registerform" class="form_box clear">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td class="tit_mc">用 户 名：</td>
              <td class="text_box"><input type="text" name="username" id="username"  maxlength="16"/><span class="pic_box" id="usernameicon"></span><span>3到16个字符，字母区分大小写，支持中文，注册后无法修改</span><p id="usernamep"></p></td>
            </tr>
            <tr>
              <td class="tit_mc">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
              <td class="text_box"><input type="password" name="password" id="password"  maxlength="20"/><span class="pic_box" id="passwordicon"></span><span>6到20个字符，字母区分大小写</span><p id="passwordp"></p></td>
            </tr>
            <tr>
              <td class="tit_mc">确认密码：</td>
              <td class="text_box"><input type="password" name="repassword" id="repassword" maxlength="20"/><span class="pic_box" id="repasswordicon"></span><span>请再次输入密码</span><p id="repasswordp"></p></td>
            </tr>
            <tr>
              <td class="tit_mc">手机号码：</td>
              <td class="text_box"><input type="text" name="mobile" id="mobile" maxlength="11"/><span class="pic_box" id="mobileicon"></span><span>请输入11位手机号码</span><p id="mobilep"></p></td>
            </tr>
            <tr>
              <td class="tit_mc">手机验证码：</td>
              <td class="text_box">
              		<input type="text" name="verifycode" id="verifycode"  maxlength="6"/><span class="pic_box" id="verifycodeicon"></span>
              		<span id="sendsms">
              			<img src='<c:url value='/images/send_pic2.jpg'/>' align="middle" style="margin-bottom:10px;*margin-bottom:20px;"/>
              		</span>
              		<span style="color:#a00104;line-height:20px;*margin-bottom:7px;display:inline-block;">每天最多发送5条验证码</span>
              		<p id="verifycodep"></p>
              </td>
            </tr>
             <tr>
              <td colspan="2" class="finish"><input type="button" id="registerbutton" onclick="submitregisterform();" /></td>
            </tr>
        </table>
      </form>

     <p class="wxts">温馨提示：一个手机号仅能注册一次。本站在尊重用户隐私的同时，有权利删除恶意用户的注册信息。请珍惜您的注册账户。</p>

</div>
<!--main style end-->

<jsp:include page="foot/footer.jsp"></jsp:include>

</body>
</html>