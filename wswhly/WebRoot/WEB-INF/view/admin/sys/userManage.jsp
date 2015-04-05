<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>用户管理</title>
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
		$('#scanuser').window('close');
		$('#levelcontrol').window('close');
		$('#moneycontrol').window('close');
		$('#updstate').window('close');
		$('#pointcontrol').window('close');
		$('#addjob').window('close');
		$('#editjob').window('close');
		$('#jobdiv').window('close');
		$('#adduser').window('close');
		$('#updateuser').window('close');
		$('#jobdiv').window('close');
		$('#comprehensiveinfo').window('close');
		$('#showdepartment').hide();
		$('#usertable').datagrid({
			toolbar:[{
				 id:'collectionusbtnscan',
                 text:'用户详情',
                 iconCls:'icon-search',
				handler:function(){
				    var row = $('#usertable').datagrid('getSelected');
				    if(row){			   
					    $('#oneusernameid').empty().append(row.username);
					    if(row.idcardimg!=null){
					        var image = row.idcardimg.split(',');					   
					      for (var i = 0; i < image.length-1 ; i++) {
					       $('#oneidcardimgid').empty().append('<img src=http://116.255.149.172:7080/wswhly/Baibaourl//'+image[i]+' width="250" height="250"/>');  
		                  }        
					    }else{
					          $('#oneidcardimgid').empty().append('该用户暂时未上传身份图片');
					    }					         	                 	       				      
				        if(row.sex == 1){
						    $('#onesexid').empty().append('男');
						}else if(row.sex == 2){
							$('#onesexid').empty().append('女');
						}else {
							$('#onesexid').empty().append('保密');
						}
					    $('#onemobileid').empty().append(row.mobile);
					    $('#onecreatedateid').empty().append(row.createdate);
					    $('#oneemailid').empty().append(row.email);
					    $('#onerealnameid').empty().append(row.realname);
					    $('#oneidcardid').empty().append(row.idcard);
					    $('#onejobid').empty().append(row.jobname);
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
				id:'userbtnadd',
				text:'添加用户',
				iconCls:'icon-add',
				handler:function(){
				    document.getElementById("adduserform").reset();
					$('#adduser').window('open');
				}
			},{
                id:'userbtnupd',
                text:'修改用户信息',
                iconCls:'icon-edit',
                handler:function(){
                    var row = $('#usertable').datagrid('getSelected');
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
						if(row.isgroup == 1){ 
							document.getElementById("updateisgroupb").checked = "checked";
					    }else{
					    	document.getElementById("updateisgroupa").checked = "checked";
						}
						$('#updateweixin').val(row.weixin);
						$('#updaterecommend').val(row.recommend);
						$('#updateidcard').val(row.idcard);
						$('#updatejob').combobox('setValue',row.job);
						$('#updateaddress').val(row.address);
						$('#updatejob').combobox('setValue',row.job);
						$('#adminName').val(row.adminName);
						$('#desction').val(row.desction);
						$('#updateuser').window('open');
                    }else{
                    	$.messager.alert('警告', "请先选择用户！", 'warning');
                    }
                }
				},{
	                id:'userbtnmoney',
	                text:'余额控制',
	                iconCls:'icon-edit',
	                handler:function(){
	                    var row = $('#usertable').datagrid('getSelected');
	                    if(row){
	                    	if(row.state == 3){
			            		$.messager.alert('警告','该用户已被删除！','warning');
				            }else{
					            $('#usermoneyid').val(row.id);
							    $('#moneycontrol').window('open');
					        }
	                    }else{
	                    	$.messager.alert('警告', "请先选择用户！", 'warning');
	                    }
	                }
				},{
	                id:'userbtnpoint',
	                text:'积分控制',
	                iconCls:'icon-edit',
	                handler:function(){
	                    var row = $('#usertable').datagrid('getSelected');
	                    
	                    if(row){
	                    	if(row.state == 3){
			            		$.messager.alert('警告','该用户已被删除！','warning');
				            }else{
	                    		$('#userpointid').val(row.id); 
							    $('#pointcontrol').window('open');
					        }
	                    }else{
	                    	$.messager.alert('警告', "请先选择用户！", 'warning');
	                    }
	                }
				},{
	                id:'userbtnlevel',
	                text:'等级控制',
	                iconCls:'icon-edit',
	                handler:function(){
	                    var row = $('#usertable').datagrid('getSelected');
	                    if(row){
	                    	if(row.state == 3){
			            		$.messager.alert('警告','该用户已被删除！','warning');
				            }else{
	                    		$('#userlevelid').val(row.id);
	                    		$('#levelid').combobox('setValue',row.level);
							    $('#levelcontrol').window('open');
					        }
	                    }else{
	                    	$.messager.alert('警告', "请先选择用户！", 'warning');  
	                    }
	                }
				},{
                 id:'userbtnfreeze',
                 text:'冻结/解冻用户',
                 iconCls:'icon-redo',
                 handler:function(){
					var row = $('#usertable').datagrid('getSelected');
	            	if(row){
		            	if(row.state == 3){
		            		$.messager.alert('警告','该用户已被删除！','warning');
			            }else{
		            		$.messager.confirm('提示', '确定要执行该操作吗？', function(r){
		           		         if (r){
			           		         if(row.state == 1){
		            		        	freezeUser(row.id,2);
				           		     }else{
		            		        	freezeUser(row.id,1);
					           		 }
		           		         }
		           		    });
					    }
	            	}else{
	            		$.messager.alert('警告','请先选择用户！','warning');
	                }
	             }
				},{
                 id:'userbtndel',
                 text:'删除用户',
                 iconCls:'icon-cancel',
                 handler:function(){
					var row = $('#usertable').datagrid('getSelected');
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
				},{
              id:'collectioninfobtnscan',
              text:'综合查询',
              iconCls:'icon-search',
              handler:function(){
                 var row = $('#usertable').datagrid('getSelected');
                 if(row){    
               	    document.getElementById("comprehensiveinfo_member").src="<c:url value='/sys/gotourl'/>?comprehensiveid="+row.id+"&url=admin/member/memberManage";
               	    document.getElementById("comprehensiveinfo_collection").src="<c:url value='/sys/gotourl'/>?comprehensiveid="+row.id+"&url=admin/collection/collectionManage";
               	    document.getElementById("comprehensiveinfo_lylots").src="<c:url value='/sys/gotourl'/>?comprehensiveid="+row.id+"&url=admin/lylots/lylotsManage";
               	        $('#comprehensiveinfo').window('open'); 
		          } else{
		               	  $.messager.alert('警告','请选择一条信息','warning');
		          }
              }
             },{
	                 id:'userbtnpasswd',
	                 text:'重置密码',
	                 iconCls:'icon-ok',
	                 handler:function(){
						var row = $('#usertable').datagrid('getSelected');
		            	if(row){
		            		$.messager.confirm('提示', '确定要重置密码吗？', function(r){
		           		         if (r){
		            		        rePassword(row.id);
		           		         }
		           		    });
		            	}else{
		            		$.messager.alert('警告','请先选择用户！','warning');
		                }
		             }
					},{
                 id:'userbtnjob',
                 text:'职业管理',
                 iconCls:'icon-tip',
                 handler:function(){
	        	      $('#typetable').datagrid({
	  				    url:"<c:url value='/sys/getjoblist'/>",
	  				    title:'职业列表',
	  				    fitColumns:true,
	  				    rownumbers:true,
	  				    striped:true,
	  				    singleSelect:true,
	  				    columns:[[
	  				        {field:'id',title:'ID',width:50},
	  				        {field:'name',title:'职业名称',width:50}
	  				    ]],
	  				    toolbar:[{
	  					    id:'btntypeadd',
	  	                    text:'添加',
	  	                    iconCls:'icon-add',
	  	                    handler:function(){
	  				    	  $('#addjob').window('open');
	  	                    }
	  	                },{
	  		                id:'btntypeedit',
	  	                    text:'修改',
	  	                    iconCls:'icon-edit',
	  	                    handler:function(){
	  	                	  var row = $('#typetable').datagrid('getSelected');
	  	                	  if(row){
	  	                		  $('#edittypeid').val(row.id);
	  	                		  $('#edittypename').val(row.name);
	  		                  }
	  	                	  $('#editjob').window('open');
	  	                    }
	  	                },{
	  		                id:'btntypedel',
	  	                    text:'删除',
	  	                    iconCls:'icon-cancel',
	  	                    handler:function(){
	  		                	  var row = $('#typetable').datagrid('getSelected');
	  			              	  if(row){
	  			              		  $.messager.confirm('提示', '确定要删除此类型吗？', function(r){
	  			             		         if (r){
	  			             		        	delType(row.id);
	  			             		         }
	  			             		      });
	  			              	  }else{
	  			              		  $.messager.alert('警告','请选择一条数据','warning');
	  		                      }
	  	                    }
	  	                }],
	  		            pagination:true
	  				});
	  				$("#jobdiv").window("open");
	              }
				}]
		});

		$('#usertable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');
		$.extend($.fn.validatebox.defaults.rules,{
	          repeatname:{
	            validator:function(value,param){
                    return checkRepeatName(value);
                },
              message:'该登录名已经被使用！！'
	          },
	          repeatmobile:{
	            validator:function(value,param){
	                    return ifMobileCanBeUsed(value);
	            },
	            message:'手机号格式错误或者已经被使用！！'
		      },
	          repeatcardid:{
	            validator:function(value,param){
	                    return ifCardidCanBeUsed(value);
	            },
	            message:'非法身份证号或者该号已经被使用！！'
	          },
	          repeatpassword:{
        	    validator:function(value,param){
                        return repeatPassword(value);
                },
                message:'两次输入密码不一致！！'
		      }
	      });

		 //objects为json数据源对象
		   $('#usernameid').autocomplete('<c:url value="/sys/autouser"/>', 
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
	                    return "<table width='97%'><tr><td align='left'>用户名：" + row.username + "</td></tr></table>";
	                    //return  row.name;
	                }, 
	                formatMatch: function(row, i, max){ 
	                     return row.username;
	                } ,

	                formatResult: function(row, i, max) {
	                     return row.username;
	                }                 
	             });

		   $('#mobileid').autocomplete('<c:url value="/sys/automobile"/>', 
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
				                   value: row.mobile,
				                   result: row.mobile
				               }
				           }
				           );
		                },
		                formatItem: function (row, i, max) {
		                    return "<table width='97%'><tr><td align='left'>手机号码：" + row.mobile + "</td></tr></table>";
		                    //return  row.name;
		                }, 
		                formatMatch: function(row, i, max){ 
		                     return row.mobile;
		                } ,

		                formatResult: function(row, i, max) {
		                     return row.mobile;
		                }                 
		             });

		   $('#realnameid').autocomplete('<c:url value="/sys/autorealname"/>', 
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
				                   value: row.realname,
				                   result: row.realname
				               }
				           }
				           );
		                },
		                formatItem: function (row, i, max) {
		                    return "<table width='97%'><tr><td align='left'>真实姓名：" + row.realname + "</td></tr></table>";
		                    //return  row.name;
		                }, 
		                formatMatch: function(row, i, max){ 
		                     return row.realname;
		                } ,

		                formatResult: function(row, i, max) {
		                     return row.realname;
		                }                 
		             });

		   $('#idcardid').autocomplete('<c:url value="/sys/autoidcard"/>', 
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
				                   value: row.idcard,
				                   result: row.idcard
				               }
				           }
				           );
		                },
		                formatItem: function (row, i, max) {
		                    return "<table width='97%'><tr><td align='left'>身份证号：" + row.idcard + "</td></tr></table>";
		                    //return  row.name;
		                }, 
		                formatMatch: function(row, i, max){ 
		                     return row.idcard;
		                } ,

		                formatResult: function(row, i, max) {
		                     return row.idcard;
		                }                 
		             });
		   $('#adminNameid').autocomplete('<c:url value="/sys/autoadminName"/>', 
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
				                   value: row.adminName,
				                   result: row.adminName
				               }
				           });
		                },
		                formatItem: function (row, i, max) {
		                    return "<table width='97%'><tr><td align='left'>商务专员：" + row.adminName + "</td></tr></table>";
		                    //return  row.name;
		                }, 
		                formatMatch: function(row, i, max){ 
		                     return row.adminName;
		                } ,

		                formatResult: function(row, i, max) {
		                     return row.adminName;
		                }                 
		             });
		
	});
	
	function serach(){
			
		$('#usertable').datagrid('loadData',{total:0,rows:[]});
		    var id = $("#idid").attr("value");
		    var username = $("#usernameid").attr("value");
		    var mobile = $("#mobileid").attr("value");
		    var realname = $("#realnameid").attr("value");
		    var idcard = $("#idcardid").attr("value");
		    var adminName=$("#adminNameid").attr("value");
		    var money = $('#money').combobox('getValue');
		    var level = $('#level').combobox('getValue');
			var state = $('#stateid').combobox('getValue');
			var baibaoshopstate = $('#baibaoshopstateid').combobox('getValue');
		$('#usertable').datagrid('load',{'id':id,'username':username,'mobile':mobile,'realname':realname,'idcard':idcard,'adminName':adminName,'state':state,'baibaoshopstate':baibaoshopstate,'level':level,'money':money});
	}

	//判断登录名是否重复
	function checkRepeatName(name){
        var flag = false;
        $.ajax({
            async:false,
            type:'post',
            url:"<c:url value='/sys/ifexistsuser'/>",
            data:'name='+name,
            success:function(data){
               var json = eval("("+data+")");
               if(data == '0000'){
                   flag = true;
               }else if(data == '0001'){
                   flag = false;
               }else{
            	   $.messager.alert('警告', data, 'warning');
               }
            }
        });
        return flag;
	}

	//判断手机号是否可用
	function ifMobileCanBeUsed(mobile){
        if(checkMobileStyle(mobile) == true && checkRepeatMobile(mobile)){
            return true;
        }else{
            return false;
        }
    }

	//判断手机号是否被使用
	function checkRepeatMobile(mobile){
        var flag = false;
        $.ajax({
            async:false,
            type:'post',
            url:"<c:url value='/sys/isrepeatmobile'/>",
            data:'mobile='+mobile,
            success:function(data){
               var json = eval("("+data+")");
               if(data == '0000'){
                   flag = true;
               }else if(data == '0001'){
                   flag = false;
               }else{
            	   $.messager.alert('警告', data, 'warning');
               }
            }
        });
        return flag;
	}

	function submitform(){
		$('#adduserform').form('submit', {
			url: "<c:url value='/sys/adduser'/>",
			onSubmit: function() {
				return $(this).form('validate');
			},
			success: function(data) {
				if(data == "0000"){
					$.messager.alert('提示', "添加用户成功！", 'info', function(){
						document.getElementById("adduserform").reset();
						$('#usertable').datagrid('reload');
						$('#adduser').window('close');
					});
				}else{
					$.messager.alert('警告', data, 'warning',function(){
						document.getElementById("adduserform").reset();
						$('#usertable').datagrid('reload');
						$('#adduser').window('close');
				    });
				}
			}
		});
	}
