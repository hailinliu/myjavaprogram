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
            id:'collectionbtnadd',
            text:'申请详情',
            iconCls:'icon-search',
            handler:function(){
			  var row = $('#collectiontable').datagrid('getSelected');
				if(row){
				
             	 	  $('#companyName').empty().append(row.companyName);
             	 	  $('#com_abb').empty().append(row.com_abb);
             	 	  $('#code').empty().append(row.code);
             	 	   var str = "<c:url value="/flagshop/small/"/>";
             	 	  if(row.scan!=null){
             	 	    var scan = row.scan.split(',');
             	 	   $('#scan').empty().append('<img src="'+str+scan[0]+'" width="200" height="200"/>');
             	 	   }
             	 	// $('#scan').empty().append(row.scan);
             	 	  
             	 	  $('#com_code').empty().append(row.com_code);
             	 	  if(row.com_scan!=null){
             	 	       var comscan = row.com_scan.split(',');
             	 	       $('#com_scan').empty().append('<img src="'+comscan[0]+str+'" width="200" height="200"/>');
             	 	  }  
             	 	  $('#address').empty().append(row.address);
             	 	  $('#money').empty().append(row.money);
             	 	  $('#f_name').empty().append(row.f_name);
             	 	  if(row.f_id_scan!=null){
             	 	       var fidscan = row.f_id_scan.split(',');
             	 	       $('#f_id_scan').empty().append('<img src="'+str+fidscan[0]+'" width="200" height="200"/>');
             	 	  }
             	 	  $('#name').empty().append(row.name);
             	 	  $('#id_card').empty().append(row.id_card);
             	 	  if(row.id_scan!=null){
             	 	  	  var idscan = row.id_scan.split(',');
             	 	      $('#id_scan').empty().append('<img src="'+str+idscan[0]+'" width="200" height="200"/>');
             	 	  }
             	 	  $('#mobile').empty().append(row.mobile);
             	 	  $('#email').empty().append(row.email);
             	 	  $('#manage').empty().append(row.manage);
             	 	  $('#com_area').empty().append(row.com_area);
             	 	  if(row.logo!=null){
             	 	       var logo = row.logo.split(',');
             	 	       $('#logo').empty().append('<img src="'+str+logo[0]+'" width="200" height="200"/>');
             	 	  }
             	 	  $('#applicationtime').empty().append(row.applicationtime);
             	 	  $('#begintime').empty().append(row.begintime);
             	 	  $('#endtime').empty().append(row.endtime);
             	 	  $('#desction').empty().append(row.desction);
		           $('#flagshop').window('open');
				}else{
				   $.messager.alert('警告','请选择一条商家信息','warning');
				}
				  
            } 
           },{
            id:'coollectionbtnedit',
            text:'合作审批',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#collectiontable').datagrid('getSelected');
         	  if(row){
         		  if (row.state == 1){
 	          		  $.messager.alert('警告','该商家已经与我们是合作关系。','warning');
                  } else {
           	         $('#joincontrolid').val(row.id);
	               //  $('#stateid').combobox('setValue',row.state);
					 $('#joincontrol').window('open');
	              }
               }else{
             	  $.messager.alert('警告','请选择一条藏品信息','warning');
               }
            }
           }]
		});

	$('#collectiontable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');
});

function serach(){
	$('#collectiontable').datagrid('loadData',{total:0,rows:[]});
	var username = $("#nameid").val();
	var companyName = $("#companyNameid").val();
	//var name = $("#usernameid").val();
	var mobile = $("#mobileid").val();
	//var state = $("#stateid").combobox("getValue");
	var style = $("#styleid").combobox("getValue");
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#collectiontable').datagrid('load',{'username':username,'companyName':companyName,'mobile':mobile,'style':style, 'begindate':sdate,'enddate':edate});
}


function delType(id){
   $.ajax({
      type:'post',
      url:'<c:url value="/collection/deltype"/>',
      data:'id='+id,
      success:function(data){
         if(data == '0000'){
        	 $.messager.alert('提示', "删除成功！", 'info',function(){
        		$('#typetable').datagrid('loadData',{total:0,rows:[]});
				$('#typetable').datagrid('reload');
             });
         }else{
        	 $.messager.alert('提示', data, 'warning',function(){
        		$('#typetable').datagrid('loadData',{total:0,rows:[]});
				$('#typetable').datagrid('reload');
             });
         }
      }
   });
}


