<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>广告位管理</title>
    
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
#oneadImagetable {border-right:1px solid blue;border-bottom:1px solid blue}
#oneadImagetable td{border-left:1px solid blue;border-top:1px solid blue}
</style>

<script type="text/javascript">

$(function(){
	$('#scanadImage').window('close');

	$('#adImagetable').datagrid({
        toolbar:[{
            id:'adImagebtnscan',
            text:'广告详情',
            iconCls:'icon-search',
            handler:function(){
               var row = $('#adImagetable').datagrid('getSelected');
               if(row){
             	  $('#adnameid').empty().append(row.name);
             	  $('#adurlid').empty().append(row.url);
             	  $('#adimgurlid').empty().append('<img src="<c:url value="/ad/'+row.imgname+'"/>" style="width: 3.3cm; height: 4.8cm"/>');
             	  $('#scanadImage').window('open');
               }else{
             	  $.messager.alert('警告','请选择一条信息','warning');
               }
            }
           },{
            id:'adImagebtnadd',
            text:'添加广告内容',
            iconCls:'icon-add',
            handler:function(){
        	   location.href = "<c:url value='/ad/gotoAddImage'/>";
            } 
           },{
            id:'adImagebtnedit',
            text:'修改广告内容',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#adImagetable').datagrid('getSelected');
         	  if(row){
                  location.href = "<c:url value='/ad/gotoEditImage'/>?id="+row.id;
               }else{
             	  $.messager.alert('警告','请选择一条信息','warning');
               }
            }
           }]
		});
	$('#adImagetable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');

$('#adImagenameid').autocomplete('<c:url value="/adImage/autoname"/>', 
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
              value: row.name,
              result: row.name
          }
      }
      );
      },
      formatItem: function (row, i, max) {
          return "<table width='97%'><tr><td align='left'>专家名：" + row.name + "</td></tr></table>";
          //return  row.name;
      }, 
      formatMatch: function(row, i, max){ 
           return row.name;
      } ,

      formatResult: function(row, i, max) {
           return row.name;
      }                 
});

$('#adImageappellationid').autocomplete('<c:url value="/adImage/autoappellation"/>', 
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
              value: row.appellation,
              result: row.appellation
          }
      }
      );
      },
      formatItem: function (row, i, max) {
          return "<table width='97%'><tr><td align='left'>称谓：" + row.appellation + "</td></tr></table>";
          //return  row.name;
      }, 
      formatMatch: function(row, i, max){ 
           return row.appellation;
      } ,

      formatResult: function(row, i, max) {
           return row.appellation;
      }                 
});

$('#adImagespecialityid').autocomplete('<c:url value="/adImage/autospeciality"/>', 
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
              value: row.speciality,
              result: row.speciality
          }
      }
      );
      },
      formatItem: function (row, i, max) {
          return "<table width='97%'><tr><td align='left'>称谓：" + row.speciality + "</td></tr></table>";
          //return  row.name;
      }, 
      formatMatch: function(row, i, max){ 
           return row.speciality;
      } ,

      formatResult: function(row, i, max) {
           return row.speciality;
      }                 
});
	
});

function serach(){
	$('#adImagetable').datagrid('loadData',{total:0,rows:[]});
	var name = $("#adImagenameid").val();
	var appellation = $("#adImageappellationid").val();
	var speciality = $("#adImagespecialityid").val();
	var state = $("#stateid").combobox("getValue");
	$('#adImagetable').datagrid('load',{'name':name,'appellation':appellation,'speciality':speciality,'state':state});
}

function submitform(){
	$('#addadImageform').form('submit', {
		url: "<c:url value='/adImage/addadImage'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "添加成功！", 'info', function(){
					document.getElementById("addadImageform").reset();
					$('#adImagetable').datagrid('reload');
					$('#addadImage').window('close');
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}

function editform(){
	$('#editadImageform').form('submit', {
		url: "<c:url value='/adImage/editadImage'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "修改成功！", 'info', function(){
					document.getElementById("editadImageform").reset();
					$('#adImagetable').datagrid('reload');
					$('#editadImage').window('close');
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}

function deladImage(value){
	$.ajax({
        type:'post',
        url:'<c:url value="/adImage/deladImage"/>',
        data:'delid='+value,
        success:function(data){
           if(data == '0000'){
          	 $.messager.alert('提示', "删除成功！", 'info',function(){
          		$('#adImagetable').datagrid('reload');
               });
           }else{
          	 $.messager.alert('提示', data, 'warning',function(){
          		$('#adImagetable').datagrid('reload');
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
		<td>专家姓名:<input id="adImagenameid" name="name" type="text" size="10" editable="false"/></td>
		<td>专家称谓:<input id="adImageappellationid" name="appellation" type="text" size="10" editable="false"/></td>
		<td>专长:<input id="adImagespecialityid" name="name" type="text" size="10" editable="false"/></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">正常</option>
						<option value="2">删除</option>
		              </select></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="adImagetable" class="easyui-datagrid" data-options="url:'<c:url value="/ad/getAdImageList"/>',title: '专家信息管理',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'name',width:30,halign:'center'">广告位名称</th>
				<th data-options="field:'imgname',width:25,halign:'center',formatter:function(value,row,index){
				   return '&lt;img src=<c:url value="/ad/"/>'+value+' height=20 /&gt;';
				}">广告图片</th>
				<th data-options="field:'url',width:30,halign:'center'">图片链接</th>
				<th data-options="field:'state',width:15,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '正常';
                   }else{
                     return '删除';
                   }
                }">状态</th>
			</tr>
		</thead>
	</table>
	
	<!-- 查看广告详细内容 -->
	<div id="scanadImage" class="easyui-window" data-options="title:'广告内容详情',iconCls:'icon-search',modal:true" style="width:500px;height:400px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="oneadImagetable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td width="30%">广告位名称：</td>
			    <td id="adnameid"></td>
			  </tr>
			  <tr>
			    <td>图片链接：</td>
			    <td id="adurlid"></td>
			  </tr>
			  <tr>
			    <td id="adimgurlid" colspan="2" style="width: 3.3cm; height: 4.8cm"></td>
			  </tr>
			</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanadImage').window('close');">关闭</a>
		</div>
	  </div>
	</div>
	
  </body>
  
</html>
