<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>百宝街藏品中转管理</title>    
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
	$('#scantransfer').window('close');
	$('#updateuser').window('close');
	$('#updstate').window('close');
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

	 $('#transfertable').datagrid({
		toolbar:[{
            id:'userbtnupd',
            text:'修改交易信息',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#transfertable').datagrid('getSelected');
         	  if(row){        		  
           	       window.showModalDialog("<c:url value='/baibao/gotoupdtrasfer'/>?id="+row.id+"&version="+row.version,window,"dialogWidth=1000px;dialogHeight=870px;status:no;");
               }else{
             	  $.messager.alert('警告','请选择一条交易信息','warning');
               }
            }
           },{
            id:'transferbtnscan',
            text:'查看藏品详情',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#transfertable').datagrid('getSelected');
         	  if(row){
                window.open("http://www.wswhly.com/hyzm/BaiBao_getCollection?redirect=baibaojie/shopdetails&id="+row.collectionid);                 
               }else{
             	  $.messager.alert('警告','请选择一条藏品信息','warning');
               }
            }
           },{
            id:'transfersbtnscan',
            text:'查询发货快递信息',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#transfertable').datagrid('getSelected');   
         	  if(row){
         	  if(row.kdgs==null&&row.couriernumber==null){
         	    $.messager.alert('警告','该藏品没有发货快递信息','warning');
         	  }else{
         	   window.open("http://m.kuaidi100.com/index_all.html?type="+row.kdgs+"&postid="+row.couriernumber);  
         	  }          
              }else{
             	  $.messager.alert('警告','请选择一条藏品信息','warning');
               }
            }
           },{
            id:'collectionusbtnscan',
            text:'查询退货快递信息',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#transfertable').datagrid('getSelected');
         	  if(row){
               if(row.thkdgs==null&&row.thcouriernumber==null){
         	    $.messager.alert('警告','该藏品没有退货快递信息','warning');
         	  }else{
         	   window.open("http://m.kuaidi100.com/index_all.html?type="+row.thkdgs+"&postid="+row.thcouriernumber);  
         	  }          
              }else{
             	  $.messager.alert('警告','请选择一条藏品信息','warning');
               }
            }
           }]
	});
	});
function updateuserform(){
        $('#updateuserform').form('submit',{
            url:"<c:url value='/baibao/updtrasfer'/>",
            onSubmit:function(){
                return $(this).form('validate');
            },
            success:function(data){
                if(data == "0000"){
                	$.messager.alert('提示', "修改交易成功！", 'info',function(){
	                	document.getElementById("updateuserform").reset();
						$('#updateuser').window('close');
						$('#transfertable').datagrid('reload');
                    });
                }else{
                	$.messager.alert('警告', data, 'warning',function(){
                		document.getElementById("updateuserform").reset();
						$('#updateuser').window('close');
						$('#transfertable').datagrid('reload');
                    });
                }
            }
        });
	}
function updateupdform(){					
        $('#updateupdform').form('submit',{
            url:"<c:url value='/baibao/editsate'/>",
            onSubmit:function(){
                return $(this).form('validate');
            },       
            success:function(data){
                if(data == "0000"){
                	$.messager.alert('提示', "修改状态成功！", 'info',function(){
	                	document.getElementById("updateupdform").reset();
						$('#updstate').window('close');
						$('#transfertable').datagrid('reload');
                    });
                }else{
                	$.messager.alert('警告', data, 'warning',function(){
                		document.getElementById("updateupdform").reset();
						$('#updstate').window('close');
						$('#transfertable').datagrid('reload');
                    });
                }
            }
        });
	}

