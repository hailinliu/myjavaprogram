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
		
	});

	function modify(){
		if($('#address').val().length == 0){
			$('#addressp').empty().append("输入邮箱格式错误");
			return false;
		}
		if('${CurrentSession.address}' != '')
	  		if(!verifycode())
	  			return false;
		$.ajax({type: "POST",
			dataType: "text",
			async: false,
			url: "<c:url value='/user/ModifyUser'/>",
			data: {address:$('#address').val(),d:new Date().getTime()},
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
	
	function verifycode(str){
		var flag = false;
		var verifycode = $('#mobilecode').val();
		if(verifycode.length != 6){
			$('#mobilecodep').empty().append("* 请输入正确6位有效的手机验证码。");
		}else{
			$.ajax({type: "POST",
				dataType: "text",
				async: false,
				url: "<c:url value='/user/verifyMobileCode'/>",
				data: {mobile:'${CurrentSession.mobile}',verifycode:verifycode,d:new Date().getTime()},
				success:function(data){
					if(data == "0000"){
						$('#mobilecodep').empty();
						flag = true;
					}else{
						$('#mobilecodep').empty().append("验证码不正确，请重新输入。");
					}
				}
			});
		}
		return flag;
	}
	
	function sendsms(str) {
		$.ajax({type: "POST",
			dataType: "text",
			url: "<c:url value='/user/SendSms'/>",
			data: {mobile:'${CurrentSession.mobile}',type:'7'},
			success:function(data){
				if(data == "0000"){
					time(str);
				}else{
					alert("发送失败，请重新发送");
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
	
	</script>
  </head>
  <body>
  <div data-role="page" data-close-btn="right" data-dialog="true">
  <div data-role="header">
		<h1>修改地址</h1>
		</div>
  	<div data-role="content">
			<input type="text" placeholder="新地址" name="address" id="address"  maxlength="20"/>
			<p style="color: red" id="addressp"></p>
			<c:if test="${not empty CurrentSession.address}">
				<input type="text" placeholder="手机验证码" name="mobilecode" id="mobilecode"  maxlength="6"/>
				<p style="color: red" id="mobilecodep"></p>
				<button id="sendsms" class="ui-shadow ui-btn ui-corner-all" onclick="sendsms('sendsms')">发送验证码</button>
			</c:if>
		<button class="ui-shadow ui-btn ui-corner-all" onclick="modify()">修改</button>
	</div>
	<!-- 修改成功提示框 -->
	<div data-role="popup" id="successdialog" data-dismissible="false">
	    <div data-role="header">
	    <h1>提示</h1>
	    </div>
	    <div role="main" class="ui-content">
	        <h3 class="ui-title">修改成功</h3>
	        <a data-ajax="false" href="<c:url value='/user/UserCenter'/>" class="ui-btn ui-corner-all ui-shadow ui-btn-inline">返回</a>
	    </div>
	</div>
  </div>
</body>
</html>