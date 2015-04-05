<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>服务购买信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/default/easyui.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/icon.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery.autocomplete.css"/>">
	<script type="text/javascript" src="<c:url value="/jquery/jquery-1.8.0.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.easyui.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.easyui.toolbar.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/locale/easyui-lang-zh_CN.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.autocomplete.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/util.js"/>"></script>
	<style type="text/css">
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

	$.extend($.fn.validatebox.defaults.rules,{
		validatename:{
          validator:function(value,param){
                return validateName(value);
          },
        message:'用户名不存在！！'
        }
    });
	
	$('#adduserserve').window('close');
	$('#upduserserve').window('close');

	$('#serveinfotable').datagrid({
          toolbar:[{
              id:'serveinfoinfobtnadd',
              text:'添加购买信息',
              iconCls:'icon-add',
              handler:function(){
        	        document.getElementById("adduserserveform").reset();
					$("#adduserserve").window("open");
              }
          },{
              id:'serveinfoinfobtnupd',
              text:'修改购买状态',
              iconCls:'icon-edit',
              handler:function(){
	        	  var row = $('#serveinfotable').datagrid('getSelected');
	        	  if (row) {
	        		  $('#suidid').val(row.suid);
	        		  $('#selectedstateid').combobox('setValue', row.state);
	        		  $('#upduserserve').window('open');
	        	  } else {
	        		$.messager.alert('警告','请选择一条记录','warning');
	              }
              }
          },{
              id:'serveinfoinfobtndel',
              text:'删除购买信息',
              iconCls:'icon-cancel',
              handler:function(){
	        	  var row = $('#serveinfotable').datagrid('getSelected');
	        	  if (row) {
	        		  $.messager.confirm('提示', '确定要删除此记录吗？', function(r){
		       		         if (r){
	        		  			delServeUser(row.suid);
		       		         }
		       		     });
	        	  } else {
	        		$.messager.alert('警告','请选择一条记录','warning');
	              }
              }
          }]
	});

	$('#usernameid').autocomplete('<c:url value="/sys/autouser"/>', 
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
                   return "<table width='97%'><tr><td align='left'>用户名：" + row.username + "</td></tr></table>";
                   //return  row.name;
               }, 
               formatMatch: function(row, i, max){ 
                    return row.username;
               } ,

               formatResult: function(row, i, max) {
                    return row.username;
               }                 
            });
    
	$('#userserveid').autocomplete('<c:url value="/sys/autouser"/>', 
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
                   return "<table width='97%'><tr><td align='left'>用户名：" + row.username + "</td></tr></table>";
                   //return  row.name;
               }, 
               formatMatch: function(row, i, max){ 
                    return row.username;
               } ,

               formatResult: function(row, i, max) {
                    return row.username;
               }                 
            });
	
	//$('#serveinfotable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');

});
	
function serach(){
	$('#serveinfotable').datagrid('loadData',{total:0,rows:[],footer:[]});
	var username = $("#usernameid").val();
	var state = $("#stateid").combobox("getValue");
	$('#serveinfotable').datagrid('load',{'username':username,'serveid':'${serveid}','state':state});
}

