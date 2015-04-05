<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>服务管理</title>
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

	$('#servetable').datagrid({
          toolbar:[{
              id:'servebtnscan',
              text:'查看服务内容',
              iconCls:'icon-search',
              handler:function(){
                 var row = $('#servetable').datagrid('getSelected');
                 if(row){
                	 $('#onetitleid').empty().append(row.name);
                 	 $('#onecreatedateid').empty().append(row.period);
                 	 $('#onepriceid').empty().append('￥'+row.price);
                 	 $('#onenumid').empty().append(row.countnum);
                 	 $('#onestateid').empty().append(row.enddate);
                 	 if (row.enddate == 1) {
                 		$('#onestateid').empty().append('开启');
                     } else {
                 		$('#onestateid').empty().append('关闭');
                     }
                  	 $('#onecontentid').empty().append(row.memo);
                  	 $('#scanserve').window('open');
                 }else{
               	  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
              id:'servebtnadd',
              text:'添加服务',
              iconCls:'icon-add',
              handler:function(){
            	 document.getElementById("addserveform").reset();
  			     $('#addserve').window('open');
              } 
             },{
              id:'servebtnedit',
              text:'修改服务',
              iconCls:'icon-edit',
              handler:function(){
           	  var row = $('#servetable').datagrid('getSelected');
           	  if(row){
           		    if (row.state == 2){
   	          		  $.messager.alert('警告','该信息已关闭','warning');
   	                } else {
               	      $('#editserveid').val(row.id);
               	      $('#editnameid').val(row.name);
               	      $('#editpriceid').val(row.price);
               	      $('#editperiodid').val(row.period);
               	      $('#editmemoid').val(row.memo);
               	      $('#editserve').window('open');
   		            }
                 }else{
               	  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
              id:'servebtnquery',
              text:'购买服务信息',
              iconCls:'icon-redo',
              handler:function(){
            	 var row = $('#servetable').datagrid('getSelected');
              	  if(row){
              		if (row.state == 2){
   	          		  $.messager.alert('警告','该信息已关闭','warning');
   	                } else {
   	                  location.href = "<c:url value='/serve/gotoserveInfoList'/>?id="+row.id;
   		            }
              	  }else{
              		  $.messager.alert('警告','请选择一条信息','warning');
                  }
              }
             },{
              id:'servebtndel',
              text:'开启/关闭',
              iconCls:'icon-cancel',
              handler:function(){
           	  var row = $('#servetable').datagrid('getSelected');
           	  if(row){
           		    if (row.state == 1){
           		    	$.messager.confirm('提示', '确定要关闭此信息吗？', function(r){
   	           		     if (r){
   	           		       delserve(row.id,2);
   	           		     }
   	           		  });
	                } else {
	           		  $.messager.confirm('提示', '确定要开启此信息吗？', function(r){
	           		     if (r){
	           		       delserve(row.id,1);
	           		     }
	           		  });
		            }
           	  }else{
           		  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             }]
	});
	$('#servetable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');

});
	
function serach(){
	$('#servetable').datagrid('loadData',{total:0,rows:[],footer:[]});
	var name = $('#nameid').val();
    var state = $('#stateid').combobox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#servetable').datagrid('load',{'name':name,'state':state});
}

function submitserveform() {
	$('#addserveform').form('submit', {
		url: "<c:url value='/serve/addServe'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "添加成功！", 'info', function(){
					document.getElementById("addserveform").reset();
					$('#servetable').datagrid('reload');
					$('#addserve').window('close');
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}

function editform(){
	$('#editserveform').form('submit', {
		url: "<c:url value='/serve/editServe'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "修改成功！", 'info', function(){
					document.getElementById("editserveform").reset();
					$('#servetable').datagrid('reload');
					$('#editserve').window('close');
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}

function delserve(id,state){
      $.ajax({
         type:'post',
         url:'<c:url value="/serve/onOrOffServe"/>',
         data:'id='+id+'&state='+state,
         success:function(data){
            if(data == '0000'){
           	 $.messager.alert('提示', "操作成功！", 'info',function(){
					$('#servetable').datagrid('reload');
                });
            }else{
           	 $.messager.alert('提示', data, 'warning',function(){
 					$('#servetable').datagrid('reload');
                });
            }
         }
      });
}

	</script>

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr><td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
		<td>服务名称:<input id="nameid" name="name" type="text" size="8" editable="false"/></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 70px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">开启</option>
						<option value="2">关闭</option>
		              </select></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="servetable" class="easyui-datagrid" data-options="url:'<c:url value="/serve/getServeList"/>',queryParams:{'begindate':formatMonth(-3),'enddate':formatDay(0)},title: '服务列表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true,showFooter:true">
		<thead>
			<tr>
				<th data-options="field:'name',width:35,halign:'center'">服务名称</th>
				<th align="right" data-options="field:'price',width:35,halign:'center',formatter:function(value,row,index){
				   if(!isNaN(value)){
				         return '￥'+value.toFixed(2);
				   }
				   return value;
				}">价格</th>
				<th data-options="field:'period',width:35,halign:'center'">服务时段</th>
				<th data-options="field:'countnum',width:35,halign:'center'">购买人数</th>
				<th data-options="field:'memo',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 12){
				         return value.substring(0,12)+'...';
				      }
				   }
				   return value;
				}">备注</th>
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
	
	<!-- 查看服务活动 -->
	<div id="scanserve" class="easyui-window" data-options="title:'服务详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
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
	<div id="addserve" class="easyui-window" data-options="title:'添加服务',iconCls:'icon-add',modal:true" style="width:500px;height:400px;padding:5px;background: #fafafa;overflow:auto;">
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
	<div id="editserve" class="easyui-window" data-options="title:'修改服务',iconCls:'icon-edit',modal:true" style="width:500px;height:400px;padding:5px;background: #fafafa;overflow:auto;">
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
	</div>
	
  </body>
</html>
