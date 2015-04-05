<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>会员藏品区</title>
    
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

TD {
	FONT: 12px 微软雅黑
}
</style>
<script type="text/javascript">
$(function(){
	$('#scanvip').window('close');
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

	$('#viptable').datagrid({
		toolbar:[{
				 id:'collectionusbtnscan',
                 text:'用户详情',
                 iconCls:'icon-search',
				handler:function(){
				var row = $('#viptable').datagrid('getSelected');
				if(row){
				getuserinfo(row.userid);
				}else{
				$.messager.alert('警告', "请先选择用户！", 'warning');
				}
				
			    }
			},{
            id:'votevipbtnscan',
            text:'藏品详情',
            iconCls:'icon-search',
            handler:function(){
               var row = $('#viptable').datagrid('getSelected');
               if(row){
            	  $('#scanviptypenameid').empty().append(row.typename);
              	  $('#scanvipnameid').empty().append(row.name);
              	  $('#scanvipserialnumid').empty().append(row.serialnum);
              	  $('#scanvipusernameid').empty().append(row.username);
              	  $('#scanvipuploaddateid').empty().append(row.uploaddate);
                   var image = row.imgurl.split(',');
              	  $('#scanvipimgurlid').empty().append('<img src="<c:url value="/voteactivity/"/>'+image[0]+'" width="250" height="250"/>');
              	  $('#scanvipnoteid').empty().append(row.note);
              	  $('#scanvip').window('open');
               }else{
             	  $.messager.alert('警告','请选择一条藏品','warning');
               }
            }
           },{
        	id:'votevipbtnadd',
            text:'添加藏品',
            iconCls:'icon-add',
            handler:function(){
				location.href = "<c:url value='/vote/gotoAddVoteCollection'/>";
            } 
        },{
            id:'votevipbtnupd',
            text:'修改藏品',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#viptable').datagrid('getSelected');
         	  if(row){
       	          location.href = "<c:url value='/vote/gotoUpdVoteCollection'/>?id="+row.id;
               }else{
             	  $.messager.alert('警告','请选择一条藏品信息','warning');
               }
            }
           },{
            id:'votevipbtnshow',
            text:'显示/隐藏',
            iconCls:'icon-search',
            handler:function(){
        	  var row = $('#viptable').datagrid('getSelected');
        	  if(row){
        		  if (row.state == 3){
             		 $.messager.alert('警告','该信息已被删除','warning');
                  } else {
                	  collectionShowOrHide(row.id,2);
                  }
          	  }else{
          		  $.messager.alert('警告','请选择一条藏品信息','warning');
              }
            }
           },{
            id:'votevipbtndel',
            text:'删除藏品',
            iconCls:'icon-cancel',
            handler:function(){
         	  var row = $('#viptable').datagrid('getSelected');
         	  if(row){
         		 if (row.state == 3){
            		 $.messager.alert('警告','该信息已被删除','warning');
                 } else {
	         		 $.messager.confirm('提示', '确定要删除此藏品？', function(r){
	       		         if (r){
	       		        	delcollection(row.id,3);
	       		         }
	       		     });
                 }
         	  }else{
         		  $.messager.alert('警告','请选择一条藏品信息','warning');
              }
            }
           }]
	});
});

function collectionShowOrHide(value,state){
	$.ajax({
        type:'post',
        url:'<c:url value="/vote/delVoteCollection"/>',
        data:'id='+value+'&state='+state,
        success:function(data){
           if(data == '0000'){
          	 $.messager.alert('提示', "操作成功！", 'info',function(){
          		$('#viptable').datagrid('reload');
             });
           }else{
          	 $.messager.alert('提示', data, 'warning',function(){
          		$('#viptable').datagrid('reload');
             });
           }
        }
     });
}

