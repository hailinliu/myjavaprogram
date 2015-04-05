<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>报名信息管理</title>
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
	$('#scanenrollcollection').window('close');
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

	$('#enrollinfotable').datagrid({
          toolbar:[{
				 id:'collectionusbtnscan',
                 text:'用户详情',
                 iconCls:'icon-search',
				handler:function(){
				var row = $('#enrollinfotable').datagrid('getSelected');
				if(row){
				getuserinfo(row.userid);
				}else{
				$.messager.alert('警告', "请先选择用户！", 'warning');
				}
				
			    }
			},{
              id:'enrollinfoinfobtnscan',
              text:'查看报名藏品信息',
              iconCls:'icon-search',
              handler:function(){
	        	  var row = $('#enrollinfotable').datagrid('getSelected');
	        	  if (row) {
	       	      	$('#collectiontable').datagrid({
					    url:"<c:url value='/enroll/getCollectionsByBmid'/>?bmid="+row.id,
					    title:'报名报名藏品',
					    fitColumns:true,
					    rownumbers:true,
					    striped:true,
					    singleSelect:true,
					    columns:[[
					        {field:'name',title:'藏品名称',width:50},
					        {field:'uploaddate',title:'上传时间',width:50},
					        {field:'username',title:'上传者',width:50}
					    ]],
			            pagination:true
					});
					$("#scanenrollcollection").window("open");
	        	  } else {
	        		$.messager.alert('警告','请选择一条报名记录','warning');
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
                   return "<table width='97%'><tr><td align='left'>用户名：" + row.username + "</td><td align='right'>手机号：" + row.mobile + "</td></tr></table>";
                   //return  row.name;
               }, 
               formatMatch: function(row, i, max){ 
                    return row.username;
               } ,

               formatResult: function(row, i, max) {
                    return row.username;
               }                 
            });
	
	//$('#enrollinfotable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');

});
	
function serach(){
	$('#enrollinfotable').datagrid('loadData',{total:0,rows:[],footer:[]});
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	var username = $("#usernameid").val();
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#enrollinfotable').datagrid('load',{'username':username,'enrollid':'${enrollid}','begindate':sdate,'enddate':edate});
}

function exportExcel() {
	window.open('<c:url value="/enroll/exportExcel"/>?enrollid=${enrollid}&begindate='+$("#startdate").datebox('getValue')+'&enddate='+$("#enddate").datebox('getValue')+'&username='+$('#usernameid').val());
}

	</script>

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr>
		<td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
		<td>报名用户:<input id="usernameid" name="username" type="text" size="20" editable="false"/></td>
		<td>报名日期从:<input id="startdate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>到:<input id="enddate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>
		<td><a href="javascript:exportExcel()" class="easyui-linkbutton" iconCls="icon-redo">导出Excel</a></td>
		</tr>
	</table>
    <table id="enrollinfotable" class="easyui-datagrid" data-options="url:'<c:url value="/enroll/getEnrollInfoList?enrollid=${enrollid}"/>',queryParams:{'begindate':formatMonth(-3),'enddate':formatDay(0)},title: '报名列表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true,showFooter:true">
		<thead>
			<tr>
				<th data-options="field:'username',width:35,halign:'center'">用户名</th>
				<th data-options="field:'level',width:35,halign:'center'">会员级别</th>
				<th data-options="field:'mobile',width:35,halign:'center'">电话号码</th>				
				<th data-options="field:'ordernum',width:35,halign:'center'">报名订单号</th>
				<th data-options="field:'collectionnum',width:35,halign:'center'">报名藏品数</th>
				<th data-options="field:'code',width:35,halign:'center'">报名编号</th>
				<th data-options="field:'createdate',width:35,halign:'center'">报名时间</th>
				<th data-options="field:'validdate',width:35,halign:'center'">鉴定时间</th>
			</tr>
		</thead>
	</table>
	
	<a class="easyui-linkbutton" style="float: right" data-options="iconCls:'icon-redo'" href="javascript:void(0)" onclick="history.go(-1);">返回</a>
	
	<!-- 查看报名藏品 -->
	<div id="scanenrollcollection" class="easyui-window" data-options="title:'用户报名藏品',iconCls:'icon-search',modal:true" style="width:500px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="collectiontable" width="100%" cellpadding="5" cellspacing="1">
				</table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanenrollcollection').window('close');">关闭</a>
			</div>
		</div>
	</div>
		 <jsp:include page="../incloudUser.jsp"/>
  </body>
</html>
