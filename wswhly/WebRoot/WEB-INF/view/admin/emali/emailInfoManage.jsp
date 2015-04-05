<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>短信管理</title>
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
	$('#scanmessage').window('close');
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

	$('#emailtable').datagrid({
          toolbar:[{
              id:'messagebtnscan',
              text:'查看邮件',
              iconCls:'icon-search',
              handler:function(){
                 var row = $('#emailtable').datagrid('getSelected');
                 if(row){
               	  $('#onemailaddressid').empty().append(row.mailaddress);
               	  $('#onecreatetimeid').empty().append(row.createtime);
               	  if (row.state == '0') {
               	  	$('#onestateid').empty().append('成功');
                  } else {
               	  	$('#onestateid').empty().append('失败');
                  }
               	  $('#onecreatetimeid').empty().append(row.createtime);
               	  $('#onesubjectid').empty().append(row.subject);
               	  $('#onecontentid').empty().append(row.content);
               	  $('#onefilesid').empty().append(row.files);               	  
               	  $('#scanmessage').window('open');
                 }else{
               	  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
              id:'messagebtnadd',
              text:'发送邮件',
              iconCls:'icon-add',
              handler:function(){
                 location.href = "<c:url value='/email/gotoaddemail'/>";
              } 
             }]
	});
	$('#emailtable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');

});
	
	function serach(){
	$('#emailtable').datagrid('loadData',{total:0,rows:[],footer:[]});
		var mailaddress = $("#mailaddressid").val();
	    var state = $("#stateid").combobox("getValue");
		var sdate = $('#startdate').datebox('getValue');
		var edate = $('#enddate').datebox('getValue');
		if(edate == "" || sdate == ""){
			$.messager.alert('警告','请输入查询日期!','warning');
			return false;
		}
		$('#emailtable').datagrid('load',{'mailaddress':mailaddress,'state':state,'begindate':sdate,'enddate':edate});
	}

	</script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr><td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 70px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
		<td>邮箱地址:<input id="mailaddressid" name="title" type="text" size="10" editable="false"/></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 170px" data-options="panelHeight:'auto'">
						<option value="">全部</option>
						<option value="0">成功</option>
					    <option value="1">失败</option>				
		              </select></td>
		<td>起始日期:<input id="startdate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>结束日期:<input id="enddate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="emailtable" class="easyui-datagrid" data-options="url:'<c:url value="/email/getemailList"/>',queryParams:{'begindate':formatMonth(-3),'enddate':formatDay(0)},title: '邮件列表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true,showFooter:true">
		<thead>
			<tr>
				<th data-options="field:'mailaddress',width:35,halign:'center'">邮箱地址</th>
				<th data-options="field:'content',width:90,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      //if(value.length > 30){
				         //return value.substring(0,30)+'...';
				     // }
				   }
				   return value;
				}">邮件内容</th>
				<th data-options="field:'subject',width:35,halign:'center'">邮件主题</th>
			    <th data-options="field:'files',width:35,halign:'center'">附件</th>
				<th data-options="field:'createtime',width:55,halign:'center'">发送时间</th>
				<th data-options="field:'state',width:55,halign:'center',formatter:function(value,row,index){
                   if(value == 0){
                     return '成功';               
                   }else {
                     return '失败';
                   }
                }">状态</th>
			
			</tr>
		</thead>
	</table>
	
	<!-- 查看短信详情 -->
	<div id="scanmessage" class="easyui-window" data-options="title:'短信内容',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="oneverifytable" width="100%" cellpadding="5" cellspacing="1">
				<tr><td width="25%">邮箱地址:</td><td id="onemailaddressid"></td><td width="25%">发送时间:</td><td id="onecreatetimeid"></td></tr>
				<tr><td width="25%">状态:</td><td id="onestateid"></td><td width="25%">邮件主题:</td><td id="onesubjectid"></td></tr>
		        <tr><td width="25%">附件:</td><td id="onefilesid"></td></tr>
				<tr><td id="onecontentid" colspan="4"></td></tr>
				</table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanmessage').window('close');">关闭</a>
			</div>
		</div>
	</div>
	
	
  </body>
</html>