//合作审批提交按钮
	function submitjoinlform(){
	var state = $("#stateid").combobox("getValue");
		var jstartdate = $('#jstartdate').datebox('getValue');
	 
	   	var jenddate = $('#jenddate').datebox('getValue');
	
	    if(state==1){
		    if(jstartdate.length==0){
		    alert('合作开始时间不能为空！');
		    return false;
		    }
		    if(jenddate.length==0){
		    alert('合作结束时间不能为空！')
		    return false;
		    }
		    if(jstartdate>jenddate){
		     alert('合作开始时间不能大于结束时间！')
		     return false;
		    }
	     }
		$('#joinform').form('submit', {
			url: "<c:url value='/collection/joinControl'/>",
			onSubmit: function() {
				return $(this).form('validate');
			},
			success: function(data) {
				if(data == "0000"){
					$.messager.alert('提示', "合作审批成功！", 'info', function(){
						document.getElementById("joinform").reset();
						$('#collectiontable').datagrid('reload');
						$('#joincontrol').window('close');
					});
				} else if(data == "1111"){
						$.messager.alert('提示', "取消合作审批！", 'info', function(){
						document.getElementById("joinform").reset();
						$('#collectiontable').datagrid('reload');
						$('#joincontrol').window('close');
					});
				}else{
					$.messager.alert('警告', data, 'warning');
				}
			}
		});
	}
function exportExcel() {
	$('#collectiontable').datagrid('loadData',{total:0,rows:[]});
	
//	var username = $("#usernameid").val();
	//var companyName = $("#companyNameid").val();
	//var name = $("#usernameid").val();
	//var mobile = $("#mobileid").val();
	//var state = $("#stateid").combobox("getValue");
	//var style = $("#styleid").combobox("getValue");
	//var sdate = $('#startdate').datebox('getValue');
	//var edate = $('#enddate').datebox('getValue');
	
	
  var username = $("#nameid").attr("value");
		    var companyName = $("#companyNameid").attr("value");
	        var mobile = $("#mobileid").attr("value");
	        var startdate = $('#startdate').datebox('getValue');
	        var enddate = $('#enddate').datebox('getValue');
	      	var style = $("#styleid").combobox("getValue");
          window.open('<c:url value="/flagshop/exportExcel"/>?companyName='+companyName+'&username='+username+'&mobile='+mobile+'&startdate='+startdate+'&enddate='+enddate+'&style='+style);        
       serach();
}



