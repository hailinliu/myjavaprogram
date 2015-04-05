<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>观摩预约</title>
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
	$('#addserve').window('close');
	$('#editserve').window('close');
	$('#scanserve').window('close');
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

	
function serach(){
	$('#servetable').datagrid('loadData',{total:0,rows:[],footer:[]});
	var username = $('#nameid').val();
	var usermobile = $('#usermobile').val();
    //var state = $('#stateid').combobox('getValue');
	//if(edate == "" || sdate == ""){
		//$.messager.alert('警告','请输入查询日期!','warning');
		///return false;
	//}
	$('#servetable').datagrid('load',{'username':username,'usermobile':usermobile});
}






	</script>

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr><!--td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'"><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td-->
		<td>用户名称:<input id="nameid" name="username" type="text" size="8" editable="false"/></td>
		<td>电话号码:<input id="usermobile" name="usermobile" type="text" size="8" editable="false"/></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="servetable" class="easyui-datagrid" data-options="url:'<c:url value="/serve/getServeLookList"/>',queryParams:{'begindate':formatMonth(-3),'enddate':formatDay(0)},title: '观摩预约列表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true,showFooter:true">
		<thead>
			<tr>
				<th data-options="field:'username',width:35,halign:'center'">登陆名称</th>
				<th data-options="field:'realname',width:35,halign:'center'">真实名称</th>
					<th data-options="field:'mobile',width:15,halign:'center'">电话号码</th>
				<th data-options="field:'collectionname',width:35,halign:'center'">藏品名称</th>
				<th data-options="field:'serialnum',width:35,halign:'center'">藏品编号</th>
				<th data-options="field:'collectiontime',width:35,halign:'center'">预约时间</th>
			
			</tr>
		</thead>
	</table>
	
	<!-- 查看服务活动 -->
	<!-- div id="scanserve" class="easyui-window" data-options="title:'服务详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="oneverifytable" width="100%" cellpadding="5" cellspacing="1">
				<tr><td id="onetitleid" colspan="4" style="font-weight: bold;" align="center"></td></tr>
				<tr><td width="25%">服务时段:</td><td id="onecreatedateid"></td><td width="25%">价格:</td><td id="onepriceid"></td></tr>
				<tr><td width="25%">购买人数:</td><td id="onenumid"></td><td width="25%">状态:</td><td id="onestateid"></td></tr>
				<tr><td id="onecontentid" colspan="4"></td></tr>
				</table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanserve').window('close');">关闭</a>
			</div>
		</div>
	</div>
	
	<!-- 添加服务 -->
	<!-- div id="addserve" class="easyui-window" data-options="title:'添加服务',iconCls:'icon-add',modal:true" style="width:500px;height:400px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="addserveform" method="post">
				<table style="line-height: 30px;">
				<tr><td>服务名称:</td><td><input name="name" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>价格:</td><td><input name="price" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>服务时段:</td><td><input name="period" class="easyui-validatebox" type="text"></td></tr>
				<tr><td>备注:</td><td>
				<textarea name="memo" style="width:200px; height: 60px"></textarea>
				</td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submitserveform();">添加</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#addserve').window('close');">取消</a>
			</div>
		</div>
	</div>
	
	<!-- 修改服务 -->
	<!--div id="editserve" class="easyui-window" data-options="title:'修改服务',iconCls:'icon-edit',modal:true" style="width:500px;height:400px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="editserveform" method="post">
				<input type="hidden" id="editserveid" name="id"/>
				<table style="line-height: 30px;">
				<tr><td>服务名称:</td><td><input id="editnameid" name="name" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>价格:</td><td><input id="editpriceid" name="price" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>服务时段:</td><td><input id="editperiodid" name="period" class="easyui-validatebox" type="text"></td></tr>
				<tr><td>备注:</td><td>
				<textarea id="editmemoid" name="memo" style="width:200px; height: 60px"></textarea>
				</td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="editform();">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#editserve').window('close');">取消</a>
			</div>
		</div>
	</div-->
	
  </body>
</html>
