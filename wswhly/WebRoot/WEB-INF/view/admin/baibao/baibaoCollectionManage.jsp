<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>百宝街藏品信息管理</title>
    
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
    $('#updstate').window('close');
	$('#scanlylots').window('close');
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
	$('#baicollectiontable').datagrid({
		toolbar:[{
				 id:'collectionusbtnscan',
                 text:'用户详情',
                 iconCls:'icon-search',
				handler:function(){
				var row = $('#baicollectiontable').datagrid('getSelected');
				if(row){
				getuserinfo(row.userid);
				}else{
				$.messager.alert('警告', "请先选择用户！", 'warning');
				}
				
			    }
			},{
            id:'votecollectionbtnupd',
            text:'修改拍品',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#baicollectiontable').datagrid('getSelected');
         	  if(row){
         	   if (row.state == 10){
 	          		  $.messager.alert('警告','该拍品已被删除','warning');
                  } else {
           	        window.showModalDialog("<c:url value='/baibao/gotoeditBaibaoCollection'/>?id="+row.id,window,"dialogWidth=1000px;dialogHeight=870px;status:no;");
	              }          	      
               }else{
             	  $.messager.alert('警告','请选择一条拍品信息','warning');
               }
            }
         },{
            id:'userbtnlevel',
            text:'状态控制',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#baicollectiontable').datagrid('getSelected');
         	  if(row){     	
         	       if(row.state == 10){
			        $.messager.alert('警告','该拍品已被删除！','warning');
				    }else{
					 $('#updid').val(row.id);
         	        $('#upstateid').val(row.state);
           	        $('#updstate').window('open');
					 }   
                   }else{
             	  $.messager.alert('警告','请选择一条拍品信息','warning');
               }
             }	 
            }]
	});
});
function updateupdform(){					
        $('#updateupdform').form('submit',{
            url:"<c:url value='/baibao/editcollectionsate'/>",
            onSubmit:function(){
                return $(this).form('validate');
            },       
            success:function(data){
                if(data == "0000"){
                	$.messager.alert('提示', "修改状态成功！", 'info',function(){
	                	document.getElementById("updateupdform").reset();
						$('#updstate').window('close');
						$('#baicollectiontable').datagrid('reload');
                    });
                }else{
                	$.messager.alert('警告', data, 'warning',function(){
                		document.getElementById("updateupdform").reset();
						$('#updstate').window('close');
						$('#baicollectiontable').datagrid('reload');
                    });
                }
            }
        });
	}

function serach(){
	$('#baicollectiontable').datagrid('loadData',{total:0,rows:[]});
	var baibaonum = $("#baibaonumid").attr("value");
	var username = $("#usernameid").attr("value");
	var name = $("#nameid").attr("value");
	var userid = $("#useridid").attr("value");
	var state = $("#stateid").combobox("getValue");
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#baicollectiontable').datagrid('load',{'baibaonum':baibaonum,'name':name,'username':username,'userid':userid,'state':state,'begindate':sdate,'enddate':edate});
}
 function exportExcel() {
    var baibaonum = $("#baibaonumid").val();
	var username = $("#usernameid").val();
	var name = $("#nameid").val();
	var userid = $("#useridid").val();
	var state = $("#stateid").combobox("getValue");
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	window.open('<c:url value="/baibao/exportExcel"/>?baibaonum='+baibaonum+'&name='+name+'&username='+username+'&userid='+userid+'&state='+state+'&begindate='+sdate+'&enddate='+edate);
}

        
</script>
  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr>
		<td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 70px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
		<td>百宝街编号:<input id="baibaonumid" name="baibaonum" type="text" size="10" editable="false"/></td>
		<td>藏品名称:<input id="nameid" name="name" type="text" size="10" editable="false"/></td>
		<td>上传者:<input id="usernameid" name="username" type="text" size="10" editable="false"/></td>
		<td><input id="useridid" name="userid" type="hidden" size="10" editable="false"/></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
		                <option value="">全部</option>
						<option value="1">审核中</option>
						<option value="2">待售中</option>
						<option value="3">交易中转</option>
						<option value="4">已售罄</option>
						<option value="5">下架</option>
						<option value="6">已删除</option>
		              </select></td>
		<td>起始日期:<input id="startdate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>结束日期:<input id="enddate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
	    <td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>
	    <td><a href="javascript:exportExcel()" class="easyui-linkbutton" iconCls="icon-redo">导出Excel</a></td></tr>
	</table>
    <table id="baicollectiontable" class="easyui-datagrid" data-options="url:'<c:url value="/baibao/getBaibaoCollectionList"/>',queryParams:{'userid':'${comprehensiveid}','begindate':formatMonth(-3),'enddate':formatDay(0)},title: '百宝街藏品信息表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>			   
			    <th data-options="field:'baibaonum',width:50,halign:'center'">百宝编号</th>
				<th data-options="field:'name',width:60,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 9){
				         return value.substring(0,9)+'...';
				      }
				   }
				   return value;
				}">藏品名称</th>
				<th data-options="field:'typename',width:50,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 9){
				         return value.substring(0,9)+'...';
				      }
				   }
				   return value;
				}">类别</th>					
				<th  data-options="field:'imgurl',width:35,halign:'center',formatter:function(value,row,index){			
                           var imgurl = value.split(',');
                return '&lt;img src=<c:url value="/Baibaourl/"/>'+imgurl[0]+' height=20 /&gt;';
                     }">图片</th> 
				<th data-options="field:'username',width:30,halign:'center'">上传者</th>
				<th data-options="field:'uploaddate',width:50,halign:'center'">上传时间</th>	
				<th data-options="field:'advertisement',width:50,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 9){
				         return value.substring(0,9)+'...';
				      }
				   }
				   return value;
				}">广告</th>
				<th data-options="field:'note',width:50,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 9){
				         return value.substring(0,9)+'...';
				      }
				   }
				   return value;
				}">详细介绍</th>
				<th data-options="field:'price',width:40,halign:'center'">价格</th>		
				<th data-options="field:'isagree',width:50,halign:'center',formatter:function(value,row,index){
				   if(value == 1){
                     return '同意';
                   }else if(value == 2){
                     return '不同意';
                     }
				}">是否同意中转</th>
				<th data-options="field:'state',width:30,halign:'center',formatter:function(value,row,index){   
                     if(value == 1){
                     return '审核中';
                   }else if(value == 2){
                     return '待售中';
                   }else if(value == 3){
                     return '交易中转';
                   }else if(value == 4){
                     return '已售罄';
                   }else if(value == 5){
                     return '下架';
                   }else if(value == 6){
                     return '已删除';
                     }
                }">拍卖状态</th>
             	<th data-options="field:'clicknum',width:30,halign:'center'">点击量</th>
			</tr>
		</thead>
	</table>
	<div id="updstate" class="easyui-window" data-options="title:'状态控制',iconCls:'icon-add',modal:true" style="width:300px;height:170px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="updateupdform" method="post">
				 <input type="hidden" name="id" id="updid"/>   
				<table style="line-height: 30px;">
				<tr><td>合作状态</td><td><select id="state"  name="state" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="1">审核中</option>
						<option value="2">待售中</option>
						<option value="3">交易中转</option>
						<option value="4">已售罄</option>
						<option value="5">下架</option>
						<option value="6">已删除</option>
		              </select>
		 </td></tr>	
				</table>
				</form>
			</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="updateupdform();">提交</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#updstate').window('close');">取消</a>
			</div>
		</div>
	</div>
		 <jsp:include page="../incloudUser.jsp"/>
  </body>
</html>
