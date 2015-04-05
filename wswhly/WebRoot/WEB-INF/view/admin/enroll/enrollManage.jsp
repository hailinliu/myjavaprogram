<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>报名管理</title>
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
	$('#addenroll').window('close');
	$('#editenroll').window('close');
	$('#scanenroll').window('close');
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

	$('#enrolltable').datagrid({
          toolbar:[{
              id:'enrollbtnscan',
              text:'查看报名内容',
              iconCls:'icon-search',
              handler:function(){
                 var row = $('#enrolltable').datagrid('getSelected');
                 if(row){
                	 $('#onetitleid').empty().append(row.title);
                 	  $('#onecycleid').empty().append('第'+row.cycle+'期');
                 	  $('#onevaliddateid').empty().append(row.validdate);
                 	 $('#onebegindateid').empty().append(row.begindate);
                 	 $('#oneenddateid').empty().append(row.enddate);
                  	 $('#onecontentid').empty().append(row.content);
                  	 $('#scanenroll').window('open');
                 }else{
               	  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
              id:'enrollbtnadd',
              text:'添加报名',
              iconCls:'icon-add',
              handler:function(){
            	 document.getElementById("addenrollform").reset();
  			     $('#addenroll').window('open');
              } 
             },{
              id:'enrollbtnedit',
              text:'修改报名',
              iconCls:'icon-edit',
              handler:function(){
           	  var row = $('#enrolltable').datagrid('getSelected');
           	  if(row){
           		    if (row.state == 2){
   	          		  $.messager.alert('警告','该信息已关闭','warning');
   	                } else {
               	      $('#editenrollid').val(row.id);
               	      $('#editcycleid').val(row.cycle);
               	      $('#edittitleid').val(row.title);
               	      $('#editbegindateid').datetimebox('setValue',row.begindate);
               	      $('#editenddateid').datetimebox('setValue',row.enddate);
               	      $('#editvaliddateid').datetimebox('setValue',row.validdate);
               	      $('#editcontentid').val(row.content);
               	      $('#editenroll').window('open');
   		            }
                 }else{
               	  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
              id:'enrollbtnquery',
              text:'报名情况',
              iconCls:'icon-redo',
              handler:function(){
            	 var row = $('#enrolltable').datagrid('getSelected');
              	  if(row){            	
   	                  location.href = "<c:url value='/enroll/gotoEnrollInfoList'/>?id="+row.id;   		           
              	  }else{
              		  $.messager.alert('警告','请选择一条信息','warning');
                  }
              }
             },{
              id:'enrollbtnquery',
              text:'报名统计',
              iconCls:'icon-redo',
              handler:function(){
            	 var row = $('#enrolltable').datagrid('getSelected');
              	  if(row){       
   	                 window.open('<c:url value="redirect?p=admin/index"/>');  		        
              	  }else{
              		  $.messager.alert('警告','请选择一条信息','warning');
                  }
              }
             },{
              id:'enrollbtndel',
              text:'开启/关闭',
              iconCls:'icon-cancel',
              handler:function(){
           	  var row = $('#enrolltable').datagrid('getSelected');
           	  if(row){
           		    if (row.state == 1){
           		    	$.messager.confirm('提示', '确定要关闭此信息吗？', function(r){
   	           		     if (r){
   	           		       delenroll(row.id,2);
   	           		     }
   	           		  });
	                } else {
	           		  $.messager.confirm('提示', '确定要开启此信息吗？', function(r){
	           		     if (r){
	           		       delenroll(row.id,1);
	           		     }
	           		  });
		            }
           	  }else{
           		  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             }]
	});
	$('#enrolltable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');

});
	
function serach(){
	$('#enrolltable').datagrid('loadData',{total:0,rows:[],footer:[]});
    var state = $("#stateid").combobox("getValue");
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#enrolltable').datagrid('load',{'state':state,'begindate':sdate,'enddate':edate});
}

function submitenrollform() {
	$('#addenrollform').form('submit', {
		url: "<c:url value='/enroll/addEnroll'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "添加成功！", 'info', function(){
					document.getElementById("addenrollform").reset();
					$('#enrolltable').datagrid('reload');
					$('#addenroll').window('close');
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}

function editform(){
	$('#editenrollform').form('submit', {
		url: "<c:url value='/enroll/editEnroll'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "修改成功！", 'info', function(){
					document.getElementById("editenrollform").reset();
					$('#enrolltable').datagrid('reload');
					$('#editenroll').window('close');
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}

function delenroll(id,state){
      $.ajax({
         type:'post',
         url:'<c:url value="/enroll/onOrOffEnroll"/>',
         data:'id='+id+'&state='+state,
         success:function(data){
            if(data == '0000'){
           	 $.messager.alert('提示', "操作成功！", 'info',function(){
					$('#enrolltable').datagrid('reload');
                });
            }else{
           	 $.messager.alert('提示', data, 'warning',function(){
 					$('#enrolltable').datagrid('reload');
                });
            }
         }
      });
}

	</script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr><td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 70px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">正常</option>
						<option value="2">删除</option>
		              </select></td>
		<td>创建日期从:<input id="startdate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>到:<input id="enddate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="enrolltable" class="easyui-datagrid" data-options="url:'<c:url value="/enroll/getEnrollList"/>',queryParams:{'begindate':formatMonth(-3),'enddate':formatDay(0)},title: '报名列表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true,showFooter:true">
		<thead>
			<tr>
				<th data-options="field:'cycle',width:35,halign:'center'">报名期数</th>
				<th data-options="field:'title',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 12){
				         return value.substring(0,12)+'...';
				      }
				   }
				   return value;
				}">报名标题</th>
				<th data-options="field:'begindate',width:35,halign:'center'">起始日期</th>
				<th data-options="field:'enddate',width:35,halign:'center'">结束日期</th>
				<th data-options="field:'validdate',width:35,halign:'center'">鉴定日期</th>
				<th data-options="field:'content',width:35,halign:'center',formatter:function(value,row,index){
				   return '查看详情';
				}">报名活动内容</th>
				<th data-options="field:'createdate',width:35,halign:'center'">创建日期</th>
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
	<div id="scanenroll" class="easyui-window" data-options="title:'报名详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="oneverifytable" width="100%" cellpadding="5" cellspacing="1">
				<tr><td id="onetitleid" colspan="4" style="font-weight: bold;" align="center"></td></tr>
				<tr><td width="25%">报名期数:</td><td id="onecycleid"></td><td width="25%">鉴定日期:</td><td id="onevaliddateid"></td></tr>
				<tr><td width="25%">起始日期:</td><td id="onebegindateid"></td><td width="25%">结束日期:</td><td id="oneenddateid"></td></tr>
				<tr><td id="onecontentid" colspan="4"></td></tr>
				</table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanenroll').window('close');">关闭</a>
			</div>
		</div>
	</div>
	
	<!-- 添加报名 -->
	<div id="addenroll" class="easyui-window" data-options="title:'添加报名',iconCls:'icon-add',modal:true" style="width:500px;height:400px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="addenrollform" method="post">
				<table style="line-height: 30px;">
				<tr><td>报名期数:</td><td><input name="cycle" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>报名标题:</td><td><input name="title" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>起始日期:</td><td><input name="begindate" class="easyui-datetimebox" type="text" data-options="required:true"></td></tr>
				<tr><td>结束日期:</td><td><input name="enddate" class="easyui-datetimebox" type="text" data-options="required:true"></td></tr>
				<tr><td>鉴定日期:</td><td><input name="validdate" class="easyui-datetimebox" type="text" data-options="required:true"></td></tr>
				<tr><td>报名活动内容:</td><td>
				<textarea name="content" style="width:200px; height: 60px"></textarea>
				</td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submitenrollform();">添加</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#addenroll').window('close');">取消</a>
			</div>
		</div>
	</div>
	
	<!-- 修改报名 -->
	<div id="editenroll" class="easyui-window" data-options="title:'修改报名',iconCls:'icon-edit',modal:true" style="width:500px;height:400px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="editenrollform" method="post">
				<input type="hidden" id="editenrollid" name="id"/>
				<table style="line-height: 30px;">
				<tr><td>报名期数:</td><td><input id="editcycleid" name="cycle" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>报名标题:</td><td><input id="edittitleid" name="title" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>起始日期:</td><td><input id="editbegindateid" name="begindate" class="easyui-datetimebox" type="text" data-options="required:true"></td></tr>
				<tr><td>结束日期:</td><td><input id="editenddateid" name="enddate" class="easyui-datetimebox" type="text" data-options="required:true"></td></tr>
				<tr><td>鉴定日期:</td><td><input id="editvaliddateid" name="validdate" class="easyui-datetimebox" type="text" data-options="required:true"></td></tr>
				<tr><td>报名活动内容:</td><td>
				<textarea id="editcontentid" name="content" style="width:200px; height: 60px"></textarea>
				</td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="editform();">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#editenroll').window('close');">取消</a>
			</div>
		</div>
	</div>
	
  </body>
</html>
