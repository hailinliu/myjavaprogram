<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>百宝街商家信息</title>
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
.
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
#onebaibaoshoptable {border-right:1px solid blue;border-bottom:1px solid blue}
#onebaibaoshoptable td{border-left:1px solid blue;border-top:1px solid blue}
</style>

 <script type="text/javascript">

$(function(){
	$('#scancollection').window('close');
	$('#addcollection').window('close');
	$('#editcollection').window('close');
	$('#joincontrol').window('close');
	$('#baibaoshop').window('close');
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

	$('#baibaoshoptable').datagrid({
        toolbar:[{
            id:'collectionbtnadd',
            text:'商家详情',
            iconCls:'icon-search',
            handler:function(){
			  var row = $('#baibaoshoptable').datagrid('getSelected');
				if(row){				
             	 	  $('#shopname').empty().append(row.shopname);
             	 	  $('#mainscope').empty().append(row.mainscope);
             	 	   var image = row.img.split(',');
					  $('#img').empty().append('<img src=http://116.255.149.172:7080/wswhly/Baibaourl//'+image[0]+' width="250" height="250"/>');  		         
             	 	  $('#desction').empty().append(row.desction);
             	 	  $('#manifesto').empty().append(row.manifesto);
             	 	  $('#mobile').empty().append(row.mobile);
             	 	  $('#weixin').empty().append(row.weixin);
                        if(row.weixinimg!=null){
             	 	    var weixinimg = row.weixinimg.split(',');
             	 	   $('#weixinimg').empty().append('<img src="'+weixinimg[0]+'" width="200" height="200"/>');
             	 	   }            	 	 
             	 	  $('#shopaddress').empty().append(row.shopaddress);            	 	             	 	
		           $('#baibaoshop').window('open');
				}else{
				   $.messager.alert('警告','请选择一条商家信息','warning');
				}
				  
            } 
           },{
            id:'collectionusbtnadd',
            text:'添加商家',
            iconCls:'icon-add',
            handler:function(){
			   location.href = "<c:url value='/baibaoshopinfo/gotoaddbaibaoshop'/>";
            } 
           },{
            id:'collectionusbtnedit',
            text:'修改商家信息',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#baibaoshoptable').datagrid('getSelected');
         	  if(row){
         		  if (row.state == 3){
 	          		  $.messager.alert('警告','该商家已被删除','warning');
                  } else {
                     window.showModalDialog("<c:url value='/baibaoshopinfo/gotoeditbaibaoshop'/>?id="+row.id,window,"dialogWidth=1000px;dialogHeight=870px;status:no;");
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
         	  var row = $('#baibaoshoptable').datagrid('getSelected');
         	  if(row){
         		 if (row.state == 3){
            		 $.messager.alert('警告','该商家已被删除','warning');
                 } else {
	         		 $.messager.confirm('提示', '确定要删除该商家吗？', function(r){
	       		         if (r){
	       		        	delbaibaoshop(row.id);
	       		         }
	       		     });
                 }
         	  }else{
         		  $.messager.alert('警告','请选择一条藏品信息','warning');
              }
            }
           },{
            id:'coollectionbtnedit',
            text:'状态审批',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#baibaoshoptable').datagrid('getSelected');
         	  if(row){
         	   if (row.state == 3){
            		 $.messager.alert('警告','该商家已被删除','warning');
                 } else {
               	  $('#joincontrolid').val(row.id);
				  $('#joincontrol').window('open'); 
				  }
               }else{
             	  $.messager.alert('警告','请选择一条商家信息','warning');
               }
            }
           }]
		});

	$('#baibaoshoptable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');
});
function delbaibaoshop(value){
	$.ajax({
        type:'post',
        url:'<c:url value="/baibaoshopinfo/delbaibaoshop"/>',
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
	$('#baibaoshoptable').datagrid('loadData',{total:0,rows:[]});
	var username = $("#usernameid").val();
	var shopname = $("#shopnameid").val();
	var mobile = $("#mobileid").val();	
	var state = $("#stateid").combobox("getValue");
	var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}
	$('#baibaoshoptable').datagrid('load',{'username':username,'shopname':shopname,'mobile':mobile,'state':state, 'begindate':sdate,'enddate':edate});
}


//合作审批提交按钮
	function submitjoinlform(){
		$('#joinform').form('submit', {
			url: "<c:url value='/baibaoshopinfo/joinControl'/>",
			onSubmit: function() {
				return $(this).form('validate');
			},
			success: function(data) {
				if(data == "0000"){
					$.messager.alert('提示', "合作审批成功！", 'info', function(){
						document.getElementById("joinform").reset();
						$('#baibaoshoptable').datagrid('reload');
						$('#joincontrol').window('close');
					});
				} else if(data == "1111"){
						$.messager.alert('提示', "取消合作审批！", 'info', function(){
						document.getElementById("joinform").reset();
						$('#baibaoshoptable').datagrid('reload');
						$('#joincontrol').window('close');
					});
				}else{
					$.messager.alert('警告', data, 'warning');
				}
			}
		});
	}
function exportExcel() {
	$('#baibaoshoptable').datagrid('loadData',{total:0,rows:[]});
       	var username = $("#usernameid").val();
	    var shopname = $("#shopnameid").val();
	    var state = $('#stateid').combobox("getValue");
	    var startdate = $('#startdate').datebox('getValue');
	    var enddate = $('#enddate').datebox('getValue');
          window.open('<c:url value="/baibaoshopinfo/exportExcel"/>?shopname='+shopname+'&username='+username+'&startdate='+startdate+'&enddate='+enddate+'&state='+state);        
       serach();
}



</script>

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr><td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
		<td>联系人名称:<input id="usernameid" name="username" type="text" size="8" editable="false"/></td>
		<td>联系人电话:<input id="mobileid" name="mobile" type="text" size="8" editable="false"/></td>
		<td>店铺名称:<input id="shopnameid" name="shopname" type="text" size="8" editable="false"/></td>	
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="">全部</option>
						<option value="1">正常</option>
						<option value="2">冻结</option>
						<option value="3">删除</option>
						<option value="4">待审核</option>
						<option value="5">审核未通过</option>
		              </select></td>	
		<td>从:<input id="startdate" type="text" size="9" class="easyui-datebox" editable="false"/></td>
		<td>到:<input id="enddate" type="text" size="9" class="easyui-datebox" editable="false"/></td>
		<td><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>
		</tr>
	</table>
    <table id="baibaoshoptable" class="easyui-datagrid" data-options="url:'<c:url value="/baibaoshopinfo/getbaibaoshopinfoList"/>',queryParams:{'begindate':formatMonth(-3),'enddate':formatDay(0)},title: '百宝街商家信息',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
			    <th data-options="field:'userid',width:20,halign:'center'">用户ID</th>
				<th data-options="field:'username',width:30,halign:'center'">登录名</th>
				<th data-options="field:'shopname',width:30,halign:'center'">公司名称</th>
                <th  data-options="field:'img',width:35,halign:'center',formatter:function(value,row,index){			
                    return '&lt;img src=<c:url value="http://116.255.149.172:7080/wswhly/Baibaourl//"/>'+value+' height=20 /&gt;';
                     }">商家头像</th> 
				 <th data-options="field:'mainscope',width:30,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				     var val='';
				      if(value.indexOf('14')>=0){
				         val+='瓷器陶器   ';
				      }
				      if(value.indexOf('15')>=0){
				         val+='玉器赏石  ';
				      }
				      if(value.indexOf('16')>=0){
				         val+='青铜金器   ';
				      }
				      if(value.indexOf('17')>=0){
				         val+='书画古籍   ';
				      }
				      if(value.indexOf('18')>=0){
				         val+='木器雕品   ';
				      }
				      if(value.indexOf('19')>=0){
				         val+='古币钱币   ';
				      }
				      if(value.indexOf('20')>=0){
				         val+='珠宝首饰   ';
				      }
				      if(value.indexOf('21')>=0){
				         val+='油画雕塑   ';
				      }
				      if(value.indexOf('22')>=0){
				         val+='邮票邮品   ';
				      }
				      if(value.indexOf('23')>=0){
				         val+='其他藏品   ';
				      }
				      return val;
				   }
				   return value;
				}">经营范围</th>
				<th data-options="field:'desction',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 10){
				         return value.substring(0,10)+'...';
				      }
				   }
				   return value;
				}">店铺描述</th>	
				<th data-options="field:'manifesto',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 10){
				         return value.substring(0,10)+'...';
				      }
				   }
				   return value;
				}">店铺宣言</th>
				<th data-options="field:'mobile',width:30,halign:'center'">联系电话</th>
				<th data-options="field:'weixin',width:25,halign:'center'">微信号</th>
				<th data-options="field:'shopaddress',width:25,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length >10){
				         return value.substring(0,10)+'...';
				      }
				   }
				   return value;
				}">店铺地址</th>
				<th data-options="field:'createdate',width:40,halign:'center'">创建时间</th>
				<th data-options="field:'state',width:25,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '正常';
                   }else  if(value ==2){
                     return '冻结';
                   } else if(value ==3){
                    return '删除 ';
                   }else if(value ==4){
                    return '待审核 ';
                   }else if(value ==5){
                    return '审核未通过 ';
                   }
                }">状态</th>
		       <th data-options="field:'model',width:15,halign:'center'">操作方式</th>
			
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
				    <select id="upstateid" name="state" class="easyui-combobox" data-options="panelHeight:'auto'">
						<option value="1">正常</option>
						<option value="2">冻结</option>
						<option value="3">删除</option>
						<option value="4">待审核</option>
						<option value="5">审核未通过</option>
				    </select>
				  </td> 
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
	<div id="baibaoshop" class="easyui-window" data-options="title:'商家详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="baibaoshoptable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td width="30%">商家名称：</td>
			    <td id="shopname"  width="200"></td> </tr>
			   <tr>  <td width="30%">经营范围：</td>
			    <td id="mainscope"  width="200"></td>
			  </tr>
			  <tr>
			    <td>商家头像：</td>
			    <td id="img"  width="200" height="100"></td></tr>
			     <tr>  <td>店铺描述：</td>
			    <td id="desction"  width="200"></td>
			  </tr>
			   <tr>  <td>店铺宣言：</td>
			    <td id="manifesto"  width="200"></td>
			  </tr>
			  <tr>  <td>联系电话：</td>
			    <td id="mobile"  width="200"></td>
			  </tr>
			   <tr>  <td>微信号：</td>
			    <td id="weixin"  width="200"></td>
			  </tr>
			   <tr>  <td>二维码：</td>
			    <td id="weixinimg"  width="200" height="100"></td> 
			  </tr> 
			  <tr>
			    <td>店铺地址：</td>
			    <td id="shopaddress"></td>  
			 </tr>
			</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
		 <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#baibaoshop').window('close');">关闭</a>
		</div>
	  </div>
	</div>
  </body>
  
</html>