function delcollection(value,state){
	$.ajax({
        type:'post',
        url:'<c:url value="/vote/delVoteCollection"/>',
        data:'id='+value+'&state='+state,
        success:function(data){
           if(data == '0000'){
          	 $.messager.alert('提示', "删除成功！", 'info',function(){
          		$('#viptable').datagrid('reload');
               });
           }else{
          	 $.messager.alert('提示', data, 'warning',function(){
          		$('#viptable').datagrid('reload');
               });
           }
        }
     });
}

function serach(){
	$('#viptable').datagrid('loadData',{total:0,rows:[]});
	var type = $("#typeid").val();
	var serialnum = $("#serialnumid").val();
	var name = $("#nameid").val();
	var username = $("#usernameid").val();
	var userid = $("#useridid").val();
	var state = $("#stateid").combobox("getValue");
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#viptable').datagrid('load',{'type':type,'serialnum':serialnum,'name':name,'username':username,'userid':userid,'issuetype':4,'state':state,'begindate':sdate,'enddate':edate});
}
</script>
  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr>
		<td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 70px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
		<td>藏品类型:<input id="typeid" name="title" type="text" size="10" editable="false"/></td>
		<td>藏品编号:<input id="serialnumid" name="serialnum" type="text" size="10" editable="false"/></td>
		<td>藏品名称:<input id="nameid" name="proficient" type="text" size="10" editable="false"/></td>
		<td>上传者:<input id="usernameid" name="username" type="text" size="10" editable="false"/></td>
		<td><input id="useridid" name="userid" type="hidden" size="10" editable="false"/></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">显示</option>
						<option value="2">隐藏</option>
						<option value="3">删除</option>
		              </select></td>
		<td>起始日期:<input id="startdate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>结束日期:<input id="enddate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="viptable" class="easyui-datagrid" data-options="url:'<c:url value="/vote/getVoteVipList?issuetype=1"/>',queryParams:{'userid':'${comprehensiveid}','begindate':formatMonth(-3),'enddate':formatDay(0)},title: '我要上华豫',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'typename',width:30,halign:'center'">藏品类型</th>
				<th data-options="field:'name',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 9){
				         return value.substring(0,9)+'...';
				      }
				   }
				   return value;
				}">藏品名称</th>
				<th data-options="field:'imgurl',width:30,halign:'center',formatter:function(value,row,index){
				   var imgurl = value.split(',');
				   return '&lt;img src=<c:url value="/voteactivity/small/"/>'+imgurl[0]+' height=20 /&gt;';
				}">藏品图片</th>
				<th data-options="field:'serialnum',width:25,halign:'center'">藏品序列号</th>
				<th data-options="field:'username',width:30,halign:'center'">上传者</th>
				<th data-options="field:'uploaddate',width:50,halign:'center'">上传时间</th>
				<th data-options="field:'note',width:30,halign:'center',formatter:function(value,row,index){
				   return '查看详情';
				}">藏品简介</th>
				<th data-options="field:'state',width:15,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '正常';
                   }else if(value == 2){
                     return '隐藏';
                   }else{
                     return '删除';
                   }
                }">状态</th>
			</tr>
		</thead>
	</table>
	
	<div id="scanvip" class="easyui-window" data-options="title:'藏品详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="oneviptable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td width="30%">所属类型：</td>
			    <td id="scanviptypenameid"></td>
			    <td id="scanvipimgurlid" rowspan="5" width="250" height="250"></td>
			  </tr>
			  <tr>
			    <td>藏品名称：</td>
			    <td id="scanvipnameid"></td>
			  </tr>
			  <tr>
			    <td>编号：</td>
			    <td id="scanvipserialnumid"></td>
			  </tr>
			  <tr>
			    <td>上传者：</td>
			    <td id="scanvipusernameid"></td>
			  </tr>
			  <tr>
			    <td>上传日期：</td>
			    <td id="scanvipuploaddateid"></td>
			  </tr>
			  <tr>
			    <td colspan="3"><u id="scanvipnoteid"></u></td>
			  </tr>
			</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanvip').window('close');">关闭</a>
		</div>
	  </div>
	</div>
	 <jsp:include page="../incloudUser.jsp"/>
  </body>
</html>
