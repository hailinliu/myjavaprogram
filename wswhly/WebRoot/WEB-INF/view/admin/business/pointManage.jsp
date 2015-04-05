<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>积分明细管理</title>
    
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
#onepointtable {border-right:1px solid blue;border-bottom:1px solid blue}
#onepointtable td{border-left:1px solid blue;border-top:1px solid blue}
</style>

<script type="text/javascript">

$(function(){
	$('#scanpoint').window('close');
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

	$('#pointtable').datagrid({
		onLoadSuccess : function() {
        onLoadSuccess();
		},
        toolbar:[{
				 id:'collectionusbtnscan',
                 text:'用户详情',
                 iconCls:'icon-search',
				handler:function(){
				var row = $('#pointtable').datagrid('getSelected');
				if(row){
				getuserinfo(row.userid);
				}else{
				$.messager.alert('警告', "请先选择用户！", 'warning');
				}
				
			    }
			},{
            id:'pointbtnscan',
            text:'积分明细详情',
            iconCls:'icon-search',
            handler:function(){
               var row = $('#pointtable').datagrid('getSelected');
               if(row){
            	  $('#oneuserid').empty().append(row.username);
              	  $('#pointid').empty().append(row.point);
 	              if (row.type == 1) {
 	                   if(row.tradetype == 1){
 	                	   $('#tradetypeid').empty().append('充值');
 	                   }else{
 	                	   $('#tradetypeid').empty().append('其他');
 	                   }
 	              } else if (row.type == 2) {
 	                   if(row.tradetype == 1){
 	                     $('#tradetypeid').empty().append('报名');
 	                   }else if(row.tradetype == 3){
	                     $('#onetradetypeid').empty().append('拍品征集');
	                   }else{
 	                	 $('#tradetypeid').empty().append('其他');
 	                   }
 	              } else {
 	              	 $('#tradetypeid').empty().append('其他');
 	              }
              	  $('#tradedateid').empty().append(row.tradedate);
              	  $('#leftpointsid').empty().append(row.leftpoints);
              	  if (row.state == 1) {
              		 $('#onestateid').empty().append('正常');
                   } else {
                 	 $('#onestateid').empty().append('删除');
                   }
              	  $('#noteid').empty().append(row.note);
             	  $('#scanpoint').window('open');
               }else{
             	  $.messager.alert('警告','请选择一条信息','warning');
               }
            }
           },{
            id:'pointbtndel',
            text:'删除积分明细',
            iconCls:'icon-cancel',
            handler:function(){
         	  var row = $('#pointtable').datagrid('getSelected');
         	  if(row){
         		 if (row.state == 2){
            		 $.messager.alert('警告','该信息已被删除','warning');
                 } else {
	         		 $.messager.confirm('提示', '确定要删除此信息？', function(r){
	       		         if (r){
	       		        	delpoint(row.id);
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
	                },

	                formatResult: function(row, i, max) {
	                     return row.username;
	                }                 
	             });

	$('#pointtable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');
});

function serach(){
	$('#pointtable').datagrid('loadData',{total:0,rows:[]});
	var userid = $("#useridid").val();
	var username = $("#usernameid").val();
	var state = $("#stateid").combobox("getValue");
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#pointtable').datagrid('load',{'userid':userid,'username':username,'state':state,'begindate':sdate,'enddate':edate});
}

function delpoint(value){
	$.ajax({
        type:'post',
        url:'<c:url value="/business/delPoint"/>',
        data:'id='+value,
        success:function(data){
           if(data == '0000'){
          	 $.messager.alert('提示', "删除成功！", 'info',function(){
          		$('#pointtable').datagrid('reload');
               });
           }else{
          	 $.messager.alert('提示', data, 'warning',function(){
          		$('#pointtable').datagrid('reload');
               });
           }
        }
     });
}
 function onLoadSuccess() {
            //添加“合计”列
            $('#pointtable').datagrid('appendRow', {
                username: '合计',
                points: compute("points"),
				leftpoints: compute("leftpoints")
            });
        }
        //指定列求和
        function compute(colName) {
            var rows = $('#pointtable').datagrid('getRows');
            var total = 0;
            for (var i = 0; i < rows.length; i++) {
                total += parseFloat(rows[i][colName]);
            }
            return total;
        }
		
</script>

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr><td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'"> <option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
		<td>用户ID:<input id="useridid" name="userid" type="text" size="10" editable="false"/></td>
		<td>用户名:<input id="usernameid" name="username" type="text" size="10" editable="false"/></td>
		<td>起始日期:<input id="startdate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>结束日期:<input id="enddate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">正常</option>
						<option value="2">删除</option>
		              </select></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="pointtable" class="easyui-datagrid" data-options="url:'<c:url value="/business/getPointList"/>',queryParams:{'userid':'${comprehensiveid}','begindate':formatMonth(-3),'enddate':formatDay(0)},title: '积分明细管理',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'username',width:30,halign:'center'">用户名</th>
				<th align="right" data-options="field:'points',width:30,halign:'center'">积分</th>
				<th data-options="field:'tradetype',width:30,halign:'center',formatter:function(value,row,index){
                   if (row.type == 1) {
	                   if(value == 1){
	                     return '充值';
	                   }else if(value == 3){
	                     return '拍品征集';
	                   }else{
	                     return '其他';
	                   }
                   } else if (row.type == 2) {
                       if(value == 4){
	                     return '海选报名';
	                   }else if(value == 2){
	                     return '会员升级';
	                   }else if(value == 3){
	                     return '拍品征集';
	                   }else if(value == 5){
	                     return '交易中转';
	                   }else if(value == 6){
	                     return '拍品征集鉴定';
	                   }else{
	                     return '其他';
	                   }
                   } else {
                       return '其他';
                   }
                }">交易类型</th>
				<th data-options="field:'tradedate',width:30,halign:'center'">交易时间</th>
				<th data-options="field:'type',width:20,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '获取';
                   }else if(value == 2){
                     return '扣除';
                   }else{
                     return '其他';
                   }
                }">获取与扣除</th>
				<th align="right" data-options="field:'leftpoints',width:50,halign:'center'">剩余积分</th>
				<th data-options="field:'note',width:50,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 10){
				         return value.substring(0,10)+'...';
				      }
				   }
				   return value;
				}">备注</th>
				<th data-options="field:'state',width:20,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '正常';
                   }else if(value == 2){
                     return '删除';
                   }
                }">状态</th>
			</tr>
		</thead>
	</table>
	
	<!-- 查看积分明细详情内容 -->
	<div id="scanpoint" class="easyui-window" data-options="title:'积分明细详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="onepointtable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td>用户名：</td>
			    <td id="oneuserid" align="right"></td>
			    <td>积分：</td>
			    <td id="pointid" align="right"></td>
			  </tr>
			  <tr>
			    <td>交易类型：</td>
			    <td id="tradetypeid" align="right"></td>
			    <td>交易时间：</td>
			    <td id="tradedateid" align="right"></td>
			  </tr>
			  <tr>
			    <td>剩余积分：</td>
			    <td id="leftpointsid" align="right"></td>
			    <td>状态：</td>
			    <td id="onestateid" align="right"></td>
			  </tr>
			  <tr>
			    <td colspan="4" id="noteid" align="center"></td>
			  </tr>
			</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanpoint').window('close');">关闭</a>
		</div>
	  </div>
	</div>
	 <jsp:include page="../incloudUser.jsp"/>
  </body>
  
</html>
