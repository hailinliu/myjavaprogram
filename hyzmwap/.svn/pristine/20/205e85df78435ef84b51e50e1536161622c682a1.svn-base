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
	var errorcount = 0;
	$(document).ready(function() {
		$('#username').blur(function(){
			var text_value = $(this).val();
			if (text_value == "") {
				$("#usernamep").html("请输入用户名");
			}
		});
		$('#password').blur(function(){
			var text_value = $(this).val();
			if (text_value == "") {
				$("#passwordp").html("请输入密码");
			}
		});
		if(errorcount > 3 || '${errorcount}' > 2){
			$('#logincodediv').show();
			$('#logincode').blur(function(){
				if($(this).val() == "")
					$(this).val("请输入验证码");
			});
		}
	});

	function login(){
		if($('#username').val() == ""){
			$('#usernamep').empty().append("请输入用户名");
			return ;
		}
		if($('#password').val() == ""){
			$('#passwordp').empty().append("请输入密码");
			return ;
		}
		var count = '${errorcount}';
		if(errorcount > 3 || count > 2){
			if($('#logincode').val() == ""){
				$('#loginnamep').empty().append("请输入验证码");
				return ;
			}
		}
		var auto = 0;
		if($('#auto').is(':checked')){
			auto = 1;
		};
		$.ajax({type: "POST",
			dataType: "text",
			url: "<c:url value='/user/Login'/>",
			data: {username:$('#username').val(),auto:auto,password:$('#password').val(),verifycode:$('#logincode').val(),d:new Date().getTime()},
			success:function(data){
				if(data == "0000"){
			     location.href = '<c:url value='/user/UserCenter'/>';
				}else{
					if(errorcount >= 3 || count >= 2)
						$('#logincodediv').show();
					$('#passwordp').empty().append(data);
					document.getElementById('imgcode').src=document.getElementById('imgcode').src+'?';
					errorcount++;
				}
			}
		});
	}
	</script>
  </head>
  <body>
  <div data-role="page">
  	<div data-role="header">
	<h1>登录</h1>
	</div>
  	<div data-role="content">
		<form id="loginform">
			<input type="text" placeholder="用户名" name="username" id="username"  maxlength="16"/>
			<p style="color: red" id="usernamep"></p>
			<input type="password" placeholder="密码" name="password" id="password"  maxlength="20"/>
			<p style="color: red" id="passwordp"></p>
			<label>
		        <input type="checkbox" name="auto" id="auto">自动登录
		    </label>
			<div style="display: none;" id="logincodediv">
	            <input type="text" id="logincode" placeholder="验证码"/>
	            <a href="javascript:void(0);" onclick="document.getElementById('imgcode').src=document.getElementById('imgcode').src+'?'"><img id="imgcode" src="<c:url value="/validateCode"/>" style="height: 50px; vertical-align: middle;" /></a>
	      	</div>
		</form>
		<p><a data-ajax="false" href="<c:url value='/redirect?p=resetPssword'/>">忘记密码？</a></p>
		<p>还没有账号，先去<a href="<c:url value='/redirect?p=register'/>">注册</a></p>
		<button class="ui-shadow ui-btn ui-corner-all" onclick="login()">登录</button>
		<p style="font-size: 14px;font-weight: bold;text-align:left;position:relative;">
			<!-- <hr> -->
			<span style="">合作网站账号登录:</span>
		</p>
		<div class="otherCount" style="font-size: 14px;padding-left: 15px; line-height:56px">

                    <a href="https://graph.qq.com/oauth2.0/authorize?client_id=101198326&response_type=token&scope=all&redirect_uri=http%3A//wap.wswhly.com/redirect%3Fp%3DQQ" style="display:inline-block;vertical-align: middle;">
                      <img src="http://www.wswhly.com/images/qq_login.png" alt="" width="42" height="42"></a>

                    <a href="https://api.t.sina.com.cn/oauth2/authorize?client_id=2718441686&redirect_uri=http%3A//wap.wswhly.com/redirect%3Fp%3DWB&response_type=code" style="display:inline-block;vertical-align: middle;">
                      <img src="http://www.wswhly.com/images/weibo_login.png" alt="" width="42" height="42"></a>

                   <a href="https://oauth.taobao.com/authorize?response_type=code&amp;client_id=23096573&amp;redirect_uri=http://wap.wswhly.com/redirect?p=TB&amp;state=1&amp;view=wap" style="padding-left:10px;"><img src="http://gtms03.alicdn.com/tps/i3/T1OjaVFl4dXXa.JOZB-114-114.png" width="28px" height="28px"></a>

                    <a href="https://openauth.alipay.com/oauth2/authorize.htm?client_id=top.23096573&amp;redirect_uri=http://wap.wswhly.com/redirect?p=ZFB&amp;state=1&amp;view=wap" style="padding-left:13px;"><img src="http://www.wswhly.com/images/login_zhifubao.jpg" width="28px" height="28px"></a>

                  </div>
	</div>
  	<jsp:include page="foot/footer.jsp"></jsp:include>
  </div>

</body>
</html>