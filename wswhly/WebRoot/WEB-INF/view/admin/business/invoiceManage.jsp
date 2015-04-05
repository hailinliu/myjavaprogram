<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>发票管理</title>
    
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
#oneinvoicetable {border-right:1px solid blue;border-bottom:1px solid blue}
#oneinvoicetable td{border-left:1px solid blue;border-top:1px solid blue}
</style>

<script type="text/javascript">

$(function(){
	$('#scaninvoice').window('close');
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

	$('#invoicetable').datagrid({
        toolbar:[{
				 id:'collectionusbtnscan',
                 text:'用户详情',
                 iconCls:'icon-search',
				handler:function(){
				var row = $('#invoicetable').datagrid('getSelected');
				if(row){
				getuserinfo(row.userid);
				}else{
				$.messager.alert('警告', "请先选择用户！", 'warning');
				}
				
			    }
			},{
            id:'invoicebtnscan',
            text:'发票详情',
            iconCls:'icon-search',
            handler:function(){
               var row = $('#invoicetable').datagrid('getSelected');
               if(row){
             	  $('#invoicenameid').empty().append(row.invoicename);
             	  $('#recipientid').empty().append(row.recipient);
             	  $('#mobileid').empty().append(row.mobile);
             	  $('#codeid').empty().append(row.code);
             	  $('#addressid').empty().append(row.address);
             	  $('#oneusernamesid').empty().append(row.username);
             	  $('#createdateid').empty().append(row.createdate);
             	  $('#ordernumid').empty().append(row.ordernum);
             	  $('#noteid').empty().append(row.note);
             	  if (row.issend == 0) {
             	    $('#onestateid').empty().append('未发送');
                  } else if (row.issend == 1) {
             	    $('#onestateid').empty().append('已发送');
                  } else {
             	    $('#onestateid').empty().append('已删除');
                  }
             	  $('#scaninvoice').window('open');
               }else{
             	  $.messager.alert('警告','请选择一条发票信息','warning');
               }
            }
           },{
            id:'invoicebtndeal',
            text:'发票发送',
            iconCls:'icon-ok',
            handler:function(){
        	   var row = $('#invoicetable').datagrid('getSelected');
	           if(row){
	          	 if (row.issend == 2){
	             	$.messager.alert('警告','该发票信息已被删除','warning');
	             } else {
		            if (row.issend == 1) {
		            	$.messager.alert('警告','该发票已发送','warning');
			        } else {
		 	         	$.messager.confirm('提示', '确定要修改发票状态？', function(r){
	 	       		         if (r){
	 	       		        	dealinvoice(row.id);
	 	       		         }
		 	       		});
			        }
	             }
	           }else{
	          		$.messager.alert('警告','请选择一条发票信息','warning');
              }
            } 
           },{
            id:'invoicebtndel',
            text:'删除发票',
            iconCls:'icon-cancel',
            handler:function(){
         	  var row = $('#invoicetable').datagrid('getSelected');
         	  if(row){
         		 if (row.issend == 2){
            		 $.messager.alert('警告','该发票信息已被删除','warning');
                 } else {
	         		 $.messager.confirm('提示', '确定要删除此发票信息？', function(r){
	       		         if (r){
	       		        	delinvoice(row.id);
	       		         }
	       		     });
                 }
         	  }else{
         		  $.messager.alert('警告','请选择一条发票信息','warning');
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
	                },

	                formatResult: function(row, i, max) {
	                     return row.username;
	                }                 
	             });

	$('#invoicetable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');
});

function serach(){
	$('#invoicetable').datagrid('loadData',{total:0,rows:[]});
	var userid = $("#useridid").val();
	var username = $("#usernameid").val();
	var state = $("#stateid").combobox("getValue");
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#invoicetable').datagrid('load',{'userid':userid,'username':username,'state':state,'begindate':sdate,'enddate':edate});
}

function dealinvoice(id){
	$.ajax({
        type:'post',
        url:'<c:url value="/business/updateInvoiceState"/>',
        data:'id='+id,
        success:function(data){
           if(data == '0000'){
          	 $.messager.alert('提示', "修改发票状态成功！", 'info',function(){
          		$('#invoicetable').datagrid('reload');
             });
           }else{
          	 $.messager.alert('提示', data, 'warning',function(){
          		$('#invoicetable').datagrid('reload');
             });
           }
        }
     });
}

function delinvoice(value){
	$.ajax({
        type:'post',
        url:'<c:url value="/business/delInvoice"/>',
        data:'id='+value,
        success:function(data){
           if(data == '0000'){
          	 $.messager.alert('提示', "删除成功！", 'info',function(){
          		$('#invoicetable').datagrid('reload');
               });
           }else{
          	 $.messager.alert('提示', data, 'warning',function(){
          		$('#invoicetable').datagrid('reload');
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
						<option value="-1">全部</option>
						<option value="0">未邮寄</option>
						<option value="1">已邮寄</option>
						<option value="2">已删除</option>
		              </select></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="invoicetable" class="easyui-datagrid" data-options="url:'<c:url value="/business/getInvoiceList"/>',queryParams:{'userid':'${comprehensiveid}','begindate':formatMonth(-3),'enddate':formatDay(0)},title: '发票管理',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'username',width:30,halign:'center'">用户名</th>
				<th data-options="field:'invoicename',width:30,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 7){
				         return value.substring(0,7)+'...';
				      }
				   }
				   return value;
				}">发票名</th>
				<th data-options="field:'recipient',width:30,halign:'center'">接收人</th>
				<th data-options="field:'mobile',width:30,halign:'center'">手机号</th>
				<th data-options="field:'code',width:20,halign:'center'">邮编</th>
				<th data-options="field:'address',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 7){
				         return value.substring(0,7)+'...';
				      }
				   }
				   return value;
				}">地址</th>
				<th data-options="field:'createdate',width:50,halign:'center'">订单时间</th>
				<th data-options="field:'ordernum',width:40,halign:'center'">订单号</th>
				<th data-options="field:'note',width:30,halign:'center'">备注</th>
				<th data-options="field:'issend',width:20,halign:'center',formatter:function(value,row,index){
                   if(value == 0){
                     return '未邮寄';
                   }else if(value == 1){
                     return '已邮寄';
                   }else{
                     return '已删除';
                   }
                }">状态</th>
			</tr>
		</thead>
	</table>
	
	<!-- 查看发票详情内容 -->
	<div id="scaninvoice" class="easyui-window" data-options="title:'发票详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="oneinvoicetable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td colspan="2" id="invoicenameid" align="center"></td>
			  </tr>
			  <tr>
			    <td>接收人：</td>
			    <td id="recipientid" align="right"></td>
			  </tr>
			  <tr>
			    <td>手机号：</td>
			    <td id="mobileid" align="right"></td>
			  </tr>
			  <tr>
			    <td>邮编：</td>
			    <td id="codeid" align="right"></td>
			  </tr>
			  <tr>
			    <td>地址：</td>
			    <td id="addressid" align="right"></td>
			  </tr>
			  <tr>
			    <td>用户名：</td>
			    <td id="oneusernamesid" align="right"></td>
			  </tr>
			  <tr>
			    <td>状态：</td>
			    <td id="onestateid" align="right"></td>
			  </tr>
			  <tr>
			    <td>订单时间：</td>
			    <td id="createdateid" align="right"></td>
			  </tr>
			  <tr>
			    <td>订单号：</td>
			    <td id="ordernumid" align="right"></td>
			  </tr>
			  <tr>
			    <td id="noteid" colspan="2"></td>
			  </tr>
			</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scaninvoice').window('close');">关闭</a>
		</div>
	  </div>
	</div>
	 <jsp:include page="../incloudUser.jsp"/>
  </body>
  
</html>
