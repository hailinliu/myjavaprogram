<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>会员信息表</title>   
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
		$('#scanmember').window('close');
		$('#usermemadd').window('close');
		$('#updatemember').window('close');
		$('#addmember').window('close');
		$('#usertable').datagrid({
			toolbar:[{
				 id:'collectionusbtnscan',
                 text:'用户详情',
                 iconCls:'icon-search',
				handler:function(){
				var row = $('#usertable').datagrid('getSelected');
				if(row){
				getuserinfo(row.userid);
				}else{
				$.messager.alert('警告', "请先选择用户！", 'warning');
				}
				
			    }
			},{
				 id:'collectionusbtnscan',
                 text:'会员信息详情',
                 iconCls:'icon-search',
				handler:function(){
				var row = $('#usertable').datagrid('getSelected');
				    if(row){
					    $('#scanusernameid').empty().append(row.username);					    
					    $('#scancollectageid').empty().append(row.collectage);
					    $('#scanlikeoptionid').empty().append(row.likeoption);
					    $('#scanchannelid').empty().append(row.channel);
					    $('#scantargetid').empty().append(row.target);
					    $('#scanserviceid').empty().append(row.service);
					    $('#scanpriceid').empty().append(row.price);
					    $('#scansuggestid').empty().append(row.suggest);					   									
					    $('#scanmember').window('open');
					}else{
					    $.messager.alert('警告', "请先选择用户！", 'warning');
				    }				
			    }
			},
			{	
                id:'membtnscan',
                text:'修改用户信息',
                iconCls:'icon-edit',
                handler:function(){
                    var row = $('#usertable').datagrid('getSelected');
                    if(row){
                    $('#updatememid').val(row.id);
                    	$('#updatememid').val(row.id);
						$('#updateusername').empty().append(row.username);
						$('#updatecollectage').combobox('setValue',row.collectage);
						var inputs1 = document.getElementsByName("channel_c");
						for (var j = 0; j < inputs1.length; j++) {
			                        inputs1[j].checked = "";
			            }			            	
						var arr1=row.channel;
						if(arr1!=null){
				            arr1 = arr1.split(",");
				          
				            for (var i = 0; i < arr1.length; i++) {
				                for (var j = 0; j < inputs1.length; j++) {
				                    if (arr1[i] == inputs1[j].value) {
				                        inputs1[j].checked = true;
				                       break;
				                    }
				                }
				            }
			            }
			            				            
						var inputs2 = document.getElementsByName("likeoption_c");
						for (var j = 0; j < inputs2.length; j++) {
			                        inputs2[j].checked = "";
			            }
						var arr2=row.likeoption;
						if(arr2!=null){
				            arr2 = arr2.split(",");
				            for (var i = 0; i < arr2.length; i++) {
				                for (var j = 0; j < inputs2.length; j++) {
				                    if (arr2[i] == inputs2[j].value) {
				                        inputs2[j].checked = true;
				                       break;
				                    }
				                }
				            }
			            }
						
						var inputs3 = document.getElementsByName("target_c");
						for (var j = 0; j < inputs3.length; j++) {
			                        inputs3[j].checked = "";
			            }
						var arr3=row.target;
						if(arr3!=null){
			            arr3 = arr3.split(",");
			            for (var i = 0; i < arr3.length; i++) {
			                for (var j = 0; j < inputs3.length; j++) {
			                    if (arr3[i] == inputs3[j].value) {
			                        inputs3[j].checked = true;
			                       break;
			                    }
			                }
			                }
			            }   					
						var inputs = document.getElementsByName("service");
						for (var j = 0; j < inputs.length; j++) {
			                        inputs[j].checked = "";
			            }
						var arr=row.service;
					if(arr!=null){
			            arr = arr.split(",");
			            for (var i = 0; i < arr.length; i++) {
			                for (var j = 0; j < inputs.length; j++) {
			                    if (arr[i] == inputs[j].value) {
			                        inputs[j].checked = true;
			                       break;
			                    }
			                }
			                }
			            }
			            
			           var inputs = document.getElementsByName("isjoin");
						for (var j = 0; j < inputs.length; j++) {
			                        inputs[j].checked = "";
			            }
						var arr=row.isjoin;
					if(arr!=null){
			            arr = arr.split(",");
			            for (var i = 0; i < arr.length; i++) {
			                for (var j = 0; j < inputs.length; j++) {
			                    if (arr[i] == inputs[j].value) {
			                        inputs[j].checked = true;
			                       break;
			                    }
			                }
			                }
			            }
			          
			           var inputs = document.getElementsByName("isload");
						for (var j = 0; j < inputs.length; j++) {
			                        inputs[j].checked = "";
			            }
						var arr=row.isload;
					if(arr!=null){
			            arr = arr.split(",");
			            for (var i = 0; i < arr.length; i++) {
			                for (var j = 0; j < inputs.length; j++) {
			                    if (arr[i] == inputs[j].value) {
			                        inputs[j].checked = true;
			                       break;
			                    }
			                }
			                }
			            }
					 $('#updateprice').combobox('setValue',row.price);
				     $('#updatemember').window('open');
                    }else{
                    	$.messager.alert('警告', "请先选择用户！", 'warning');
                    }
                }
				}				
	  			]
	  				});
	  				
	              });
	              
	       function getuserinfo(id){
      $.ajax({
		      type:'post',
		     url:"/wswhly/sys/getUserById", 
		      data:'id='+id,
		      success:function(data){
		      data=$.parseJSON(data);	
		   
		           $('#oneusernameid').empty().append(data.username);
		           $('#onesexid').empty().append(data.sex);
					    	if(data.sex == 1){
						    $('#onesexid').empty().append('男');
					    }else if(data.sex == 2){
						    $('#onesexid').empty().append('女');
						}else {
						    $('#onesexid').empty().append('保密');
						}
					    $('#onemobileid').empty().append(data.mobile);
					    $('#onecreatedateid').empty().append(data.createdate);
					    $('#oneemailid').empty().append(data.email);
					    $('#onerealnameid').empty().append(data.realname);
					    $('#oneidcardid').empty().append(data.idcard);
					    $('#onejobid').empty().append(data.jobname);
					    $('#oneaddressid').empty().append(data.address);
					    $('#onepointid').empty().append(data.point);
					    $('#onemoneyid').empty().append(data.money);
					    $('#onelevelid').empty().append(data.username);
					    if(data.level == 0){
						     $('#onelevelid').empty().append('免费会员');
						}else if(data.level == 1){
						     $('#onelevelid').empty().append('星级会员');
						}else if(data.level ==2){
						     $('#onelevelid').empty().append('贵宾会员');
						}else if(data.level ==3){
						     $('#onelevelid').empty().append('高级会员');
						}else if(data.level ==4){
						     $('#onelevelid').empty().append('超级会员');
						}
						if(data.state == 1){
						    $('#onestateid').empty().append('正常');
					    }else if(data.state == 2){
						    $('#onestateid').empty().append('冻结');
						}else if(data.state == 3){
						    $('#onestateid').empty().append('删除');
						}
		      }
		   });
		   $('#scanuser').window('open');	
}
	$(function(){
		$('#scanuser').window('close');

				});
						
	       
        function updatememform(){
						var likeoption_c="";
						var inputs2 = document.getElementsByName("likeoption_c");
						for (var j = 0; j < inputs2.length; j++) {
							if(inputs2[j].checked){
							likeoption_c+=inputs2[j].value+",";
							}
			            }
						$('#updatelikeoption').val(likeoption_c);
	                     var channel_c="";
						var inputs2 = document.getElementsByName("channel_c");
						for (var j = 0; j < inputs2.length; j++) {
							if(inputs2[j].checked){
							channel_c+=inputs2[j].value+",";
							}
			            }
						$('#updatechannel').val(channel_c);
						
						  var target_c="";
						var inputs2 = document.getElementsByName("target_c");
						for (var j = 0; j < inputs2.length; j++) {
							if(inputs2[j].checked){
							target_c+=inputs2[j].value+",";
							}
			            }
						$('#updatetarget').val(target_c);
           $('#updatememform').form('submit',{
            url:"<c:url value='/member/usermemupd'/>",
            onSubmit:function(){
                return $(this).form('validate');
            },
            success:function(data){
                if(data == "0000"){
                	$.messager.alert('提示', "修改用户成功！", 'info',function(){
	                	document.getElementById("updatememform").reset();
						$('#updatemember').window('close');
						$('#usertable').datagrid('reload');
                    });
                }else{
                	$.messager.alert('警告', data, 'warning',function(){
                		document.getElementById("updatememform").reset();
						$('#updatemember').window('close');
						$('#usertable').datagrid('reload');
                    });
                }
            }
        });
	}
	              
	              
	               //objects为json数据源对象
	                $('#usernameid').autocomplete('<c:url value="/member/automember"/>', 
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
			                   value: row.username,
			                   result: row.username
			               }
			           }
			           );
	                },
	                formatItem: function (row, i, max) {
	                    return "<table width='97%'><tr><td align='left'>会员名称：" + row.username + "</td></tr></table>";
	                    //return  row.name;
	                }, 
	                formatMatch: function(row, i, max){ 
	                     return row.username;
	                } ,

	                formatResult: function(row, i, max) {
	                     return row.username;
	                }                 
	             });
	              
	
     function serach(){
			
		$('#usertable').datagrid('loadData',{total:0,rows:[]});
		     var userid = $("#useridid").attr("value");
		    var username = $("#usernameid").attr("value");
		    var collectage = $("#collectageid").combobox("getValue");
		    var likeoption =$("#likeoptionid").combobox("getValue");
		    var price = $("#priceid").combobox("getValue");
		$('#usertable').datagrid('load',{'userid':userid,'username':username,'collectage':collectage,'likeoption':likeoption,'price':price});
		}
		
		
     function exportExcel() {
            var userid = $("#useridid").attr("value");
		    var username = $("#usernameid").attr("value");
		  var collectage = $("#collectageid").combobox("getValue");
		    var likeoption =$("#likeoptionid").combobox("getValue");
		    var price = $("#priceid").combobox("getValue");		    
	window.open('<c:url value="/member/exportExcel"/>?userid='+userid+'&username='+username+'&collectage='+collectage+'&likeoption='+likeoption+'&price='+price);
}  
	</script>
  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr>
		    <td>ID号:<input id="useridid" name="userid" type="text" size="10" editable="false"/></td>
            <td>用户名:<input id="usernameid" name="username" type="text" size="8" editable="false"/></td>
        	<td>收藏履历:<select id="collectageid" name="collectage" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="">全部</option>
						<option value="2年以下">2年以下</option>
						<option value="2-5年">2-5年</option>
                        <option value="5-10年">5-10年</option>
                        <option value="10年以上">10年以上</option>
		              </select></td>
		    <td>收藏品类:<select id="likeoptionid" name="likeoption" class="easyui-combobox" editable="false" data-options="panelHeight:'auto' ">
						<option value="">全部</option>
						<option value="瓷器陶器">瓷器陶器</option>
						<option value="玉器杂项">玉器杂项</option>
                        <option value="书画古籍">书画古籍</option>
                        <option value="青铜佛像">青铜佛像</option>
                        <option value="家具木器">家具木器</option>
		              </select></td>
		
		   <td>接受价格:<select id="priceid" name="price" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="">全部</option>
						<option value="2万以下">2万以下</option>
						<option value="5万以下">5万以下</option>
                        <option value="10万以下">10万以下</option>
                        <option value="50万以下">50万以下</option>
                        <option value="100万以下">100万以下</option>
                        <option value="100万以上">100万以上</option>
		              </select></td>
		  <td><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>
	    <td><a href="javascript:exportExcel()" class="easyui-linkbutton" iconCls="icon-redo">导出Excel</a></td>
		</tr>
	</table>
  			
			    <table id="usertable" class="easyui-datagrid" data-options="url:'<c:url value="/member/getMemberList"/>',queryParams:{'userid':'${comprehensiveid}'},title: '会员管理',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true" >
		<thead>
			<tr>
				 <th data-options="field:'userid',width:20,halign:'center'">用户ID</th>
				 <th data-options="field:'username',width:30,halign:'center'">用户名</th>
				 <th data-options="field:'realname',width:30,halign:'center'">真实姓名</th>
                 <th data-options="field:'birth',width:40,halign:'center'">出生年份</th>
                 <th data-options="field:'collectage',width:40,halign:'center'">收藏履历</th>
				 <th data-options="field:'likeoption',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 8){
				         return value.substring(0,8)+'...';
				      }
				   }
				   return value;
                 } ">收藏品类</th>
			     <th data-options="field:'hopeorganization',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 8){
				         return value.substring(0,8)+'...';
				      }
				   }
				   return value;
                 }">希望鉴定渠道</th>
				 <th data-options="field:'organization',width:40,halign:'center'">鉴定机构名称</th>
			     <th data-options="field:'collection1',width:40,halign:'center'">行业专家名称</th>
			     <th data-options="field:'collection2',width:40,halign:'center'">华豫之门专家</th>
			     <th data-options="field:'service',width:40,halign:'center' ,formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 8){
				         return value.substring(0,8)+'...';
				      }
				   }
				   return value;
				}">希望网站提供的服务</th>
				<th data-options="field:'target',width:40,halign:'center'">收藏目的</th>
			    <th data-options="field:'price',width:40,halign:'center'">接受价格</th>
			    <th data-options="field:'ispush',width:40,halign:'center'">是否愿意信息推送</th>
			    <th data-options="field:'suggest',width:30,halign:'center' ,formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 8){
				         return value.substring(0,8)+'...';
				      }
				   }
				   return value;
				}">建议</th>
			</tr>
		</thead>
	</table>
	<div id="updatemember" class="easyui-window" data-options="title:'修改会员',iconCls:'icon-edit',modal:true" style="width:500px;height:400px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="updatememform" method="post" >
				<table style="line-height: 30px;" align="center">
				<tr><td></td><td><input id="updatememid" name="id" type="hidden"/></td></tr>
				<tr><td>登陆名:</td><td><span id=updateusername></span></td></tr>
				<tr><td>收藏履历:</td><td><select id="updatecollectage" name="collectage" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="2年以下">2年以下</option>
						<option value="2-5年">2-5年</option>
                        <option value="5-10年">5-10年</option>
                        <option value="10年以上">10年以上</option>
		              </select></td></tr>
				<tr><td>收藏品类:</td><td>
								<input id="updatelikeoption" name="likeoption" type="hidden"/>
								<input id="updatelikeoption0" type='checkbox' name='likeoption_c' class="easyui-validatebox" maxlength="18" value="瓷器陶器" >瓷器陶器
								<input id="updatelikeoption1" type='checkbox' name='likeoption_c' value="玉器杂项" >玉器杂项
								<input id="updatelikeoption2" type='checkbox' name='likeoption_c' value="书画古籍" >书画古籍
								<input id="updatelikeoption3" type='checkbox' name='likeoption_c' value="青铜佛像" >青铜佛像
								<input id="updatelikeoption4" type='checkbox' name='likeoption_c' value="家具木器" >家具木器
								<input id="updatelikeoption5" type='checkbox' name='likeoption_c' value="珠宝国石" >珠宝国石   </td></tr>
				<tr><td>收藏渠道:</td><td>
				<input id="updatechannel" name="channel" type="hidden"/>
				<input id="updatechannel0" type='checkbox' name='channel_c' class="easyui-validatebox" maxlength="18" value="古玩城" >古玩城
				<input id="updatechannel1" type='checkbox' name='channel_c' value="朋友圈" >朋友圈
				<input id="updatechannel2" type='checkbox' name='channel_c' value="拍卖会" >拍卖会
				<input id="updatechannel3" type='checkbox' name='channel_c' value="商家" >商家
				<input id="updatechannel4" type='checkbox' name='channel_c' value="网络购买" >网络购买</td></tr>
				<tr><td>收藏目的:</td><td>
				<input id="updatetarget" name="target" type="hidden"/>
				<input id="updatetarget" type='checkbox' name='target_c'  class="easyui-validatebox" maxlength="18" value="个人爱好" >个人爱好
				<input id="updatetarget" type='checkbox' name='target_c'  class="easyui-validatebox" maxlength="18" value="投资" >投资</td></tr>
				<tr><td>希望网站提供的服务:</td><td><input id="updateservice" name="service" class="easyui-validatebox" maxlength="18" type='checkbox'  value="出手藏品">出手藏品
				<input id="updateservice" name="service" class="easyui-validatebox" maxlength="18" type='checkbox'  value="购买藏品">购买藏品
					<input id="updateservice" name="service" class="easyui-validatebox" maxlength="18" type='checkbox'  value="鉴定估值">鉴定估值</td></tr>
				<tr><td>是否参加过海选：</td><td><input id="updateisjoin" name="isjoin"  type="radio" value="是"   />是&nbsp;&nbsp;<input name="isjoin" type="radio" value="否" />否</td></tr>
				<tr><td>是否上过华豫之门 ：</td><td>上过节目&nbsp;&nbsp;[<input id="updateisload" name="isload"  type="radio" value="真品" />真品&nbsp;&nbsp;
				<input id="updateisload" name="isload"  type="radio" value="仿品" />仿品&nbsp;&nbsp;
				<span>&nbsp;&nbsp;<input name="isload" type="radio" value="未上节目"/>未上节目&nbsp;&nbsp;</span>
				<input name="isload" type="radio" value="登过珍宝台"/>登过珍宝台</td></tr>
				<tr><td>接受价格:</td><td><select id="updateprice" name="price" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="2万以下">2万以下</option>
						<option value="5万以下">5万以下</option>
                        <option value="10万以下">10万以下</option>
                        <option value="50万以下">50万以下</option>
                        <option value="100万以下">100万以下</option>
                        <option value="100万以上">100万以上</option>
		              </select></td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="updatememform()">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#updatemember').window('close');">取消</a>
			</div>
		</div>
	</div>
	<div id="scanmember" class="easyui-window" data-options="title:'会员详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="oneusertable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td width="30%">登录名：</td>
			    <td id="scanusernameid"></td>
			  </tr>
			  <tr>
			    <td>收藏履历:</td>
			    <td id="scancollectageid"></td>
			  </tr>
			  <tr>
			    <td>收藏品类:</td>
			    <td id="scanlikeoptionid"></td>
			  </tr>
			  <tr>
			    <td>收藏渠道:</td>
			    <td id="scanchannelid"></td>
			  </tr>
			  <tr>
			    <td>收藏目的:</td>
			    <td id="scantargetid"></td>
			  </tr>
			  <tr>
			    <td>希望网站提供的服务:：</td>
			    <td id="scanserviceid"></td>
			  </tr>
			  <tr>
			    <td>接受价格：</td>
			    <td id="scanpriceid"></td>
			  </tr>
			  <tr>
			    <td>建议：</td>
			    <td id="scansuggestid"></td>
			  </tr>
			</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanmember').window('close');">关闭</a>
		</div>
	  </div>
	</div>
	<div id="scanuser" class="easyui-window" data-options="title:'用户详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="oneusertable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td width="30%">登录名：</td>
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
			    <td>职业：</td>
			    <td id="onejobid"></td>
			  </tr>
			  <tr>
			    <td>地址：</td>
			    <td id="oneaddressid"></td>
			  </tr>
			  <tr>
			    <td>积分：</td>
			    <td id="onepointid"></td>
			  </tr>
			  <tr>
			    <td>余额：</td>
			    <td id="onemoneyid"></td>
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
   <br>

 </body>
</html>
