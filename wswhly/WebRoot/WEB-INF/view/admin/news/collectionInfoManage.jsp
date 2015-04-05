<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>收藏资讯</title>
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
	$('#addtype').window('close');
	$('#edittype').window('close');
	$('#newstype').window('close');
	$('#scannews').window('close');
	$('#addnews').window('close');
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

	$('#newstable').datagrid({
          toolbar:[{
              id:'collectioninfobtnscan',
              text:'查看详情',
              iconCls:'icon-search',
              handler:function(){
                 var row = $('#newstable').datagrid('getSelected');
                 if(row){
               	  $('#onetitleid').empty().append(row.title);
               	  $('#onecreatetimeid').empty().append(row.createdate);
               	  $('#onelabelid').empty().append(row.label);
               	  $('#onecontentid').empty().append(row.content);
               	  $('#scannews').window('open');
                 }else{
               	  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
              id:'collectioninfobtnadd',
              text:'添加收藏资讯',
              iconCls:'icon-add',
              handler:function(){
                 location.href = "<c:url value='/news/gotoaddcollectionInfo'/>";
              } 
             },{
              id:'collectioninfobtnedit',
              text:'修改收藏资讯',
              iconCls:'icon-edit',
              handler:function(){
           	  var row = $('#newstable').datagrid('getSelected');
           	  if(row){
	           		if (row.state == 2){
	          		  $.messager.alert('警告','该信息已被删除','warning');
	                } else {
               	      window.showModalDialog("<c:url value='/news/gotoeditcollectionInfo'/>?id="+row.id,window,"dialogWidth=1000px;dialogHeight=870px;status:no;");
		            }
                 }else{
               	    $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
              id:'collectioninfobtnrecommend',
              text:'推荐',
              iconCls:'icon-ok',
              handler:function(){
            	 var row = $('#newstable').datagrid('getSelected');
            	 if(row){
            		 if (row.state == 2){
      	          		 $.messager.alert('警告','该信息已被删除','warning');
      	             } else {
	            		 if (row.recommend == 1){
	            			 $.messager.alert('警告','该信息已被推荐','warning');
	                     } else {
                             setRecommend(row.id,1);
		                 }
      	             }
                 }else{
                	 $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
              id:'collectioninfobtndel',
              text:'彻底删除',
              iconCls:'icon-cancel',
              handler:function(){
           	  var row = $('#newstable').datagrid('getSelected');
           	  if(row){
           		    if (row.state ==1||row.state ==4){
 	          		  $.messager.alert('警告','状态正常不能删除！','warning');
 	                } else {
	           		  $.messager.confirm('提示', '确定要删除此信息吗？', function(r){
	           		     if (r){
	           		       delNewlist(row.id);
	           		     }
	           		  });
 		            }
           	  }else{
           		  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
              id:'collectioninfobtndel',
              text:'删除状态',
              iconCls:'icon-cancel',
              handler:function(){
           	  var row = $('#newstable').datagrid('getSelected');
           	  if(row){
           		    if (row.state == 2){
 	          		  $.messager.alert('警告','该信息已被删除','warning');
 	                } else {
	           		  $.messager.confirm('提示', '确定要删除此信息吗？', function(r){
	           		     if (r){
	           		       delNews(row.id);
	           		     }
	           		  });
 		            }
           	  }else{
           		  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
           	 id:'collectioninfobtntype',
             text:'收藏资讯类型',
             iconCls:'icon-search',
             handler:function(){
       	      $('#typetable').datagrid({
				    url:"<c:url value='/news/newstypelist'/>?parentid=1",
				    title:'资讯类型列表',
				    fitColumns:true,
				    rownumbers:true,
				    striped:true,
				    singleSelect:true,
				    columns:[[
				        {field:'id',title:'ID',width:50},
				        {field:'style',title:'类型名称',width:50}
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
	                		  $('#edittypename').val(row.style);
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
				$("#newstype").window("open");
             }
          }]
	});

	$('#newstable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');

	$('#titleid').autocomplete('<c:url value="/news/autotitle"/>?type=1', 
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
	              value: row.title,
	              result: row.title
	          }
	      }
	      );
	      },
	      formatItem: function (row, i, max) {
	          return "<table width='97%'><tr><td align='left'>标题：" + row.title + "</td><td>发布时间："+ row.createdate +"</td></tr></table>";
	          //return  row.name;
	      }, 
	      formatMatch: function(row, i, max){ 
	           return row.title;
	      } ,

	      formatResult: function(row, i, max) {
	           return row.title;
	      }                 
	});
});
	
	function serach(){
	
	$('#newstable').datagrid('loadData',{total:0,rows:[],footer:[]});
	    var id = $("#IDid").val();
		var title = $("#titleid").val();
	    var recommend = $("#recommendid").combobox("getValue");
	    var style = $("#styleid").combobox("getValue");
	    var state = $("#stateid").combobox("getValue");
		var sdate = $('#startdate').datebox('getValue');
		var edate = $('#enddate').datebox('getValue');
		var flagshopbaseinfoid=$("#flagshopbaseinfoid").combobox("getValue");
		if(edate == "" || sdate == ""){
			$.messager.alert('警告','请输入查询日期!','warning');
			return false;
		}
		$('#newstable').datagrid('load',{'id':id,'title':title,'recommend':recommend,'state':state,'begindate':sdate,'enddate':edate,'type':1,'style':style,'flagshopbaseinfoid':flagshopbaseinfoid});
	}

function setRecommend(id,style){
      $.ajax({
         type:'post',
         url:'<c:url value="/news/setrecommend"/>',
         data:'id='+id+'&recommend='+style,
         success:function(data){
            if(data == '0000'){
           	 $.messager.alert('提示', "设置成功！", 'info',function(){
					$('#newstable').datagrid('reload');
                });
            }else{
           	 $.messager.alert('提示', data, 'warning',function(){
 					$('#newstable').datagrid('reload');
                });
            }
         }
      });
}
function delNewlist(id){
      $.ajax({
         type:'post',
         url:'<c:url value="/news/delnewlist"/>',
         data:'id='+id,
         success:function(data){
            if(data == '0000'){
           	 $.messager.alert('提示', "删除成功！", 'info',function(){
					$('#newstable').datagrid('reload');
                });
            }else{
           	 $.messager.alert('提示', data, 'warning',function(){
 					$('#newstable').datagrid('reload');
                });
            }
         }
      });
}
function delNews(id){
      $.ajax({
         type:'post',
         url:'<c:url value="/news/delnews"/>',
         data:'id='+id,
         success:function(data){
            if(data == '0000'){
           	 $.messager.alert('提示', "删除成功！", 'info',function(){
					$('#newstable').datagrid('reload');
                });
            }else{
           	 $.messager.alert('提示', data, 'warning',function(){
 					$('#newstable').datagrid('reload');
                });
            }
         }
      });
}

function submittypeform(){
	$('#addtypeform').form('submit', {
		url: "<c:url value='/news/addtype'/>",
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
		url: "<c:url value='/news/updtype'/>",
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
 function zhuaqu(){
       $.ajax({
          type:'post',
          url:'<c:url value="/news/newsurl"/>',       
          success:function(){
             if(data == '0000'){
            	 $.messager.alert('提示', "抓取成功！", 'info',function(){
                 });
             }else{
            	 $.messager.alert('提示', data, 'warning',function(){
                 });
             }
          }
       });
	}
function delType(id){
   $.ajax({
      type:'post',
      url:'<c:url value="/news/deltype"/>',
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
	</script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
		<tr><td>数据周期:<select id="datacycle" class="easyui-combobox" editable="false" style="width: 70px" data-options="panelHeight:'auto'"><option value="0">近3月</option><option value="1">近7天</option><option value="2">近30天</option><option value="3">自选时间</option></select></td>
		<td>资讯ID:<input id="IDid" name="id" type="text" size="10" editable="false"/></td>
		<td>资讯标题:<input id="titleid" name="title" type="text" size="10" editable="false"/></td>
		<td>资讯类型:<input id="styleid" name="style" class="easyui-combobox" data-options="url:'<c:url value="/news/gettypecombobox"/>?parentid=1', valueField:'style', textField:'style', panelHeight:'auto' ">
		旗舰商家:<input id="flagshopbaseinfoid" name="flagshopbaseinfoid"  value="" class="easyui-combobox" data-options="url:'<c:url value="/flagshopinfo/getflagshopbaseinfocombobox"/>', valueField:'id', textField:'name',panelHeight:'auto',formatter:function(row){
				    var opts = $(this).combobox('options');
		            return row[opts.textField];
				}">
		</td>
		<td>是否推荐:<select id="recommendid" name="recommend" class="easyui-combobox" editable="false" style="width: 50px" data-options="panelHeight:'auto'">
						<option value="">全部</option>
						<option value="0">否</option>
						<option value="1">是</option>
		              </select></td>
		<td>状态:<select id="stateid" name="state" class="easyui-combobox" editable="false" style="width: 50px" data-options="panelHeight:'auto'">
						<option value="0">全部</option>
						<option value="1">正常</option>
						<option value="2">删除</option>
						<option value="3">待修改</option>
						<option value="4">带图修改</option>
		              </select></td>
		<td>起始日期:<input id="startdate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td>结束日期:<input id="enddate" type="text" size="10" class="easyui-datebox" editable="false"/></td>
		<td><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td>
		<td><a href="javascript:void(0)" onclick="zhuaqu()" class="easyui-linkbutton" iconCls="icon-redo">抓取</a></td></tr>
	</table>
    <table id="newstable" class="easyui-datagrid" data-options="url:'<c:url value="/news/getnewslist"/>',queryParams:{'begindate':formatMonth(-3),'enddate':formatDay(0),'type':1},title: '新闻列表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,striped:true,showFooter:true">
		<thead>
			<tr>
			    <th data-options="field:'id',width:10,halign:'center' ">资讯ID</th>
				<th data-options="field:'title',width:40,halign:'center' ">资讯标题</th>
				<th data-options="field:'stylename',width:35,halign:'center',formatter:function(value,row,index){
					if(row.flagshopbaseinfoname!=null&&row.flagshopbaseinfoname!=''&&row.flagshopbaseinfoname!='null'){
				   return row.stylename + '-->' + row.flagshopbaseinfoname;
				   }else{
				   return row.stylename 
				   }
				}">资讯类型</th>
				<th data-options="field:'content',width:30,halign:'center',formatter:function(value,row,index){
				    if(value != null){
				      if(value.length >8){
				         return value.substring(0,8)+'...';
				      }
				   }
				   return value;
				}">新闻内容</th>
				<th data-options="field:'createdate',width:35,halign:'center'">发布时间</th>
				<th data-options="field:'clicknum',width:35,halign:'center'">点击量</th>
				<th data-options="field:'recommend',width:15,halign:'center',formatter:function(value,row,index){
                   if(value == 0){
                     return '否';
                   }else if(value == 1){
                     return '是';
                   }
                }">是否推荐</th>
				<th data-options="field:'state',width:15,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '正常';
                   }else if(value == 2){
                     return '删除';
                   }else if(value == 3){
                     return '待修改';
                   }else{
                    return '带图修改';
                   }
                }">状态</th>
			</tr>
		</thead>
	</table>
	
	<!-- 查看新闻详细内容 -->
	<div id="scannews" class="easyui-window" data-options="title:'详情资讯',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="oneverifytable" width="100%" cellpadding="5" cellspacing="1">
				<tr><td id="onetitleid" colspan="4" style="font-weight: bold;" align="center"></td></tr>
				<tr><td width="25%">发布时间:</td><td id="onecreatetimeid"></td><td width="25%">标签:</td><td id="onelabelid"></td></tr>
				<tr><td id="onecontentid" colspan="4"></td></tr>
				</table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scannews').window('close');">关闭</a>
			</div>
		</div>
	</div>
	
	<!-- 收藏资讯类型 -->
	<div id="newstype" class="easyui-window" data-options="title:'收藏资讯类型',iconCls:'icon-search',modal:true" style="width:500px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="typetable"></table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#newstable').datagrid('reload');$('#newstype').window('close');">取消</a>
			</div>
		</div>
	</div>
	
	<!-- 添加类型 -->
	<div id="addtype" class="easyui-window" data-options="title:'添加收藏资讯类型',iconCls:'icon-add',modal:true" style="width:300px;height:150px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="addtypeform" method="post">
				<input type="hidden" name="parentid" value="1"/>
				<table style="line-height: 30px;">
				<tr><td>类型名称:</td><td><input name="style" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
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
	<div id="edittype" class="easyui-window" data-options="title:'修改收藏资讯类型',iconCls:'icon-edit',modal:true" style="width:300px;height:150px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<form id="edittypeform" method="post">
				<input type="hidden" id="edittypeid" name="id"/>
				<table style="line-height: 30px;">
				<tr><td>类型名称:</td><td><input id="edittypename" name="style" class="easyui-validatebox" type="text" data-options="required:true"></td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="edittypeform();">修改</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#edittype').window('close');">取消</a>
			</div>
		</div>
	</div>
	
  </body>
</html>
