<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>VIP短信管理</title>
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
	$('#scanmessage').window('close');
	$('#editmessage').window('close');

	$('#vipmessagetable').datagrid({
          toolbar:[{
              id:'vipmessagebtnscan',
              text:'查看短信内容',
              iconCls:'icon-search',
              handler:function(){
                 var row = $('#vipmessagetable').datagrid('getSelected');
                 if(row){
               	  $('#oneid').empty().append(row.id);
               	  if (row.type == '1') {
               	  	$('#onetypeid').empty().append('VIP会员');
                  } else if (row.type == '2') {
               	  	$('#onetypeid').empty().append('VIP贵宾会员');
                  } else if (row.type == '3') {
               	  	$('#onetypeid').empty().append('VIP高级会员');
                  } else if (row.type == '4') {
               	  	$('#onetypeid').empty().append('VIP超级会员');
                  }
               	  $('#onecontentid').empty().append(row.content);
               	  $('#scanmessage').window('open');
                 }else{
               	  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
              id:'vipmessagebtnedit',
              text:'修改短信内容',
              iconCls:'icon-add',
              handler:function(){
            	 var row = $('#vipmessagetable').datagrid('getSelected');
            	 if(row){
                   $('#messageid').val(row.id);
                   if (row.type == '1') {
                	  	$('#typeid').empty().append('VIP会员');
                   } else if (row.type == '2') {
                	  	$('#typeid').empty().append('VIP贵宾会员');
                   } else if (row.type == '3') {
                	  	$('#typeid').empty().append('VIP高级会员');
                   } else if (row.type == '4') {
                	  	$('#typeid').empty().append('VIP超级会员');
                   }
                   $('#contentid').val(row.content);
                   $('#editmessage').window('open');
                 }
              } 
             }]
	});

});

function updatemessageform(){
    $('#editmessageform').form('submit',{
        url:"<c:url value='/message/editVipMessage'/>",
        onSubmit:function(){
            return $(this).form('validate');
        },
        success:function(data){
            if(data == "0000"){
            	$.messager.alert('提示', "修改短信成功！", 'info',function(){
                	document.getElementById("editmessageform").reset();
					$('#editmessage').window('close');
					$('#vipmessagetable').datagrid('reload');
                });
            }else{
            	$.messager.alert('警告', data, 'warning',function(){
            		document.getElementById("editmessageform").reset();
					$('#editmessage').window('close');
					$('#vipmessagetable').datagrid('reload');
                });
            }
        }
    });
}
	</script>

  </head>
  
  <body>
    <table id="vipmessagetable" class="easyui-datagrid" data-options="url:'<c:url value="/message/getVipMessageList"/>',title: 'VIP短信列表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true,showFooter:true">
		<thead>
			<tr>
				<th data-options="field:'id',width:15,halign:'center'">ID号</th>
				<th data-options="field:'type',width:35,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return 'VIP会员';
                   }else if(value == 2){
                     return 'VIP贵宾会员';
                   }else if(value == 3){
                     return 'VIP高级会员';
                   }else if(value == 4){
                     return 'VIP超级会员';
                   }
                }">短信类型</th>
				<th data-options="field:'content',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 12){
				         return value.substring(0,12)+'...';
				      }
				   }
				   return value;
				}">短信内容</th>
			</tr>
		</thead>
	</table>
	
	<a class="easyui-linkbutton" style="float: right" data-options="iconCls:'icon-redo'" href="javascript:void(0)" onclick="history.go(-1);">返回</a>
	
	<!-- 查看短信详情 -->
	<div id="scanmessage" class="easyui-window" data-options="title:'短信内容',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="oneverifytable" width="100%" cellpadding="5" cellspacing="1">
				<tr><td width="25%">ID号:</td><td id="oneid"></td><td width="25%">短信类型:</td><td id="onetypeid"></td></tr>
				<tr><td id="onecontentid" colspan="4"></td></tr>
				</table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanmessage').window('close');">关闭</a>
			</div>
		</div>
	</div>
	
	<!-- 修改短信内容 -->
	<div id="editmessage" class="easyui-window" data-options="title:'修改职业',iconCls:'icon-edit',modal:true" style="width:400px;height:300px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="editmessageform" method="post">
				<input type="hidden" id="messageid" name="id"/>
				<table style="line-height: 30px;">
				<tr>
				   <td>短信类型:</td>
				   <td>
				     <span id="typeid" style="color: green"></span>
				   </td>
				</tr>
				<tr>
				   <td>短信内容:</td>
				   <td>
				     <textarea id="contentid" name="content" rows="5" style="width: 280px;"></textarea>
				   </td>
				</tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="updatemessageform();">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#editmessage').window('close');">取消</a>
			</div>
		</div>
	</div>
	
	
  </body>
</html>
