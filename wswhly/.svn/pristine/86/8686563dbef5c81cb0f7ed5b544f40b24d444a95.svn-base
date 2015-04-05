<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>申请旗舰商家信息</title>
    
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
#onecollectiontable {border-right:1px solid blue;border-bottom:1px solid blue}
#onecollectiontable td{border-left:1px solid blue;border-top:1px solid blue}
</style>

<script type="text/javascript">

$(function(){
	$('#addtype').window('close');
	$('#edittype').window('close');
	$('#collectiontype').window('close');
	$('#scancollection').window('close');
	$('#addcollection').window('close');
	$('#editcollection').window('close');
	$('#joincontrol').window('close');
	$('#flagshop').window('close');
	$('#startdate').datebox('setValue',formatMonth(-3));
	$('#enddate').datebox('setValue',formatDay(0));
		$('#jstartdate').datebox('setValue',formatDay(0));
		$('#jenddate').datebox('setValue',formatDay(0));
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

	$('#collectiontable').datagrid({
        toolbar:[{
            id:'votecollectionbtnupd',
            text:'添加拍品',
            iconCls:'icon-edit',
            handler:function(){
           	   window.location="<c:url value='redirect?p=admin/yc/addlots'/>";
            }
            },{
            id:'votecollectionbtnupd',
            text:'修改拍品',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#collectiontable').datagrid('getSelected');
         	  if(row){
         	   if (row.state == 10){
 	          		  $.messager.alert('警告','该拍品已被删除','warning');
                  } else {
           	         window.showModalDialog("<c:url value='/yclots/gotoeditlots'/>?id="+row.id,window,"dialogWidth=1000px;dialogHeight=870px;status:no;");
	              }          	      
               }else{
             	  $.messager.alert('警告','请选择一条拍品信息','warning');
               }
            }
            }]
		});

	$('#collectiontable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');
});

function getaction(){
var ins_id = $("#ins_id").val();
var con= "<select id='actionid' name='actionid'  onchange='getspecil()'> <option value=''>--请选择拍卖会--</option>";
$.ajax({
        type:'get',
        url:"<c:url value='/ycaction/getaction?ins_id='/>"+ins_id,
        success:function(data){
         var jsonData = eval(data);
                $.each(jsonData, function(index, objVal) {
	               con+="<option value='"+objVal["id"]+"'>"+objVal["auctionname"]+"</option>";
                });
                 con+="</select>";
                 $("#pmh").html(con);
        }
    });
}
function getspecil(){
var actionid = $("#actionid").val();
var con= "<select id='specialID' name='specialID' > <option value=''>--请选择拍卖会--</option>";
$.ajax({
        type:'get',
        url:"<c:url value='/ycaction/getspecil?actionid='/>"+actionid,
        success:function(data){
         var jsonData = eval(data);
                $.each(jsonData, function(index, objVal) {
	               con+="<option value='"+objVal["id"]+"'>"+objVal["specialname"]+"</option>";
                });
                 con+="</select>";
                 $("#zc").html(con);
        }
    });
}

function serach(){
	$('#collectiontable').datagrid('loadData',{total:0,rows:[]});
	var name = $("#nameid").val();
	var specialID = $("#specialID").val();
	var id = $("#id").val();
	if(specialID==undefined){
	specialID="";
	}
	$('#collectiontable').datagrid('load',{'specialID':specialID,'id':id,'name':name});
}
    function zhuaqu(){
     if($("#specialID").val()==undefined){
	      alert("请选择专场");
	  }
       $.ajax({
          type:'post',
          url:'<c:url value="/yclots/zqurl"/>',
         data:{Url:$("#Url").val(),specialID: $("#specialID").val(),ins_id:$("#ins_id").val()},
          success:function(data){
             if(data == '0001'){
            	 $.messager.alert('提示', "抓取失败！", 'warning',function(){
                 });
             }else{
            	 $.messager.alert('提示', "抓取成功",'info',function(){
                 data = data.substring(0, 10);
            	 $('#nameid').val(data);
            	 
            	 serach();
                 });
             }
          }
       });
      
	}

</script>

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">

		<tr >
			    <td>拍卖公司:
			      <select id="ins_id" name="ins_id"     onchange="getaction()">
			    			<option value="">请选择</option>
						<option value="4">苏富比</option>
						<option value="5">佳士得</option>
		          </select>
			     拍卖会：<span id="pmh"  ></span>
			     专场： <span id="zc"  ></span>
				</td>
				<td>拍品id:<input id="id" name="id" type="text" size="8" editable="false"/></td>
		      <td>拍品名称:<input id="nameid"  name="name" type="text" size="8" editable="false"/></td>
		       <td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>
		</tr>
		<tr>
		<td>藏品地址:<input id="Url" name="Url" type="text" size="60" editable="false"/>
              <a href="javascript:void(0)" onclick="zhuaqu()" class="easyui-linkbutton" iconCls="icon-search">抓取</a></td>   
		</tr>
	</table>
    <table id="collectiontable" class="easyui-datagrid" data-options="url:'<c:url value="/yclots/getlotsList"/>',queryParams:{'specialID':'','name':'','id':'','enddate':formatDay(0)},title: '旗舰商家',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'id',width:30,halign:'center'">ID</th>
				<th data-options="field:'name',width:20,halign:'center'">名称</th>
				<th  data-options="field:'image',width:30,halign:'center',formatter:function(value,row,index){			

                var imgurl = value.split(',');
                return '&lt;img src=http://116.255.149.172:7080/wswhly/zengjipaipin/'+imgurl[0]+' height=20 /&gt;';	
                     }">拍品图片</th> 
				<th data-options="field:'autor',width:10,halign:'center'">作者</th>
				<th data-options="field:'size',width:20,halign:'center'">尺寸</th>
				<th data-options="field:'year',width:20,halign:'center'">创作年代</th>
				<th data-options="field:'price',width:20,halign:'center'">估价</th>
				<th data-options="field:'cjprice',width:20,halign:'center'">成交价格</th>
				<th data-options="field:'cjtime',width:20,halign:'center'">成交时间</th>
			</tr>
		</thead>
	</table>
 
	 
  </body>
  
</html>
