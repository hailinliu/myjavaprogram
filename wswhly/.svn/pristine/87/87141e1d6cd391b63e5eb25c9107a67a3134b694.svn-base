<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>在线图片鉴定藏品管理</title>
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
	$('#scanmessagefp').window('close');
	$('#scanmessageth').window('close');
	$('#scanmessagesp').window('close');
		$('#messagetable').datagrid({
          toolbar:[{
              id:'onlinepicfs',
              text:'分配专家',
              iconCls:'icon-edit',
              handler:function(){
                var row = $('#messagetable').datagrid('getSelected');
                 if(row){
                 if(row.state==1){
                  $('#fpnameid').empty().append(row.name);
               	  $('#fpid').val(row.id);
               	  $('#scanmessagefp').window('open');
                 }else{
                  $.messager.alert('警告','该阶段不能复审','warning');
                 }
               	 
                 }else{
               	  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
              id:'onlinepicfs',
              text:'复审',
              iconCls:'icon-edit',
              handler:function(){
                var row = $('#messagetable').datagrid('getSelected');
                 if(row){
                 if(row.state==6){
                  $('#thnameid').empty().append(row.name);
               	  $('#thid').val(row.id);
               	  $('#scanmessageth').window('open');
                 }else{
                  $.messager.alert('警告','该阶段不能复审','warning');
                 }
               	 
                 }else{
               	  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
              id:'onlinepicsp',
              text:'上拍',
              iconCls:'icon-edit',
              handler:function(){
                var row = $('#messagetable').datagrid('getSelected');
                 if(row){
                 if(row.state==6||row.state==8){
                  $('#spnameid').empty().append(row.name);
               	  $('#spid').val(row.id);
               	  $('#scanmessagesp').window('open');
                 }else{
                  $.messager.alert('警告','暂不能上拍','warning');
                 }
               	 
                 }else{
               	  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
              id:'onlinepicdetile',
              text:'详细信息',
              iconCls:'icon-search',
              handler:function(){
                var row = $('#messagetable').datagrid('getSelected');
                 if(row){
                   window.open("<c:url value="/onlinepic/getOnlinePicColl"/>?id="+row.id);
                 }else{
               	  $.messager.alert('警告','请选择一条信息','warning');
                 }
              }
             },{
            id:'onlinepicdowimg',
            text:'下载图片',
            iconCls:'icon-edit',
            handler:function(){
         	  var row = $('#messagetable').datagrid('getSelected');
         	  if(row){
           	       window.open("<c:url value='/onlinepic/downIMGByid'/>?id="+row.id);
               }else{
             	  $.messager.alert('警告','请选择一条拍品信息','warning');
               }
            }    		 
            }]
	});
	$('#messagetable').datagrid("permissionToolbarItem",'${CurrentSession.buttonid}');
});
function setTh(){
if(!confirm('您确定复审吗？提交之后不能修改！')){
return;
}
if($('#thstate').datebox('getValue')==''){alert('请选择复审结果！');return;}
	$.ajax({
        type:'post',
        url:"<c:url value='/onlinepic/MyOnlinePicCollFs'/>",
        data:{    
             state:$('#thstate').datebox('getValue'),    
             id:$('#thid').val()
    	},  
        success:function(data){
          if(data==0){
          	alert('失败请重试!');
          }else{
         	 alert('成功!');
          	 $('#messagetable').datagrid('reload')
          	$('#scanmessageth').window('close');
          }
        }
	    });
}
function setFp(){
if($('#fpzjuserid').datebox('getValue')==''){
alert('请选择要分配的专家');
return;
}
$.ajax({
        type:'post',
        url:"<c:url value='/onlinepic/FpOnlinePicColl'/>",
        data:{    
             zjuserid:$('#fpzjuserid').datebox('getValue'),    
             id:$('#fpid').val()
    	},  
        success:function(data){
          if(data==1){
             alert('成功!');
          	 $('#messagetable').datagrid('reload');
          	$('#scanmessagefp').window('close');
          	
          }else{
         	alert('失败请重试!');
          }
        }
	    });
}

function setSp(){
if($('#spisshangpai').datebox('getValue')==''){alert('请选择上拍信息！');return;}
	$.ajax({
        type:'post',
        url:"<c:url value='/onlinepic/OnlinePicCollSp'/>",
        data:{    
             state:8,
             isshangpai:$('#spisshangpai').datebox('getValue'),        
             id:$('#spid').val()
    	},  
        success:function(data){
          if(data==0){
          	alert('失败请重试!');
          }else{
         	 alert('成功!');
          	 $('#messagetable').datagrid('reload')
          	$('#scanmessagesp').window('close');
          }
        }
	    });
}
	function serach(){
	$('#messagetable').datagrid('loadData',{total:0,rows:[],footer:[]});
		var username = $("#username").val();
		var mobile = $("#mobile").val();
		var name = $("#name").val();
	    var zjuserid = $("#zjuserid").combobox("getValue");
	    var isshangpai = $("#isshangpai").combobox("getValue");
		var typeid = $('#typeid').datebox('getValue');
		var state = $('#state').datebox('getValue');
		var zhpg= $('#zhpg').datebox('getValue');
		var level= $('#level').datebox('getValue');
		$('#messagetable').datagrid('load',{'username':username,'mobile':mobile,'name':name,'zjuserid':zjuserid,'typeid':typeid,'state':state,'isshangpai':isshangpai,'zhpg':zhpg,'level':level,ordercolumn:'yjresultsdate'});
	}
	function expexcel(){
		var username = $("#username").val();
		var mobile = $("#mobile").val();
		var name = $("#name").val();
	    var zjuserid = $("#zjuserid").combobox("getValue");
	    var isshangpai = $("#isshangpai").combobox("getValue");
		var typeid = $('#typeid').datebox('getValue');
		var state = $('#state').datebox('getValue');
		var zhpg= $('#zhpg').datebox('getValue');
		var level= $('#level').datebox('getValue');
		window.open("<c:url value='/onlinepic/exportExcel'/>?username="+username+"&mobile="+mobile+"&name="+name+"&zjuserid="+zjuserid+"&typeid="+typeid+"&state="+state+"&isshangpai="+isshangpai+"&zhpg="+zhpg+"&level="+level+"&ordercolumn=yjresultsdate&page=1&rows=1000000000");
	}

	</script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
    <tr>
    	<td>用户名:<input id="username" name="username" type="text" size="10" editable="false"/></td>
    	<td>会员级别:<select id="level" name="level" class="easyui-combobox" editable="false" style="width: 170px" data-options="panelHeight:'auto'">
						<option value="">全部</option>
						<option value="0">免费会员</option>
					    <option value="1">星级会员</option>
						<option value="2">贵宾会员</option>
						<option value="3">高级会员</option>
						<option value="4">超级会员</option>
		              </select></td>
    	<td>手机号码:<input id="mobile" name="mobile" type="text" size="10" editable="false"/></td>
   		<td>藏品名称:<input id="name" name="name" type="text" size="10" editable="false"/></td>
   		<td>专家:<input id="zjuserid" name="zjuserid" value="" class="easyui-combobox" data-options="url:'<c:url value="/onlinepic/getOnlinePicProf"/>', valueField:'userid', textField:'name',panelHeight:'auto'"></td>
   		<td>类型:<input id="typeid" name="typeid" value="" class="easyui-combobox" data-options="url:'<c:url value="/onlinepic/getOnlinePicType"/>', valueField:'id', textField:'name',panelHeight:'auto'"></td>
		<td>状态:<select id="state" name="state" class="easyui-combobox" editable="false" style="width: 170px" data-options="panelHeight:'auto'">
						<option value="">全部</option>
						<option value="1">已上传等待审核</option>
					    <option value="2">专家正在审核</option>
						<option value="3">审核未通过，图片清晰度不够</option>
						<option value="4">审核未通过，该藏品所选门类与实际不符</option>
						<option value="5">审核未通过，请您核对藏品数量再次上传</option>
						<option value="6">专家已审核</option>
						<option value="8">后台复审通过</option>
		              </select></td>
		 <td>送拍结果：<select id="isshangpai" name="isshangpai" class="easyui-combobox" editable="false" style="width: 170px" data-options="panelHeight:'auto',required:true">
						<option value="">---请选择--</option>
						<option value="1">不推荐复审</option>
						<option value="2">推荐复审</option>
						<option value="3">送拍到国外大拍行送拍藏品展示</option>
						<option value="4">送拍到国内大拍行送拍藏品展示</option>
						<option value="5">送拍到淘宝平台网拍藏品展示</option>
						<option value="6">送拍到华豫官网微拍藏品展示</option>

		              </select></td>
		   <td>综合评价：<select id="zhpg" name="zhpg" class="easyui-combobox" editable="false" style="width: 170px" data-options="panelHeight:'auto',required:true">
						<option value="">---请选择--</option>
						<option value="1">新</option>
						<option value="2">老</option>
						<option value="3">老仿</option>

		              </select></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td> 
		<td width="100"><a href="javascript:void(0)" onclick="expexcel();" class="easyui-linkbutton" iconCls="icon-redo">导出</a></td></tr>
	</table>
    <table id="messagetable" class="easyui-datagrid" data-options="url:'<c:url value="/onlinepic/getPicCollForList"/>',queryParams:{'ordercolumn':'yjresultsdate'},title: '图片鉴定藏品列表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true,showFooter:true">
		<thead>
			<tr>
				<th data-options="field:'username',width:25,halign:'center'">用户名</th>
				<th data-options="field:'level',width:25,halign:'center',formatter:function(value,row,index){
                   if(value == 0){
                     return '免费会员';
                   }else  if(value ==1){
                      return '星级会员';
                   } else if(value ==2){
                    return '贵宾会员';
                   }else if(value ==3){
                    return '高级会员';
                   }else if(value ==4){
                    return '超级会员';
                   }else{
                   	return '';
                   }
                }">用户级别</th>
				<th data-options="field:'mobile',width:35,halign:'center'">用户电话</th>
				<th data-options="field:'zjname',width:20,halign:'center'">鉴定专家</th>
				<th data-options="field:'name',width:55,halign:'center'">藏品名称</th>
<%--				<th data-options="field:'bh',width:20,halign:'center'">编号</th>--%>
				<th data-options="field:'typename',width:20,halign:'center'">类型</th>
				<th  data-options="field:'pic',width:60,halign:'center',formatter:function(value,row,index){			
		                var imgurl = value.split(',');
		                var ss='';
		                var imgs='';
		                var num=0;
		                for(var k=0;k<=imgurl.length;k++){
		                if(imgurl[k]!=''&&imgurl[k]!='undefined'&&imgurl[k]!=undefined){
		                	num+=1;
							if(k==0){
								ss+='<img onclick=window.open(\'http://admin.wswhly.com/zengjipaipin/'+imgurl[k]+'\') src=http://admin.wswhly.com/zengjipaipin/'+imgurl[k]+' height=20 />';
								}
		                  imgs+='http://admin.wswhly.com/zengjipaipin/'+imgurl[k]+',';
		                  }	
		                }
		                ss+='('+num+')'
		                ss+='<a target=\'_blank\' href=\'<c:url value='/jqzoom/index.jsp?imgs='/>'+imgs+'\'>图集</a>';
		                return ss ;
                     }">拍品图片(图片数量)</th>
				<th data-options="field:'size',width:35,halign:'center'">尺寸、重量</th>
<%--				<th data-options="field:'note',width:35,halign:'center'">备注</th>--%>
				<th data-options="field:'uploaddate',width:35,halign:'center'">上传时间</th>
				<th data-options="field:'yjresultsdate',width:35,halign:'center'">要求鉴定结果时间</th>
				<th data-options="field:'resultsdate',width:35,halign:'center'">专家鉴定时间</th>
				<th data-options="field:'fsdate',width:35,halign:'center'">复审或上拍时间</th>
				<th data-options="field:'zhpg',width:25,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '新';
                   }else  if(value ==2){
                      return '老';
                   } else if(value ==3){
                    return '老仿';
                   }else{
                   	return '';
                   }
                }">综合评价</th>
				<th data-options="field:'niandai',width:35,halign:'center'">年代</th>
				<th data-options="field:'guzhi',width:35,halign:'center'">估值（万）</th>
				<th data-options="field:'hangqing',width:35,halign:'center'">行情走势</th>
