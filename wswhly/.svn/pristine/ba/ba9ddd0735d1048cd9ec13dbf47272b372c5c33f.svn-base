<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>订单管理</title>
    
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
#oneordertable {border-right:1px solid blue;border-bottom:1px solid blue}
#oneordertable td{border-left:1px solid blue;border-top:1px solid blue}
</style>

<script type="text/javascript">

$(function(){
	$('#scanorder').window('close');

	$('#ordertable').datagrid({
		onLoadSuccess : function() {
        onLoadSuccess();
		},
        toolbar:[{
				 id:'collectionusbtnscan',
                 text:'用户详情',
                 iconCls:'icon-search',
				handler:function(){
				var row = $('#ordertable').datagrid('getSelected');
				if(row){
				getuserinfo(row.userid);
				}else{
				$.messager.alert('警告', "请先选择用户！", 'warning');
				}
				
			    }
			},{
            id:'orderbtnscan',
            text:'订单详情',
            iconCls:'icon-search',
            handler:function(){
               var row = $('#ordertable').datagrid('getSelected');
               if(row){
             	  $('#oneuserid').empty().append(row.username);
             	  $('#onemoneyid').empty().append('￥ '+row.money);
             	  if (row.type == 1) {
	                   if(row.tradetype == 1){
	                	   $('#onetradetypeid').empty().append('充值');
	                   }else{
	                	   $('#onetradetypeid').empty().append('其他');
	                   }
                  } else if (row.type == 2) {
                     if(row.tradetype == 1){
	                     $('#onetradetypeid').empty().append('报名');
	                   }else if(row.tradetype == 3){
	                     $('#onetradetypeid').empty().append('拍品征集');
	                   }else{
	                	 $('#onetradetypeid').empty().append('其他');
	                   }
                  } else {
                	 $('#onetradetypeid').empty().append('其他');
                  }
             	  $('#oneordernumid').empty().append(row.ordernum);
             	  $('#createdateid').empty().append(row.createdate);
             	  if (row.paytype == 1) {
             		 $('#onepaytypeid').empty().append('支付宝');
                  } else if (row.paytype == 2) {
             		 $('#onepaytypeid').empty().append('财付通');
                  } else {
                	 $('#onepaytypeid').empty().append('其他');
                  }
             	  $('#leftmoneyid').empty().append('￥'+row.leftmoney);
             	  if (row.state == 0) {
             	    $('#onestateid').empty().append('未支付');
                  } else if (row.state == 1) {
             	    $('#onestateid').empty().append('已支付');
                  } else {
             	    $('#onestateid').empty().append('已删除');
                  }
             	  $('#trade_noid').empty().append(row.trade_no);
             	  $('#trade_statusid').empty().append(row.trade_status);
             	  $('#scanorder').window('open');
               }else{
             	  $.messager.alert('警告','请选择一条订单信息','warning');
               }
            }
           },{
            id:'orderbtndel',
            text:'删除订单',
            iconCls:'icon-cancel',
            handler:function(){
         	  var row = $('#ordertable').datagrid('getSelected');
         	  if(row){
         		 if (row.issend == 2){
            		 $.messager.alert('警告','该订单信息已被删除','warning');
                 } else {
	         		 $.messager.confirm('提示', '确定要删除此订单信息？', function(r){
	       		         if (r){
	       		        	delorder(row.id);
	       		         }
	       		     });
                 }
         	  }else{
         		  $.messager.alert('警告','请选择一条订单信息','warning');
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

	$('#ordertable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');
});

function serach(){
	$('#ordertable').datagrid('loadData',{total:0,rows:[]});
	var userid = $("#useridid").val();
	var username = $("#usernameid").val();
	var money = $("#moneyid").val();
	var tradetype = $("#tradetypeid").combobox("getValue");
	var ordernum = $("#ordernumid").val();
	var orderno = $("#ordernoid").val();
	var paytype = $("#paytypeid").combobox("getValue");
	$('#ordertable').datagrid('load',{'userid':userid,'username':username,'money':money,'tradetype':tradetype,'ordernum':ordernum,'orderno':orderno,'paytype':paytype});
}

function delorder(value){
	$.ajax({
        type:'post',
        url:'<c:url value="/business/delOrder"/>',
        data:'id='+value,
        success:function(data){
           if(data == '0000'){
          	 $.messager.alert('提示', "删除成功！", 'info',function(){
          		$('#ordertable').datagrid('reload');
               });
           }else{
          	 $.messager.alert('提示', data, 'warning',function(){
          		$('#ordertable').datagrid('reload');
               });
           }
        }
     });
}
 function onLoadSuccess() {
            //添加“合计”列
            $('#ordertable').datagrid('appendRow', {
                username: '合计',
                money: compute("money"),
				leftmoney: compute("leftmoney")
            });
        }
        //指定列求和
        function compute(colName) {
            var rows = $('#ordertable').datagrid('getRows');
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
		<tr>
		<td>用户ID:<input id="useridid" name="userid" type="text" size="10" editable="false"/></td>
		<td>用户名:<input id="usernameid" name="username" type="text" size="10" editable="false"/></td>
		<td>金额:<input id="moneyid" name="money" type="text" size="10" editable="false"/></td>
		<td>交易类型:<select id="tradetypeid" name="tradetype" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">充值</option>
						<option value="2">其他</option>
					
		              </select></td>
		<td>订单号:<input id="ordernumid" name="ordernum" type="text" size="10" editable="false"/></td>
		<td>网关订单号:<input id="ordernoid" name="orderno" type="text" size="10" editable="false"/></td>
		<td>网关途径:<select id="paytypeid" name="paytype" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">支付宝</option>
						<option value="2">财付通</option>
						<option value="3">其他</option>
		              </select></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="ordertable" class="easyui-datagrid" data-options="url:'<c:url value="/business/getOrderList"/>',queryParams:{'userid':'${comprehensiveid}','begindate':formatMonth(-3),'enddate':formatDay(0)},title: '订单管理',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'username',width:30,halign:'center'">用户名</th>
				<th align="right" data-options="field:'money',width:20,halign:'center',formatter:function(value,row,index){
				   if(value != '' && value != null && value != undefined){
                      return '￥'+value.toFixed(2);
                   }
				}">金额</th>
				<th data-options="field:'tradetype',width:20,halign:'center',formatter:function(value,row,index){
                   if (row.type == 1) {
	                   if(value == 1){
	                     return '充值';
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
				<th data-options="field:'ordernum',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 14){
				         return value.substring(0,14)+'...';
				      }
				   }
				   return value;
				}">订单号</th>
				<th data-options="field:'createdate',width:40,halign:'center'">订单时间</th>
				<th data-options="field:'paytype',width:20,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '支付宝';
                   }else if(value == 2){
                     return '财付通';
                   }else{
                     return '其他';
                   }
                }">网关途径</th>
				<th data-options="field:'paymodel',width:20,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '网站支付';
                   }else if(value == 2){
                     return '手机支付';
                   }else{
                     return '其他';
                   }
                }">支付模式</th>
				<th align="right" data-options="field:'leftmoney',width:20,halign:'center',formatter:function(value,row,index){
				   if(value != '' && value != null && value != undefined){
                      return '￥'+value.toFixed(2);
                   }
				}">剩余金额</th>
				<th data-options="field:'type',width:20,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '获取';
                   }else if(value == 2){
                     return '扣除';
                   }else{
                     return '其他';
                   }
                }">获取与扣除</th>
				<th data-options="field:'trade_no',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 14){
				         return value.substring(0,14)+'...';
				      }
				   }
				   return value;
				}">网关订单号</th>
				<th data-options="field:'trade_status',width:30,halign:'center'">网关状态</th>
				<th data-options="field:'state',width:20,halign:'center',formatter:function(value,row,index){
                   if(value == 0){
                     return '未支付';
                   }else if(value == 1){
                     return '已支付';
                   }else{
                     return '已删除';
                   }
                }">状态</th>
			</tr>
		</thead>
	</table>
	
	<!-- 查看订单详情内容 -->
	<div id="scanorder" class="easyui-window" data-options="title:'订单详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="oneordertable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td width="15%">用户名：</td>
			    <td width="35%" id="oneuserid" align="right"></td>
			    <td width="15%">金额：</td>
			    <td width="35%" id="onemoneyid" align="right"></td>
			  </tr>
			  <tr>
			    <td>交易类型：</td>
			    <td id="onetradetypeid" align="right"></td>
			    <td>交易订单号：</td>
			    <td id="oneordernumid" align="right"></td>
			  </tr>
			  <tr>
			    <td>订单时间：</td>
			    <td id="createdateid" align="right"></td>
			    <td>网关途径：</td>
			    <td id="onepaytypeid" align="right"></td>
			  </tr>
			  <tr>
			    <td>剩余金额：</td>
			    <td id="leftmoneyid" align="right"></td>
			    <td>状态：</td>
			    <td id="onestateid" align="right"></td>
			  </tr>
			  <tr>
			    <td>网关订单号：</td>
			    <td id="trade_noid" align="right"></td>
			    <td>网关状态：</td>
			    <td id="trade_statusid" align="right"></td>
			  </tr>
			</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanorder').window('close');">关闭</a>
		</div>
	  </div>
	</div>
	 <jsp:include page="../incloudUser.jsp"/>
  </body>
  
</html>
