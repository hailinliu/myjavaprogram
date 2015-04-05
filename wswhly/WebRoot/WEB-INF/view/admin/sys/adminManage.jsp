<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>管理员管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/default/easyui.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/icon.css"/>">
	<script type="text/javascript" src="<c:url value="/jquery/jquery-1.8.0.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.easyui.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.easyui.toolbar.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/locale/easyui-lang-zh_CN.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.autocomplete.min.js"/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery.autocomplete.css"/>">
	<script type="text/javascript" src="<c:url value="/jquery/util.js"/>"></script>
	<style type="text/css">
		input,textarea{
			border:1px solid #ccc;
			padding:2px;
		}
		body{
	        FONT: 9pt 微软雅黑;
	        background:url(<c:url value="/images/lightblue.jpg"/>);
	    }
	    TD {
	FONT: 12px 微软雅黑
}
	</style>
	<script type="text/javascript">
	$(function(){
		$('#addadmin').window('close');
		$('#updateadmin').window('close');
		$('#updateadminrole').window('close');
		$('#showdepartment').hide();
		$('#admintable').datagrid({
			toolbar:[{
				id:'adminbtnadd',
				text:'添加管理员',
				iconCls:'icon-add',
				handler:function(){
				    document.getElementById("addadminform").reset();
					$('#addadmin').window('open');
				}
			},{
                id:'adminbtnupd',
                text:'修改管理员信息',
                iconCls:'icon-edit',
                handler:function(){
                    var row = $('#admintable').datagrid('getSelected');
                    if(row){
                    	$('#updateadminid').val(row.id);
						$('#updatename').empty().append(row.username);
						if(row.sex == 1){
							document.getElementById("maleid").checked = "checked";
					    }else{
					    	document.getElementById("femaleid").checked = "checked";
						}
						$('#updatemobile').val(row.mobile);
						$('#updateemail').val(row.email);
						$('#updaterealname').val(row.realname);
						$('#updateidcard').val(row.idcard);
						$('#updateroleid').combobox('setValue',row.roleid);
						$('#updateadmin').window('open');
                    }else{
                    	$.messager.alert('警告', "请先选择管理员！", 'warning');
                    }
                }
				},{
                 id:'adminbtndel',
                 text:'删除管理员',
                 iconCls:'icon-cancel',
                 handler:function(){
					var row = $('#admintable').datagrid('getSelected');
	            	if(row){
		            	if (row.state == 3) {
		            		$.messager.alert('警告','该管理员已被删除！','warning');
			            } else {
		            		$.messager.confirm('提示', '确定要删除此活动吗？', function(r){
		           		         if (r){
		            		        deladmin(row.id);
		           		         }
		           		    });
				        }
	            	}else{
	            		$.messager.alert('警告','请先选择管理员！','warning');
	                }
	             }
				}]
		});

		$('#admintable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');

		$.extend($.fn.validatebox.defaults.rules,{
	          repeatname:{
	            validator:function(value,param){
                    return checkRepeatName(value);
                },
              message:'该登录名已经被使用！！'
	          },
	          repeatmobile:{
	            validator:function(value,param){
	                    return ifMobileCanBeUsed(value);
	            },
	            message:'手机号格式错误或者已经被使用！！'
		      },
	          repeatcardid:{
	            validator:function(value,param){
	                    return ifCardidCanBeUsed(value);
	            },
	            message:'非法身份证号或者该号已经被使用！！'
	          },
	          repeatpassword:{
        	    validator:function(value,param){
                        return repeatPassword(value);
                },
                message:'两次输入密码不一致！！'
		      }
	      });

		 //objects为json数据源对象
		   $('#adminnameid').autocomplete('<c:url value="/sys/autoadmin"/>', 
	             {
			        minChars: 0, 
	                width :400, 
	                dataType: "json",
	                max: 10,
	                mustMatch:true,
	                scroll:false,
	                //autoFill: true,
	                matchContains: true,
	                parse:function(data){
			           return $.map(eval(data),
			           function(row) {
			               return {
			                   data: row,
			                   value: row.username,
			                   result: row.username
			               }
			           }
			           );
	                },
	                formatItem: function (row, i, max) {
	                    return "<table width='97%'><tr><td align='left'>管理员名：" + row.username + "</td><td align='right'>手机号：" + row.mobile + "</td></tr></table>";
	                    //return  row.name;
	                }, 
	                formatMatch: function(row, i, max){ 
	                     return row.username;
	                } ,

	                formatResult: function(row, i, max) {
	                     return row.username;
	                }                 
	             });
		
	});
	
	function serach(){
		
		$('#admintable').datagrid('loadData',{total:0,rows:[]});
		    var username = $("#usernameid").attr("value");
			var state = $('#stateid').combobox('getValue');
		$('#admintable').datagrid('load',{'username':username,'state':state});
		$('#btndelete').linkbutton('disable');
	}

	//判断管理员名称是否重复
	function checkRepeatName(name){
        var flag = false;
        $.ajax({
            async:false,
            type:'post',
            url:"<c:url value='/sys/ifexistsadmin'/>",
            data:'name='+name,
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

	//判断手机号是否可用
	function ifMobileCanBeUsed(mobile){
        if(checkMobileStyle(mobile) == true && checkRepeatMobile(mobile)){
            return true;
        }else{
            return false;
        }
    }

	//判断手机号是否被使用
	function checkRepeatMobile(mobile){
        var flag = false;
        $.ajax({
            async:false,
            type:'post',
            url:"<c:url value='/sys/isrepeatmobile'/>",
            data:'mobile='+mobile,
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

	function submitform(){
		$('#addadminform').form('submit', {
			url: "<c:url value='/sys/addadmin'/>",
			onSubmit: function() {
				return $(this).form('validate');
			},
			success: function(data) {
				if(data == "0000"){
					$.messager.alert('提示', "添加管理员成功！", 'info', function(){
						document.getElementById("addadminform").reset();
						$('#admintable').datagrid('reload');
						$('#addadmin').window('close');
					});
				}else{
					$.messager.alert('警告', data, 'warning',function(){
						document.getElementById("addadminform").reset();
						$('#admintable').datagrid('reload');
						$('#addadmin').window('close');
				    });
				}
			}
		});
	}

	function updateadminform(){
        $('#updateadminform').form('submit',{
            url:"<c:url value='/sys/updadmin'/>",
            onSubmit:function(){
                return $(this).form('validate');
            },
            success:function(data){
                if(data == "0000"){
                	$.messager.alert('提示', "修改管理员成功！", 'info',function(){
	                	document.getElementById("updateadminform").reset();
						$('#updateadmin').window('close');
						$('#admintable').datagrid('reload');
                    });
                }else{
                	$.messager.alert('警告', data, 'warning',function(){
                		document.getElementById("updateadminform").reset();
						$('#updateadmin').window('close');
						$('#admintable').datagrid('reload');
                    });
                }
            }
        });
	}

	function deladmin(id){
       $.ajax({
          type:'post',
          url:'<c:url value="/sys/deladmin"/>',
          data:'id='+id,
          success:function(data){
             if(data == '0000'){
            	 $.messager.alert('提示', "删除成功！", 'info',function(){
 					$('#admintable').datagrid('reload');
                 });
             }else{
            	 $.messager.alert('提示', data, 'warning',function(){
  					$('#admintable').datagrid('reload');
                 });
             }
          }
       });
	}

	//判断身份证号是否可用
	function ifCardidCanBeUsed(cardid){
        if(checkCardidStyle(cardid) == checkCardidStyle("222426300207031") && checkRepeatCardid(cardid) == true){
            return true;
        }else{
            return false;
        }
    }

	//判断身份证号是否重复
	function checkRepeatCardid(name){
        var flag = false;
        $.ajax({
            async:false,
            type:'post',
            url:"<c:url value='/sys/isrepeatcardid'/>",
            data:'cardid='+name+'&ismanager=1',
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

	function repeatPassword(password) {
		if ($('#repassword').val() == $('#addpasswordid').val()) {
           return true;
		} else {
           return false;
		}
	}
	</script>

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr><td>请输入管理员名:<input id="adminnameid" name="adminname" type="text" size="10" editable="false"/></td>
		<td>请选择管理员状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">正常</option>
						<option value="2">锁定</option>
						<option value="3">删除</option>
		              </select></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="admintable" class="easyui-datagrid" data-options="url:'<c:url value="/sys/getadminlist"/>',title: '管理员管理',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'username',width:40,halign:'center'">登录名</th>
				<th data-options="field:'sex',width:20,halign:'center',formatter:function(value,row,index){
				   if(value == 1){
				     return '男';
				   }else if(value ==2){
				     return '女';
				   }else{
				     return '保密';
				   }
				}">性别</th>
				<th data-options="field:'rolename',width:40,halign:'center'">角色</th>
				<th data-options="field:'mobile',width:40,halign:'center'">手机号</th>
				<th data-options="field:'createdate',width:60,halign:'center'">创建时间</th>
				<th data-options="field:'email',width:50,halign:'center'">电子邮箱</th>
				<th data-options="field:'realname',width:30,halign:'center'">真实姓名</th>
				<th data-options="field:'idcard',width:60,halign:'center'">身份证号</th>
				<th data-options="field:'model',width:30,halign:'center',formatter:function(value,row,index){
				   if(value == 1){
				     return '后台操作';
				   }else if(value ==2){
				     return '管理员操作';
				   }else{
				     return '其他操作';
				   }
				}">操作方式</th>
				<th data-options="field:'state',width:30,halign:'center',formatter:function(value,row,index){
				   if(value == 1){
				     return '正常';
				   }else if(value ==2){
				     return '锁定';
				   }else{
				     return '删除';
				   }
				}">状态</th>
			</tr>
		</thead>
	</table>
	
	<div id="addadmin" class="easyui-window" data-options="title:'添加管理员',iconCls:'icon-add',modal:true" style="width:500px;height:370px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="addadminform" method="post">
				<table style="line-height: 30px;" align="center">
				<tr><td>登陆名:</td><td><input name="username" class="easyui-validatebox" type="text" data-options="required:true,validType:'repeatname'"></td></tr>
				<tr><td>密码:</td><td><input id="addpasswordid" name="password" class="easyui-validatebox" type="password" data-options="required:true"></td></tr>
				<tr><td>确认密码:</td><td><input id="repassword" class="easyui-validatebox" type="password" data-options="required:true,validType:'repeatpassword'"></td></tr>
				<tr><td>性别:</td><td><input name="sex" type="radio" value="1" checked="checked"/>男&nbsp;&nbsp;<input name="sex" type="radio" value="2"/>女</td></tr>
				<tr><td>手机号:</td><td><input name="mobile" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>电子邮箱:</td><td><input name="email" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>真实姓名:</td><td><input name="realname" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>身份证号:</td><td><input name="idcard" class="easyui-validatebox" type="text" maxlength="18" data-options="required:true"></td></tr>
				<tr><td>角色:</td><td><input name="roleid" class="easyui-combobox" editable="false" data-options="url:'<c:url value="/sys/getrolecombox"/>',required:true,valueField:'id',textField:'rolename',panelHeight:'auto'"></td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submitform();">添加</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#addadmin').window('close');$('#showcorp').hide();$('#showdepartment').hide();">取消</a>
			</div>
		</div>
	</div>
	
	<div id="updateadmin" class="easyui-window" data-options="title:'修改管理员',iconCls:'icon-edit',modal:true" style="width:500px;height:300px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="updateadminform" method="post">
				<table style="line-height: 30px;" align="center">
				<tr><td></td><td><input id="updateadminid" name="id" type="hidden"/></td></tr>
				<tr><td>登陆名:</td><td><span id="updatename"></span></td></tr>
				<tr><td>性别:</td><td><input id="maleid" name="sex" type="radio" value="1" checked="checked"/>男&nbsp;&nbsp;<input id="femaleid" name="sex" type="radio" value="2"/>女</td></tr>
				<tr><td>手机号:</td><td><input id="updatemobile" name="mobile" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>电子邮箱:</td><td><input id="updateemail" name="email" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>真实姓名:</td><td><input id="updaterealname" name="realname" class="easyui-validatebox" type="text"></td></tr>
				<tr><td>身份证号:</td><td><input id="updateidcard" name="idcard" class="easyui-validatebox" maxlength="18" type="text"></td></tr>
				<tr><td>角色:</td><td><input id="updateroleid" name="roleid" class="easyui-combobox" editable="false" data-options="url:'<c:url value="/sys/getrolecombox"/>',required:true,valueField:'id',textField:'rolename',panelHeight:'auto'"></td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="updateadminform();">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#updateadmin').window('close');">取消</a>
			</div>
		</div>
	</div>
	
  </body>
</html>
