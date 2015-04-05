<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>视频管理</title>
    
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
	$('#scanvideo').window('close');
	$('#addvideo').window('close');
	$('#editvideo').window('close');
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
	$('#videotable').datagrid({
        toolbar:[{
            id:'videobtnscan',
            text:'视频详情',
            iconCls:'icon-search',
            handler:function(){
               var row = $('#videotable').datagrid('getSelected');
               if(row){
             	  $('#scanvideotitleid').empty().append(row.title);
             	  $('#scanvideoproficientid').empty().append(row.proficient);
             	  $('#scanvideouploaddateid').empty().append(row.uploaddate);
             	  if (row.state == 1) {
             	    $('#scanvideostateid').empty().append('正常');
                  } else {
             	    $('#scanvideostateid').empty().append('删除');
                  }
             	  $('#scanvideoclicknumid').empty().append(row.clicknum);
             	  $('#scanvideoimgid').empty().append('<img src="'+row.imgurl+'" width="600"/>');
             	  $('#scanvideonoteid').empty().append(row.note);
             	  $('#scanvideo').window('open');
               }else{
             	  $.messager.alert('警告','请选择一条视频','warning');
               }
            }
           },{
            id:'videobtnadd',
            text:'添加视频',
            iconCls:'icon-add',
            handler:function(){
        	   location.href = "<c:url value='/video/gotoaddvideo'/>";
            } 
           },{
            id:'videobtnedit',
            text:'修改视频',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#videotable').datagrid('getSelected');
         	  if(row){
         		 if (row.state == 2){
            		  $.messager.alert('警告','该视频已被删除','warning');
                 } else {
                	  location.href = "<c:url value='/video/gotoeditvideo'/>?id="+row.id;
                 }
               }else{
             	  $.messager.alert('警告','请选择一条视频','warning');
               }
            }
           },{
            id:'videobtndel',
            text:'删除视频',
            iconCls:'icon-cancel',
            handler:function(){
         	  var row = $('#videotable').datagrid('getSelected');
         	  if(row){
         		 if (row.state == 2){
            		 $.messager.alert('警告','该视频已被删除','warning');
                 } else {
	         		 $.messager.confirm('提示', '确定要删除此视频吗？', function(r){
	       		         if (r){
	       		        	delvideo(row.id);
	       		         }
	       		     });
                 }
         	  }else{
         		  $.messager.alert('警告','请选择一条视频','warning');
              }
            }
           }]
		});

	$('#videotable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');

//objects为json数据源对象
$('#videonameid').autocomplete('<c:url value="/video/autotitle"/>', 
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
              value: row.title,
              result: row.title
          }
      }
      );
      },
      formatItem: function (row, i, max) {
          return "<table width='97%'><tr><td align='left'>视频名称：" + row.title + "</td></tr></table>";
          //return  row.name;
      }, 
      formatMatch: function(row, i, max){ 
           return row.title;
      } ,

      formatResult: function(row, i, max) {
           return row.title;
      }                 
});

$('#proficientid').autocomplete('<c:url value="/video/autoproficient"/>', 
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
              value: row.proficient,
              result: row.proficient
          }
      }
      );
      },
      formatItem: function (row, i, max) {
          return "<table width='97%'><tr><td align='left'>讲座专家：" + row.proficient + "</td></tr></table>";
          //return  row.name;
      }, 
      formatMatch: function(row, i, max){ 
           return row.proficient;
      } ,

      formatResult: function(row, i, max) {
           return row.proficient;
      }                 
});

});

function serach(){
	$('#videotable').datagrid('loadData',{total:0,rows:[]});
	var title = $("#videonameid").val();
	var proficient = $("#proficientid").val();
	var state = $("#stateid").combobox("getValue");
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	var videotype=$("#videotype").combobox("getValue");
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#videotable').datagrid('load',{'title':title,'proficient':proficient,'state':state,'begindate':sdate,'enddate':edate,'videotype':videotype});
}

function delvideo(value){
	$.ajax({
        type:'post',
        url:'<c:url value="/video/delvideo"/>',
        data:'id='+value,
        success:function(data){
           if(data == '0000'){
          	 $.messager.alert('提示', "删除成功！", 'info',function(){
          		$('#videotable').datagrid('reload');
               });
           }else{
          	 $.messager.alert('提示', data, 'warning',function(){
          		$('#videotable').datagrid('reload');
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
		<td>视频名称:<input id="videonameid" name="title" type="text" size="10" editable="false"/></td>
		<td><select id="videotype" name="videotype" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="">全部</option>
						<option value="0">讲座专家</option>
						<option value="1">新闻名称</option>
		              </select>:<input id="proficientid" name="proficient" type="text" size="10" editable="false"/></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">正常</option>
						<option value="2">删除</option>
		              </select></td>
		<td>起始日期:<input id="startdate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>结束日期:<input id="enddate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="videotable" class="easyui-datagrid" data-options="url:'<c:url value="/video/getvideolist"/>',queryParams:{'begindate':formatMonth(-3),'enddate':formatDay(0)},title: '视频管理',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'title',width:30,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 12){
				         return value.substring(0,12)+'...';
				      }
				   }
				   return value;
				}">视频名称</th>
				<th data-options="field:'imgurl',width:30,halign:'center',formatter:function(value,row,index){
				   return '&lt;img src='+value+' height=20 /&gt;';
				}">视频图片</th>
				<th data-options="field:'videotype',width:25,halign:'center',formatter:function(value,row,index){
                   if(value == 0){
                     return '讲座专家';
                   }else{
                     return '新闻名称';
                   }
                }">
				视频类型</th>
				<th data-options="field:'proficient',width:25,halign:'center'">名称</th>
				<th data-options="field:'uploaddate',width:30,halign:'center'">上传时间</th>
				<th data-options="field:'clicknum',width:30,halign:'center'">点击量</th>
				<th data-options="field:'note',width:30,halign:'center',formatter:function(value,row,index){
				   return '查看详情';
				}">视频简介</th>
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
	
	<!-- 查看视频视频详细内容 -->
	<div id="scanvideo" class="easyui-window" data-options="title:'视频详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="onevideotable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td id="scanvideotitleid" colspan="4" style="font-weight: bold;" align="center"></td>
			  </tr>
			  <tr>
			    <td>讲座专家：</td>
			    <td id="scanvideoproficientid"></td>
			    <td>上传时间：</td>
			    <td id="scanvideouploaddateid"></td>
			  </tr>
			  <tr>
			    <td>视频状态：</td>
			    <td id="scanvideostateid"></td>
			    <td>视频点击量：</td>
			    <td id="scanvideoclicknumid"></td>
			  </tr>
			  <tr>
			    <td id="scanvideoimgid" colspan="4" align="center"></td>
			  </tr>
			  <tr>
			    <td id="scanvideonoteid" colspan="4"></td>
			  </tr>
			</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanvideo').window('close');">关闭</a>
		</div>
	  </div>
	</div>
	
  </body>
  
</html>
