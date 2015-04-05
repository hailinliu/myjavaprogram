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
	$(document).ready(function() {
  		$('#oldpassword').blur(function (){
  			verifyoldpassword();
  		});
  		
  		$('#password').blur(function (){
  			verifypassword();
  		});
  		
  		$('#repassword').blur(function (){
  			verifyrepassword();
  		});
	}); 
  	
  	function verifyoldpassword(){
		var password = $('#oldpassword').val();
		if (password.length > 20 || password.length < 6) {
			$('#oldpasswordp').empty().append("密码长度不符合要求，请重新输入。");
			return false;
		}else{
			$('#oldpasswordp').empty();
			return true;
		}
	}
  	
  	function verifypassword(){
		var password = $('#password').val();
		if (password.length > 20 || password.length < 6) {
			$('#passwordp').empty().append("密码长度不符合要求，请重新输入。");
			return false;
		}else{
			var repassword = $('#repassword').val();
			if(repassword.length != 0){
				if(password == repassword){
					$('#repasswordp').empty();
					return true;
				}else{
					$('#repasswordp').empty().append("密码不一致，请重新输入。");
					return false;
				}
			}else{
				$('#passwordp').empty();
				return true;
			}
		}
	}
	
	function verifyrepassword(){
		var password = $('#password').val();
		var repassword = $('#repassword').val();
		if(password == repassword){
			$('#repasswordp').empty();
			return true;
		}else{
			$('#repasswordp').empty().append("密码不一致，请重新输入。");
			return false;
		}
	}

	function submitform() {
		if(!verifyoldpassword())
  			return false;
  		if(!verifypassword())
  			return false;
  		if(!verifyrepassword())
  			return false;
  		$.ajax({type: "POST",
			dataType: "text",
			async: false,
			url: "<c:url value='/user/ChangePassword'/>",
			data: {oldpassword:$('#oldpassword').val(),password:$('#password').val(),d:new Date().getTime()},
			success:function(data){
				if(data == "0000"){
					$("#successdialog").popup();
					$("#successdialog").popup('open');
				}else{
					alert("修改失败");
				}
			}
		});
  	}
	</script>
  </head>
  <body>
  <div data-role="page" data-close-btn="right" data-dialog="true">
  <div data-role="header">
		<h1>修改密码</h1>
		</div>
  	<div data-role="content">
  		<input type="password" name="oldpassword" placeholder="老密码" id="oldpassword" maxlength="20" />
		<p style="color: red" id="oldpasswordp"></p>
		<input type="password" name="password" placeholder="新密码" id="password" maxlength="20" />
		<p style="color: red" id="passwordp"></p>
		<input type="password" name="repassword" placeholder="确认密码" id="repassword" maxlength="20" />
		<p style="color: red" id="repasswordp"></p>
		<button class="ui-shadow ui-btn ui-corner-all" onclick="submitform()">修改</button>
	</div>
	<!-- 修改成功提示框 -->
	<div data-role="popup" id="successdialog" data-dismissible="false">
	    <div data-role="header">
	    <h1>提示</h1>
	    </div>
	    <div role="main" class="ui-content">
	        <h3 class="ui-title">修改成功,下次登录请用新密码</h3>
	        <a data-ajax="false" href="<c:url value='/user/UserCenter'/>" class="ui-btn ui-corner-all ui-shadow ui-btn-inline" >返回</a>
	    </div>
	</div>
  </div>
</body>
</html>