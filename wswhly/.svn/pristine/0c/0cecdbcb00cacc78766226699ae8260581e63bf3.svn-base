<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>个人信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/default/easyui.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/icon.css"/>">
	<script type="text/javascript" src="<c:url value="/jquery/jquery-1.8.0.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.easyui.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/locale/easyui-lang-zh_CN.js"/>"></script>

<style type="text/css">
BODY {
	MARGIN: 0px;
	FONT: 9pt 微软雅黑;
background:url(<c:url value="/images/lightblue.jpg"/>);

}

TABLE {
	BORDER-RIGHT: 0px;
	BORDER-TOP: 0px;
	BORDER-LEFT: 0px;
	BORDER-BOTTOM: 0px
}

TD {
	FONT: 12px 微软雅黑
}

IMG {
	BORDER-RIGHT: 0px;
	BORDER-TOP: 0px;
	VERTICAL-ALIGN: bottom;
	BORDER-LEFT: 0px;
	BORDER-BOTTOM: 0px
}

A {
	FONT: 12px 微软雅黑;
	COLOR: #000000;
	TEXT-DECORATION: none
}

A:hover {
	COLOR: #428eff;
	TEXT-DECORATION: underline
}

.sec_menu {
	BORDER-RIGHT: white 1px solid;
	BACKGROUND: #d6dff7;
	OVERFLOW: hidden;
	BORDER-LEFT: white 1px solid;
	BORDER-BOTTOM: white 1px solid
}

.menu_title {
	
}

.menu_title SPAN {
	FONT-WEIGHT: bold;
	LEFT: 7px;
	COLOR: #215dc6;
	POSITION: relative;
	TOP: 2px
}

.menu_title2 {
	
}

.menu_title2 SPAN {
	FONT-WEIGHT: bold;
	LEFT: 8px;
	COLOR: #428eff;
	POSITION: relative;
	TOP: 2px
}

/*table中偶数行*/ 
.tabEven 
{ 
background: #EEEEFF; 
} 
/*table中奇数行*/ 
.tabOdd 
{ 
background: #ffffff; 
} 
</style>

<script type="text/javascript">
$(function(){
	$("#myinfo tr:even").addClass("tabEven"); 
	$("#myinfo tr:odd").addClass("tabOdd"); 

	$('#modifypassword').window('close');

	$.extend($.fn.validatebox.defaults.rules,{
		multiple : {
            validator : function(value, vtypes) {
                var returnFlag = true;
                var opts = $.fn.validatebox.defaults;
                for (var i = 0; i < vtypes.length; i++) {
                    var methodinfo = /([a-zA-Z_]+)(.*)/.exec(vtypes[i]);
                    var rule = opts.rules[methodinfo[1]];
                    if (value && rule) {
                        var parame = eval(methodinfo[2]);
                        if (!rule["validator"](value, parame)) {
                            returnFlag = false;
                            this.message = rule.message;
                            break;
                        }
                    }
                }
                return returnFlag;
            }
        },
        rightpassword:{
          validator:function(value,param){
                return checkPassword(value);
            },
        message:'密码不正确！！'
        },
        repeatpassword:{
        	validator:function(value,param){
            return checkRepeatPassword(value);
        },
        message:'新密码不能与旧密码相同！！'
        },
        ensurepassword:{
        	validator:function(value,param){
            return checkEnsurePassword(value);
        },
        message:'两次密码不一样！！'
        },
        ispassword:{
        	validator:function(value,param){
            return checkIsPassword(value);
        },
        message:'请输入6-10位数字或字母！'
        }
    });
	
});

function showPasswordWindow(){
	$('#modifypassword').window('open');
}

