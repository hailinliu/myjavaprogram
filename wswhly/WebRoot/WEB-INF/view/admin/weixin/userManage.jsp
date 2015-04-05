<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>微信群管理</title>
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
#oneweixintable {border-right:1px solid lightgreen;border-bottom:1px solid green}
#oneweixintable td{border-left:1px solid lightgreen;border-top:1px solid green}
	</style>
	<script type="text/javascript">
	$(function(){
		$('#scanuser').window('close');
		$('#adduser').window('close');
		$('#updateuser').window('close');	
		$('#weixintable').datagrid({
			toolbar:[{
				 id:'collectionusbtnscan',
                 text:'用户详情',
                 iconCls:'icon-search',
				handler:function(){
				    var row = $('#weixintable').datagrid('getSelected');
				    if(row){
					    $('#oneusernameid').empty().append(row.username);
					    if(row.sex == 1){
						    $('#onesexid').empty().append('男');
						}else if(row.sex == 2){
							$('#onesexid').empty().append('女');
						}else {
							$('#onesexid').empty().append('保密');
						}
					    $('#onemobileid').empty().append(row.mobile);
					    $('#oneweixinid').empty().append(row.weixin);
					    $('#onecreatedateid').empty().append(row.createdate);
					    $('#oneemailid').empty().append(row.email);
					    $('#onerealnameid').empty().append(row.realname);
					    $('#oneidcardid').empty().append(row.idcard);	
					    $('#oneaddressid').empty().append(row.address);
					    $('#onepointid').empty().append(row.point);
					    $('#onemoneyid').empty().append(row.money);
					    $('#onelevelid').empty().append(row.username);
					    if(row.level == 0){
						     $('#onelevelid').empty().append('免费会员');
						}else if(row.level == 1){
						     $('#onelevelid').empty().append('星级会员');
						}else if(row.level ==2){
						     $('#onelevelid').empty().append('贵宾会员');
						}else if(row.level ==3){
						     $('#onelevelid').empty().append('高级会员');
						}else if(row.level ==4){
						     $('#onelevelid').empty().append('超级会员');
						}
						if(row.state == 1){
						    $('#onestateid').empty().append('正常');
					    }else if(row.state == 2){
						    $('#onestateid').empty().append('冻结');
						}else if(row.state == 3){
						    $('#onestateid').empty().append('删除');
						}
					    $('#scanuser').window('open');
					}else{
					    $.messager.alert('警告', "请先选择用户！", 'warning');
				    }
				}
			},{
                id:'userbtnupd',
                text:'修改用户信息',
                iconCls:'icon-edit',
                handler:function(){
                    var row = $('#weixintable').datagrid('getSelected');
                    if(row){
                    	$('#updateuserid').val(row.id);
						$('#updatename').empty().append(row.username);
						if(row.sex == 1){ 
							document.getElementById("maleid").checked = "checked";
					    }else{
					    	document.getElementById("femaleid").checked = "checked";
						}
						$('#updateemail').val(row.email);
						$('#updaterealname').val(row.realname);
						$('#updatemobile').val(row.mobile);
						$('#updateidcard').val(row.idcard);
						$('#updateaddress').val(row.address);						
						$('#updateadminName').val(row.adminName);
						$('#desction').val(row.desction);
						$('#updateuser').window('open');
                    }else{
                    	$.messager.alert('警告', "请先选择用户！", 'warning');
                    }
                }
				},{
				id:'userbtnadd',
				text:'添加用户',
				iconCls:'icon-add',
				handler:function(){
				    document.getElementById("adduserform").reset();
					$('#adduser').window('open');
				}
			},{
                 id:'userbtndel',
                 text:'删除用户',
                 iconCls:'icon-cancel',
                 handler:function(){
					var row = $('#weixintable').datagrid('getSelected');
	            	if(row){
	            		$.messager.confirm('提示', '确定要删除此用户吗？', function(r){
	           		         if (r){
	            		        delUser(row.id);
	           		         }
	           		    });
	            	}else{
	            		$.messager.alert('警告','请先选择用户！','warning');
	                }
	             }
				}]});
		});
		$('#weixintable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');	      
		function updateuserform(){
        $('#updateuserform').form('submit',{
            url:"<c:url value='/weixin/upduser'/>",
            onSubmit:function(){
                return $(this).form('validate');
            },
            success:function(data){
                if(data == "0000"){
                	$.messager.alert('提示', "修改用户成功！", 'info',function(){
	                	document.getElementById("updateuserform").reset();
						$('#updateuser').window('close');
						$('#usertable').datagrid('reload');
                    });
                }else{
                	$.messager.alert('警告', data, 'warning',function(){
                		document.getElementById("updateuserform").reset();
						$('#updateuser').window('close');
						$('#usertable').datagrid('reload');
                    });
                }
            }
        });
	}  
	function serach(){			
		$('#weixintable').datagrid('loadData',{total:0,rows:[]});
		    var onesearch=$("#onesearchid").attr("value");
		    var search = $('#searchid').combobox('getValue');
		    var level = $('#level').combobox('getValue');
			var state = $('#stateid').combobox('getValue');
		$('#weixintable').datagrid('load',{'search':search,'onesearch':onesearch,'state':state,'level':level,'type':1});;
	}
   function duibi(){			
		$('#weixintable').datagrid('loadData',{total:0,rows:[]});
		    var duibi = $('#duibi').combobox('getValue');
		    var onesearch=$("#onesearchid").attr("value");
		$('#weixintable').datagrid('load',{'duibi':duibi,'onesearch':onesearch,'type':2});;
	}
	function submitform(){
		$('#adduserform').form('submit', {
			url: "<c:url value='/weixin/adduser'/>",
			onSubmit: function() {
				return $(this).form('validate');
			},
			success: function(data) {
				if(data == "0000"){
					$.messager.alert('提示', "添加用户成功！", 'info', function(){
						document.getElementById("adduserform").reset();
						$('#weixintable').datagrid('reload');
						$('#adduser').window('close');
					});
				}else{
					$.messager.alert('警告', data, 'warning',function(){
						document.getElementById("adduserform").reset();
						$('#weixintable').datagrid('reload');
						$('#adduser').window('close');
				    });
				}
			}
		});
	}

	function delUser(id){
       $.ajax({
          type:'post',
          url:'<c:url value="/weixin/deluser"/>',
          data:'id='+id,
          success:function(data){
             if(data == '0000'){
            	 $.messager.alert('提示', "删除成功！", 'info',function(){
 					$('#weixintable').datagrid('reload');
                 });
             }else{
            	 $.messager.alert('提示', data, 'warning',function(){
  					$('#weixintable').datagrid('reload');
                 });
             }
          }
       });
	}



    function exportExcel() {
            var onesearch=$("#onesearchid").attr("value");
		    var search = $('#searchid').combobox('getValue');
		    var level = $('#level').combobox('getValue');
			var state = $('#stateid').combobox('getValue');
	window.open('<c:url value="/weixin/exportExcel"/>?search='+search+'&onesearch='+onesearch+'&level='+level+'&state='+state);
}
    
    
             
    
	</script>

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr>
	    <td>选择查询条件:<select id="searchid" name="search" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
		                <option value="1">ID号</option>
						<option value="2">用户名</option>
						<option value="3">手机号</option>
						<option value="4">真实名</option>
						<option value="5">身份证</option>
						<option value="6">推荐人</option>
		              </select>
		</td>
		<td>对比:<select id="duibi" name="duibi" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="1">真实姓名对比</option>
						<option value="2">手机号对比</option>
						<option value="3">微信号对比</option>
		 </select></td> 
		<td>输入查询内容<input id="onesearchid" name="onesearch" type="text" size="10" editable="false"/></td>
		<td>会员级别:<select id="level" name="level" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
		                <option value="0">全部</option>
						<option value="5">免费会员</option>
						<option value="1">星级会员</option>
						<option value="2">贵宾会员</option>
						<option value="3">高级会员</option>
						<option value="4">超级会员</option>
		              </select>
		</td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">正常</option>
						<option value="2">冻结</option>
						<option value="3">删除</option>
		              </select></td>   
	 
		<td><a href="javascript:void(0)" onclick="duibi();" class="easyui-linkbutton" iconCls="icon-search">对比</a></td>          
		<td><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>
		</tr> 
	</table>
    <table id="weixintable" class="easyui-datagrid" data-options="url:'<c:url value="/weixin/getuserinfo"/>',title: '用户管理',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>  
				<th data-options="field:'id',width:20,halign:'center'">ID号</th>
				<th data-options="field:'username',width:40,halign:'center'">用户名</th>
				<th data-options="field:'sex',width:20,halign:'center',formatter:function(value,row,index){
				   if(value == 1){
				     return '男';
				   }else if(value ==2){
				     return '女';
				   }else{
				     return '保密';
				   }
				}">性别</th>
				<th data-options="field:'mobile',width:40,halign:'center'">手机号</th>
				<th data-options="field:'weixin',width:40,halign:'center'">微信号</th>
				<th data-options="field:'isgroup',width:40,halign:'center',formatter:function(value,row,index){
				   if(value == 1){
				     return '否';
				   }else if(value ==2){
				     return '是';
				   }
				}">是否入群</th>
				<th data-options="field:'recommend',width:40,halign:'center'" nowrap="nowrap">推荐人</th>
				<th data-options="field:'createdate',width:60,halign:'center'" nowrap="nowrap">创建时间</th>
				<th data-options="field:'email',width:30,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 8){
				         return value.substring(0,8)+'...';
				      }
				   }
				   return value;
				}">电子邮箱</th>
				<th data-options="field:'realname',width:30,halign:'center'">真实姓名</th>
				<th data-options="field:'idcard',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 8){
				         return value.substring(0,8)+'...';
				      }
				   }
				   return value;
				}">身份证号</th>
				<th data-options="field:'address',width:60,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 8){
				         return value.substring(0,8)+'...';
				      }
				   }
				   return value;
				}">地址</th>
				<th data-options="field:'level',width:30,halign:'center',formatter:function(value,row,index){
				   if(value == 0){
				     return '免费会员';
				   }else if(value == 1){
				     return '星级会员';
				   }else if(value ==2){
				     return '贵宾会员';
				   }else if(value ==3){
				     return '高级会员';
				   }else if(value ==4){
				     return '超级会员';
				   }
				}" align="right">会员等级</th>
			    <th data-options="field:'adminName',width:20,halign:'center'" align="right">商务专员</th>
				<th data-options="field:'state',width:20,halign:'center',formatter:function(value,row,index){
				     if(value == 1){
				       return '正常';
				   }else if(value ==2){
				     return '冻结';
				   }else{
				     return '删除';
				   }
				}">状态</th>
				<th data-options="field:'desction',width:20,halign:'center'" align="right">描述</th>
				<th data-options="field:'aaa',width:20,halign:'center'" align="right">归属</th>
			</tr>
		</thead>
	</table>
	
	<div id="scanuser" class="easyui-window" data-options="title:'用户详情',iconCls:'icon-search'" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="oneweixintable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td width="30%">用户名：</td>
			    <td id="oneusernameid"></td>
			  </tr>
			  <tr>
			    <td>性别：</td>
			    <td id="onesexid"></td>
			  </tr>
			  <tr>
			    <td>手机号：</td>
			    <td id="onemobileid"></td>
			  </tr>
			   <tr>
			    <td>微信号：</td>
			    <td id="oneweixinid"></td>
			  </tr>
			  <tr>
			    <td>创建时间：</td>
			    <td id="onecreatedateid"></td>
			  </tr>
			  <tr>
			    <td>电子邮箱：</td>
			    <td id="oneemailid"></td>
			  </tr>
			  <tr>
			    <td>真实姓名：</td>
			    <td id="onerealnameid"></td>
			  </tr>
			  <tr>
			    <td>身份证号：</td>
			    <td id="oneidcardid"></td>
			  </tr>
			  <tr>
			    <td>地址：</td>
			    <td id="oneaddressid"></td>
			  </tr>		
			  <tr>
			    <td>会员等级：</td>
			    <td id="onelevelid"></td>
			  </tr>
			  <tr>
			    <td>状态：</td>
			    <td id="onestateid"></td>
			  </tr>			  
			</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanuser').window('close');">关闭</a>
		</div>
	  </div>
	</div>
	<div id="updateuser" class="easyui-window" data-options="title:'修改用户',iconCls:'icon-edit',modal:true" style="width:500px;height:400px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="updateuserform" method="post">
				<table style="line-height: 30px;" align="center">
				<tr><td></td><td><input id="updateuserid" name="id" type="hidden"/></td></tr>
				<tr><td>登陆名:</td><td><span id="updatename"></span></td></tr>
				<tr><td>性别:</td><td><input id="maleid" name="sex" type="radio" value="1" checked="checked"/>男&nbsp;&nbsp;<input id="femaleid" name="sex" type="radio" value="2"/>女</td></tr>
				<tr><td>手机号:</td><td><input id="updatemobile" name="mobile" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>电子邮箱:</td><td><input id="updateemail" name="email" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>真实姓名:</td><td><input id="updaterealname" name="realname" class="easyui-validatebox" type="text"></td></tr>
				<tr><td>身份证号:</td><td><input id="updateidcard" name="idcard" class="easyui-validatebox" maxlength="18" type="text"></td></tr>
				<tr><td>地址:</td><td><input id="updateaddress" name="address" class="easyui-validatebox" maxlength="18" type="text"></td></tr>
				<tr><td>商务专员:</td><td><input id="updateadminName" name="adminName" class="easyui-validatebox" type="text"></td></tr>
				<tr><td>描述:</td><td><textarea id="desction" name="desction" class="easyui-validatebox" style="width:150px"></textarea></td></tr>
				
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="updateuserform();">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#updateuser').window('close');">取消</a>
			</div>
		</div>
	</div>
	
	<div id="adduser" class="easyui-window" data-options="title:'添加用户',iconCls:'icon-add',modal:true" style="width:700px;height:600px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="adduserform" method="post">
				<table width="100%" cellpadding="5" cellspacing="1">
				<tr><td>用户名:</td><td><input name="username" class="easyui-validatebox" type="text" data-options="required:true" ></td></tr>			
				<tr><td>性别:</td><td><input name="sex" type="radio" value="1" checked="checked"/>男&nbsp;&nbsp;<input name="sex" type="radio" value="2"/>女</td></tr>
				<tr><td>手机号:</td><td><input name="mobile" class="easyui-validatebox" type="text" data-options=""></td></tr>
				<tr><td>微信号:</td><td><input name="weixin" class="easyui-validatebox" type="text" data-options=""></td></tr>
				<tr><td>推荐人:</td><td><input name="recommend" class="easyui-validatebox" type="text" data-options=""></td></tr>
				<tr><td>电子邮箱:</td><td><input name="email" class="easyui-validatebox" type="text" data-options=""></td></tr>
				<tr><td>真实姓名:</td><td><input name="realname" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>身份证号:</td><td><input name="idcard" class="easyui-validatebox" type="text" maxlength="18" data-options=""></td></tr>			
				<tr><td>地址:</td><td><input name="address" class="easyui-validatebox" type="text"></td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submitform();">添加</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#adduser').window('close');$('#showcorp').hide();$('#showdepartment').hide();">取消</a>
			</div>
		</div>
	</div>		
  </body>
</html>
