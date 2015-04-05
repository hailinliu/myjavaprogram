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
function checkLogin(username,password){
	var flag = false;
	$.ajax({
       async:false,
       type:'post',
       url:"<c:url value='/sys/checklogin'/>",
       data:{
            username:username,
            password:password
       },
       success:function(data){
          if(data == '0000'){
             flag = true;
          }else if(data == '0001'){
             flag = false;
          }else{
        	  alert(data);
          }
       }
	});
	return flag;
}

function checkValidateCode(validatecode){
    var flag = false;
    $.ajax({
        async:false,
        type:'post',
        url:"<c:url value='/sys/validatecode'/>",
        data:'validatecode='+validatecode,
        success:function(data){
           if(data == "0000"){
               flag = true;
           }else if(data == "0001"){
               flag = false;
           }else{
        	  alert(data);
           }
        }
    });
    return flag;
}

function validateName(name){
	var flag = false;
	$.ajax({
        async:false,
        type:'post',
        url:"<c:url value='/sys/ifexistsadmin'/>",
        data:'name='+name,
        success:function(data){
           if(data == "0001"){
               flag = true;
           }else if(data == "0000"){
               flag = false;
           }else{
           		alert(data);
           }
        }
    });
    return flag;
}
function validateLogin(name,pass){
	var flag = 0;
	$.ajax({
        async:false,
        type:'post',
        url:"<c:url value='/sys/login'/>",
        data:$('#loginForm').serialize(),
        success:function(data){
           flag=data;
        }
    });
    return flag;
}
function checkForm(){
if($('#usernameid').val()==''){alert('请输入用户名！');return;}
if($('#passwordid').val()==''){alert('请输入密码！');return;}
if($('#validatecodeid').val()==''){alert('请输入验证码！');return;}
        if(checkValidateCode($('#validatecodeid').val())){
	        if(checkLogin($("#usernameid").val(),$("#passwordid").val())){
	         var nums=validateLogin($("#usernameid").val(),$("#passwordid").val());
	    	  if(nums!=0){
	    	  	if(nums==1){
	    	  	window.location.href="<c:url value='/sys/gomainzj'/>";
	    	  	}else if(nums==2){
	    	  	window.location.href="<c:url value='/sys/gomainadmin'/>";
	    	  	}else{
	    	  	 if(nums.indexOf('异常')>=0){
	    	  	 	window.location.href="<c:url value='/sys/gologin/'/>";
	    	  	 }
	    	  	}
	    	  }
	        }else{
	        	alert("密码错误");
	        }
        }else{
      		  alert("请输入正确的验证码！");
        }
}

 document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if(e && e.keyCode==108){ //小键盘回车108
               $('#loginId').click();
               }            
             if(e && e.keyCode==13){ // enter 键
                 $('#loginId').click();
            }
        }; 
	</script>
  </head>
  <body>
  <div data-role="page">
  	<div data-role="header">
	<h1>登录</h1>
	</div>
  	<div data-role="content">
		<form id="loginForm" action="<c:url value="/sys/login"/>" method="post" >
			 <input id="usernameid" type="text" name="username"  placeholder="用户名" value="" />
			<p style="color: red" id="usernamep"></p>
			 <input id="passwordid" type="password" name="password"   placeholder="密码" value=""/>
			<p style="color: red" id="passwordp"></p>
			<div id="logincodediv">
			<input id="validatecodeid" name="validatecode"    placeholder="验证码"/>
					<img id="imgcode" src="<c:url value="/validateCode"/>"	 	onclick="this.src=this.src+'?'"  />
	      	</div>
		</form>
		<button id="loginId" class="ui-shadow ui-btn ui-corner-all" onclick="checkForm()">登录</button>
		<p style="font-size: 14px;font-weight: bold;text-align:left;position:relative;color: red" >1、验证码均为数字！！！！</p>
		<p style="font-size: 14px;font-weight: bold;text-align:left;position:relative;color: red" >2、请您尽量在WIFI情况下访问！！！！</p>
		<p style="font-size: 14px;font-weight: bold;text-align:left;position:relative;color: red" >3、该系统为专家鉴定系统，普通用户无法登陆！！！！</p>
	</div>
  </div>

</body>
</html>