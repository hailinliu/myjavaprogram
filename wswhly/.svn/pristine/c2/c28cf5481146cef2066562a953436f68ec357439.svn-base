 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>藏品信息管理</title>
    
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
	$('#styletdid').hide();
	$('#addtype').window('close');
	$('#edittype').window('close');
	$('#collectionustype').window('close');
	$('#scancollectionus').window('close');
	$('#priceareacontrol').window('close');
	$('#pointpricecontrol').window('close');
	/* $('#startdate').datebox('setValue',formatMonth(-3));
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
	}); */

	$('#collectionustable').datagrid({
        toolbar:[{
            id:'collectionusbtnscan',
            text:'藏品详情',
            iconCls:'icon-search',
            handler:function(){
               var row = $('#collectionustable').datagrid('getSelected');
               if(row){
             	  $('#scancollectionustypenameid').empty().append(row.typename + '-->' + row.typename1);
             	  $('#scancollectionusnameid').empty().append(row.name);
             	  $('#scancollectionusserialnumid').empty().append(row.serialnum);
             	  $('#scancollectionusernameid').empty().append(row.username);
             	  $('#scancollectiontvnumid').empty().append(row.tvnum);
             	  $('#scancollectionusuploaddateid').empty().append(row.uploaddate);
                  var image = row.imgurl.split(',');
             	  $('#scancollectionusimgurlid').empty().append('<img src="'+image[0]+'" width="250" height="250"/>');
             	  $('#scancollectionusnoteid').empty().append(row.note);
             	  $('#scancollectionus').window('open');
               }else{
             	  $.messager.alert('警告','请选择一条藏品','warning');
               }
            }
           },{
            id:'collectionusbtnadd',
            text:'添加藏品',
            iconCls:'icon-add',
            handler:function(){
			   location.href = "<c:url value='/collectionus/gotoaddcollection'/>";
            } 
           },{
          id:'collectionuspointpricebtnedit',
            text:'价格区间控制',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#collectionustable').datagrid('getSelected');
         	  if(row){
         		  if (row.state == 3){
 	          		  $.messager.alert('警告','该藏品已被删除','warning');
                  } else {
           	         $('#priceareaid').val(row.id);
					$('#priceareacontrol').window('open');

	              }
               }else{
             	  $.messager.alert('警告','请选择一条藏品信息','warning');
               }
            }
           },{
          id:'collectionuspointpricebtnedit',
            text:'具体价格控制',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#collectionustable').datagrid('getSelected');
         	  if(row){
         		  if (row.state == 3){
 	          		  $.messager.alert('警告','该藏品已被删除','warning');
                  } else {
           	         $('#pointpriceid').val(row.id);
					$('#pointpricecontrol').window('open');

	              }
               }else{
             	  $.messager.alert('警告','请选择一条藏品信息','warning');
               }
            }
           },{
            id:'collectionusbtnedit',
            text:'修改藏品',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#collectionustable').datagrid('getSelected');
         	  if(row){
         		  if (row.state == 3){
 	          		  $.messager.alert('警告','该藏品已被删除','warning');
                  } else {
           	            window.showModalDialog("<c:url value='/collectionus/gotoeditcollection'/>?id="+row.id,window,"dialogWidth=1000px;dialogHeight=870px;status:no;");
	              }
               }else{
             	  $.messager.alert('警告','请选择一条藏品信息','warning');
               }
            }
           },{
            id:'collectionusbtncollect',
            text:'收藏/取消',
            iconCls:'icon-ok',
            handler:function(){
        	  var row = $('#collectionustable').datagrid('getSelected');
        	  if(row){
            	 if (row.state == 3){
            		 $.messager.alert('警告','该信息已被删除','warning');
                 } else {
	          		 $.messager.confirm('提示', '确定要收藏/取消收藏？', function(r){
	       		         if (r){
	       		        	collectThing(row.id);
	       		         }
	       		     });
                 }
          	  }else{
          		  $.messager.alert('警告','请选择一条藏品信息','warning');
              }
            }
           },{
            id:'collectionusbtndel',
            text:'删除藏品',
            iconCls:'icon-cancel',
            handler:function(){
         	  var row = $('#collectionustable').datagrid('getSelected');
         	  if(row){
         		 if (row.state == 3){
            		 $.messager.alert('警告','该信息已被删除','warning');
                 } else {
	         		 $.messager.confirm('提示', '确定要删除此藏品？', function(r){
	       		         if (r){
	       		        	delcollectionus(row.id);
	       		         }
	       		     });
                 }
         	  }else{
         		  $.messager.alert('警告','请选择一条藏品信息','warning');
              }
            }
           },{
            id:'collectionusbtntype',
            text:'藏品类型',
            iconCls:'icon-search',
            handler:function(){
        	      $('#typetable').datagrid({
				    url:"<c:url value='/collectionus/gettypelist'/>",
				    title:'藏品类型列表',
				    fitColumns:true,
				    rownumbers:true,
				    striped:true,
				    singleSelect:true,
				    columns:[[
				        {field:'id',title:'ID',width:50},
				        {field:'typename',title:'类型名称',width:50}
				    ]],
				    toolbar:[{
					    id:'btntypeadd',
	                    text:'添加类型',
	                    iconCls:'icon-add',
	                    handler:function(){
				    	  $('#addtype').window('open');
	                    }
	                },{
		                id:'btntypeedit',
	                    text:'修改类型',
	                    iconCls:'icon-edit',
	                    handler:function(){
	                	  var row = $('#typetable').datagrid('getSelected');
	                	  if(row){
	                		  $('#edittypeid').val(row.id);
	                		  $('#edittypename').val(row.typename);
		                  }
	                	  $('#edittype').window('open');
	                    }
	                },{
		                id:'btntypedel',
	                    text:'删除类型',
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
				$("#collectionustype").window("open");
            }
           }]
		});

	//objects为json数据源对象
	$('#nameid').autocomplete('<c:url value="/collectionusus/autoname"/>', 
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
	              value: row.name,
	              result: row.name
	          }
	      }
	      );
	      },
	      formatItem: function (row, i, max) {
	          return "<table width='97%'><tr><td align='left'>藏品名称：" + row.name + "</td></tr></table>";
	          //return  row.name;
	      }, 
	      formatMatch: function(row, i, max){ 
	           return row.name;
	      } ,

	      formatResult: function(row, i, max) {
	           return row.name;
	      }                 
	});
