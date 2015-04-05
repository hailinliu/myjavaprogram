<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>角色管理</title>
    
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
<style type="text/css">
input,textarea{
	border:1px solid #ccc;
	padding:2px;
}
body{
       FONT: 9pt 微软雅黑;
       background:url('<c:url value="/images/lightblue.jpg"/>');
}
TD {
	FONT: 12px 微软雅黑
}
</style>
<script type="text/javascript">
$(function(){
$('#addrole').window('close');
$('#updaterole').window('close');
$('#addpermission').window('close');
$('#roletable').datagrid({
	toolbar:[{
		id:'rolebtnadd',
		text:'添加',
		iconCls:'icon-add',
		handler:function(){
		    document.getElementById("addroleform").reset();
			$('#addrole').window('open');
		}
	},{
	id:'rolebtnupd',
		text:'修改角色',
		iconCls:'icon-edit',
		handler:function(){
			var row = $('#roletable').datagrid('getSelected');
			if (row) {
				if (row.state == 2) {
				    $.messager.alert('警告', "该角色已被删除！", 'warning');
			    } else {
					$('#updateroleid').val(row.id);
					$('#updaterolename').val(row.rolename);
					$('#updaterolememo').val(row.content);
					$('#updaterole').window('open');
				}
			}else{
				$.messager.alert('警告', "请先选择角色！", 'warning');
			}
		}
	 },{
     id:'rolebtnaddp',
		text:'分配权限',
		iconCls:'icon-permission',
		handler:function(){
			var row = $('#roletable').datagrid('getSelected');
			if (row) {
				if (row.state == 2) {
		       		$.messager.alert('警告','该角色已被删除！','warning');
			    } else {
					$('#roleid').val(row.id);
					$('#permissiontree').tree({
						checkbox: true,
						url: '<c:url value="/sys/getpermissionbyroleid"/>?date='+(new Date()).getTime()+'&roleid='+row.id,
						onBeforeCollapse:function(node){
						return false;
						},
						onBeforeExpand:function(node){
						return false;
						}
					});
					$('#addpermission').window('open');
				}
			}else{
				$.messager.alert('警告', "请先选择角色！", 'warning');
			}
		}
    },{
    	id:'rolebtndel',
        text:'删除角色',
        iconCls:'icon-cancel',
        handler:function(){
			var row = $('#roletable').datagrid('getSelected');
	       	if(row){
		       	if (row.state == 2) {
		       		$.messager.alert('警告','该角色已被删除！','warning');
			    } else {
		       		$.messager.confirm('提示', '确定要删除此角色吗？', function(r){
		  		         if (r){
		       		        delRole(row.id);
		  		         }
		  		    });
				}
	       	}else{
	       		$.messager.alert('警告','请先选择角色！','warning');
	        }
        }
    }]
  });

$('#roletable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');

$.extend($.fn.validatebox.defaults.rules,{
    repeatrole:{
      validator:function(value,param){
          return checkRepeatRole(value);
      },
    message:'该角色名已经被使用！！'
    }
});

//objects为json数据源对象
$('#rolenameid').autocomplete('<c:url value="/sys/autorole"/>', 
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
	                   value: row.rolename,
	                   result: row.rolename
	               }
	           }
	           );
      },
      formatItem: function (row, i, max) {
          return "<table width='97%'><tr><td align='left'>角色名：" + row.rolename + "</td><td align='right'>创建时间：" + row.createdate + "</td></tr></table>";
          //return  row.name;
      },
      formatMatch: function(row, i, max){
           return row.rolename;
      } ,

      formatResult: function(row, i, max) {
           return row.rolename;
      }
   });
});

