<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>短信管理</title>
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

	$('#messagetable').datagrid({
          toolbar:[{
              id:'messagebtnscan',
              text:'查看短信',
              iconCls:'icon-search',
              handler:function(){
                 var row = $('#messagetable').datagrid('getSelected');
                 if(row){
               	  $('#onemobileid').empty().append(row.mobile);
               	  $('#onecreatetimeid').empty().append(row.createtime);
               	  if (row.state == '0') {
               	  	$('#onestateid').empty().append('成功');
                  } else {
               	  	$('#onestateid').empty().append('失败');
                  }
               	  $('#onetimesid').empty().append(row.times);
               	  $('#onebacktimeid').empty().append(row.backtime);
               	  $('#oneaccountcountid').empty().append(row.accountcount);
               	  $('#onecontentid').empty().append(row.content);
               	  $('#scanmessage').window('open');
                 }else{
               	  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
              id:'messagebtnadd',
              text:'发送短信',
              iconCls:'icon-add',
              handler:function(){
                 location.href = "<c:url value='/message/gotoaddmessage'/>";
              } 
             },{
                 id:'vipmessagebtnmanage',
                 text:'会员短信管理',
                 iconCls:'icon-redo',
                 handler:function(){
                    location.href = "<c:url value='/message/gotovipmessage'/>";
                 } 
             }]
	});
	$('#messagetable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');

});
	
	function serach(){
	$('#messagetable').datagrid('loadData',{total:0,rows:[],footer:[]});
		var mobile = $("#mobileid").val();
	    var state = $("#stateid").combobox("getValue");
		var sdate = $('#startdate').datebox('getValue');
		var edate = $('#enddate').datebox('getValue');
		if(edate == "" || sdate == ""){
			$.messager.alert('警告','请输入查询日期!','warning');
			return false;
		}
		$('#messagetable').datagrid('load',{'mobile':mobile,'state':state,'begindate':sdate,'enddate':edate});
	}

	</script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr><td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 70px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
		<td>手机号码:<input id="mobileid" name="title" type="text" size="10" editable="false"/></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 170px" data-options="panelHeight:'auto'">
						<option value="">全部</option>
						<option value="0">成功</option>
					    <option value="-1">失败</option>
						<option value="4050">失败-账号被冻结</option>
						<option value="4051">失败-剩余条数不足</option>
						<option value="408">失败-自动被冻结</option>
						<option value="1110">失败-一天之内只能发送15条信息</option>
						<option value="1111">失败-一天之内只能发送5条验证码信息</option>
						<option value="1112">失败-180秒之内只能发送1条信息</option>
		              </select></td>
		<td>起始日期:<input id="startdate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>结束日期:<input id="enddate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="messagetable" class="easyui-datagrid" data-options="url:'<c:url value="/message/getMessageList"/>',queryParams:{'begindate':formatMonth(-3),'enddate':formatDay(0)},title: '短信列表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true,showFooter:true">
		<thead>
			<tr>
				<th data-options="field:'mobile',width:35,halign:'center'">手机号</th>
				<th data-options="field:'content',width:90,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      //if(value.length > 30){
				         //return value.substring(0,30)+'...';
				     // }
				   }
				   return value;
				}">短信内容</th>
				<th data-options="field:'createtime',width:55,halign:'center'">发送时间</th>
				<th data-options="field:'state',width:55,halign:'center',formatter:function(value,row,index){
                   if(value == 0){
                     return '成功';
                   }else if(value == 400){
                     return '失败-非法ip访问';
                   }else if(value == 401){
                     return '失败-帐号不能为空';
                   }else if(value == 402){
                     return '失败-密码不能为空';
                   }else if(value == 403){
                     return '失败-手机号码不能为空';
                   }else if(value == 4030){
                     return '失败-手机号码已被列入黑名单';
                   }else if(value == 404){
                     return '失败-短信内容不能为空';
                   }else if(value == 405){
                     return '失败-用户名或密码不正确';
                   }else if(value == 4050){
                     return '失败-账号被冻结';
                   }else if(value == 4051){
                     return '失败-剩余条数不足';
                   }else if(value == 4052){
                     return '失败-访问ip与备案ip不符';
                   }else if(value == 406){
                     return '失败-手机格式不正确';
                   }else if(value == 407){
                     return '失败-短信内容含有敏感字符';
                   }else if(value == 4070){
                     return '失败-签名格式不正确';
                   }else if(value == 4071){
                     return '失败-没有提交备案模板';
                   }else if(value == 4072){
                     return '失败-短信内容与模板不匹配';
                   }else if(value == 4073){
                     return '失败-短信内容超出长度限制';
                   }else if(value == 408){
                     return '失败-帐户疑被恶意利用，已被自动冻结';
                   }else if(value == 1110){
                     return '失败-一天之内只能发送15条信息!';
                   }else if(value == 1111||value==4085){
                     return '失败-一天之内只能发送5条验证码信息!';
                   }else if(value == 1112){
                     return '失败-180秒之内只能发送1条信息';
                   }else {
                     return '失败';
                   }
                }">状态</th>
				<th data-options="field:'times',width:35,halign:'center'">链接次数</th>
				<th data-options="field:'backtime',width:35,halign:'center'">短信平台返回时间</th>
				<th data-options="field:'accountcount',width:35,halign:'center'">短信剩余条数</th>
			</tr>
		</thead>
	</table>
	
	<!-- 查看短信详情 -->
	<div id="scanmessage" class="easyui-window" data-options="title:'短信内容',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="oneverifytable" width="100%" cellpadding="5" cellspacing="1">
				<tr><td width="25%">手机号:</td><td id="onemobileid"></td><td width="25%">发送时间:</td><td id="onecreatetimeid"></td></tr>
				<tr><td width="25%">状态:</td><td id="onestateid"></td><td width="25%">链接次数:</td><td id="onetimesid"></td></tr>
				<tr><td width="25%">短信平台返回时间:</td><td id="onebacktimeid"></td><td width="25%">短信剩余条数:</td><td id="oneaccountcountid"></td></tr>
				<tr><td id="onecontentid" colspan="4"></td></tr>
				</table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanmessage').window('close');">关闭</a>
			</div>
		</div>
	</div>
	
	
  </body>
</html>
