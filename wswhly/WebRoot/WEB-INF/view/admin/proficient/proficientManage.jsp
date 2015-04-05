<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>专家信息管理</title>
    
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
#oneproficienttable {border-right:1px solid blue;border-bottom:1px solid blue}
#oneproficienttable td{border-left:1px solid blue;border-top:1px solid blue}
</style>

<script type="text/javascript">

$(function(){
	$('#scanproficient').window('close');

	$('#proficienttable').datagrid({
        toolbar:[{
            id:'proficientbtnscan',
            text:'专家信息详情',
            iconCls:'icon-search',
            handler:function(){
               var row = $('#proficienttable').datagrid('getSelected');
               if(row){
             	  $('#scanproficientnameid').empty().append(row.name);
             	  $('#scanproficientappellationid').empty().append(row.appellation);
             	  $('#scanproficientspecialityid').empty().append(row.speciality);
             	  $('#scanproficientcreatedateid').empty().append(row.createdate);
             	  $('#scanproficientimgurlid').empty().append('<img src="'+row.imgurl+'" style="width: 3.3cm; height: 4.8cm"/>');
             	  $('#scanproficientnoteid').empty().append("专家简介："+row.note);
             	  $('#scanproficient').window('open');
               }else{
             	  $.messager.alert('警告','请选择一条信息','warning');
               }
            }
           },{
            id:'proficientbtnadd',
            text:'添加专家信息',
            iconCls:'icon-add',
            handler:function(){
        	   location.href = "<c:url value='/proficient/gotoaddproficient'/>";
            } 
           },{
            id:'proficientbtnedit',
            text:'修改专家信息',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#proficienttable').datagrid('getSelected');
         	  if(row){
         		 if (row.state == 2){
            		  $.messager.alert('警告','该信息已被删除','warning');
                 } else {
                	  location.href = "<c:url value='/proficient/gotoeditproficient'/>?id="+row.id;
                 }
               }else{
             	  $.messager.alert('警告','请选择一条信息','warning');
               }
            }
           },{
            id:'proficientbtndel',
            text:'删除专家信息',
            iconCls:'icon-cancel',
            handler:function(){
         	  var row = $('#proficienttable').datagrid('getSelected');
         	  if(row){
         		 if (row.state == 2){
            		 $.messager.alert('警告','该信息已被删除','warning');
                 } else {
	         		 $.messager.confirm('提示', '确定要删除此专家信息？', function(r){
	       		         if (r){
	       		        	delproficient(row.id);
	       		         }
	       		     });
                 }
         	  }else{
         		  $.messager.alert('警告','请选择一条信息','warning');
              }
            }
           }]
		});
	$('#proficienttable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');

$('#proficientnameid').autocomplete('<c:url value="/proficient/autoname"/>', 
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

$('#proficientappellationid').autocomplete('<c:url value="/proficient/autoappellation"/>', 
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

$('#proficientspecialityid').autocomplete('<c:url value="/proficient/autospeciality"/>', 
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
	$('#proficienttable').datagrid('loadData',{total:0,rows:[]});
	var name = $("#proficientnameid").val();
	var appellation = $("#proficientappellationid").val();
	var speciality = $("#proficientspecialityid").val();
	var state = $("#stateid").combobox("getValue");
	$('#proficienttable').datagrid('load',{'name':name,'appellation':appellation,'speciality':speciality,'state':state});
}

function submitform(){
	$('#addproficientform').form('submit', {
		url: "<c:url value='/proficient/addproficient'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "添加成功！", 'info', function(){
					document.getElementById("addproficientform").reset();
					$('#proficienttable').datagrid('reload');
					$('#addproficient').window('close');
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}

function editform(){
	$('#editproficientform').form('submit', {
		url: "<c:url value='/proficient/editproficient'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "修改成功！", 'info', function(){
					document.getElementById("editproficientform").reset();
					$('#proficienttable').datagrid('reload');
					$('#editproficient').window('close');
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}

function delproficient(value){
	$.ajax({
        type:'post',
        url:'<c:url value="/proficient/delproficient"/>',
        data:'delid='+value,
        success:function(data){
           if(data == '0000'){
          	 $.messager.alert('提示', "删除成功！", 'info',function(){
          		$('#proficienttable').datagrid('reload');
               });
           }else{
          	 $.messager.alert('提示', data, 'warning',function(){
          		$('#proficienttable').datagrid('reload');
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
		<td>专家姓名:<input id="proficientnameid" name="name" type="text" size="10" editable="false"/></td>
		<td>专家称谓:<input id="proficientappellationid" name="appellation" type="text" size="10" editable="false"/></td>
		<td>专长:<input id="proficientspecialityid" name="name" type="text" size="10" editable="false"/></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">正常</option>
						<option value="2">删除</option>
		              </select></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="proficienttable" class="easyui-datagrid" data-options="url:'<c:url value="/proficient/getproficientlist"/>',queryParams:{'begindate':formatMonth(-3),'enddate':formatDay(0)},title: '专家信息管理',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'name',width:30,halign:'center'">专家姓名</th>
				<th data-options="field:'imgurl',width:25,halign:'center',formatter:function(value,row,index){
				   return '&lt;img src='+value+' height=20 /&gt;';
				}">专家信息图片</th>
				<th data-options="field:'speciality',width:30,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 12){
				         return value.substring(0,12)+'...';
				      }
				   }
				   return value;
				}">专长</th>
				<th data-options="field:'appellation',width:30,halign:'center'">称谓</th>
				<th data-options="field:'note',width:30,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 12){
				         return value.substring(0,12)+'...';
				      }
				   }
				   return value;
				}">专家简介</th>
				<th data-options="field:'orderc',width:15,halign:'center'">排序</th>
                <th data-options="field:'isbqhx',width:50,halign:'center',formatter:function(value,row,index){
                   if(value ==1){
                     return '是';
                   }else{
                     return '不是';
                   }
                }">是否为本期专家</th>
                <th data-options="field:'hxqh',width:50,halign:'center'">本期海选报名期号</th>
				<th data-options="field:'createdate',width:60,halign:'center'">创建日期</th>
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
	
	<!-- 查看专家信息详细内容 -->
	<div id="scanproficient" class="easyui-window" data-options="title:'专家信息详情',iconCls:'icon-search',modal:true" style="width:500px;height:400px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="oneproficienttable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td width="30%">专家姓名：</td>
			    <td id="scanproficientnameid"></td>
			    <td id="scanproficientimgurlid" rowspan="4" style="width: 3.3cm; height: 4.8cm"></td>
			  </tr>
			  <tr>
			    <td>专家称谓：</td>
			    <td id="scanproficientappellationid"></td>
			  </tr>
			  <tr>
			    <td>专长：</td>
			    <td id="scanproficientspecialityid"></td>
			  </tr>
			  <tr>
			    <td>创建时间：</td>
			    <td id="scanproficientcreatedateid"></td>
			  </tr>
			  <tr>
			    <td colspan="3"><u id="scanproficientnoteid"></u></td>
			  </tr>
			</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanproficient').window('close');">关闭</a>
		</div>
	  </div>
	</div>
	
  </body>
  
</html>
