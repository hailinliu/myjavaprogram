<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>旗舰商家信息</title>
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
            text:'商家详情',
            iconCls:'icon-search',
            handler:function(){
			  var row = $('#collectiontable').datagrid('getSelected');
				if(row){
				
             	 	  $('#name').empty().append(row.name);
             	 	  $('#mainscope').empty().append(row.mainscope);
             	 	  if(row.logo!=null){
             	 	    var logo = row.logo.split(',');
             	 	   $('#logo').empty().append('<img src="'+logo[0]+'" width="200" height="200"/>');
             	 	   }
             	 	  $('#introduce').empty().append(row.introduce);
             	 	  $('#contactname').empty().append(row.contactname);
             	 	  $('#contacttel').empty().append(row.contacttel);
             	 	    $('#qq').empty().append(row.qq);
                        if(row.weixin!=null){
             	 	    var weixin = row.weixin.split(',');
             	 	   $('#weixin').empty().append('<img src="'+weixin[0]+'" width="200" height="200"/>');
             	 	   }
             	 	   if(row.sinlwblog!=null){
             	 	    var sinlwblog = row.sinlwblog.split(',');
             	 	   $('#sinlwblog').empty().append('<img src="'+sinlwblog[0]+'" width="200" height="200"/>');
             	 	   }
             	 	  $('#addresss').empty().append(row.addresss);
             	 	  if(row.map!=null){
             	 	    var map = row.map.split(',');
             	 	   $('#map').empty().append('<img src="'+map[0]+'" width="200" height="200"/>');
             	 	   }
             	 	  $('#startdate').empty().append(row.startdate);
             	 	  $('#enddate').empty().append(row.enddate);
		           $('#flagshop').window('open');
				}else{
				   $.messager.alert('警告','请选择一条商家信息','warning');
				}
				  
            } 
           },{
            id:'collectionusbtnadd',
            text:'添加商家',
            iconCls:'icon-add',
            handler:function(){
			   location.href = "<c:url value='/flagshopinfo/gotoaddflagshop'/>";
            } 
           },{
            id:'collectionusbtnedit',
            text:'修改商家信息',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#collectiontable').datagrid('getSelected');
         	  if(row){
         		  if (row.state == 3){
 	          		  $.messager.alert('警告','该商家已被删除','warning');
                  } else {
           	            window.showModalDialog("<c:url value='/flagshopinfo/gotoeditflagshop'/>?id="+row.id,window,"dialogWidth=1000px;dialogHeight=870px;status:no;");
	              }
               }else{
             	  $.messager.alert('警告','请选择一条商家信息','warning');
               }
            }
           },{
            id:'collectionusbtndel',
            text:'删除商家',
            iconCls:'icon-cancel',
            handler:function(){
         	  var row = $('#collectiontable').datagrid('getSelected');
         	  if(row){
         		 if (row.state == 3){
            		 $.messager.alert('警告','该商家已被删除','warning');
                 } else {
	         		 $.messager.confirm('提示', '确定要删除该商家吗？', function(r){
	       		         if (r){
	       		        	delflagshop(row.id);
	       		         }
	       		     });
                 }
         	  }else{
         		  $.messager.alert('警告','请选择一条藏品信息','warning');
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
             	  $.messager.alert('警告','请选择一条商家信息','warning');
               }
            }
           }]
		});

	$('#collectiontable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');
});
function delflagshop(value){
	$.ajax({
        type:'post',
        url:'<c:url value="/flagshopinfo/delflagshop"/>',
        data:'delid='+value,
        success:function(data){
           if(data == '0000'){
          	 $.messager.alert('提示', "删除成功！", 'info',function(){
          		$('#collectionustable').datagrid('reload');
               });
           }else{
          	 $.messager.alert('提示', data, 'warning',function(){
          		$('#collectionustable').datagrid('reload');
               });
           }
        }
     });
}

function serach(){
	$('#collectiontable').datagrid('loadData',{total:0,rows:[]});
	var username = $("#usernameid").val();
	var name = $("#nameid").val();
	var commissioner = $("#commissionerid").val();
	var type = $("#typeid").combobox("getValue");
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#collectiontable').datagrid('load',{'username':username,'name':name,'commissioner':commissioner,'type':type, 'begindate':sdate,'enddate':edate});
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
			url: "<c:url value='/flagshopinfo/joinControl'/>",
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
            var username = $("#usernameid").attr("value");
		    var name = $("#nameid").attr("value");
	        var commissioner = $("#commissionerid").attr("value");
	        var startdate = $('#startdate').datebox('getValue');
	        var enddate = $('#enddate').datebox('getValue');
	      	var type = $("#typeid").combobox("getValue");
          window.open('<c:url value="/flagshopinfo/exportExcel"/>?name='+name+'&username='+username+'&commissioner='+commissioner+'&startdate='+startdate+'&enddate='+enddate+'&type='+type);        
       serach();
}



