<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>华豫之门-注册</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
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
		if (username.length > 20 || username.length < 3) {
			$('#usernamep').empty().append("该用户名长度不符合要求，请重新输入。");
		}else if(!checkname(username)){
			$('#usernamep').empty().append("该用户名包含字符受屏蔽限制，请使用其他用户名。");
		}else{
			$.ajax({type: "POST",
				dataType: "text",
				async: false,
				url: "<c:url value='/user/verifyUserName'/>",
				data: {username:username,d:new Date().getTime()},
				success:function(data){
					if(data == "0000"){
						$('#usernamep').empty();
						flag = true;
					}else{
						$('#usernamep').empty().append("该用户名已存在，请使用其他用户名。");
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
		}else{
			var repassword = $('#repassword').val();
			if(repassword.length != 0){
				if(password == repassword){
					$('#passwordp').empty();
					flag = true;
				}else{
					$('#passwordp').empty().append("与登录密码不一致，请重新输入。");
				}
			}else{
				$('#passwordp').empty();
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
			flag = true;
		}else{
			$('#repasswordp').empty().append("与登录密码不一致，请重新输入。");
		}
		return flag;
  	}

	function checkmobile(mobile)	{
		return new RegExp("^1\\d{10}$").test(mobile);
	}

  	function verifymobile(){
  		var flag = false;
 		var mobile = $('#mobile').val();
 		if(!checkmobile(mobile)){
			$('#mobilep').empty().append("请输入正确11位有效的手机号码。");
 		}else{
			$.ajax({type: "POST",
				dataType: "text",
				async: false,
				url: "<c:url value='/user/verifyMobile'/>",
				data: {mobile:mobile,d:new Date().getTime()},
				success:function(data){
					if(data == "0000"){
						$('#mobilep').empty();
						flag = true;
					}else{
						$('#mobilep').empty().append("该手机号已经注册过了，请使用其他手机号。");
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
		}else{
			$.ajax({type: "POST",
				dataType: "text",
				async: false,
				url: "<c:url value='/user/verifyMobileCode'/>",
				data: {mobile:$('#mobile').val(),verifycode:verifycode,d:new Date().getTime()},
				success:function(data){
					if(data == "0000"){
						$('#verifycodep').empty();
						flag = true;
					}else{
						$('#verifycodep').empty().append("验证码不正确，请重新输入。");
					}
				}
			});
		}
		return flag;
	}

  	function checkname(str){
  		return str.match(/^[a-zA-Z0-9_\u4E00-\u9FA5]+$/);
  	 }


  	function sendsms(str) {
  		if(!verifymobile())
  			return false;
  		$.ajax({type: "POST",
			dataType: "text",
			url: "<c:url value='/user/SendSms'/>",
			data: {mobile:$('#mobile').val(),type:"1"},
			success:function(data){
				if(data == "0000"){
					time(str);
					alert("发送成功，请注意查收！");
				}else{
					alert("发送失败，请重新发送");
				}
			}
		});
  	}

  	function submitregisterform() {
  		$('#registerbutton').attr('disabled',"true");
  		if(!verifyusername()){
  			return false;
  			$('#registerbutton').attr('disabled',"false");
  		}
  		if(!verifypassword()){
  			return false;
  			$('#registerbutton').attr('disabled',"false");
  		}
  		if(!verifyrepassword()){
  			return false;
  			$('#registerbutton').attr('disabled',"false");
  		}
  		if(!verifymobile()){
  			return false;
  			$('#registerbutton').attr('disabled',"false");
  		}
  		if(!verifycode()){
  			return false;
  			$('#registerbutton').attr('disabled',"false");
  		}
  		$("#registerform").attr('action', "<c:url value='/user/Register'/>");
  		$("#registerform").submit();
  	}


	var wait=180;
	function time(str) {
		if (wait == 0) {
			$('#'+str).removeAttr("disabled");
			$('#'+str).html("发送验证码");
			wait = 180;
			$('#'+str).css("background","#b61519");
		} else {
			$('#'+str).attr('disabled',"true");
			$('#'+str).html("" + wait + "秒后重新发送");
			wait--;
			setTimeout(function() {
				time(str);
			},
			1000);
		}
	}

	</script>
  </head>
  <body>
    <div data-role="page">
  	<div data-role="header">
	<h1>注册</h1>
	</div>
  	<div data-role="content">
	<form id="registerform" method="post" data-ajax="false">
		<div>
	      <label>姓名</label>
	      <input type="text" placeholder="长度3-16位，支持中文" name="username" id="username" maxlength="16"/>
	      <p id="usernamep" style="color: red"></p>
	    </div>
		<div>
	      <label>密码</label>
	      <input type="password" placeholder="长度6-20位" name="password" id="password"  maxlength="20"/>
	      <p id="passwordp" style="color: red"></p>
	    </div>
		<div>
	      <label>确认密码</label>
	      <input type="password" placeholder="请确认密码" name="repassword" id="repassword" maxlength="20"/>
	      <p id="repasswordp" style="color: red"></p>
	    </div>
		<div>
	      <label>手机号</label>
	      <input type="text" placeholder="长度11位" name="mobile" id="mobile" maxlength="11"/>
	      <p id="mobilep" style="color: red"></p>
	    </div>
	 </form>
	    <div align="center">
	      <button id="sendsms" class="ui-shadow ui-btn ui-corner-all" onclick="sendsms('sendsms')">发送验证码</button>
	    </div>
		<div>
	      <label>验证码</label>
	      <input type="text" placeholder="长度6位" name="verifycode" id="verifycode"  maxlength="6"/>
	      <p id="verifycodep" style="color: red"></p>
	    </div>
	<button id="registerbutton" class="btn btn-positive btn-block" onclick="submitregisterform()">注册</button>
	<p>温馨提示：一个手机号仅能注册一次。本站在尊重用户隐私的同时，有权利删除恶意用户的注册信息。请珍惜您的注册账户。</p>
	</div>
  <jsp:include page="foot/footer.jsp"></jsp:include>
  </div>
</body>
</html>