function submitform(){
	$('#modifypasswordform').form('submit', {
		url: "<c:url value='/sys/modifypassword'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "密码修改成功！", 'info');
				document.getElementById("modifypasswordform").reset();
				$('#modifypassword').window('close');
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}

function checkPassword(password){
	var flag = false;
    $.ajax({
        async:false,
        type:'post',
        url:"<c:url value='/sys/validatepassword'/>",
        data:'currentPassword='+password,
        success:function(data){
           var json = eval("("+data+")");
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

function checkRepeatPassword(value){
	if($('#currentPasswordid').attr('value') == $('#newPasswordid').attr('value')){
        return false;
    }else{
        return true;
    }
}

function checkEnsurePassword(value){
	if($('#ensurePasswordid').attr('value') == $('#newPasswordid').attr('value')){
       return true;
	}else{
       return false;
    }
}

function checkIsPassword(s)  
{  
var patrn=/^(\w){6,10}$/;  
if (!patrn.exec(s)) return false  
return true  
}  

</script>

  </head>
  
  <body>
    <!-- 我的个人信息 -->
	<div id="scanmyinfo" class="easyui-window" data-options="closable:false,minimizable:false,title:'我的个人信息',iconCls:'icon-search',modal:true" style="width:500px;height:375px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="myinfo" width="100%" cellpadding="5" cellspacing="1">
				<tr><td>登录名:</td><td>${CurrentSession.userinfo.username}</td></tr>
				<tr><td>性别:</td><td>
				<c:choose>
				  <c:when test="${CurrentSession.userinfo.sex eq 1}">男</c:when>
				  <c:when test="${CurrentSession.userinfo.sex eq 2}">女</c:when>
				  <c:when test="${CurrentSession.userinfo.sex eq 3}">保密</c:when>
				</c:choose>
				</td></tr>
				<tr><td>角色:</td><td>${CurrentSession.userinfo.rolename}</td></tr>
				<tr><td>手机号:</td><td>${CurrentSession.userinfo.mobile}</td></tr>
				<tr><td>电子邮箱:</td><td>${CurrentSession.userinfo.email}</td></tr>
				<tr><td>真实姓名:</td><td>${CurrentSession.userinfo.realname}</td></tr>
				<tr><td>身份证号:</td><td>${CurrentSession.userinfo.idcard}</td></tr>
				<tr><td>状态:</td><td>
				<c:choose>
				  <c:when test="${CurrentSession.userinfo.state eq 1}">正常</c:when>
				  <c:when test="${CurrentSession.userinfo.state eq 2}">锁定</c:when>
				  <c:otherwise>注销</c:otherwise>
				</c:choose>
				</td></tr>
				</table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="showPasswordWindow();">修改密码</a>
			</div>
		</div>
	</div>
	
	<div id="modifypassword" class="easyui-window"
			data-options="iconCls:'icon-edit',title:'修改密码',modal:true"
			style="padding: 5px; width: 300px; height: 210px;">
		<div class="easyui-layout" data-options="fit:true">
		   <div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
		     <form id="modifypasswordform" method="post">
		      <table>
		        <tr>
		          <td>当前密码：</td>
		          <td>
		            <input id="currentPasswordid" name="currentPassword" class="easyui-validatebox" type="password" data-options="required:true,validType:'rightpassword'"/>
		          </td>
		        </tr>
		        <tr>
		          <td>新密码：</td>
		          <td>
		            <input id="newPasswordid" name="newPassword" class="easyui-validatebox" type="password" data-options="required:true,validType:'multiple[\'repeatpassword\',\'ispassword\']'"/>
		          </td>
		        </tr>
		        <tr>
		          <td>确认密码：</td>
		          <td>
		            <input id="ensurePasswordid" name="ensurePassword" class="easyui-validatebox" type="password" data-options="required:true,validType:'ensurepassword'"/>
		          </td>
		        </tr>
		      </table>
		     </form>
		   </div>
		   <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submitform();">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#modifypassword').window('close');document.getElementById('modifypasswordform').reset();">取消</a>
		   </div>
		</div>
	</div>
  </body>
</html>