function submitpermission(){
	var nodes = $('#permissiontree').tree('getChecked','indeterminate');
	var s = '';
	for(var i=0; i<nodes.length; i++){
		if (s != '') s += ',';
		s += nodes[i].id;
	}
	var checknodes = $('#permissiontree').tree('getChecked');
	for(var i=0; i<checknodes.length; i++){
		if (s != '') s += ',';
		s += checknodes[i].id;
	}
	$.ajax({type: "POST",
		dataType: "text",
		url: "<c:url value='/sys/addrolepermission'/>",
		data: {roleid:$('#roleid').val(),permissionid:s},
		success:function(data){
			if(data == "0000"){
				$.messager.alert('提示', "处理成功！", 'info');
				$('#addpermission').window('close');
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}

function checkRepeatRole(rolename){
	var flag = false;
    $.ajax({
        async:false,
        type:'post',
        url:"<c:url value='/sys/isrepeatrole'/>",
        data:'rolename='+rolename,
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

function serach(){
	$('#roletable').datagrid('loadData',{total:0,rows:[]});
	    var rolename = $("#rolenameid").attr("value");
		var state = $('#stateid').combobox('getValue');
	$('#roletable').datagrid('load',{'rolename':rolename,'state':state});
	$('#btndelete').linkbutton('disable');
}

function submitform(){
	$('#addroleform').form('submit', {
		url: "<c:url value='/sys/addrole'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "添加角色成功！", 'info', function(){
					document.getElementById("addroleform").reset();
					$('#roletable').datagrid('reload');
					$('#addrole').window('close');
				});
			}else{
				$.messager.alert('警告', data, 'warning',function(){
					document.getElementById("addroleform").reset();
					$('#roletable').datagrid('reload');
					$('#addrole').window('close');
			    });
			}
		}
	});
}

function updateuserrolesubmitform(){
	$('#updateroleform').form('submit', {
		url: "<c:url value='/sys/updrole'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "修改角色成功！", 'info', function(){
					document.getElementById("updateroleform").reset();
					$('#roletable').datagrid('reload');
					$('#updaterole').window('close');
				});
			}else{
				$.messager.alert('警告', data, 'warning',function(){
					document.getElementById("updateroleform").reset();
					$('#roletable').datagrid('reload');
					$('#updaterole').window('close');
			    });
			}
		}
	});
}

function delRole(id){
	$.ajax({
        type:'post',
        url:'<c:url value="/sys/delrole"/>',
        data:'id='+id,
        success:function(data){
           if(data == '0000'){
          	 $.messager.alert('提示', "删除成功！", 'info',function(){
					$('#roletable').datagrid('reload');
               });
           }else{
          	 $.messager.alert('提示', data, 'warning',function(){
					$('#roletable').datagrid('reload');
               });
           }
        }
     });
}
</script>
  </head>
  
  <body style="overflow: auto">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr><td>请输入角色名:<input id="rolenameid" name="username" type="text" size="10" editable="false"/></td>
		<td>请选择角色状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">正常</option>
						<option value="2">锁定</option>
						<option value="3">删除</option>
		              </select></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="roletable" class="easyui-datagrid" data-options="url:'<c:url value="/sys/getrolelist"/>',title: '用户管理',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'rolename',width:40,halign:'center'">角色名</th>
				<th data-options="field:'content',width:40,halign:'center'">备注</th>
				<th data-options="field:'createdate',width:50,halign:'center'">创建时间</th>
				<th data-options="field:'state',width:15,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '正常';
                   }else if(value == 2){
                     return '删除';
                   }
                }">状态</th>
			</tr>
		</thead>
	</table>
	
	<div id="addrole" class="easyui-window" data-options="title:'添加角色',iconCls:'icon-add',modal:true" style="width:500px;height:300px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="addroleform" method="post">
				<table style="line-height: 30px;">
				<tr><td>角色:</td><td><input name="rolename" class="easyui-validatebox" type="text" data-options="required:true,validType:'repeatrole'"></td></tr>
				<tr><td>备注:</td><td><textarea class="easyui-validatebox" name="note" style="height:100px;"></textarea></td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submitform();">添加</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#addrole').window('close');">取消</a>
			</div>
		</div>
	</div>
	
	<div id="updaterole" class="easyui-window" data-options="title:'修改角色信息',iconCls:'icon-edit',modal:true" style="width:500px;height:300px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="updateroleform" method="post">
				<table>
				<tr><td></td><td><input id="updateroleid" name="id" type="hidden"></td></tr>
				<tr><td>角色:</td><td><input id="updaterolename" name="rolename" class="easyui-validatebox" type="text" data-options="required:true"/></td></tr>
				<tr><td>备注:</td><td><textarea id="updaterolememo" class="easyui-validatebox" name="note" style="height:100px;"></textarea></td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="updateuserrolesubmitform();">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#updaterole').window('close');">取消</a>
			</div>
		</div>
	</div>
	<div id="addpermission" class="easyui-window" data-options="title:'分配权限',iconCls:'icon-add',modal:true" style="width:500px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<input type="hidden" id="roleid">
				<ul id="permissiontree"></ul>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submitpermission();">确定</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#addpermission').window('close');">取消</a>
			</div>
		</div>
	</div>
  </body>
</html>