function updateupdform(){					
        $('#updateupdform').form('submit',{
            url:"<c:url value='/sys/sateControl'/>",
            onSubmit:function(){
                return $(this).form('validate');
            },       
            success:function(data){
                if(data == "0000"){
                	$.messager.alert('提示', "修改审核状态成功！", 'info',function(){
	                	document.getElementById("updateupdform").reset();
						$('#updstate').window('close');
						$('#usertable').datagrid('reload');
                    });
                }else{
                	$.messager.alert('警告', data, 'warning',function(){
                		document.getElementById("updateupdform").reset();
						$('#updstate').window('close');
						$('#usertable').datagrid('reload');
                    });
                }
            }
        });
	}
	function updateuserform(){
        $('#updateuserform').form('submit',{
            url:"<c:url value='/sys/upduser'/>",
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

	function delUser(id){
       $.ajax({
          type:'post',
          url:'<c:url value="/sys/deluser"/>',
          data:'id='+id,
          success:function(data){
             if(data == '0000'){
            	 $.messager.alert('提示', "删除成功！", 'info',function(){
 					$('#usertable').datagrid('reload');
                 });
             }else{
            	 $.messager.alert('提示', data, 'warning',function(){
  					$('#usertable').datagrid('reload');
                 });
             }
          }
       });
	}

	function freezeUser(id,state){
	       $.ajax({
	          type:'post',
	          url:'<c:url value="/sys/freezeuser"/>',
	          data:'id='+id+'&state='+state,
	          success:function(data){
	             if(data == '0000'){
	            	 $.messager.alert('提示', "操作成功！", 'info',function(){
	 					$('#usertable').datagrid('reload');
	                 });
	             }else{
	            	 $.messager.alert('提示', data, 'warning',function(){
	  					$('#usertable').datagrid('reload');
	                 });
	             }
	          }
	       });
		}

	//判断身份证号是否可用
	function ifCardidCanBeUsed(cardid){
        if(checkCardidStyle(cardid) == checkCardidStyle("222426300207031") && checkRepeatCardid(cardid) == true){
            return true;
        }else{
            return false;
        }
    }

	//判断身份证号是否重复
	function checkRepeatCardid(name){
        var flag = false;
        $.ajax({
            async:false,
            type:'post',
            url:"<c:url value='/sys/isrepeatcardid'/>",
            data:'cardid='+name+'&ismanager=0',
            success:function(data){
               if(data == '0000'){
                   flag = true;
               }else if(data == '0001'){
                   flag = false;
               }else{
            	   $.messager.alert('警告', data, 'warning');
               }
            }
        });
        return flag;
	}

	function repeatPassword(password) {
		if ($('#repassword').val() == $('#addpasswordid').val()) {
           return true;
		} else {
           return false;
		}
	}

	function submittypeform(){
		$('#addtypeform').form('submit', {
			url: "<c:url value='/sys/addjob'/>",
			onSubmit: function() {
				return $(this).form('validate');
			},
			success: function(data) {
				if(data == "0000"){
					$.messager.alert('提示', "添加成功！", 'info', function(){
						document.getElementById("addtypeform").reset();
						$('#typetable').datagrid('reload');
						$('#addjob').window('close');
					});
				}else{
					$.messager.alert('警告', data, 'warning');
				}
			}
		});
	}

	function edittypeform(){
		$('#edittypeform').form('submit', {
			url: "<c:url value='/sys/updjob'/>",
			onSubmit: function() {
				return $(this).form('validate');
			},
			success: function(data) {
				if(data == "0000"){
					$.messager.alert('提示', "修改成功！", 'info', function(){
						document.getElementById("edittypeform").reset();
						$('#typetable').datagrid('reload');
						$('#editjob').window('close');
					});
				}else{
					$.messager.alert('警告', data, 'warning');
				}
			}
		});
	}

	function delType(id){
	   $.ajax({
	      type:'post',
	      url:'<c:url value="/sys/deljob"/>',
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

	function submitmoneyform(){
		$('#moneycontrolform').form('submit', {
			url: "<c:url value='/sys/moneyControl'/>",
			onSubmit: function() {
				return $(this).form('validate');
			},
			success: function(data) {
				if(data == "0000"){
					$.messager.alert('提示', "操作成功！", 'info', function(){
						document.getElementById("moneycontrolform").reset();
						$('#usertable').datagrid('reload');
						$('#moneycontrol').window('close');
					});
				}else{
					$.messager.alert('警告', data, 'warning');
				}
			}
		});
	}

	function submitpointform(){
		$('#pointcontrolform').form('submit', {
			url: "<c:url value='/sys/pointControl'/>",
			onSubmit: function() {
				return $(this).form('validate');
			},
			success: function(data) {
				if(data == "0000"){
					$.messager.alert('提示', "操作成功！", 'info', function(){
						document.getElementById("pointcontrolform").reset();
						$('#usertable').datagrid('reload');
						$('#pointcontrol').window('close');
					});
				}else{
					$.messager.alert('警告', data, 'warning');
				}
			}
		});
	}
	
	function submitlevelform(){
		$('#levelcontrolform').form('submit', {
			url: "<c:url value='/sys/levelControl'/>",
			onSubmit: function() {
				return $(this).form('validate');
			},
			success: function(data) {
				if(data == "0000"){
					$.messager.alert('提示', "操作成功！", 'info', function(){
						document.getElementById("levelcontrolform").reset();
						$('#usertable').datagrid('reload');
						$('#levelcontrol').window('close');
					});
				}else{
					$.messager.alert('警告', data, 'warning');
				}
			}
		});
	}

	function rePassword(value){
		$.ajax({
		      type:'post',
		      url:'<c:url value="/sys/rePassword"/>',
		      data:'id='+value,
		      success:function(data){
		         if(data == '0000'){
		        	 $.messager.alert('提示', "重置密码成功！", 'info',function(){
						$('#usertable').datagrid('reload');
		             });
		         }else{
		        	 $.messager.alert('提示', data, 'warning',function(){
						$('#usertable').datagrid('reload');
		             });
		         }
		      }
		   });
    }
    function exportExcel() {
            var id = $("#idid").attr("value");
		    var username = $("#usernameid").attr("value");
		    var mobile = $("#mobileid").attr("value");
		    var realname = $("#realnameid").attr("value");
		    var idcard = $("#idcardid").attr("value");
		    var adminName=$("#adminNameid").attr("value");
		    var money = $('#money').combobox('getValue');
		    var level = $('#level').combobox('getValue');
			var state = $('#stateid').combobox('getValue');
			var baibaoshopstate = $('#baibaoshopstateid').combobox('getValue');
	window.open('<c:url value="/sys/exportExcel"/>?id='+id+'&username='+username+'&mobile='+mobile+'&realname='+realname+'&idcard='+idcard+'&adminName='+adminName+'&money='+money+'&level='+level+'&state='+state+'&baibaoshopstate='+baibaoshopstate);
}
    
    
             
    
	</script>

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr>
		<td>ID号:<input id="idid" name="username" type="text" size="10" editable="false"/></td>
		<td>用户名:<input id="usernameid" name="username" type="text" size="10" editable="false"/></td>
		<td>手机号:<input id="mobileid" name="username" type="text" size="10" editable="false"/></td>
		<td>真实名:<input id="realnameid" name="username" type="text" size="10" editable="false"/></td>
		<td>身份证:<input id="idcardid" name="username" type="text" size="10" editable="false"/></td>
	    <td>商务专员<input id="adminNameid" name="username" type="text" size="10" editable="false"/></td>
		
		<td>余额:
		<select id="money" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
		                <option value="0">全部</option>
						<option value="1">等于0</option>
						<option value="2">大于0</option>
		              </select>
		</td>
		<td>会员级别:
		<select id="level" name="state" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
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
	   <td>审核状态:<select id="baibaoshopstateid" name="baibaoshopstate" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="">全部</option>
		             	<option value="0">等待审核</option>
						<option value="1">审核未通过</option>
						<option value="2">审核通过</option>
		     </select></td>	
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>
		<td><a href="javascript:exportExcel()" class="easyui-linkbutton" iconCls="icon-redo">导出Excel</a></td>
		</tr>
	</table>
    <table id="usertable" class="easyui-datagrid" data-options="url:'<c:url value="/sys/getuserinfo"/>',title: '用户管理',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'id',width:20,halign:'center'">ID号</th>
				<th data-options="field:'username',width:40,halign:'center'">登录名</th>
				<th data-options="field:'sex',width:20,halign:'center',formatter:function(value,row,index){
				   if(value == 1){
				     return '男';
				   }else if(value ==2){
				     return '女';
				   }else{
				     return '保密';
				   }
				}">性别</th>
				<th data-options="field:'mobile',width:35,halign:'center'">手机号</th>
				<th data-options="field:'weixin',width:30,halign:'center'">微信号</th>
				<th data-options="field:'createdate',width:35,halign:'center'" nowrap="nowrap">创建时间</th>
				<th data-options="field:'realname',width:30,halign:'center'">真实姓名</th>
				<th data-options="field:'address',width:35,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 8){
				         return value.substring(0,8)+'...';
				      }
				   }
				   return value;
				}">地址</th>
				<th data-options="field:'point',width:25,halign:'center'" align="right">积分</th>
				<th data-options="field:'money',width:25,halign:'center'" align="right">余额</th>
				<th data-options="field:'level',width:30,halign:'center',formatter:function(value,row,index){
				   if(value == 0){
				     return '免费会员';
				   }else if(value == 1){
				     return '星级会员';
				   }else if(value ==2){
				     return '贵宾会员';a
				   }else if(value ==3){
				     return '高级会员';
				   }else if(value ==4){
				     return '超级会员';
				   }
				}" align="right">会员等级</th>
				<th data-options="field:'model',width:30,halign:'center',formatter:function(value,row,index){
				   if(value == 1){
				     return '后台操作';
				   }else if(value ==2){
				     return '用户操作';
				   }else{
				     return '其他操作';
				   }
				}">操作方式</th>
				<th data-options="field:'leveltime',width:20,halign:'center'" align="right">操作时间</th>
				<th data-options="field:'state',width:25,halign:'center',formatter:function(value,row,index){
				   if(value == 1){
				     return '正常';
				   }else if(value ==2){
				     return '冻结';
				   }else{
				     return '删除';
				   }
				}">状态</th>				
				<th data-options="field:'adminName',width:25,halign:'center'" align="right">商务专员</th>
				<th data-options="field:'desction',width:20,halign:'center'" align="right">描述</th>
			</tr>
		</thead>
	</table>
	
	<div id="scanuser" class="easyui-window" data-options="title:'用户详情',iconCls:'icon-search'" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="oneusertable" width="100%" cellpadding="5" cellspacing="1">	
			  <tr>
			    <td width="30%">登录名：</td>
			    <td id="oneusernameid"></td>
			    <td id="oneidcardimgid" rowspan="13" width="250" height="250"></td>
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
	
	<div id="adduser" class="easyui-window" data-options="title:'添加用户',iconCls:'icon-add',modal:true" style="width:700px;height:600px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="adduserform" method="post">
				<table width="100%" cellpadding="5" cellspacing="1">
				<tr><td>登陆名:</td><td><input name="username" class="easyui-validatebox" type="text" data-options="required:true,validType:'repeatname'" ></td></tr>
				<tr><td>密码:</td><td><input id="addpasswordid" name="password" class="easyui-validatebox" type="password" data-options="required:true" ></td></tr>
				<tr><td>确认密码:</td><td><input id="repassword" class="easyui-validatebox" type="password" data-options="required:true,validType:'repeatpassword'"></td></tr>
				<tr><td>性别:</td><td><input name="sex" type="radio" value="1" checked="checked"/>男&nbsp;&nbsp;<input name="sex" type="radio" value="2"/>女</td></tr>
				<tr><td>手机号:</td><td><input name="mobile" class="easyui-validatebox" type="text" data-options="validType:'repeatmobile'"></td></tr>
				<tr><td>微信号:</td><td><input name="weixin" class="easyui-validatebox" type="text" data-options=""></td></tr>
				<tr><td>是否入群:</td><td><input name="isgroup" type="radio" value="2" checked="checked"/>是&nbsp;&nbsp;<input name="isgroup" type="radio" value="1"/>否</td></tr>
				<tr><td>推荐人:</td><td><input name="recommend" class="easyui-validatebox" type="text" data-options=""></td></tr>
				<tr><td>电子邮箱:</td><td><input name="email" class="easyui-validatebox" type="text" data-options=""></td></tr>
				<tr><td>真实姓名:</td><td><input name="realname" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>身份证号:</td><td><input name="idcard" class="easyui-validatebox" type="text" maxlength="18" data-options=""></td></tr>
				<tr><td>职业:</td><td><input name="job" class="easyui-combobox" type="text" data-options="url:'<c:url value="/sys/getjobcombobox"/>',valueField:'id',textField:'name',panelHeight:'auto'"/></td></tr>
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
	
	<div id="updateuser" class="easyui-window" data-options="title:'修改用户',iconCls:'icon-edit',modal:true" style="width:700px;height:600px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="updateuserform" method="post">
				<table width="100%" cellpadding="5" cellspacing="1">
				<tr><td></td><td><input id="updateuserid" name="id" type="hidden"/></td></tr>
				<tr><td>登陆名:</td><td><span id="updatename"></span></td></tr>
				<tr><td>性别:</td><td><input id="maleid" name="sex" type="radio" value="1" checked="checked"/>男&nbsp;&nbsp;<input id="femaleid" name="sex" type="radio" value="2"/>女</td></tr>
				<tr><td>手机号:</td><td><input id="updatemobile" name="mobile" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				<tr><td>微信号:</td><td><input id="updateweixin" name="weixin" class="easyui-validatebox" type="text" data-options=""></td></tr>
				<tr><td>是否入群:</td><td><input id="updateisgroupa" name="isgroup" type="radio" value="2" checked="checked"/>是&nbsp;&nbsp;<input id="updateisgroupb" name="isgroup" type="radio" value="1"/>否</td></tr>
				<tr><td>推荐人:</td><td><input id="updaterecommend" name="recommend" class="easyui-validatebox" type="text" data-options=""></td></tr>
				<tr><td>电子邮箱:</td><td><input id="updateemail" name="email" class="easyui-validatebox" type="text" data-options=""></td></tr>
				<tr><td>真实姓名:</td><td><input id="updaterealname" name="realname" class="easyui-validatebox" type="text"></td></tr>
				<tr><td>身份证号:</td><td><input id="updateidcard" name="idcard" class="easyui-validatebox" maxlength="18" type="text"></td></tr>
				<tr><td>职业:</td><td><input id="updatejob" name="job" class="easyui-combobox" type="text" editable="false" data-options="url:'<c:url value="/sys/getjobcombobox"/>',valueField:'id',textField:'name',panelHeight:'auto'"></td></tr>
				<tr><td>地址:</td><td><input id="updateaddress" name="address" class="easyui-validatebox" maxlength="18" type="text"></td></tr>
				<tr><td>商务专员:</td><td><input id="adminName" name="adminName" class="easyui-validatebox" type="text"></td></tr>
				<tr><td>描述:</td><td><textarea id="desction" name="desction" class="easyui-validatebox" style="width:340px;height:100px"></textarea></td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="updateuserform();">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#updateuser').window('close');">取消</a>
			</div>
		</div>
	</div>
	
	<!-- 职业管理 -->
	<div id="jobdiv" class="easyui-window" data-options="title:'职业管理',iconCls:'icon-search',modal:true" style="width:500px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="typetable"></table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#usertable').datagrid('reload');$('#jobdiv').window('close');">取消</a>
			</div>
		</div>
	</div>
	
	<!-- 添加职业 -->
	<div id="addjob" class="easyui-window" data-options="title:'添加职业',iconCls:'icon-add',modal:true" style="width:300px;height:150px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="addtypeform" method="post">
				<table style="line-height: 30px;">
				<tr><td>职业名称:</td><td><input name="name" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submittypeform();">添加</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#addjob').window('close');">取消</a>
			</div>
		</div>
	</div>
	
	<!-- 修改职业 -->
	<div id="editjob" class="easyui-window" data-options="title:'修改职业',iconCls:'icon-edit',modal:true" style="width:300px;height:150px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="edittypeform" method="post">
				<input type="hidden" id="edittypeid" name="id"/>
				<table style="line-height: 30px;">
				<tr><td>职业名称:</td><td><input id="edittypename" name="name" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="edittypeform();">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#editjob').window('close');">取消</a>
			</div>
		</div>
	</div>
	
	<div id="moneycontrol" class="easyui-window" data-options="title:'余额控制',iconCls:'icon-add',modal:true" style="width:300px;height:170px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="moneycontrolform" method="post">
				<input id="usermoneyid" type="hidden" name="id"/>
				<table style="line-height: 30px;">
				<tr><td><input name="model" value="1" type="radio" checked="checked">充值&nbsp;&nbsp;<input name="model" value="2" type="radio">扣费</td></tr>
				<tr><td><input name="money" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submitmoneyform();">提交</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#moneycontrol').window('close');">取消</a>
			</div>
		</div>
	</div>
	
	<div id="pointcontrol" class="easyui-window" data-options="title:'积分控制',iconCls:'icon-add',modal:true" style="width:300px;height:170px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="pointcontrolform" method="post">
				<input id="userpointid" type="hidden" name="id"/>
				<table style="line-height: 30px;">
				<tr><td><input name="model" value="1" type="radio" checked="checked">增加&nbsp;&nbsp;<input name="model" value="2" type="radio">扣除</td></tr>
				<tr><td><input name="point" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submitpointform();">提交</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#pointcontrol').window('close');">取消</a>
			</div>
		</div>
	</div>
	<div id="updstate" class="easyui-window" data-options="title:'审核状态控制',iconCls:'icon-add',modal:true" style="width:300px;height:170px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="updateupdform" method="post">
				 <input type="hidden" name="id" id="updid"/>   
				<table style="line-height: 30px;">
				<tr>
				  <td>
				       状态: <select  id="upstateid"  name="baibaoshopstate" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'">
						<option value="0">等待审核</option>
						<option value="1">审核未通过</option>
						<option value="2">审核通过</option>
		              </select>
				  </td>
				</tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="updateupdform();">提交</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#updstate').window('close');">取消</a>
			</div>
		</div>
	</div>
	<div id="levelcontrol" class="easyui-window" data-options="title:'等级控制',iconCls:'icon-add',modal:true" style="width:300px;height:170px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="levelcontrolform" method="post">
				<input id="userlevelid" type="hidden" name="id"/>
				<table style="line-height: 30px;">
				<tr>
				  <td>
				    <select id="levelid" name="level" class="easyui-combobox" data-options="panelHeight:'auto'">
				      <option value="0">免费会员</option>
				      <option value="1">星级会员</option>
				      <option value="2">贵宾会员</option>
				      <option value="3">高级会员</option>
				      <option value="4">超级会员</option>
				    </select>
				  </td>
				</tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submitlevelform();">提交</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#levelcontrol').window('close');">取消</a>
			</div>
		</div>
	</div>
	
	
	<div id="comprehensiveinfo" class="easyui-window" data-options="title:'综合详情',iconCls:'icon-add'" style="width:1200px;height:600px; ">
				 <iframe id="comprehensiveinfo_member" src=""  width="1400px" height="200"></iframe>
			     <iframe id="comprehensiveinfo_collection" src=""  width="1400px" height="200"></iframe>			
			     <iframe id="comprehensiveinfo_lylots" src=""  width="1400px" height="200"></iframe>			            
	</div>
	
	
  </body>
</html>