$('#serialnumid').autocomplete('<c:url value="/collectionusus/autoserialnum"/>', 
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
	              value: row.serialnum,
	              result: row.serialnum
	          }
	      }
	      );
	      },
	      formatItem: function (row, i, max) {
	          return "<table width='97%'><tr><td align='left'>藏品编号：" + row.serialnum + "</td></tr></table>";
	          //return  row.name;
	      }, 
	      formatMatch: function(row, i, max){ 
	           return row.serialnum;
	      } ,

	      formatResult: function(row, i, max) {
	           return row.serialnum;
	      }                 
	});

	$('#ownerid').autocomplete('<c:url value="/collectionusus/autoowner"/>', 
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
	              value: row.owner,
	              result: row.owner
	          }
	      }
	      );
	      },
	      formatItem: function (row, i, max) {
	          return "<table width='97%'><tr><td align='left'>归属：" + row.owner + "</td></tr></table>";
	          //return  row.name;
	      }, 
	      formatMatch: function(row, i, max){ 
	           return row.owner;
	      } ,

	      formatResult: function(row, i, max) {
	           return row.owner;
	      }                 
	});

	$('#usernameid').autocomplete('<c:url value="/collectionusus/autoUsername"/>', 
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
	$('#collectionustable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');
});

function serach(){
	$('#collectionustable').datagrid('loadData',{total:0,rows:[]});
	var type = $("#typeid").combobox("getValue");
	var style = $("#styleid").combobox("getValue");
	var pricearea = $("#pricearea").combobox("getValue");
	var name = $("#nameid").val();
	var serialnum = $("#serialnumid").val();
	var username = $("#usernameid").val();
	var state = $("#stateid").combobox("getValue");
	/* var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	} */
	$('#collectionustable').datagrid('load',{'type':type,'style':style,'name':name,'serialnum':serialnum,'username':username,'state':state,'pricearea':pricearea});
}

