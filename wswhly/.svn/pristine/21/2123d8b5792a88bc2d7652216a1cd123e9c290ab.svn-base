<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>拍品征集管理</title>
    
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
	<script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "<c:url value='/ueditor/'/>";
    </script>
	<script type="text/javascript" src="<c:url value="/ueditor/ueditor.config.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/ueditor/ueditor.all.min.js"/>"></script>
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
	$('#scanlylots').window('close');
	$('#updateup').window('close');
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

	$('#lylotstable').datagrid({
		toolbar:[{
            id:'votecollectionbtnscan',
            text:'拍品详情',
            iconCls:'icon-search',
            handler:function(){
               var row = $('#lylotstable').datagrid('getSelected');
               if(row){
            	   $('#scanspecialIDid').empty().append(row.specialname);
            	     var image = row.image.split(',');
             	  $('#scanimageid').empty().append('<img src="<c:url value="/zengjipaipin/'+image[0]+'"/>" width="250" height="250"/>');
              	  $('#scannameid').empty().append(row.name);
              	  $('#scanybpriceid').empty().append(row.ybprice);
              	  $('#scanautorid').empty().append(row.autor);                
              	  $('#scanyearid').empty().append(row.year);
              	  $('#scansizeid').empty().append(row.size);
              	  $('#scanuptimeid').empty().append(row.uptime);
              	  $('#scansuggestid').empty().append(row.suggest);
              	  $('#scanlylots').window('open');
               }else{
             	  $.messager.alert('警告','请选择一条藏品','warning');
               }
            }
           },{
            id:'votecollectionbtnupd',
            text:'添加评论',       
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#lylotstable').datagrid('getSelected');
         	  if(row){     	   
         	        $('#updid').val(row.id);        
         	        $('#trialcomments').val(row.trialcomments);	      
           	        $('#updateup').window('open');
               }else{
             	  $.messager.alert('警告','请选择一条拍品信息','warning');
               }
            }
    		 
            }
            ,{
            id:'votecollectionbtnupd',
            text:'下载图片',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#lylotstable').datagrid('getSelected');
         	  if(row){
           	       window.open("<c:url value='/collect/downIMGByid'/>?id="+row.id);
               }else{
             	  $.messager.alert('警告','请选择一条拍品信息','warning');
               }
            }
    		 
            }]
	});
});



 function updateupdform(){
        $('#updateupdform').form('submit',{
            url:"<c:url value='/collect/gotozjeditlylots'/>",
            onSubmit:function(){
                return $(this).form('validate');
            },       
            success:function(data){
                if(data == "0000"){
                	$.messager.alert('提示', "修改评论成功！", 'info',function(){
	                	document.getElementById("updateupdform").reset();
						$('#updateup').window('close');
						$('#lylotstable').datagrid('reload');
                    });
                }else{
                	$.messager.alert('警告', data, 'warning',function(){
                		document.getElementById("updateupdform").reset();
						$('#updateup').window('close');
						$('#lylotstable').datagrid('reload');
                    });
                }
            }
        });
	}


function serach(){
	$('#lylotstable').datagrid('loadData',{total:0,rows:[]});
	var lynumber = $("#lynumberid").val();
	var name = $("#nameid").val();
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#lylotstable').datagrid('load',{'lynumber':lynumber,'name':name,'begindate':sdate,'enddate':edate});
}
function exportExcel() {
   $('#lylotstable').datagrid('loadData',{total:0,rows:[]});
	var lynumber = $("#lynumberid").val();
	var name = $("#nameid").val();
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	window.open('<c:url value="/collect/ZJexportExcel"/>?lynumber='+lynumber+'&name='+name+'&begindate='+sdate+'&enddate='+edate);
}
        
</script>
  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr>
		<td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 70px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>		
		<td>乐园编号:<input id="lynumberid" name="lynumber" type="text" size="10" editable="false"/></td>
		<td>拍品名称:<input id="nameid" name="name" type="text" size="10" editable="false"/></td>
		<td>起始日期:<input id="startdate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>结束日期:<input id="enddate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>
		<td><a href="javascript:exportExcel()" class="easyui-linkbutton" iconCls="icon-redo">导出Excel</a></td>
	</table>
    <table id="lylotstable" class="easyui-datagrid" data-options="url:'<c:url value="/collect/getZjlotsList"/>',queryParams:{'userid':'${comprehensiveid}','begindate':formatMonth(-3),'enddate':formatDay(0)},title: '拍品征集列表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
			    <th data-options="field:'lynumber',width:50,halign:'center'">乐园编号</th>
				<th data-options="field:'name',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 9){
				         return value.substring(0,9)+'...';
				      }
				   }
				   return value;
				}">拍品名称</th>
				<th data-options="field:'specialname',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 9){
				         return value.substring(0,9)+'...';
				      }
				   }
				   return value;
				}">拍卖专场</th>			
				<th data-options="field:'autor',width:30,halign:'center'">作者</th>
				<th data-options="field:'size',width:40,halign:'center'">尺寸</th>
				<th data-options="field:'year',width:30,halign:'center'">年代</th>
				<th data-options="field:'ybprice',width:30,halign:'center'">预备价格</th>
				<th data-options="field:'uptime',width:40,halign:'center'">上传时间</th>		
				<th data-options="field:'trialtime',width:30,halign:'center'">初审时间</th>
				<th data-options="field:'trialcomments',width:30,halign:'center'">初审评论</th>
				<th data-options="field:'suggest',width:50,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 9){
				         return value.substring(0,9)+'...';
				      }
				   }
				   return value;
				}">拍品描述</th>             
			</tr>
		</thead>
	</table>
	<div id="updateup" class="easyui-window" data-options="title:'修改评论',iconCls:'icon-edit',modal:true" style="width:800px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="updateupdform" method="post" >
				<input type="hidden" name="id" id="updid"/>				
				<h4>请填写初审评论:</h4><br>
				<textarea id="trialcomments" name="trialcomments" class="easyui-validatebox" style="width:650px;height:320px"></textarea>		  
		   				
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="updateupdform()">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#updateupdform').window('close');">取消</a>
			</div>
		</div>
	</div>	
	<div id="scanlylots" class="easyui-window" data-options="title:'乐园拍品详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="onelylotstable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td width="30%">所属专场：</td>
			    <td id="scanspecialIDid"></td>
			    <td id="scanimageid" rowspan="6" width="250" height="250"></td>
			  </tr>
			  <tr>
			    <td>拍品名称：</td>
			    <td id="scannameid"></td>
			  </tr>
			  <tr>
			    <td>预备价格：</td>
			    <td id="scanybpriceid"></td>
			  </tr>			 
			   <tr>
			    <td>作者：</td>
			    <td id="scanautorid"></td>
			  </tr>
			   <tr>
			    <td>年代：</td>
			    <td id="scanyearid"></td>
			  </tr>
			   <tr>
			    <td>尺寸：</td>
			    <td id="scansizeid"></td>
			  </tr>			  
			  <tr>
			    <td>上传日期：</td>
			    <td id="scanuptimeid"></td>
			  </tr>			  
			   <tr>
			    <td colspan="3">拍品描述：<u id="scansuggestid"></u></td>
			  </tr>
			</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanlylots').window('close');">关闭</a>
		</div>
	  </div>
	</div>
		 <jsp:include page="../incloudUser.jsp"/>
  </body>
</html>
