<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>淘宝管理</title>
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
		input,textarea{
			border:1px solid #ccc;
			padding:2px;
		}
		body{
	        FONT: 9pt 微软雅黑;
	        background:url(<c:url value="/images/lightblue.jpg"/>);
	    }
	    TD {
	FONT: 12px 微软雅黑
}
#oneusertable {border-right:1px solid lightgreen;border-bottom:1px solid green}
#oneusertable td{border-left:1px solid lightgreen;border-top:1px solid green}
	</style>
<script type="text/javascript">
$(function(){
	$('#taobaotable').datagrid({
          toolbar:[{
              id:'collectioninfobtndel',
              text:'删除信息',
              iconCls:'icon-cancel',
              handler:function(){
           	  var row = $('#taobaotable').datagrid('getSelected');
           	  if(row){           		   
	           		  $.messager.confirm('提示', '确定要删除此信息吗？', function(r){
	           		     if (r){
	           		       delNewlist(row.id);
	           		     }
	           		  }); 		           
           	  }else{
           		  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             }]
});
});
function delNewlist(id){
      $.ajax({
         type:'post',
         url:'<c:url value="/taobao/deltaobaolist"/>',
         data:'id='+id,
         success:function(data){
            if(data == '0000'){
           	 $.messager.alert('提示', "删除成功！", 'info',function(){
					$('#taobaotable').datagrid('reload');
                });
            }else{
           	 $.messager.alert('提示', data, 'warning',function(){
 					$('#taobaotable').datagrid('reload');
                });
            }
         }
      });
}
    function zhuaqu(){
       $.ajax({
          type:'post',
          url:'<c:url value="/taobao/taobaourl"/>',
          data:'Url='+document.getElementById("Url").value,
          success:function(data){
             if(data == '0000'){
            	 $.messager.alert('提示', "抓取成功！", 'info',function(){
                 });
             }else{
            	 $.messager.alert('提示', data, 'warning',function(){
                 });
             }
          }
       });
	}
	 function exportExcel() {  
	window.open('<c:url value="/taobao/exportExcel"/>');
}
		</script>
  </head>
  
  <body>
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
          <tr>
          <td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 70px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
          <td>淘宝地址:<input id="Url" name="Url" type="text" size="100" editable="false"/>
          <a href="javascript:void(0)" onclick="zhuaqu()" class="easyui-linkbutton" iconCls="icon-search">抓取</a></td>              
		  <td><a href="javascript:exportExcel()" class="easyui-linkbutton" iconCls="icon-redo">导出Excel</a></td>
          </tr>
  </table>
   <table id="taobaotable" class="easyui-datagrid" data-options="url:'<c:url value="/taobao/getTaobaoList"/>',queryParams:{'userid':'${comprehensiveid}','begindate':formatMonth(-3),'enddate':formatDay(0)},title: '淘宝信息统计',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>			   
			    <th data-options="field:'id',width:20,halign:'center'">ID</th>
				<th data-options="field:'pmname',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 9){
				         return value.substring(0,9)+'...';
				      }
				   }
				   return value;
				}">拍品名称</th>
				<th data-options="field:'qpprice',width:40,halign:'center'">起拍价</th>					
				<th  data-options="field:'baozhengprice',width:25,halign:'center'">保证金</th> 
				<th data-options="field:'dangqianprice',width:30,halign:'center'">当前价</th>
				<th data-options="field:'jprice',width:40,halign:'center'">加价幅度</th>
				<th data-options="field:'bmnum',width:30,halign:'center'">报名人数</th>
				<th data-options="field:'sznum',width:30,halign:'center'">设置提醒人数</th>
				<th data-options="field:'wgnum',width:50,halign:'center'">围观人数</th>	
				<th data-options="field:'jgname',width:50,halign:'center'">送拍机构</th>
				<th data-options="field:'zqtime',width:30,halign:'center'">抓取时间</th>
			</tr>
		</thead>
	</table>
	
  </body>
</html>
