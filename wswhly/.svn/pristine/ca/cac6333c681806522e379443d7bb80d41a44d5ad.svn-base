<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>活动报名管理</title>
    
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

TD {
	FONT: 12px 微软雅黑
}
</style>
<script type="text/javascript">
$(function(){
	$('#scanbm').window('close');
	$('#addbmdiv').window('close');
	$('#updbmdiv').window('close');
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

	$('#bmtable').datagrid({
        toolbar:[{
           id:'votebmbtnscan',
           text:'报名活动详情',
           iconCls:'icon-search',
           handler:function(){
               var row = $('#bmtable').datagrid('getSelected');
               if(row){
            	  $('#onetitleid').empty().append(row.title);
              	  $('#onecycleid').empty().append('第'+row.cycle+'期');
              	  if (row.type == 2) {
	              	  $('#oneactivityid').empty().append('我要上华豫');
                  } else if (row.type == 3) {
	              	  $('#oneactivityid').empty().append('藏品征集令');
                  }
              	  $('#onebegindateid').empty().append(row.begindate);
              	  $('#oneenddateid').empty().append(row.enddate);
               	  $('#onecontentid').empty().append(row.content);
               	  $('#scanbm').window('open');
               }else{
                  $.messager.alert('警告','请选择一条信息','warning');
               }
           }
        },{
           id:'votebmbtnadd',
           text:'添加活动',
           iconCls:'icon-add',
           handler:function(){
        	   document.getElementById("addbmform").reset();
			   $('#addbmdiv').window('open');
           }
        },{
           id:'votebmbtnupd',
           text:'修改活动',
           iconCls:'icon-edit',
           handler:function(){
        	   var row = $('#bmtable').datagrid('getSelected');
               if(row){
            	  $('#editenrollid').val(row.id);
           	      $('#editcycleid').val(row.cycle);
           	      $('#edittitleid').val(row.title);
           	      $('#editbegindateid').datetimebox('setValue',row.begindate);
           	      $('#editenddateid').datetimebox('setValue',row.enddate);
           	      if (row.type == 2) {
           	    	$('#edittypeid').empty().append('我要上华豫');
               	  } else if (row.type == 3) {
           	    	$('#edittypeid').empty().append('藏品征集令');
                  }
           	      $('#editcontentid').val(row.content);
           	      $('#updbmdiv').window('open');
               }else{
                  $.messager.alert('警告','请选择一条信息','warning');
               }
           }
        },{
           id:'votebmbtndel',
           text:'开启/关闭活动',
           iconCls:'icon-cancel',
           handler:function(){
        	   var row = $('#bmtable').datagrid('getSelected');
               if(row){
            	   if (row.state == 1){
          		      $.messager.confirm('提示', '确定要关闭此活动吗？', function(r){
  	           		     if (r){
  	           		    	delbm(row.id,2);
  	           		     }
  	           		  });
	                } else {
	           		  $.messager.confirm('提示', '确定要开启此活动吗？', function(r){
	           		     if (r){
	           		    	delbm(row.id,1);
	           		     }
	           		  });
		            }
               }else{
                  $.messager.alert('警告','请选择一条信息','warning');
               }
           }
        },{
        	id:'voteactivitybtnadd',
            text:'添加藏品',
            iconCls:'icon-add',
            handler:function(){
        	   var row = $('#bmtable').datagrid('getSelected');
        	   if(row){
	        	   if (row.state == 2){
		          		  $.messager.alert('警告','该活动已关闭','warning');
	               } else {
						  location.href = "<c:url value='/vote/gotoAddVoteCollection'/>?type="+row.type+"&issue="+row.cycle;
		           }
               }else{
                  $.messager.alert('警告','请选择一条活动信息','warning');
               }
            } 
        }]
	});
	$('#bmtable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');
});

function serach(){
	$('#bmtable').datagrid('loadData',{total:0,rows:[]});
	var cycle = $("#cycleid").val();
	var title = $("#titleid").val();
	var type = $("#typeid").combobox("getValue");
	var state = $("#stateid").combobox("getValue");
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#bmtable').datagrid('load',{'cycle':cycle,'title':title,'type':type,'state':state,'begindate':sdate,'enddate':edate});
}

