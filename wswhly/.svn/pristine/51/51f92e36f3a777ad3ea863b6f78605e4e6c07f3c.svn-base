<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>拍卖会信息管理</title>
    
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
#oneycspeciltable {border-right:1px solid blue;border-bottom:1px solid blue}
#oneycspeciltable td{border-left:1px solid blue;border-top:1px solid blue}
</style>

<script type="text/javascript">

$(function(){
	
	$('#addycspecil').window('close');
	$('#editycspecil').window('close');
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

	$('#ycspeciltable').datagrid({
        toolbar:[{
            id:'ycspecilbtnadd',
            text:'添加专场',
            iconCls:'icon-add',
            handler:function(){
			   location.href = "<c:url value='/ycaction/gotoaddspecial'/>";
            } 
           } ]
		});
});
	$('#specialnameid').autocomplete('<c:url value="/collection/autospecialname"/>', 
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
	              value: row.specialname,
	              result: row.specialname
	          }
	      }
	      );
	      },
	      formatItem: function (row, i, max) {
	          return "<table width='97%'><tr><td align='left'>专场名称：" + row.specialname + "</td></tr></table>";
	          //return  row.name;
	      }, 
	      formatMatch: function(row, i, max){ 
	           return row.specialname;
	      } ,

	      formatResult: function(row, i, max) {
	           return row.specialname;
	      }                 
	});
function serach(){
	$('#ycspeciltable').datagrid('loadData',{total:0,rows:[]});	
	var specialname = $("#specialname").val();
  
	$('#ycspeciltable').datagrid('load',{'specialname':specialname,'actionid':''});
}





</script>

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr> 
		<td>拍卖专场名称:<input id="specialname" name="specialname" size="8"   ></td>

		<td><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="ycspeciltable" class="easyui-datagrid" data-options="url:'<c:url value="/ycaction/getspeciallist"/>',queryParams:{'actionid':'${actionid}','specialname':'${specialname}','begindate':formatMonth(-3),'enddate':formatDay(0)},title: '藏品管理',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'specialname',width:30,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length >20){
				         return value.substring(0,20)+'...';
				      }
				   }
				   return value;
				}">拍卖专场名称</th>				
				<th data-options="field:'auctionname',width:30,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 20){
				         return value.substring(0,20)+'...';
				      }
				   }
				   return value;
				}">所属拍卖会</th>
				<th data-options="field:'time',width:30,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 20){
				         return value.substring(0,20)+'...';
				      }
				   }
				   return value;
				}">专场时间</th>
				<th data-options="field:'address',width:50,halign:'center'">地点</th>
				<th data-options="field:'totalnum',width:30,halign:'center'">拍品总数</th>
			</tr>
		</thead>
	</table>
	
	 <jsp:include page="../incloudUser.jsp"/>
  </body>
  
</html>
