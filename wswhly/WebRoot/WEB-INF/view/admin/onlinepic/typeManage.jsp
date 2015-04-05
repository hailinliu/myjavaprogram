<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>在线图片鉴定藏品管理</title>
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
$('#scanmessageadd').window('close');
$('#scanmessageupdate').window('close');
		$('#messagetable').datagrid({
		pageSize:5000,
        pageList:[1000],
          toolbar:[{
              id:'onlinetypeadd',
              text:'添加',
              iconCls:'icon-edit',
              handler:function(){
                $('#scanmessageadd').window('open');
             }
            },{
              id:'onlinetypeupdate',
              text:'修改',
              iconCls:'icon-edit',
              handler:function(){
              var row = $('#messagetable').datagrid('getSelected');
              if(row){
		             $('#updateid').val(row.id);
		             $('#updatename').val(row.name);
		              $('#updatedstate').combobox('setValue',row.state);			
		            $('#scanmessageupdate').window('open');
	          }else{
	            $.messager.alert('警告','请先选择一条信息！','warning');
	          }
               
             }
            }]
	});
	$('#messagetable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');
	getType();
});

var typelist=null;
//根绝类型id查询类型名称
function getTypename(ids){
var names="";
 var strs=ids.split(",");      
   for (i=0;i<strs.length ;i++ )  
   {   
	 $.each(data,function(index,info){
				if(info.id==id){
				names+=info.name+",";
				}
	});
	} 
	return names;
}
//类型
function getType(){
	 $.ajax({
            async:false,
            type:'post',
            url:"<c:url value='/onlinepic/getOnlinePicType'/>",
            data:'name='+name,
            success:function(data){
                data = eval(data);
                typelist=data;
                 $.each(data,function(index,info){
			      $('#typeidsh').append("<input id='addtypeid"+index+"' type='checkbox' name='addtypeid'   value='"+info.id+"' >"+info.name);
			      $('#typeidshup').append("<input id='addtypeid"+index+"' type='checkbox' name='updatetypeid'   value='"+info.id+"' >"+info.name);
		          });
            }
        });
}
//添加
function Add(){
	 var name=$("#addname").val();
	if(name==''){alert('请填写名称！');return;}
	 $.ajax({
            async:false,
            type:'post',
            url:"<c:url value='/onlinepic/AddType'/>",
            data:{    
             name:name 
    	},  
            success:function(data){
                 if(data=1){
                 	alert("添加成功！");
                 	$('#scanmessageadd').window('close');
                 	$('#messagetable').datagrid('reload');
                 	document.getElementById("addadminform").reset();
                 }else{
                 	alert("添加失败！");
                 }
            }
        });
}
//修改
function Update(){
	var id=$("#updateid").val();
	 var name=$("#updatename").val();
	 
	var state= $('#updatedstate').combobox('getValue');
	if(name==''){alert('请填写名称！');return;}
	
	 $.ajax({
            async:false,
            type:'post',
            url:"<c:url value='/onlinepic/UpdateType'/>",
            data:{   
             id:id,  
             name:name,    
             state:state 
    	},  
            success:function(data){
                 if(data=1){
                 	alert("修改成功！");
                 	$('#scanmessageupdate').window('close');
                 	$('#messagetable').datagrid('reload');
                 	document.getElementById("updateadminform").reset();
                 }else{
                 	alert("添加失败！");
                 }
            }
        });
}
	</script>

  </head>
  
  <body>
    <table id="messagetable" class="easyui-datagrid" data-options="url:'<c:url value="/onlinepic/getOnlinePicType"/>',queryParams:{rows:'1000000'},title: '图片鉴定专家列表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true,showFooter:true">
		<thead>
			<tr>
				<th data-options="field:'name',width:25,halign:'center'">名称</th>
				<th data-options="field:'state',width:20,halign:'center',formatter:function(value,row,index){
				   if(value==1){
				      return '正常';
				   }else if(value==2){
				      return '删除';
				   }
				}">状态</th>
			 
			</tr>
		</thead>
	</table>
	
	<div id="scanmessageadd" class="easyui-window" data-options="title:'添加类型',iconCls:'icon-add',modal:true" style="width:500px;height:370px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="addadminform" method="post">
				<table style="line-height: 30px;" align="center">
				<tr><td>名称:</td><td><input name="addname"  id="addname" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				
				
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="Add();">添加</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanmessageadd').window('close');;">取消</a>
			</div>
		</div>
	</div>
	
	<div id="scanmessageupdate" class="easyui-window" data-options="title:'修改类型',iconCls:'icon-update',modal:true" style="width:500px;height:370px;pupdateing:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="pupdateing:10px;background:#fff;border:1px solid #ccc;">
				<form id="updateadminform" method="post">
				<table style="line-height: 30px;" align="center">
				<input name="updateid"  id="updateid" class="easyui-validatebox" type="hidden" data-options="required:true">
				<tr><td>名称:</td><td><input id="updatename" name="updatename" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>状态:</td><td>
				<select id="updatedstate" name="updatedstate" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="1">正常</option>
						<option value="2">删除</option>
		              </select>
				</td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;pupdateing:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="Update();">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanmessageupdate').window('close');;">取消</a>
			</div>
		</div>
	</div>
	
  </body>
</html>