function addbmform() {
	$('#addbmform').form('submit', {
		url: "<c:url value='/vote/addActivityBm'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "添加成功！", 'info', function(){
					document.getElementById("addbmform").reset();
					$('#bmtable').datagrid('reload');
					$('#addbmdiv').window('close');
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}

function updbmform() {
	$('#updbmform').form('submit', {
		url: "<c:url value='/vote/updActivityBm'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "修改成功！", 'info', function(){
					document.getElementById("updbmform").reset();
					$('#bmtable').datagrid('reload');
					$('#updbmdiv').window('close');
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}

function delbm(id,state) {
	$.ajax({
        type:'post',
        url:'<c:url value="/vote/delActivityBm"/>',
        data:'id='+id+'&state='+state,
        success:function(data){
           if(data == '0000'){
          	 $.messager.alert('提示', "操作成功！", 'info',function(){
					$('#bmtable').datagrid('reload');
               });
           }else{
          	 $.messager.alert('提示', data, 'warning',function(){
					$('#bmtable').datagrid('reload');
               });
           }
        }
     });
}
</script>
  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr>
		<td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 70px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
		<td>活动期数:<input id="cycleid" name="title" type="text" size="10" editable="false"/></td>
		<td>活动名称:<input id="titleid" name="title" type="text" size="10" editable="false"/></td>
		<td>活动类型:<select id="typeid" name="type" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="2">我要上华豫</option>
						<option value="3">藏品征集令</option>
		              </select></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">开启</option>
						<option value="2">关闭</option>
		              </select></td>
		<td>起始日期:<input id="startdate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>结束日期:<input id="enddate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="bmtable" class="easyui-datagrid" data-options="url:'<c:url value="/vote/getActivityBmList"/>',queryParams:{'begindate':formatMonth(-3),'enddate':formatDay(0)},title: '活动管理',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'cycle',width:30,halign:'center'">活动期数</th>
				<th data-options="field:'title',width:30,halign:'center'">活动名称</th>
				<th data-options="field:'content',width:30,halign:'center',formatter:function(value,row,index){
				   return '查看详情';
				}">活动介绍</th>
				<th data-options="field:'begindate',width:50,halign:'center'">起始日期</th>
				<th data-options="field:'enddate',width:50,halign:'center'">结束日期</th>
				<th data-options="field:'createdate',width:50,halign:'center'">创建日期</th>
				<th data-options="field:'type',width:40,halign:'center',formatter:function(value,row,index){
				   if (value == '2') {
				      return '我要上华豫';
				   } else if (value == '3'){
				      return '藏品征集令';
				   }
				   return value;
				}">活动类型</th>
				<th data-options="field:'state',width:15,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '开启';
                   }else{
                     return '关闭';
                   }
                }">状态</th>
			</tr>
		</thead>
	</table>
	
	<!-- 查看报名活动 -->
	<div id="scanbm" class="easyui-window" data-options="title:'报名详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="oneverifytable" width="100%" cellpadding="5" cellspacing="1">
				<tr><td id="onetitleid" colspan="4" style="font-weight: bold;" align="center"></td></tr>
				<tr><td width="25%">报名期数:</td><td id="onecycleid"></td><td width="25%">活动标题:</td><td id="oneactivityid"></td></tr>
				<tr><td width="25%">起始日期:</td><td id="onebegindateid"></td><td width="25%">结束日期:</td><td id="oneenddateid"></td></tr>
				<tr><td id="onecontentid" colspan="4"></td></tr>
				</table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanbm').window('close');">关闭</a>
			</div>
		</div>
	</div>
	
	<!-- 添加活动 -->
	<div id="addbmdiv" class="easyui-window" data-options="title:'添加活动',iconCls:'icon-add',modal:true" style="width:500px;height:400px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="addbmform" method="post">
				<table style="line-height: 30px;">
				<tr><td>期数:</td><td><input name="cycle" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>标题:</td><td><input name="title" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>起始日期:</td><td><input name="begindate" class="easyui-datetimebox" type="text" data-options="required:true"></td></tr>
				<tr><td>结束日期:</td><td><input name="enddate" class="easyui-datetimebox" type="text" data-options="required:true"></td></tr>
				<tr><td>活动类型:</td>
				<td>
				<select name="type" class="easyui-combobox" editable="false" style="width: 140px" data-options="panelHeight:'auto'">
					<option value="2">我要上华豫</option>
					<option value="3">藏品征集令</option>
		        </select>
				</td></tr>
				<tr><td>活动内容:</td><td>
				<textarea name="content" style="width:200px; height: 60px"></textarea>
				</td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="addbmform();">添加</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#addbmdiv').window('close');">取消</a>
			</div>
		</div>
	</div>
	
	<!-- 修改活动 -->
	<div id="updbmdiv" class="easyui-window" data-options="title:'修改活动',iconCls:'icon-edit',modal:true" style="width:500px;height:400px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="updbmform" method="post">
				<input type="hidden" id="editenrollid" name="id"/>
				<table style="line-height: 30px;">
				<tr><td>期数:</td><td><input id="editcycleid" name="cycle" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>标题:</td><td><input id="edittitleid" name="title" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>起始日期:</td><td><input id="editbegindateid" name="begindate" class="easyui-datetimebox" type="text" data-options="required:true"></td></tr>
				<tr><td>结束日期:</td><td><input id="editenddateid" name="enddate" class="easyui-datetimebox" type="text" data-options="required:true"></td></tr>
				<tr><td>活动类型:</td>
				<td>
				<span id="edittypeid"></span>
				</td></tr>
				<tr><td>活动内容:</td><td>
				<textarea id="editcontentid" name="content" style="width:200px; height: 60px"></textarea>
				</td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="updbmform();">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#updbmdiv').window('close');">取消</a>
			</div>
		</div>
	</div>
  </body>
</html>