function submitform() {
	$('#adduserserveform').form('submit', {
		url: "<c:url value='/serve/addServeUser'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "添加成功！", 'info', function(){
					document.getElementById("adduserserveform").reset();
					$('#serveinfotable').datagrid('reload');
					$('#adduserserve').window('close');
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}

function updsubmitform() {
	$('#upduserserveform').form('submit', {
		url: "<c:url value='/serve/updServeUser'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "修改成功！", 'info', function(){
					document.getElementById("upduserserveform").reset();
					$('#serveinfotable').datagrid('reload');
					$('#upduserserve').window('close');
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}

function delServeUser(value){
	$.ajax({
        type:'post',
        url:'<c:url value="/serve/delServeUser"/>',
        data:'suid='+value,
        success:function(data){
           if(data == '0000'){
          	 $.messager.alert('提示', "删除成功！", 'info',function(){
          		$('#serveinfotable').datagrid('loadData',{total:0,rows:[],footer:[]});
          		$('#serveinfotable').datagrid('reload');
               });
           }else{
          	 $.messager.alert('提示', data, 'warning',function(){
          		$('#serveinfotable').datagrid('reload');
               });
           }
        }
     });
}

function validateName(name){
	var flag = false;
	$.ajax({
        async:false,
        type:'post',
        url:"<c:url value='/sys/ifexistsuser'/>",
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

	</script>

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr>
		<td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'"><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
		<td>报名用户:<input id="usernameid" name="username" type="text" size="20" editable="false"/></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">已预约</option>
						<option value="2">已确认</option>
						<option value="3">预约失效</option>
						<option value="4">已退款</option>
						<option value="5">已结束/option>
		              </select></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>
		</tr>
	</table>
    <table id="serveinfotable" class="easyui-datagrid" data-options="url:'<c:url value="/serve/getServeInfoList?serveid=${serveid}"/>',title: '报名列表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true,showFooter:true">
		<thead>
			<tr>
				<th data-options="field:'suid',width:35,halign:'center'">序列号</th>
				<th data-options="field:'servicename',width:35,halign:'center'">服务名名</th>
				<th data-options="field:'username',width:35,halign:'center'">购买用户</th>
				<th data-options="field:'date1',width:35,halign:'center'">预约时间</th>
				<th data-options="field:'date2',width:35,halign:'center'">确认时间</th>
				<th data-options="field:'date3',width:35,halign:'center'">预约失效时间</th>
				<th data-options="field:'date4',width:35,halign:'center'">退款时间</th>
				<th data-options="field:'date5',width:35,halign:'center'">结束时间</th>
				<th data-options="field:'state',width:35,halign:'center',formatter:function(value,row,index){
				   if(value == 1){
				      return '已预约';
				   }else if(value == 2){
				      return '已确认';
				   }else if(value == 3){
				      return '预约失效';
				   }else if(value == 4){
				      return '已退款';
				   }else{
				      return '已结束';
				   }
				}">状态</th>
			</tr>
		</thead>
	</table>
	
	<a class="easyui-linkbutton" style="float: right" data-options="iconCls:'icon-redo'" href="javascript:void(0)" onclick="history.go(-1);">返回</a>
	
	<!-- 添加购买信息 -->
	<div id="adduserserve" class="easyui-window" data-options="title:'添加购买信息',iconCls:'icon-add',modal:true" style="width:500px;height:200px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="adduserserveform" method="post">
				    <input type="hidden" name="serveid" value="${serveid}"/>
					<table width="100%" cellpadding="5" cellspacing="1">
					  <tr><td>用户名:</td><td><input id="userserveid" name="username" class="easyui-validatebox" type="text" data-options="required:true,validType:'validatename'"></td></tr>
					</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submitform();">添加</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#adduserserve').window('close');">关闭</a>
			</div>
		</div>
	</div>
	
	<!-- 修改购买状态 -->
	<div id="upduserserve" class="easyui-window" data-options="title:'修改购买状态',iconCls:'icon-edit',modal:true" style="width:500px;height:200px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="upduserserveform" method="post">
				    <input id="suidid" type="hidden" name="suid""/>
					<table width="100%" cellpadding="5" cellspacing="1">
					  <tr>
						  <td>状态:</td>
						  <td>
						    <select id="selectedstateid" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
								<option value="1">已预约</option>
								<option value="2">已确认</option>
								<option value="3">预约失效</option>
								<option value="4">已退款</option>
								<option value="5">已结束</option>
				            </select>
						  </td>
					  </tr>
					</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="updsubmitform();">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#upduserserve').window('close');">关闭</a>
			</div>
		</div>
	</div>
	
  </body>
</html>
