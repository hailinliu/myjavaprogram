<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>线下转款管理</title>
    
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
		#addrole input{
		    width:200px;
			border:1px solid #ccc;
			padding:2px;
		}
		#updaterole input{
		    width:200px;
			border:1px solid #ccc;
			padding:2px;
		}
		TD {
	FONT: 12px 微软雅黑
}
#oneofflinetable {border-right:1px solid blue;border-bottom:1px solid blue}
#oneofflinetable td{border-left:1px solid blue;border-top:1px solid blue}
</style>

<script type="text/javascript">

$(function(){
	$('#scanoffline').window('close');
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

	$('#offlinetable').datagrid({
        toolbar:[{
				 id:'collectionusbtnscan',
                 text:'用户详情',
                 iconCls:'icon-search',
				handler:function(){
				var row = $('#offlinetable').datagrid('getSelected');
				if(row){
				getuserinfo(row.userid);
				}else{
				$.messager.alert('警告', "请先选择用户！", 'warning');
				}
				
			    }
			},{
            id:'offlinebtnscan',
            text:'转款详情',
            iconCls:'icon-search',
            handler:function(){
               var row = $('#offlinetable').datagrid('getSelected');
               if(row){
             	  $('#uploaddateid').empty().append(row.createdate);
             	  $('#rechargemoneyid').empty().append(row.money);
             	  $('#rechargeuserid').empty().append(row.username);
             	  if (row.state == 1) {
             	    $('#rechargestateid').empty().append('未处理');
                  } else if (row.state == 2) {
             	    $('#rechargestateid').empty().append('已处理');
                  } else {
             	    $('#rechargestateid').empty().append('删除');
                  }
             	  $('#rechargeimageid').empty().append('<img src="<c:url value="/offline/'+row.imgurl+'"/>" width="600"/>');
             	  $('#scanoffline').window('open');
               }else{
             	  $.messager.alert('警告','请选择一条信息','warning');
               }
            }
           },{
            id:'offlinebtndeal',
            text:'转款处理',
            iconCls:'icon-ok',
            handler:function(){
        	   var row = $('#offlinetable').datagrid('getSelected');
	           if(row){
	          	 if (row.state == 3){
	             	$.messager.alert('警告','该信息已被删除','warning');
	             } else {
		            if (row.state == 2) {
		            	$.messager.alert('警告','该信息已被处理','warning');
			        } else {
		 	         	$.messager.confirm('提示', '确定要处理此信息？', function(r){
	 	       		         if (r){
	 	       		        	dealOffline(row.id, row.money, row.userid);
	 	       		         }
		 	       		});
			        }
	             }
	           }else{
	          		$.messager.alert('警告','请选择一条信息','warning');
              }
            } 
           },{
            id:'offlinebtndel',
            text:'删除信息',
            iconCls:'icon-cancel',
            handler:function(){
         	  var row = $('#offlinetable').datagrid('getSelected');
         	  if(row){
         		 if (row.state == 3){
            		 $.messager.alert('警告','该信息已被删除','warning');
                 } else {
	         		 $.messager.confirm('提示', '确定要删除此信息？', function(r){
	       		         if (r){
	       		        	deloffline(row.id);
	       		         }
	       		     });
                 }
         	  }else{
         		  $.messager.alert('警告','请选择一条信息','warning');
              }
            }
           }]
		});

	//objects为json数据源对象
	$('#usernameid').autocomplete('<c:url value="/sys/autouser"/>', 
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
			                   value: row.username,
			                   result: row.username
			               }
			           }
			           );
	                },
	                formatItem: function (row, i, max) {
	                    return "<table width='97%'><tr><td align='left'>用户名：" + row.username + "</td><td align='right'>手机号：" + row.mobile + "</td></tr></table>";
	                    //return  row.name;
	                }, 
	                formatMatch: function(row, i, max){ 
	                     return row.username;
	                } ,

	                formatResult: function(row, i, max) {
	                     return row.username;
	                }                 
	             });

	$('#offlinetable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');
});

function serach(){
	$('#offlinetable').datagrid('loadData',{total:0,rows:[]});
	var userid = $("#useridid").val();
	var username = $("#usernameid").val();
	var state = $("#stateid").combobox("getValue");
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#offlinetable').datagrid('load',{'userid':userid,'username':username,'state':state,'begindate':sdate,'enddate':edate});
}

function dealOffline(id, money, userid){
	$.ajax({
        type:'post',
        url:'<c:url value="/business/dealOffLine"/>',
        data:'id='+id+'&money='+money+'&userid='+userid,
        success:function(data){
           if(data == '0000'){
          	 $.messager.alert('提示', "处理线下转款成功！", 'info',function(){
          		$('#offlinetable').datagrid('reload');
             });
           }else{
          	 $.messager.alert('提示', data, 'warning',function(){
          		$('#offlinetable').datagrid('reload');
             });
           }
        }
     });
}

function deloffline(value){
	$.ajax({
        type:'post',
        url:'<c:url value="/business/delOffLine"/>',
        data:'id='+value,
        success:function(data){
           if(data == '0000'){
          	 $.messager.alert('提示', "删除成功！", 'info',function(){
          		$('#offlinetable').datagrid('reload');
               });
           }else{
          	 $.messager.alert('提示', data, 'warning',function(){
          		$('#offlinetable').datagrid('reload');
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
		<td>用户ID:<input id="useridid" name="userid" type="text" size="10" editable="false"/></td>
		<td>用户名:<input id="usernameid" name="username" type="text" size="10" editable="false"/></td>
		<td>起始日期:<input id="startdate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>结束日期:<input id="enddate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">未处理</option>
						<option value="2">已处理</option>
						<option value="3">删除</option>
		              </select></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="offlinetable" class="easyui-datagrid" data-options="url:'<c:url value="/business/getOffLinePayList"/>',queryParams:{'userid':'${comprehensiveid}','begindate':formatMonth(-3),'enddate':formatDay(0)},title: '线下转款管理',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'money',width:30,halign:'center'">金额</th>
				<th data-options="field:'createdate',width:60,halign:'center'">上传日期</th>
				<th data-options="field:'imgurl',width:25,halign:'center',formatter:function(value,row,index){
				   var imgurl = value.split(',');
				   return '&lt;img src=<c:url value="/offline/small/"/>'+imgurl[0]+' height=20 /&gt;';
				}">凭条或凭证图片</th>
				<th data-options="field:'username',width:30,halign:'center'">用户名</th>
				<th data-options="field:'state',width:15,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '未处理';
                   }else if(value == 2){
                     return '已处理';
                   }else{
                     return '删除';
                   }
                }">状态</th>
			</tr>
		</thead>
	</table>
	
	<!-- 查看转款详情内容 -->
	<div id="scanoffline" class="easyui-window" data-options="title:'转款详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="oneofflinetable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td width="30%">上传时间：</td>
			    <td id="uploaddateid" align="right"></td>
			  </tr>
			  <tr>
			    <td>转账金额：</td>
			    <td id="rechargemoneyid" align="right"></td>
			  </tr>
			  <tr>
			    <td>用户：</td>
			    <td id="rechargeuserid" align="right"></td>
			  </tr>
			  <tr>
			    <td>处理状态：</td>
			    <td id="rechargestateid" align="right"></td>
			  </tr>
			  <tr>
			    <td id="rechargeimageid" colspan="2"></td>
			  </tr>
			</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanoffline').window('close');">关闭</a>
		</div>
	  </div>
	</div>
		 <jsp:include page="../incloudUser.jsp"/>
  </body>
  
</html>
