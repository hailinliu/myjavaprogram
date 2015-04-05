<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>日志管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/default/easyui.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/icon.css"/>">
	<script type="text/javascript" src="<c:url value="/jquery/jquery-1.8.0.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.easyui.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.easyui.toolbar.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/locale/easyui-lang-zh_CN.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/util.js"/>"></script>
<style type="text/css">
	    body{
	        FONT: 9pt 微软雅黑;
	        background:url(<c:url value="/images/lightblue.jpg"/>);
	    }
		textarea{
			width:200px;
			border:1px solid #ccc;
			padding:2px;
		}
		#addrole input{
		    width:200px;
			border:1px solid #ccc;
			padding:2px;
		}
		#updaterole input{
		    width:200px;
			border:1px solid #ccc;
			padding:2px;
		}
		TD {
	FONT: 12px 微软雅黑
}
</style>
<script type="text/javascript">
$(function(){
	$('#scansyslog').window('close');
	$('#syslogtable').datagrid({
        toolbar:[{
          id:'logbtnscan',
          text:'日志详情',
          iconCls:'icon-search',
          handler:function(){
        	  var row = $('#syslogtable').datagrid('getSelected');
        	  $('#oneopmodelid').empty().append(row.opmodel);
        	  $('#oneactionid').empty().append(row.action);
        	  $('#oneoperid').empty().append(row.opername);
        	  $('#onecreatetimeid').empty().append(row.createdate);
        	  $('#oneresultid').empty().append(row.result);
        	  $('#oneipid').empty().append(row.ip);
        	  $('#onecontentid').empty().append(row.content);
        	  $('#scansyslog').window('open');
          }
        }]
    });
	$('#syslogtable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');
	$('#syslogtable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');
	$('#startdate').datebox('setValue',formatMonth(-3));
	$('#enddate').datebox('setValue',formatDay(0));
	$('#datacycle').combobox({
		onSelect: function(rec){
			if(rec.value == "0"){
				$('#startdate').datebox('setValue',formatMonth(-3));
				$('#enddate').datebox('setValue',formatDay(0));
			}else if(rec.value == "1"){
				$('#startdate').datebox('setValue',formatDay(-7));
				$('#enddate').datebox('setValue',formatDay(0));
			}else if(rec.value == "2"){
				$('#startdate').datebox('setValue',formatDay(-30));
				$('#enddate').datebox('setValue',formatDay(0));
			}else{
				$('#startdate').datebox('setValue','');
				$('#enddate').datebox('setValue','');
			}
		}
	});
});
function serach(){
	$('#syslogtable').datagrid('loadData',{total:0,rows:[]});
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#syslogtable').datagrid('load',{'begindate':sdate,'enddate':edate});
}
</script>
  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr><td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
		<td>起始日期:<input id="startdate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>结束日期:<input id="enddate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="syslogtable" class="easyui-datagrid" data-options="url:'<c:url value="/syslog/getsysloglist"/>',queryParams:{'begindate':formatMonth(-3),'enddate':formatDay(0)},title: '日志浏览',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'opmodel',width:30,halign:'center'">操作模块</th>
				<th data-options="field:'action',width:30,halign:'center'">动作</th>
				<th data-options="field:'content',width:30,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 8){
				         return value.substring(0,8)+'...';
				      }
				   }
				   return value;
				}">内容</th>
				<th data-options="field:'result',width:20,halign:'center'">结果</th>
				<th data-options="field:'opername',width:20,halign:'center'">操作人员</th>
				<th data-options="field:'createdate',width:30,halign:'center'">操作时间</th>
				<th data-options="field:'ip',width:25,halign:'center'">IP地址</th>
				<th data-options="field:'model',width:25,halign:'center',formatter:function(value,row,index){
				   if(value == 1){
				      return '用户操作';
				   }else if(value == 2){
				      return '管理员操作';
				   }
				}">操作模式</th>
			</tr>
		</thead>
	</table>
	
	<!-- 查看系统日志详细内容 -->
	<div id="scansyslog" class="easyui-window" data-options="title:'日志详情',iconCls:'icon-search',modal:true" style="width:700px;height:300px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="oneverifytable" width="100%" cellpadding="5" cellspacing="1">
				<tr><td width="25%" style="font-weight: bold;">操作模块:</td><td id="oneopmodelid"></td><td width="25%">动作:</td><td id="oneactionid"></td></tr>
				<tr><td width="25%">操作人员:</td><td id="oneoperid"></td><td width="25%">操作时间:</td><td id="onecreatetimeid"></td></tr>
				<tr><td width="25%">结果:</td><td id="oneresultid"></td><td width="25%">ip地址:</td><td id="oneipid"></td></tr>
				<tr><td width="25%" style="font-weight: bold;">内容:</td><td id="onecontentid" colspan="3"></td></tr>
				</table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scansyslog').window('close');">关闭</a>
			</div>
		</div>
	</div>
  </body>
</html>
