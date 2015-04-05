<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>等待在线图片鉴定藏品管理</title>
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
	$('#scanmessage').window('close');
$('#messagetable').datagrid({
          toolbar:[{
              id:'onlinemyjddd',
              text:'我要鉴定',
              iconCls:'icon-edit',
              handler:function(){
                 var rows = $('#messagetable').datagrid('getSelections');
                 if(confirm('您确定要鉴定这些藏品吗？')){
                  if(upda(rows)){
                  	serach();
                  }
                 }
              }
             },{
              id:'onlinedetaildd',
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
            id:'onlinepicdowimgdd',
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

function upda(rows){
	if(rows.length==0){
			alert('请选择一条信息！');
          	return false;
	}
	for(var i=0;i<rows.length;i++){
		var id=rows[i].id;
		$.ajax({
        type:'get',
        url:"<c:url value='/onlinepic/MyOnlinePicColl?id='/>"+id,
        success:function(data){
          if(data==0){
          	alert('失败请重试!');
          	return false;
          }
        }
	    });
	}
	return true;
}

	function serach(){
	$('#messagetable').datagrid('loadData',{total:0,rows:[],footer:[]});
		var name = $("#name").val();
		$('#messagetable').datagrid('load',{'name':name,'state':1,'zjuserid':-1,ordercolumn:'yjresultsdate'});
	}

	</script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
    <tr>
   		<td>藏品名称:<input id="name" name="name" type="text" size="10" editable="false"/></td>
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="messagetable" class="easyui-datagrid" data-options="url:'<c:url value="/onlinepic/getMyPicCollForList"/>',queryParams:{'state':1,'zjuserid':-1,'ordercolumn':'yjresultsdate'},title: '等待图片鉴定藏品列表',frozenColumns:[[{field:'ck',checkbox:true}]],fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true,showFooter:true">
		<thead>
			<tr>
<%--				<th data-options="field:'username',width:25,halign:'center'">用户名</th>--%>
<%--				<th data-options="field:'mobile',width:35,halign:'center'">用户电话</th>--%>
<%--				<th data-options="field:'zjname',width:20,halign:'center'">鉴定专家</th>--%>
				<th data-options="field:'name',width:55,halign:'center'">藏品名称</th>
				<th data-options="field:'bh',width:20,halign:'center'">编号</th>
				<th data-options="field:'typename',width:20,halign:'center'">类型</th>
				<th  data-options="field:'pic',width:60,halign:'center',formatter:function(value,row,index){			
		                var imgurl = value.split(',');
		                var ss='';
		                var imgs='';
		                var num=0;
		                for(var k=0;k<=imgurl.length;k++){
		                if(imgurl[k]!=''&&imgurl[k]!='undefined'&&imgurl[k]!=undefined){
		                	num+=1;
		                  ss+='<img onclick=window.open(\'http://admin.wswhly.com/zengjipaipin/'+imgurl[k]+'\') src=http://admin.wswhly.com/zengjipaipin/'+imgurl[k]+' height=20 />';
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
                   }else if(value ==8){
                    return '已审核';
                   }else if(value==9){
                   	return '请重新审核';
                   }else{
                   	return '';
                   }
                }">状态</th>
                
			 
			</tr>
		</thead>
	</table>
	
	
	
  </body>
</html>
