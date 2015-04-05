<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<link href="<c:url value="/images/favicon.ico"/>" rel="SHORTCUT ICON" />
<style type="text/css">
	input,textarea{
		width:200px;
		border:1px solid #ccc;
		padding:2px;
	}
	body{
	FONT: 9pt 微软雅黑;
	}
</style>
<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/default/easyui.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/icon.css"/>">
<script type="text/javascript" src="<c:url value="/jquery/jquery-1.8.0.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/jquery/jquery.easyui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/jquery/locale/easyui-lang-zh_CN.js"/>"></script>
<style type="text/css">
.middle{width:980px; text-align: left; margin:0 auto; /***background:#Fcc;***/}
.bottom{width:980px;font:normal 14px/160% verdana;color:#666;padding:15px 0;}
.b_logo{float:left;width:300px;}
.b_text{float:left;text-align:left;}
body {
	background-color: #dddddd;
}
</style>
<script type="text/javascript">
//$(function(){
//	 var omitformtags=["input", "textarea", "select"];
//     omitformtags=omitformtags.join("|")
//     function disableselect(e){
//     if (omitformtags.indexOf(e.target.tagName.toLowerCase())==-1)
//     return false
//     }
//    function reEnable(){
//    return true
//    }
//    if (typeof document.onselectstart!="undefined")
//    document.onselectstart=new Function ("return false")
//    else{
//    document.onmousedown=disableselect
//    document.onmouseup=reEnable
//    }
	
//	document.getElementById("loginForm").reset();
//	document.getElementById("usernameid").focus();
//	$.extend($.fn.validatebox.defaults.rules,{
//		validatename:{
//         validator:function(value,param){
//                return validateName(value);
//          },
//        message:'用户名不存在！！'
//        }
//    });
//});

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
        	  $.messager.alert('警告', data, 'warning');
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
        	   $.messager.alert('警告', data, 'warning');
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
        	   $.messager.alert('警告', data, 'warning');
           }
        }
    });
    return flag;
}

function checkForm(){
    if($('#loginForm').form('validate')){
        if(checkValidateCode($('#validatecodeid').attr("value"))){
	        if(checkLogin($("#usernameid").attr("value"),$("#passwordid").attr("value"))){
	    	   $('#loginForm').submit();
	        }else{
	        	$.messager.alert('警告', '密码错误！！', 'warning');
	        }
        }else{
        	$.messager.alert('警告', '请输入正确的验证码！！', 'warning');
        }
    }else{
    	return $('#loginForm').form('validate');
    }
}

/*function EnterPress(e){ //传入 event 
	var e = e || window.event; 
	if(e.keyCode == 13 || e.keyCode==108){ 
		 $('#loginId').click();
	} 
}*/

/*function keypress(e){
   var currKey=0,e=e||event;
     if(e.keyCode==13 || e.keyCode==108){
    	 $('#loginId').click();
     }
  document.onkeypress=keypress;
}*/

 document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if(e && e.keyCode==108){ //小键盘回车108
               $('#loginId').click();
               }            
             if(e && e.keyCode==13){ // enter 键
                 $('#loginId').click();
            }
        }; 
   
--></script>
<title>华豫之门管理系统登录</title>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<c:if test="${!empty msg}">
	<script type="text/javascript">
		alert("${msg}");
	</script>
</c:if>
<table width="1002" height="897" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td>
			<img src="<c:url value='/images/denglu_01.jpg'/>" width="1002" height="449" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="<c:url value='/images/denglu_02.png'/>" width="1002" height="448" alt=""></td>
	</tr>
</table>
<div id="dlg" class="easyui-dialog" title="用户登陆" style="width:400px;height:250px;padding:10px" data-options="iconCls:'icon-login',onClose:function(){
	     if (confirm('您确定要关闭本页吗？')){
			window.opener=null;
			window.open('','_self');
			window.close();
		}
		else{
		   location.href = '<c:url value="/sys/gologin"/>';
		}
	    },buttons:[{
				    id:'loginId',
					text:'登陆',
					iconCls:'icon-ok',
					handler:function(){
						checkForm();
		  	        }
				}]">
	<form id="loginForm" action="<c:url value="/sys/login"/>" method="post" >
	   <table align="center" width="100%" height="100px" cellSpacing=0 cellPadding=0>
	       <tr>
	           <td align="right">用户名：</td>
	           <td style="padding-left: 30px">
	               <input id="usernameid" type="text" name="username" class="easyui-validatebox" data-options="required:true,validType:'validatename'"/>
	           </td>
	       </tr>
	       <tr>
	           <td align="right">密&nbsp;&nbsp;&nbsp;码：</td>
	           <td style="padding-left: 30px">
	               <input id="passwordid" type="password" name="password" class="easyui-validatebox" data-options="required:true"/>
	           </td>
	       </tr>
		   <tr>
				<td align="right">
					验证码：
				</td>
				<td style="padding-left: 30px">
					<input id="validatecodeid" name="validatecode" style="width: 50px"/>
					<img id="imgcode" src="<c:url value="/validateCode"/>"
								style="height: 25px; vertical-align: middle;"
								onclick="this.src=this.src+'?'"  />
				</td>
			</tr>
	   </table>
	</form>
</div>
</body>
</html>