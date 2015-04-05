<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>拍卖会信息管理</title>
    
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
#oneycactiontable {border-right:1px solid blue;border-bottom:1px solid blue}
#oneycactiontable td{border-left:1px solid blue;border-top:1px solid blue}
</style>

<script type="text/javascript">

$(function(){
	
	$('#addycaction').window('close');
	$('#editycaction').window('close');
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

	$('#ycactiontable').datagrid({
        toolbar:[{
            id:'ycactionbtnadd',
            text:'添加拍卖会',
            iconCls:'icon-add',
            handler:function(){
			   location.href = "<c:url value='/ycaction/gotoaddycaction'/>";
            } 
           } ]
		});
});

function serach(){
	$('#ycactiontable').datagrid('loadData',{total:0,rows:[]});	
	var auctionname = $("#auctionnameid").val();
	var state = $("#stateid").combobox("getValue");
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#ycactiontable').datagrid('load',{'auctionname':auctionname,'state':state,'begindate':sdate,'enddate':edate});
}





</script>

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr><td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
		<td>拍卖会名称:<input id="auctionnameid" name="auctionname" type="text" size="8" editable="false"/></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">预展</option>
						<option value="2">结束</option>
		              </select></td>
		<td>从:<input id="startdate" type="text" size="9" class="easyui-datebox" editable="false"/></td>
		<td>到:<input id="enddate" type="text" size="9" class="easyui-datebox" editable="false"/></td>

		<td><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="ycactiontable" class="easyui-datagrid" data-options="url:'<c:url value="/ycaction/getycactionlist"/>',queryParams:{'userid':'${comprehensiveid}','begindate':formatMonth(-3),'enddate':formatDay(0)},title: '藏品管理',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'auctionname',width:30,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length >20){
				         return value.substring(0,20)+'...';
				      }
				   }
				   return value;
				}">拍卖会名称</th>				
				<th data-options="field:'as_name',width:30,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 20){
				         return value.substring(0,20)+'...';
				      }
				   }
				   return value;
				}">所属拍卖机构</th>
				<th data-options="field:'actiontime',width:30,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 20){
				         return value.substring(0,20)+'...';
				      }
				   }
				   return value;
				}">拍卖会时间</th>
				<th data-options="field:'place',width:50,halign:'center'">地点</th>
				<th data-options="field:'specialnumber',width:30,halign:'center'">专场总数</th>
				<th data-options="field:'totalnumber',width:30,halign:'center'">拍品总数</th>
				<th data-options="field:'state',width:25,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '预展';
                   }else if(value == 2){
                     return '结束';
                   }
                }">状态</th>

				<th data-options="field:'previewtime',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 20){
				         return value.substring(0,20)+'...';
				      }
				   }
				   return value;
				}">预展时间</th>
				<th data-options="field:'previewaddress',width:50,halign:'center'">预展地点</th>

			</tr>
		</thead>
	</table>
	
	 <jsp:include page="../incloudUser.jsp"/>
  </body>
  
</html>