</script>

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr><td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>

		<td>联系人名称:<input id="usernameid" name="username" type="text" size="8" editable="false"/></td>
		<td>公司名称:<input id="nameid" name="name" type="text" size="8" editable="false"/></td>		
		<td>商务专员:<input id="commissionerid" name="commissioner" type="text" size="12" editable="false"/></td>
		<td>从:<input id="startdate" type="text" size="9" class="easyui-datebox" editable="false"/></td>
		<td>到:<input id="enddate" type="text" size="9" class="easyui-datebox" editable="false"/></td>
		<td>类型:<select id="typeid" name="type" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">个人</option>
						<option value="2">公司</option>
		              </select></td>
		<td><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>
		
		<!-- <td><a href="javascript:exportExcel()" class="easyui-linkbutton" iconCls="icon-redo">导出Excel</a></td> -->
		</tr>
	</table>
    <table id="collectiontable" class="easyui-datagrid" data-options="url:'<c:url value="/flagshopinfo/getFlagshopinfoList"/>',queryParams:{'begindate':formatMonth(-3),'enddate':formatDay(0)},title: '旗舰商家',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
			    <th data-options="field:'userid',width:20,halign:'center'">用户ID</th>
				<th data-options="field:'username',width:30,halign:'center'">登录名</th>
				<th data-options="field:'name',width:30,halign:'center'">公司名称</th>
				<th data-options="field:'logo',width:25,halign:'center',formatter:function(value,row,index){
				   return '&lt;img src='+value+' height=20 /&gt;';
				}">商家logo</th>
				<th data-options="field:'mainscope',width:30,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 10){
				         return value.substring(0,10)+'...';
				      }
				   }
				   return value;
				}">经营范围</th>
				<th data-options="field:'daoyu',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 10){
				         return value.substring(0,10)+'...';
				      }
				   }
				   return value;
				}">公司导语</th>
				<th data-options="field:'introduce',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 10){
				         return value.substring(0,10)+'...';
				      }
				   }
				   return value;
				}">详细介绍</th>
				<th data-options="field:'contactname',width:30,halign:'center'">联系人</th>
				<th data-options="field:'contacttel',width:30,halign:'center'">联系电话</th>
				<th data-options="field:'qq',width:30,halign:'center'">QQ号</th>
				<th data-options="field:'weixin',width:25,halign:'center',formatter:function(value,row,index){
				   return '&lt;img src='+value+' height=20 /&gt;';
				}">微信号</th>
				<th data-options="field:'sinlwblog',width:25,halign:'center',formatter:function(value,row,index){
				   return '&lt;img src='+value+' height=20 /&gt;';
				}">新浪微博</th>
				<th data-options="field:'addresss',width:25,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length >10){
				         return value.substring(0,10)+'...';
				      }
				   }
				   return value;
				}">公司地址</th>
			  <th data-options="field:'map',width:25,halign:'center',formatter:function(value,row,index){
				   return '&lt;img src='+value+' height=20 /&gt;';
				}">地图</th>
				<th data-options="field:'commissioner',width:40,halign:'center'">商务专员</th>
				<th data-options="field:'startdate',width:40,halign:'center'">开始合作时间</th>
				<th data-options="field:'enddate',width:40,halign:'center'">合作结束时间</th>
				<th data-options="field:'state',width:25,halign:'center',formatter:function(value,row,index){
                   if(value == 3){
                     return '合作结束';
                   }if(value ==1){
                     return '合作中';
                   } else if(value ==2){
                    return '合作暂停';
                   }
                }">合作状态</th>
		       <th data-options="field:'type',width:15,halign:'center',formatter:function(value,row,index){
                   if(value == 0){
                     return '全部';
                   }else if(value==1){
                     return '个人';
                   }else  if(value==2){
                     return '公司';
                   }
                }">类型</th>
			
			</tr>
		</thead>
	</table>

 <!--合作审批 -->
 	
	<div id="joincontrol" class="easyui-window" data-options="title:'合作审批',iconCls:'icon-add',modal:true" style="width:500px;height:170px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="joinform" method="post">
				<input id="joincontrolid" type="hidden" name="id"/>
				<table style="line-height: 30px;" align="center">
				<tr>
				<td>合作状态:
				    <select id="stateid" name="state" class="easyui-combobox" data-options="panelHeight:'auto'">
				    <option value="1" selected>合作中</option>
				    <option value="2">合作暂停</option>
				    <option value="3" selected>合作结束</option>
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
	<!-- 商家详情 -->
	<div id="flagshop" class="easyui-window" data-options="title:'商家详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="flagshoptable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td width="30%">商家名称：</td>
			    <td id="name"  width="200"></td> </tr>
			   <tr>  <td width="30%">经营范围：</td>
			    <td id="mainscope"  width="200"></td>
			  </tr>
			  <tr>
			    <td>商家logo：</td>
			    <td id="logo"  width="200" height="100"></td></tr>
			     <tr>  <td>公司导语：</td>
			    <td id="daoyu"  width="200"></td>
			  </tr>
			   <tr>  <td>详细介绍：</td>
			    <td id="introduce"  width="200"></td>
			  </tr>
			  <tr>
			    <td>联系人：</td>
			    <td id="contactname"  width="200"></td>  </tr>
			  <tr>  <td>联系电话：</td>
			    <td id="contacttel"  width="200"></td>
			  </tr>
			   <tr>  <td>QQ号：</td>
			    <td id="qq"  width="200"></td>
			  </tr>
			   <tr>  <td>微信号：</td>
			    <td id="weixin"  width="200"></td>
			  </tr>
			   <tr>  <td>微博号：</td>
			    <td id="sinlwblog"  width="200"></td>
			  </tr>
			  <tr>
			    <td>公司地址：</td>
			    <td id="addresss"></td>  </tr>
			   <tr>   <td>地图：</td>
			    <td id="map"  width="200" height="100"></td>  </tr> 
			
			  
			    <tr>
			    <td>开始合作时间：</td>
			    <td id="startdate"  width="200"></td> </tr>
			  <tr>  <td>合作结束时间：</td>
			    <td id="enddate"  width="200"></td>
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