function collectThing(value){
	$.ajax({
        type:'post',
        url:'<c:url value="/collectionus/collectThing"/>',
        data:'id='+value,
        success:function(data){
           if(data == '0000'){
          	 $.messager.alert('提示', "收藏成功！", 'info',function(){
          		$('#collectionustable').datagrid('reload');
             });
           }else if(data == '1111'){
        	   $.messager.alert('提示', "取消收藏成功！", 'info',function(){
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


function delcollectionus(value){
	$.ajax({
        type:'post',
        url:'<c:url value="/collectionus/delcollection"/>',
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

function submittypeform(){
	$('#addtypeform').form('submit', {
		url: "<c:url value='/collectionus/addtype'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "添加成功！", 'info', function(){
					document.getElementById("addtypeform").reset();
					$('#typetable').datagrid('reload');
					$('#addtype').window('close');
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}

function edittypeform(){
	$('#edittypeform').form('submit', {
		url: "<c:url value='/collectionus/updtype'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "修改成功！", 'info', function(){
					document.getElementById("edittypeform").reset();
					$('#typetable').datagrid('reload');
					$('#edittype').window('close');
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
      url:'<c:url value="/collectionus/deltype"/>',
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
function submitpriceareaform(){
		$('#priceareaform').form('submit', {
			url: "<c:url value='/collectionus/priceareaControl'/>",
			onSubmit: function() {
				return $(this).form('validate');
			},
			success: function(data) {
				if(data == "0000"){
					$.messager.alert('提示', "价格区间修改成功！", 'info', function(){
						document.getElementById("priceareaform").reset();
						$('#collectionustable').datagrid('reload');
						$('#priceareacontrol').window('close');
					});
				}else{
					$.messager.alert('警告', data, 'warning');
				}
			}
		});
	}
function  submitpointpriceform(){
		$('#pointpriceform').form('submit', {
			url: "<c:url value='/collectionus/pointpriceControl'/>",
			onSubmit: function() {
				return $(this).form('validate');
			},
			success: function(data) {
				if(data == "0000"){
					$.messager.alert('提示', "具体价格修改成功！", 'info', function(){
						document.getElementById("pointpriceform").reset();
						$('#collectionustable').datagrid('reload');
						$('#pointpricecontrol').window('close');
					});
				}else{
					$.messager.alert('警告', data, 'warning');
				}
			}
		});
	}
  function exportExcel() {
    var type = $("#typeid").combobox("getValue");
	var style = $("#styleid").combobox("getValue");
	var pricearea = $("#pricearea").combobox("getValue");
	var name = $("#nameid").val();
	var serialnum = $("#serialnumid").val();
	var username = $("#usernameid").val();
	var state = $("#stateid").combobox("getValue");
	 var sdate = $('#startdate').datebox('getValue');
	var edate = $('#enddate').datebox('getValue');
	if(edate == "" || sdate == ""){
		$.messager.alert('警告','请输入查询日期!','warning');
		return false;
	}  
	window.open('<c:url value="/collectionus/exportExcel"/>?username='+username+'&name='+name+'&serialnum='+serialnum+'&state='+state+'&style='+style+'&pricearea='+pricearea+'&type='+type+'&begindate='+sdate+'&enddate='+edate);
}  
//藏品类型管理
/*var editcount = 0;
function editrow(index){
    $('#typetable').datagrid('beginEdit', index);
}

function deleterow(index){
    $.messager.confirm('确认','是否真的删除?',function(r){
        if (r){
            $('#typetable').datagrid('deleteRow', index);
        }
    });
}

function saverow(index){
    $('#typetable').datagrid('endEdit', index);
}

function cancelrow(index){
    $('#typetable').datagrid('cancelEdit', index);
}

function addrow(){
    if (editcount > 0){
        $.messager.alert('警告','当前还有'+editcount+'记录正在编辑，不能增加记录。');
        return;
    }
	var editIndex = $('#typetable').datagrid('getRows').length;
    if ($('#typetable').datagrid('validateRow', editIndex)){
	    $('#typetable').datagrid('appendRow',{
	        typename:''
	    });
	    $('#typetable').datagrid('selectRow', editIndex).datagrid('beginEdit', editIndex);
    }
}

function saveall(id){
    var inserted = $("#typetable").datagrid('getChanges', "inserted");
    var deleted = $("#typetable").datagrid('getChanges', "deleted");
    var updated = $("#typetable").datagrid('getChanges', "updated");
    var effectRow = new Object();
    if (inserted.length) {
            effectRow["inserted"] = JSON.stringify(inserted);
    }
    if (deleted.length) {
            effectRow["deleted"] = JSON.stringify(deleted);
    }
    if (updated.length) {
            effectRow["updated"] = JSON.stringify(updated);
    }

    $.post('<c:url value="/collectionus/typecontrol"/>?id='+id, effectRow, function(data) {
        if(data == '0000'){
            $.messager.alert("提示", "提交成功！");
            $("#typetable").datagrid('acceptChanges');
        }
    }, "JSON").error(function() {
        $.messager.alert("提示", "提交错误了！");
    });
}

function cancelall(){
    $('#typetable').datagrid('rejectChanges');
}*/
</script>

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr><!-- <td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 100px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td> -->
		<td>价格区间:
		 <select id="pricearea" name="pricearea" class="easyui-combobox" data-options="panelHeight:'auto'">
		 			  <option value="-1" selected="selected">全部</option>
				      <option value="0">5万以内</option>
				      <option value="1">5万至10万</option>
				      <option value="2">10万至20万</option>
				      <option value="3">20万至50万</option>
				      <option value="4">50万至100万</option>
				       <option value="5">100万以上</option>
				    </select>
		</td>
		<td>类型:<input id="typeid" name="type" size="8" class="easyui-combobox" data-options="url:'<c:url value="/collectionus/typecombox"/>', valueField:'id', textField:'typename', panelHeight:'auto',formatter:function(row){
		    var opts = $(this).combobox('options');
            return row[opts.textField];
		},onSelect:function(data){
				    if(data.id != 0){
				        $('#styleid').combobox({ 
							url:'<c:url value="/collectionus/stylecombox"/>?typeid='+$('#typeid').combobox('getValue'), 
							valueField:'id', 
							textField:'typename' 
						});
						$('#styletdid').show();
				    }else{
				        $('#styleid').combobox('clear');
						$('#styletdid').hide();
				    }
				}"></td>
		<td id="styletdid">子类型:<input id="styleid" name="type" size="8" class="easyui-combobox" data-options="panelHeight:'auto',formatter:function(row){
		    var opts = $(this).combobox('options');
            return row[opts.textField];
		}"></td>
		<td>藏品名:<input id="nameid" name="name" type="text" size="8" editable="false"/></td>
	    <td>藏品编号:<input id="serialnumid" name="serialnum" type="text" size="8" editable="false"/></td>
		<td>上传者:<input id="usernameid" name="username" type="text" size="10" editable="false"/></td>
	<!-- 	<td>从:<input id="startdate" type="text" size="9" class="easyui-datebox" editable="false"/></td>
		<td>到:<input id="enddate" type="text" size="9" class="easyui-datebox" editable="false"/></td> -->
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">正常</option>
						<option value="2">隐藏</option>
						<option value="3">删除</option>
		              </select></td>
		<td><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>
		<td><a href="javascript:exportExcel()" class="easyui-linkbutton" iconCls="icon-redo">导出Excel</a></td></tr>
	</table>
    <table id="collectionustable" class="easyui-datagrid" data-options="url:'<c:url value="/collectionus/getcollectionuslist"/>',title: '藏品管理',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true">
		<thead>
			<tr>
				<th data-options="field:'typename',width:50,halign:'center',formatter:function(value,row,index){
				   return row.typename + '-->' + row.typename1;
				}">类型</th>
				<th data-options="field:'name',width:30,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 4){
				         return value.substring(0,4)+'...';
				      }
				   }
				   return value;
				}">名称</th>
				<th data-options="field:'serialnum',width:30,halign:'center'">编号</th>
				<th data-options="field:'username',width:30,halign:'center'">推荐者</th>
				<th data-options="field:'tvnum',width:40,halign:'center'">节目期号</th>
				<th data-options="field:'uploaddate',width:60,halign:'center'">上传日期</th>
				<th data-options="field:'lastmodifydate',width:40,halign:'center'">最后编辑时间</th>
				<th data-options="field:'imgurl',width:40,halign:'center',formatter:function(value,row,index){
				   var imgurl = value.split(',');
				   return '&lt;img src='+imgurl[0]+' height=20 /&gt;';
				}">藏品图片</th>
				<th data-options="field:'note',width:40,halign:'center',formatter:function(value,row,index){
				   if(value != null){
				      if(value.length > 7){
				         return value.substring(0,7)+'...';
				      }
				   }
				   return value;
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
                 <th data-options="field:'pricearea',width:30,halign:'center',formatter:function(value,row,index){
                   if(value == 0){
                     return '5万以内';
                   }else if(value == 1){
                     return '5万至10万';
                   }else if(value == 2){
                     return '10万至20万';
                   }else if(value == 3){
                     return '20万至50万';
                   }else if(value == 4){
                     return '50万至100万';
                   }else if(value == 5){
                     return '100万以上';
                   }
                }">价格区间</th>
                  <th data-options="field:'pointprice',width:30,halign:'center'">具体价格</th>
			</tr>
		</thead>
	</table>
	
	<!-- 查看藏品详细内容 -->
	<div id="scancollectionus" class="easyui-window" data-options="title:'藏品详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="onecollectionustable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td width="30%">所属类型：</td>
			    <td id="scancollectionustypenameid"></td>
			    <td id="scancollectionusimgurlid" rowspan="6" width="250" height="250"></td>
			  </tr>
			  <tr>
			    <td>藏品名称：</td>
			    <td id="scancollectionusnameid"></td>
			  </tr>
			  <tr>
			    <td>编号：</td>
			    <td id="scancollectionusserialnumid"></td>
			  </tr>
			  <tr>
			    <td>推荐者：</td>
			    <td id="scancollectionusernameid"></td>
			  </tr>
			  <tr>
			    <td>节目期号：</td>
			    <td id="scancollectiontvnumid"></td>
			  </tr>
			  <tr>
			    <td>上传日期：</td>
			    <td id="scancollectionusuploaddateid"></td>
			  </tr>
			  <tr>
			    <td colspan="3">藏品简介：<u id="scancollectionusnoteid"></u></td>
			  </tr>
			</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scancollectionus').window('close');">关闭</a>
		</div>
	  </div>
	</div>
	
	<!-- 藏品类型 -->
	<div id="collectionustype" class="easyui-window" data-options="title:'藏品类型',iconCls:'icon-search',modal:true" style="width:500px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="typetable"></table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#collectionustable').datagrid('reload');$('#collectionustype').window('close');">取消</a>
			</div>
		</div>
	</div>
	
	<!-- 添加类型 -->
	<div id="addtype" class="easyui-window" data-options="title:'添加藏品类型',iconCls:'icon-add',modal:true" style="width:300px;height:150px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="addtypeform" method="post">
				<table style="line-height: 30px;">
				<tr><td>类型名称:</td><td><input name="typename" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submittypeform();">添加</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#addtype').window('close');">取消</a>
			</div>
		</div>
	</div>
	
	<!-- 修改类型 -->
	<div id="edittype" class="easyui-window" data-options="title:'修改藏品类型',iconCls:'icon-edit',modal:true" style="width:300px;height:150px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="edittypeform" method="post">
				<input type="hidden" id="edittypeid" name="id"/>
				<table style="line-height: 30px;">
				<tr><td>类型名称:</td><td><input id="edittypename" name="typename" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="edittypeform();">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#edittype').window('close');">取消</a>
			</div>
		</div>
	</div>
	<!--价格区间控制 -->
	<div id="priceareacontrol" class="easyui-window" data-options="title:'价格区间控制',iconCls:'icon-add',modal:true" style="width:300px;height:170px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="priceareaform" method="post">
				<input id="priceareaid" type="hidden" name="priceareaid"/>
				<table style="line-height: 30px;">
				<tr><td>
				  <select id="pricearea" name="pricearea" class="easyui-combobox" data-options="panelHeight:'auto'">
				      <option value="0">5万以内</option>
				      <option value="1">5万至10万</option>
				      <option value="2">10万至20万</option>
				      <option value="3">20万至50万</option>
				      <option value="4">50万至100万</option>
				       <option value="5">100万以上</option>
				    </select>
				</td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submitpriceareaform();">提交</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#priceareacontrol').window('close');">取消</a>
			</div>
		</div>
	</div>
	
	<!--价格区间控制 -->
	<div id="pointpricecontrol" class="easyui-window" data-options="title:'具体价格控制',iconCls:'icon-add',modal:true" style="width:300px;height:170px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="pointpriceform" method="post">
				<input id="pointpriceid" type="hidden" name="pointpriceid"/>
				<table style="line-height: 30px;">
				<tr><td>
				 <input id="pointprice" name="pointprice" class="easyui-validatebox" type="text" data-options="required:true">
				</td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="submitpointpriceform();">提交</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#pointpricecontrol').window('close');">取消</a>
			</div>
		</div>
	</div>
	

  </body>
  
</html>
