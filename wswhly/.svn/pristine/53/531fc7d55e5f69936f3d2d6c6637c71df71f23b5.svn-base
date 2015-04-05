<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>代购藏品管理</title>
    
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
    $('#updatedaigou').window('close');
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

	$('#daigoutable').datagrid({
		toolbar:[{
                id:'userbtnupd',
                text:'修改用户信息',
                iconCls:'icon-edit',
                handler:function(){
                    var row = $('#daigoutable').datagrid('getSelected');
                    if(row){
                    	$('#updatedaigouid').val(row.id);
						$('#updatename').empty().append(row.name);				
						$('#updateemail').val(row.email);
						$('#updatemobile').val(row.mobile);		
						$('#updateweixin').val(row.weixin);											
						$('#updateaddress').val(row.address);	
						$('#upstateid').combobox('setValue',row.state);				
						$('#updatedaigou').window('open');
                    }else{
                    	$.messager.alert('警告', "请先选择用户！", 'warning');
                    }
                }
			},{
            id:'transferbtnscan',
            text:'查看苏富比拍卖详情',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#daigoutable').datagrid('getSelected');
         	  if(row){
         	    if(row.lotsid==null){
         	    $.messager.alert('警告','该用户没有申请过苏富比代购','warning');
         	  }else{
         	   window.open("http://www.wswhly.com/yclots/"+row.lotsid+".dhtml");       
         	    }       
               }else{
             	  $.messager.alert('警告','请选择一条信息','warning');
               }
            }
           },{
            id:'transferbtnscan',
            text:'查看佳士得拍卖详情',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#daigoutable').datagrid('getSelected');
         	  if(row){
         	 if(row.colloctionurl==null){
         	    $.messager.alert('警告','该用户没有申请过佳士得代购','warning');
         	  }else{
         	   window.open(row.colloctionurl);     
         	   }         
               }else{
             	  $.messager.alert('警告','请选择一条信息','warning');
               }
            }
           }]
	});
});

function updatedaigouform(){
        $('#updatedaigouform').form('submit',{
            url:"<c:url value='/daigou/upddaigou'/>",
            onSubmit:function(){
                return $(this).form('validate');
            },
            success:function(data){
                if(data == "0000"){
                	$.messager.alert('提示', "修改信息成功！", 'info',function(){
	                	document.getElementById("updatedaigouform").reset();
						$('#updatedaigou').window('close');
						$('#daigoutable').datagrid('reload');
                    });
                }else{
                	$.messager.alert('警告', data, 'warning',function(){
                		document.getElementById("updatedaigouform").reset();
						$('#updatedaigou').window('close');
						$('#daigoutable').datagrid('reload');
                    });
                }
            }
        });
	}

function serach(){
	$('#daigoutable').datagrid('loadData',{total:0,rows:[]});
	var name = $("#nameid").attr("value");
	var mobile = $("#mobileid").attr("value");
	var state = $('#stateid').combobox('getValue');
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#daigoutable').datagrid('load',{'name':name,'mobile':mobile,'state':state,'begindate':sdate,'enddate':edate});
}

        
</script>
  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr>
		<td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 70px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
		<td>买家名称:<input id="nameid" name="name" type="text" size="10" editable="false"/></td>
		<td>买家电话:<input id="mobileid" name="mobile" type="text" size="10" editable="false"/></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="1">申请代购</option>
						<option value="2">正在代购中</option>
						<option value="3">取消代购</option>
						<option value="4">代购成功</option>
		              </select></td>
		<td>起始日期:<input id="startdate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>结束日期:<input id="enddate" type="text" size="10" class="easyui-datebox" editable="false"/></td>	
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>	
	</table>
    <table id="daigoutable" class="easyui-datagrid" data-options="url:'<c:url value="/daigou/getdaigouinfo"/>',queryParams:{'userid':'${comprehensiveid}','begindate':formatMonth(-3),'enddate':formatDay(0)},title: '藏品征集列表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>			   
				<th data-options="field:'name',width:40,halign:'center'">买家姓名</th>
				<th data-options="field:'sex',width:40,halign:'center',formatter:function(value,row,index){
				   if(value == 1){
				     return '男';
				   }else if(value ==2){
				     return '女';
				   }else{
				     return '保密';
				   }
				}">性别</th>
				<th data-options="field:'mobile',width:40,halign:'center'">电话</th>		
				<th data-options="field:'weixin',width:40,halign:'center'">微信号</th>			
				<th data-options="field:'address',width:60,halign:'center'">地址</th>
				<th data-options="field:'email',width:40,halign:'center'">邮箱</th>
	            <th data-options="field:'cjaction',width:50,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				     var val='';
				      if(value.indexOf('1')>=0){
				         val+='苏富比   ';
				      }
				      if(value.indexOf('2')>=0){
				         val+='佳士得    ';
				      }				     
				      return val;
				   }
				   return value;
				}">希望参加的拍卖会</th>
	            <th data-options="field:'pmfs',width:50,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				     var val='';
				      if(value.indexOf('1')>=0){
				         val+='现场参拍   ';
				      }
				      if(value.indexOf('2')>=0){
				         val+='代理参拍    ';
				      }				     
				      return val;
				   }
				   return value;
				}">希望的拍卖方式</th>	
				<th data-options="field:'lotsname',width:40,halign:'center'">买到的藏品</th>
				<th data-options="field:'buytime',width:30,halign:'center'">生成时间</th>	   
				<th data-options="field:'state',width:25,halign:'center',formatter:function(value,row,index){
				   if(value == 1){
				     return '申请代购';
				   }else if(value ==2){
				     return '正在代购中';
				   }else if(value ==3){
				     return '取消代购';
				   }else if(value ==4){
				     return '代购成功';
				   }else{
				     return '其他';
				   }
				}">状态</th>		 
			</tr>
		</thead>
	</table>
	<div id="updatedaigou" class="easyui-window" data-options="title:'修改信息',iconCls:'icon-edit',modal:true" style="width:700px;height:600px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="updatedaigouform" method="post">
				<table width="100%" cellpadding="5" cellspacing="1">
				<tr><td></td><td><input id="updatedaigouid" name="id" type="hidden"/></td></tr>
				<tr><td>买家姓名:</td><td><span id="updatename"></span></td></tr>
				<tr><td>性别:</td><td><input name="sex" type="radio" value="1" checked="checked"/>男&nbsp;&nbsp;<input name="sex" type="radio" value="2"/>女</td></tr>
				<tr><td>手机号:</td><td><input id="updatemobile" name="mobile" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>微信号:</td><td><input id="updateweixin"  name="weixin" class="easyui-validatebox" type="text" data-options=""></td></tr>
				<tr><td>电子邮箱:</td><td><input id="updateemail" name="email" class="easyui-validatebox" type="text" data-options=""></td></tr>
				<tr><td>地址:</td><td><input id="updateaddress" name="address" class="easyui-validatebox" maxlength="18" type="text"></td></tr>
				<tr><td>
				       状态: <select  id="upstateid"  name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="1">申请代购</option>
						<option value="2">正在代购中</option>
						<option value="3">取消代购</option>
						<option value="4">代购成功</option>
		              </select>
				  </td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="updatedaigouform();">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#updatedaigou').window('close');">取消</a>
			</div>
		</div>
	</div>
		 <jsp:include page="../incloudUser.jsp"/>
  </body>
</html>
