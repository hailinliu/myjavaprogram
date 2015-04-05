<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>推荐资讯</title>
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
	$('#scannews').window('close');
	$('#addnews').window('close');
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

	$('#newstable').datagrid({
          toolbar:[{
              id:'recommendbtnscan',
              text:'查看详情',
              iconCls:'icon-search',
              handler:function(){
                 var row = $('#newstable').datagrid('getSelected');
                 if(row){
                	$('#onetitleid').empty().append(row.title);
                  	$('#onecreatetimeid').empty().append(row.createdate);
                  	if (row.type == 1) {
                  	   $('#onenewstypeid').empty().append('收藏资讯');
                    } else if (row.type == 2) {
                  	   $('#onenewstypeid').empty().append('收藏学院下属');
                    }
                  	$('#onecontentid').empty().append(row.content);
                  	$('#scannews').window('open');
                 }else{
               	  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
              id:'recommendbtndel',
              text:'取消推荐',
              iconCls:'icon-cancel',
              handler:function(){
           	  var row = $('#newstable').datagrid('getSelected');
           	  if(row){
           		  $.messager.confirm('提示', '确定要取消此活动吗？', function(r){
           		     if (r){
           		       delNews(row.id);
           		     }
           		  });
           	  }else{
           		  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             }]
	});
	$('#newstable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');

	$('#titleid').autocomplete('<c:url value="/news/autotitle"/>', 
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
	          return "<table width='97%'><tr><td align='left'>标题：" + row.title + "</td><td>发布时间："+ row.createdate +"</td></tr></table>";
	          //return  row.name;
	      }, 
	      formatMatch: function(row, i, max){ 
	           return row.title;
	      } ,

	      formatResult: function(row, i, max) {
	           return row.title;
	      }                 
	});
});
	
	function serach(){
	
	$('#newstable').datagrid('loadData',{total:0,rows:[],footer:[]});
		var title = $("#titleid").val();
		var sdate = $('#startdate').datebox('getValue');
		var edate = $('#enddate').datebox('getValue');
		if(edate == "" || sdate == ""){
			$.messager.alert('警告','请输入查询日期!','warning');
			return false;
		}
		$('#newstable').datagrid('load',{'title':title,'begindate':sdate,'enddate':edate,'recommend':1});
	}

function delNews(id){
      $.ajax({
         type:'post',
         url:'<c:url value="/news/cancel"/>',
         data:'id='+id+'&style=2',
         success:function(data){
            if(data == '0000'){
           	 $.messager.alert('提示', "推荐取消成功！", 'info',function(){
           		serach();
                });
            }else{
           	 $.messager.alert('提示', data, 'warning',function(){
           		serach();
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
		<tr><td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 70px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
		<td>资讯标题:<input id="titleid" name="title" type="text" size="10" editable="false"/></td>
		<td>起始日期:<input id="startdate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>结束日期:<input id="enddate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="newstable" class="easyui-datagrid" data-options="url:'<c:url value="/news/getnewslisttd"/>',queryParams:{'begindate':formatMonth(-3),'enddate':formatDay(0)},title: '信息列表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true,showFooter:true">
		<thead>
			<tr>
				<th data-options="field:'title',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 12){
				         return value.substring(0,12)+'...';
				      }
				   }
				   return value;
				}">资讯标题</th>
				<th data-options="field:'content',width:35,halign:'center',formatter:function(value,row,index){
				   return '查看详情';
				}">资讯内容</th>
				<th data-options="field:'createdate',width:35,halign:'center'">发布时间</th>
				<th data-options="field:'clicknum',width:35,halign:'center'">点击量</th>
				<th data-options="field:'state',width:15,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '收藏资讯';
                   }else if(value == 2){
                     return '学院下属资讯';
                   }
                }">所属类型</th>
			</tr>
		</thead>
	</table>
	
	<!-- 查看信息详细内容 -->
	<div id="scannews" class="easyui-window" data-options="title:'详情资讯',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="oneverifytable" width="100%" cellpadding="5" cellspacing="1">
				<tr><td id="onetitleid" colspan="4" style="font-weight: bold;" align="center"></td></tr>
				<tr><td width="25%">发布时间:</td><td id="onecreatetimeid"></td><td width="25%">信息类型:</td><td id="onenewstypeid"></td></tr>
				<tr><td id="onecontentid" colspan="4"></td></tr>
				</table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scannews').window('close');">关闭</a>
			</div>
		</div>
	</div>
	
  </body>
</html>