<%--				<th data-options="field:'detailnote',width:35,halign:'center'">详细说明</th>--%>
				<th data-options="field:'isshangpai',width:25,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '不推荐复审';
                   }else  if(value ==2){
                      return '推荐复审';
                   } else if(value ==3){
                    return '送拍到国外大拍行送拍藏品展示';
                   }else if(value ==4){
                   return '送拍到国内大拍行送拍藏品展示';
                   }else if(value ==5){
                    return '送拍到淘宝平台网拍藏品展示';
                   }else if(value ==6){
                    return '送拍到华豫官网微拍藏品展示';
                   }else if(value ==7){
                    return '过期未得到专家审核';
                   }else{
                   	return '';
                   }
                }">是否推荐复审</th>
				<th data-options="field:'thcs',width:35,halign:'center'">退回次数</th>
				<th data-options="field:'state',width:45,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '已上传等待审核';
                   }else  if(value ==2){
                      return '专家正在审核';
                   } else if(value ==3){
                    return '审核未通过，图片清晰度不够';
                   }else if(value ==4){
                    return '审核未通过，该藏品所选门类与实际不符';
                   }else if(value ==5){
                     return '审核未通过，请您核对藏品数量再次上传';
                   }else if(value ==6){
                    return '专家已审核';
                   }else if(value ==7){
                    return '过期未得到专家审核';
                   }else if(value==8){
                   	return '后台复审通过';
                   }else if(value==9){
                   	return '后台复审未通过';
                   }else{
                   	return '';
                   }
                }">状态</th>
                
			 
			</tr>
		</thead>
	</table>
	
	<!--分配专家 -->
	<div id="scanmessagefp" class="easyui-window" data-options="title:'分配专家',iconCls:'icon-search',modal:true" style="width:300px;height:250px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="oneverifytable" width="100%" cellpadding="5" cellspacing="1" align="center">
				<input type="hidden" name="fpid" id="fpid" />
				<tr><td>藏品名称:&nbsp;&nbsp;<span id="fpnameid"></span></td></tr>
				<tr><td>专家:<input id="fpzjuserid" name="fpzjuserid" value="" class="easyui-combobox" data-options="url:'<c:url value="/onlinepic/getOnlinePicProf"/>', valueField:'userid', textField:'name',panelHeight:'auto'"></td></tr>
				</table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="setFp();">确认</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanmessagefp').window('close');">关闭</a>
			</div>
		</div>
	</div> 
	<!--复审 -->
	<div id="scanmessageth" class="easyui-window" data-options="title:'复审',iconCls:'icon-search',modal:true" style="width:300px;height:250px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="oneverifytable" width="100%" cellpadding="5" cellspacing="1" align="center">
				<input type="hidden" name="thid" id="thid" />
				<tr><td>藏品名称:&nbsp;&nbsp;<span id="thnameid"></span></td></tr>
				<tr><td>复审结果:<select id="thstate" name="thstate" class="easyui-combobox" editable="false" style="width: 170px" data-options="panelHeight:'auto',required:true">
						<option value="">---请选择--</option>
						<option value="8">后台复审通过</option>
						<option value="9">后台复审未通过</option>

		              </select></td></tr>
				</table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="setTh();">确认</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanmessageth').window('close');">关闭</a>
			</div>
		</div>
	</div> 
	
	
	<!-- 上拍-->
	<div id="scanmessagesp" class="easyui-window" data-options="title:'上拍',iconCls:'icon-search',modal:true" style="width:300px;height:250px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="oneverifytable" width="100%" cellpadding="5" cellspacing="1" align="center">
				<input type="hidden" name="spid" id="spid" />
				<tr><td>藏品名称:&nbsp;&nbsp;<span id="spnameid"></span></td></tr>
				<tr><td>上拍到:<select id="spisshangpai" name="spisshangpai" class="easyui-combobox" editable="false" style="width: 170px" data-options="panelHeight:'auto',required:true">
						<option value="">---请选择--</option>
						<option value="3">送拍到国外大拍行送拍藏品展示</option>
						<option value="4">送拍到国内大拍行送拍藏品展示</option>
						<option value="5">送拍到淘宝平台网拍藏品展示</option>
						<option value="6">送拍到华豫官网微拍藏品展示</option>

		              </select></td></tr>
		          <tr><td><font color='red' >同意上拍即表示复审通过！！！！！！</font></td></tr>
				</table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="setSp();">确认上拍</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanmessageth').window('close');">关闭</a>
			</div>
		</div>
	</div> 
	
	
  </body>
</html>
