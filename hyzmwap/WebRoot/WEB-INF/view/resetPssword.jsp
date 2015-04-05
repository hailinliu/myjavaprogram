<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>华豫之门官方网站-卫视文化乐园</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
	<script type="text/javascript">
	var phone;
	$(document).ready(function() {
	});

	function next1(){
		var flag = false;
		var username = $('#username').empty().val();
		if(username.length == 0){
			$('#usernamep').html("请输入要重置密码的用户名");
			return false;
		}
		$.ajax({type: "POST",
				dataType: "text",
				async: false,
				url: "<c:url value='/resets/telUserName'/>",
				data: {username:username,d:new Date().getTime()},
				success:function(data){
					if(data == "0001"){
						$('#usernamep').html("会员名不存在");
					}else{
						phone=data;
						$.mobile.changePage("#reset2","slideup");
						$("#namecode").empty().html(username);
						$("#namecode1").empty().html(username);
						$('#mobile').html(data.substring(0,data.length-8)+"****"+data.substring(7,data.length));
						flag = true;
					}
				}
			});
		return flag;
	}

	function next2(){
		var flag = false;
		var verifycode = $('#mobilecode').empty().val();
		if(verifycode.length == 0){
			$('#mobilecodep').html("请输入验证码");
			return false;
		}
		$.ajax({type: "POST",
			dataType: "text",
			async: false,
			url: "<c:url value='/user/verifyMobileCode'/>",
			data: {mobile:phone,verifycode:verifycode,d:new Date().getTime()},
			success:function(data){
				if(data == "0000"){
					$.mobile.changePage("#reset3","slideup");
					flag = true;
				}else{
					$('#mobilecodep').empty().append("验证码不正确，请重新输入。");
				}
			}
		});
		return flag;
	}

	function next3(){
		if(phone == null || phone == ""){
			$.mobile.changePage("#reset1","slideup");
			return false;
		}
		var password = $('#password').val();
		if (password.length > 20 || password.length < 6) {
			$('#passwordp').html("密码长度不符合要求，请重新输入。");
			return false;
		}else{
			var repassword = $('#repassword').val();
			if(repassword.length != 0){
				if(password == repassword){
					$('#repasswordp').empty();
				}else{
					$('#repasswordp').html("与登录密码不一致，请重新输入。");
					return false;
				}
			}else{
				$('#passwordp').empty();
			}
		}
		$.ajax({type:'post',
            url:"<c:url value='/resets/resetPassword'/>",
            data:{password:password,repassword:repassword,d:new Date().getTime()},
           	success:function(data){
                 if(data == "0000"){
                	 $("#successdialog").popup();
 					 $("#successdialog").popup('open');
                 } else {
                	 alert("重置密码失败");
                 }
            }
        });
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

	function sendsms(str) {
		if(phone == null || phone == ""){
			$.mobile.changePage("#reset1","slideup");
			return false;
		}
		$.ajax({type: "POST",
			dataType: "text",
			url: "<c:url value='/user/SendSms'/>",
			data: {mobile:phone,type:'10'},
			success:function(data){
				if(data == "0000"){
					time(str);
				}else{
					alert("发送失败，请重新发送");
				}
			}
		});
	}
	</script>
  </head>
  <body>
  <div data-role="page" id="reset1">
  	<div data-role="header">
	<h1>重置密码</h1>
	</div>
  	<div data-role="content">
		<input type="text" placeholder="用户名" name="username" id="username"  maxlength="16"/>
		<p style="color: red" id="usernamep"></p>
		<button class="ui-shadow ui-btn ui-corner-all" onclick="next1()">下一步</button>
	</div>
  	<jsp:include page="foot/footer.jsp"></jsp:include>
  </div>

  <div data-role="page" id="reset2">
  	<div data-role="header">
	<a href="javascript:history.go(-1);" data-icon="back" class="ui-btn-left">后退</a>
	<h1>重置密码</h1>
	</div>
  	<div data-role="content">
  		<p>您正在找回用户名<span id="namecode"></span>的密码</p>
  		您预留的手机号:<p id="mobile" style="color: red"></p>
  		<button id="sendsms" class="ui-shadow ui-btn ui-corner-all" onclick="sendsms('sendsms')">发送验证码</button>
		<input type="text" placeholder="验证码" name="mobilecode" id="mobilecode"  maxlength="6"/>
		<p style="color: red" id="mobilecode"></p>
		<button class="ui-shadow ui-btn ui-corner-all" onclick="next2()">下一步</button>
		<h4>*如果您预留的手机号已停用，请联系客服</h4>
	</div>
  	<jsp:include page="foot/footer.jsp"></jsp:include>
  </div>

  <div data-role="page" id="reset3">
  	<div data-role="header">
	<a href="javascript:history.go(-1);" data-icon="back" class="ui-btn-left">后退</a>
	<h1>重置密码</h1>
	</div>
  	<div data-role="content">
  		<p>您正在找回用户名<span id="namecode1"></span>的密码</p>
  		<input type="password" name="password" placeholder="新密码" id="password" maxlength="20" />
		<p style="color: red" id="passwordp"></p>
		<input type="password" name="repassword" placeholder="确认密码" id="repassword" maxlength="20" />
		<p style="color: red" id="repasswordp"></p>
		<button class="ui-shadow ui-btn ui-corner-all" onclick="next3()">确认修改</button>
	</div>
  	<jsp:include page="foot/footer.jsp"></jsp:include>
  	<!-- 修改成功提示框 -->
	<div data-role="popup" id="successdialog" data-dismissible="false">
	    <div data-role="header">
	    <h1>提示</h1>
	    </div>
	    <div role="main" class="ui-content">
	        <h3 class="ui-title">修改成功</h3>
	        <a data-ajax="false" href="<c:url value='/redirect?p=login'/>" class="ui-btn ui-corner-all ui-shadow ui-btn-inline">返回登录</a>
	    </div>
	</div>
  </div>
</body>
</html>