function serach(){
	$('#transfertable').datagrid('loadData',{total:0,rows:[]});
	var username = $("#usernameid").val();
	var name = $("#nameid").val();
	var shopname = $("#shopnameid").val();
	var state = $('#stateid').datebox('getValue');
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#transfertable').datagrid('load',{'username':username,'name':name,'shopname':shopname,'state':state,'begindate':sdate,'enddate':edate});
}        
</script>
  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr>
		<td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 70px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>		
		<td>商铺名称:<input id="shopnameid" name="shopname" type="text" size="10" editable="false"/></td>
		<td>买家名称:<input id="usernameid" name="username" type="text" size="10" editable="false"/></td>
		<td>藏品名称:<input id="nameid" name="name" type="text" size="10" editable="false"/></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 150px" data-options="panelHeight:'auto'">
		                <option value="">全部</option>
						<option value="1">等待买家支付</option>
						<option value="2">买家已支付 等待卖家发货</option>
						<option value="3">卖家已发货</option>
						<option value="4">买家已收货 </option>
						<option value="5">交易完成(平台已打款给卖家)</option>
						<option value="100">买家申请退货</option>
						<option value="101">卖家同意退货 </option>
						<option value="102">卖家不同意退货  </option>
						<option value="103">退货买家已发货 </option>
						<option value="104">退货卖家已收货 </option>
						<option value="105">退货完成(平台已打款给买家)</option>
						<option value="200">卖家取消订单 </option>
						<option value="201">买家取消订单</option>
						<option value="202">系统取消订单</option>
		              </select></td>
		<td>起始日期:<input id="startdate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>结束日期:<input id="enddate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>
	</table>
    <table id="transfertable" class="easyui-datagrid" data-options="url:'<c:url value="/baibao/getBaibaoTrabsferList"/>',queryParams:{'userid':'${comprehensiveid}','begindate':formatMonth(-3),'enddate':formatDay(0)},title: '百宝藏品中转表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
			    <th data-options="field:'name',width:50,halign:'center'">藏品名称</th>
				<th data-options="field:'shopname',width:40,halign:'center'">店铺名称</th>
				<th data-options="field:'shopusername',width:40,halign:'center'">卖家名称</th>				
				<th data-options="field:'username',width:40,halign:'center'">购买人</th>	
				<th data-options="field:'ordernumber',width:40,halign:'center'">订单号</th>			
				<th data-options="field:'starttime',width:40,halign:'center'">发起时间</th>		
				<th data-options="field:'agreetime',width:30,halign:'center'">确认中转时间</th>				
				<th data-options="field:'deliverytime',width:30,halign:'center'">发货时间</th>
				<th data-options="field:'receivetime',width:50,halign:'center'">确认收货时间</th>  
				<!-- <th data-options="field:'smsrecord',width:30,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				     var val='';
				      if(value.indexOf('1')>=0){
                     val+='用户申请交易中转提醒客服,';
                   }
				      if(value.indexOf('2')>=0){ 
                     val+= '用户支付提醒客服,';
                   }
				       if(value.indexOf('3')>=0){
                     val+= '卖家发货提醒客服,';
                   }
				       if(value.indexOf('4')>=0){
                     val+= '卖家申请退货提醒客服,';
                   }
				      if(value.indexOf('5')>=0){
                     val+= '申请客服介入提醒客服,';
                   }
				      if(value.indexOf('6')>=0){
                     val+= '卖家5天未发货提醒, ';
                  }
				      if(value.indexOf('100')>=0){
                     val+= '12小时未支付提醒买家 ,';
                  }
				      if(value.indexOf('101')>=0){
                     val+= '卖家发货提醒买家, ';
                  }
				      if(value.indexOf('102')>=0){
                     val+= '卖家5天为发货提醒,';
                  }
				     if(value.indexOf('200')>=0){
                     val+= '买家支付之后提醒卖家,';
                   }
                   if(value.indexOf('201')>=0){
                     val+= '2天内发货提醒,';
                  }
                  if(value.indexOf('202')>=0){
                     val+= '5天未发货提醒 ,';
                  }
                  if(value.indexOf('203')>=0){
                     val+= '买家申请延迟收货提醒卖家, ';
                  }
                  if(value.indexOf('204')>=0){
                     val+= '买家申请退货提醒卖家,';
                  }
                  if(value.indexOf('205')>=0){
                     val+= '买家确认收货提醒卖家,';
                   }
				      return val;
				   }
				   return value;
				}">短信发送记录</th>    -->
               <th data-options="field:'shopisth',width:30,halign:'center',formatter:function(value,row,index){   
                     if(value == 0){
                     return '不同意';
                   }else if(value == 1){ 
                     return '同意';
                   }
                }">是否同意退货</th>   
                
				<th data-options="field:'state',width:30,halign:'center',formatter:function(value,row,index){   
                     if(value == 1){
                     return '等待买家支付  ';
                   }else if(value == 2){ 
                     return '买家已支付 等待卖家发货';
                   }else if(value == 3){
                     return '卖家已发货 ';
                   }else if(value == 4){
                     return '买家已收货 ';
                   }else if(value == 5){
                     return '平台已打款给卖家';
                   }else if(value == 100){
                     return '买家申请退货 ';
                  }else if(value == 101){
                     return '卖家同意退货  ';
                  }else if(value == 102){
                     return '卖家不同意退货 ';
                  }else if(value == 103){
                     return '退货买家已发货';
                  }else if(value == 104){
                     return '退货卖家已收货';
                  }else if(value == 105){
                     return '退货完成,';
                  } else if(value == 200){
                     return '卖家取消订单';
                  }else if(value == 201){
                     return '买家取消订单';
                  }else if(value == 202){
                     return '系统取消订单';
                  }        
                }">状态</th>          
                <th data-options="field:'zhjzje',width:40,halign:'center'">最后结账金额</th>	 
			</tr>
		</thead>
	</table>	

		 <jsp:include page="../incloudUser.jsp"/>
  </body>
</html>