</script>

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr><td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>

		<td>联系人名称:<input id="nameid" name="username" type="text" size="8" editable="false"/></td>
		<td>公司名称:<input id="companyNameid" name="companyName" type="text" size="8" editable="false"/></td>
		
		<td>联系人电话:<input id="mobileid" name="mobile" type="text" size="12" editable="false"/></td>
		<td>从:<input id="startdate" type="text" size="9" class="easyui-datebox" editable="false"/></td>
		<td>到:<input id="enddate" type="text" size="9" class="easyui-datebox" editable="false"/></td>
		<td>类型:<select id="styleid" name="style" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">公司</option>
						<option value="2">个人</option>
		              </select></td>
		<td><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>
		
		<td><a href="javascript:exportExcel()" class="easyui-linkbutton" iconCls="icon-redo">导出Excel</a></td>
		</tr>
	</table>
    <table id="collectiontable" class="easyui-datagrid" data-options="url:'<c:url value="/flagshop/getFlagshopList"/>',queryParams:{'begindate':formatMonth(-3),'enddate':formatDay(0)},title: '旗舰商家',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'username',width:30,halign:'center'">登录名</th>
				<th data-options="field:'companyName',width:30,halign:'center'">公司名称</th>
				<th data-options="field:'code',width:30,halign:'center'">营业执照号码</th>
				<th data-options="field:'com_code',width:30,halign:'center'">组织机构代码</th>
				<th data-options="field:'address',width:30,halign:'center'">地址</th>
				<th data-options="field:'money',width:60,halign:'center'">注册资金</th>	
				<th data-options="field:'name',width:25,halign:'center'">联系人名称</th>
				<th data-options="field:'mobile',width:25,halign:'center'">联系电话</th>
				<th data-options="field:'opermodel',width:25,halign:'center'">邮箱</th>
				<th data-options="field:'manage',width:25,halign:'center'">经营范围</th>
				<th data-options="field:'applicationtime',width:40,halign:'center'">提交申请时间</th>
				<th data-options="field:'state',width:25,halign:'center',formatter:function(value,row,index){
                   if(value == 0){
                     return '未合作';
                   }if(value ==1){
                     return '已合作';
                   } else if(value ==2){
                    return '取消合作';
                   }
                }">合作状态</th>
				<th data-options="field:'style',width:15,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '公司';
                   }else{
                    return '个人';
                   }
                }">类型</th>
			</tr>
		</thead>
	</table>

 <!--合作审批 -->
 	
	<div id="joincontrol" class="easyui-window" data-options="title:'合作审批',iconCls:'icon-add',modal:true" style="width:300px;height:170px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="joinform" method="post">
				<input id="joincontrolid" type="hidden" name="id"/>
				<table style="line-height: 30px;" align="center">
				<tr>
				<td>合作状态:
				    <select id="stateid" name="state" class="easyui-combobox" data-options="panelHeight:'auto'">
				    <option value="1" selected>合作</option>
				      <option value="2">取消合作</option>
				    </select>
				  </td> 
				</tr>
				<tr>
				<td>起始日期:<input id="jstartdate" name = "jbegintime" type="text" size="10" class="easyui-datebox" editable="false"/></td>
				</tr>
				<tr>
		      <td>结束日期:<input id="jenddate"  name = "jendtime" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		      </tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submitjoinlform();">提交</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#joincontrol').window('close');">取消</a>
			</div>
		</div>
	</div>
	<!-- 申请详情 -->
	<div id="flagshop" class="easyui-window" data-options="title:'申请详情',iconCls:'icon-search',modal:true" style="width:1000px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="flagshoptable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td width="30%">商家名称：</td>
			    <td id="companyName"></td>
			    <td width="30%">公司简称：</td>
			    <td id="com_abb"></td>
			<!--  <td id="" rowspan="6" width="250" height="250"></td>--> 
			  </tr>
			  <tr>
			    <td>营业执照号码：</td>
			    <td id="code"></td>
			    <td>组织机构代码：</td>
			    <td id="com_code"></td>
			  </tr>
			  <tr>
			    <td>地址：</td>
			    <td id="address"></td>
			    <td>注册资金：</td>
			    <td id="money"></td>
			  </tr>
			  <tr>
			    <td>法人代表人名称：</td>
			    <td id="f_name"></td>
			      <td>法人身份证号：</td>
			    <td id="f_id_code"></td>  
			  </tr>
			    <tr>
			    <td>联系人名称：</td>
			    <td id="name"></td>
			    <td>联系人身份证号码：</td>
			    <td id="id_card"></td>
			  </tr>
			    <tr>
			    <td>联系电话：</td>
			    <td id="mobile"></td>
			    <td>电子邮箱：</td>
			    <td id="email"></td>
			  </tr>
			    <tr>
			    <td>经营范围：</td>
			    <td id="manage"></td>
			  </tr>
			    <tr>
			    <td>店铺面积：</td>
			    <td id="com_area"></td>
			    <td>提交申请时间：</td>
			    <td id="applicationtime"></td>
			  </tr>
			  
			    <tr>
			    <td>开始合作时间：</td>
			    <td id="begintime"></td>
			    <td>合作结束时间：</td>
			    <td id="endtime"></td>
			    </tr>
			    <tr>
			     <td>营业执照扫描件：</td>
			     <td id="scan"  width="200" height="200"></td>
			     <td>组织机构代码扫描件：</td>
			     <td id="com_scan" width="200" height="200"></td>
			    </tr>
			    <tr>
			    <td>法人代表身份证扫描件：</td>
			    <td id="f_id_scan"  width="200" height="200"></td>
			       <td>联系人身份证扫描件：</td>
			    <td id="id_scan"   width="200" height="200"></td>
			    </tr>
			    <tr>
			     <td>LOGO图片：</td>
			    <td id="logo"  width="200" height="200"></td>
			    </tr>
			  <tr>
			    <td colspan="3">详细介绍：<u id="desction"></u></td>
			  </tr>
			</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
		 <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#flagshop').window('close');">关闭</a>
		</div>
	  </div>
	</div>
  </body>
  
</html>
