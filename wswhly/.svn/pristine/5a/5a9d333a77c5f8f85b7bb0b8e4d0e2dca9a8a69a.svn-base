<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改藏品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/default/easyui.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/icon.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/default.css"/>">
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/swfupload.queue.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/fileprogress.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/swfupload/handlers.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery-1.8.0.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.easyui.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/locale/easyui-lang-zh_CN.js"/>"></script>
	<script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "<c:url value='/ueditor/'/>";
    </script>
	<script type="text/javascript" src="<c:url value="/ueditor/ueditor.config.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/ueditor/ueditor.all.min.js"/>"></script>
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
$(document).ready(function(){
	$('#state').combobox('setValue', '${baibaotransfer.state}');
});
function formsubmit(){	
	$('#editbaibaotransferform').form('submit', {	
		url: "<c:url value='/baibao/updtrasfer'/>",		
		onSubmit: function() {
			return $(this).form('validate');
		},	
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "修改商家成功！", 'info',function(){
					document.getElementById("editbaibaotransferform").reset();
				    window.dialogArguments.$('#transfertable').datagrid('reload');
					window.close();
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}
</script>
</head>
  
  <body>
   <form id="editbaibaotransferform" method="post">
	   <input type="hidden" name="id" value="${baibaotransfer.id}"/>
	   <input name="version" type="hidden" value="${baibaotransfer.version}"/>
	   <table id="onebaibaotransfer" width="100%" border="0" align="center" cellpadding="10" cellspacing="10" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
			  <tr><td> 状态: </td><td><select id="state"  value="${baibaotransfer.state}" name="state" class="easyui-combobox" editable="false" style="width: 200px" data-options="panelHeight:'auto'">
						<option value="1">等待买家支付</option>
						<option value="2">买家已支付 等待卖家发货</option>
						<option value="3">卖家已发货</option>
						<option value="4">买家已收货 </option>
						<option value="5">发货完成（平台已打款给卖家）</option>
						<option value="100">买家申请退货</option>
						<option value="101">卖家同意退货 </option>
						<option value="102">卖家不同意退货  </option>
						<option value="103">退货买家已发货 </option>
						<option value="104">退货卖家已收货 </option>
						<option value="105">退货完成 （平台已打款给买家） </option>
						<option value="200">卖家取消订单 </option>
						<option value="201">买家取消订单</option>
						<option value="202">系取消订单</option>
		              </select></td></tr>	
		        <tr><td>发起时间：</td><td><input value="${baibaotransfer.starttime}" name="starttime"  type="text"  class="easyui-datetimebox" editable="false"/></td></tr>	
			    <tr><td>支付时间：</td><td><input value="${baibaotransfer.paytime}" name="paytime"  type="text"  class="easyui-datetimebox" editable="false"/></td></tr>
				<tr><td>提醒买家支付时间：</td><td><input value="${baibaotransfer.txmjfhtime}" name="txmjfhtime"  type="text" class="easyui-datetimebox" editable="false"/></td></tr>
				<tr><td>订单到期时间：</td><td><input value="${baibaotransfer.dddqtime}" name="dddqtime"  type="text"  class="easyui-datetimebox" editable="false"/></td></tr>
				<tr><td>发货时间：</td><td><input value="${baibaotransfer.deliverytime}" name="deliverytime"  type="text"  class="easyui-datetimebox" editable="false"/></td></tr>
				<tr><td>取消订单时间：</td><td><input value="${baibaotransfer.wfhtime}" name="wfhtime"  type="text" class="easyui-datetimebox" editable="false"/></td></tr>
				<tr><td>平台打款给卖方时间：</td><td><input value="${baibaotransfer.syspaytime}" name="syspaytime"  type="text"  class="easyui-datetimebox" editable="false"/></td></tr>
				<tr><td>买家申请退货时间：</td><td><input value="${baibaotransfer.applyreturntime}" name="applyreturntime"  type="text"  class="easyui-datetimebox" editable="false"/></td></tr>
				<tr><td>发货信息：</td></tr>				
				<tr><td>快递公司:</td><td><input value="${baibaotransfer.kdgs}" name="kdgs" class="easyui-validatebox" maxlength="18" type="text"></td></tr>
				<tr><td>快递单号:</td><td><input value="${baibaotransfer.couriernumber}" name="couriernumber" class="easyui-validatebox" maxlength="18" type="text"></td></tr>
				<tr><td>收件人:</td><td><input value="${baibaotransfer.consignee}" name="consignee" class="easyui-validatebox" maxlength="18" type="text"></td></tr>
				<tr><td>收件人手机:</td><td><input value="${baibaotransfer.consigneemobile}" name="consigneemobile" class="easyui-validatebox" maxlength="18" type="text"></td></tr>
				<tr><td>收件人地址:</td><td><textarea  name="consigneeaddress" class="easyui-validatebox" style="width:340px;height:100px">${baibaotransfer.consigneeaddress}</textarea></td></tr>				
				<tr><td>退货信息（需要退货时填写）：</td></tr>
				<tr><td>退货快递公司:</td><td><input value="${baibaotransfer.thkdgs}" name="thkdgs" class="easyui-validatebox" maxlength="18" type="text"></td></tr>
				<tr><td>退货订单号:</td><td><input value="${baibaotransfer.thcouriernumber}"name="thcouriernumber" class="easyui-validatebox" maxlength="18" type="text"></td></tr>
				<tr><td>退货收件人:</td><td><input value="${baibaotransfer.thconsignee}" name="thconsignee" class="easyui-validatebox" maxlength="18" type="text"></td></tr>
				<tr><td>退货收件人手机:</td><td><input value="${baibaotransfer.thconsigneemobile}" name="thconsigneemobile" class="easyui-validatebox" maxlength="18" type="text"></td></tr>
				<tr><td>退货收件人地址:</td><td><textarea  name="thconsigneeaddress" class="easyui-validatebox" style="width:340px;height:100px">${baibaotransfer.thconsigneeaddress}</textarea></td></tr>
				<tr><td>退货卖家确认时间：</td><td><input value="${baibaotransfer.thmjqrtime}" name="thmjqrtime"  type="text"  class="easyui-datetimebox" editable="false"/></td></tr>
				<tr><td>平台打款到买方时间：</td><td><input value="${baibaotransfer.dkdmftime}" name="dkdmftime"  type="text"  class="easyui-datetimebox" editable="false"/></td></tr>
		</table>
	</form>
	<div style="text-align:right;padding:5px 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="formsubmit();">修改</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="window.close();">返回</a>
       </div>
       
  </body>
</html>
