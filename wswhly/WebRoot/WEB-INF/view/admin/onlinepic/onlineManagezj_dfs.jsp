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
	<script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "<c:url value='/ueditor/'/>";
    </script>
	<script type="text/javascript" src="<c:url value="/ueditor/ueditor.config.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/ueditor/ueditor.all.min.js"/>"></script>
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
	
var yuqiniandai="商,西周,战国,唐代,南宋,北宋,元代,明代早期,明代空白期,明代中期,明代晚期,明代末期,清早期,清中期,清晚期,清代顺治,清代康熙,清代雍正,清代乾隆,清代嘉庆,清代道光,清代咸丰,清代末期,清代同治,清代光绪,清代宣统,民国,现代艺术品,年代不明";
var yuqimiaos="";
var qingtongniandai="商,西周,战国,唐代,南宋,北宋,元代,明代早期,明代空白期,明代中期,明代晚期,明代末期,清早期,清中期,清晚期,清代顺治,清代康熙,清代雍正,清代乾隆,清代嘉庆,清代道光,清代咸丰,清代末期,清代同治,清代光绪,清代宣统,民国,现代艺术品,年代不明";
var qingtongmiaos="";
var fuxiangniandai="商,西周,战国,唐代,南宋,北宋,元代,明代早期,明代空白期,明代中期,明代晚期,明代末期,清早期,清中期,清晚期,清代顺治,清代康熙,清代雍正,清代乾隆,清代嘉庆,清代道光,清代咸丰,清代末期,清代同治,清代光绪,清代宣统,民国,现代艺术品,年代不明";
var fuxiangmiaos="";
var ciqiniandai="商,西周,战国,唐代,南宋,北宋,元代,明代早期,明代空白期,明代中期,明代晚期,明代末期,清早期,清中期,清晚期,清代顺治,清代康熙,清代雍正,清代乾隆,清代嘉庆,清代道光,清代咸丰,清代末期,清代同治,清代光绪,清代宣统,民国,现代艺术品,年代不明";
var ciqimiaos="";
var zaxiangniandai="商,西周,战国,唐代,南宋,北宋,元代,明代早期,明代空白期,明代中期,明代晚期,明代末期,清早期,清中期,清晚期,清代顺治,清代康熙,清代雍正,清代乾隆,清代嘉庆,清代道光,清代咸丰,清代末期,清代同治,清代光绪,清代宣统,民国,现代艺术品,年代不明";
function setNiandai(typeid){
$('#niandaidiv').html("");
var niandaiv="";
var miaosv="";
	if(typeid==1){
		niandaiv=yuqiniandai;
		miaosv=yuqimiaos;
	}else if(typeid==2){
		niandaiv=qingtongniandai;
		miaosv=qingtongmiaos;
	}else if(typeid==3){
		niandaiv=fuxiangniandai;
		miaosv=fuxiangmiaos;
	}else if(typeid==4){
		niandaiv=ciqiniandai;
		miaosv=ciqimiaos;
	}else if(typeid==5){
		niandaiv=zaxiangniandai;
	}
	else if(typeid==6){
		niandaiv=zaxiangniandai;
	}
$('#jgdetailnote').val(miaosv);
 var fniand=niandaiv.split(',');
 for(var i=0;i<fniand.length;i++){
 	$('#niandaidiv').append("<input value='"+fniand[i]+"' type='button' onclick='$(\"#jgniandai\").val(\""+fniand[i]+"\")'/>");
 }
 $('#hangqingdiv').append("<input value='近5至10年该藏品有可能升值' type='button' onclick='$(\"#jghangqing\").val(\"近5至10年该藏品有可能升值\")'/>");
  $('#hangqingdiv').append("<input value='近5至10年该藏品有可能贬值' type='button' onclick='$(\"#jghangqing\").val(\"近5至10年该藏品有可能贬值\")'/>");
}
$(function(){
$('#jgzhpg').combobox({
		onSelect: function(rec){
			if(rec.value == "1"){
				$('#jgniandai').val('现代艺术品');
				$('#jgguzhitr').css("display","none");
				$('#jgisshangpaitr').css("display","none");
				$('#jghangqingtr').css("display","none");
			}else{
				$('#jgniandai').val('');
				$('#jgguzhitr').css("display","block");
				$('#jgisshangpaitr').css("display","block");
				$('#jghangqingtr').css("display","block");
			}
		}
	});
	
	
	$('#scanmessage').window('close');
	$('#scanmessageth').window('close');
	$('#messagetable').datagrid({
          toolbar:[{
              id:'onlinedetailzj',
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
            id:'onlinepicdowimgzj',
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
function setJg(){
if($('#jgzhpg').datebox('getValue')==''){alert('请选择综合评估结果！');return;}
if($('#jgniandai').val()==''){alert('请填写年代！');return;}
	if($('#jgzhpg').datebox('getValue')!=1){//如果综合评估不为新
		if($('#jglevel').val()>1){//如果用户基本为高级以上
			if($('#jgguzhi').val()==''){alert('请填写估值！');return;}
		}
		if($('#jgisshangpai').datebox('getValue')==''){alert('请选择是否推荐复审！');return;}
		if($('#jghangqing').val()==''){alert('请填写行情走势！');return;}
		
	}else{
		if($('#jgdetailnote').val()==''){alert('请填写详细说明！');return;}
		if($('#jgdetailnote').val().length<20){alert('详细说明不得少于20字！');return;}
	}
if(!confirm('您确定提交鉴定结果吗？提交之后不能修改！')){
return;
}
var isshangpai;
if($('#jgzhpg').datebox('getValue')==1){//如果综合评估为新 清空值
	$('#jgguzhi').val('');
	$('#jghangqing').val('');
	isshangpai=1;
}else{
isshangpai=$('#jgisshangpai').datebox('getValue');
}

	$.ajax({
        type:'post',
        url:"<c:url value='/onlinepic/UpdateOnlinePicCollByProf'/>",
        data:{    
             state:6,    
             zhpg: $('#jgzhpg').datebox('getValue'),    
             niandai:$('#jgniandai').val(),    
             guzhi:$('#jgguzhi').val(),  
             hangqing:$('#jghangqing').val(),  
             detailnote:$('#jgdetailnote').val(),
             isshangpai:isshangpai,    
             id:$('#jgid').val()
    	},  
        success:function(data){
          if(data==0){
          	alert('失败请重试!');
          }else{
         	 alert('鉴定成功!');
         	 $('#messagetable').datagrid('reload')
          	$('#scanmessage').window('close');
          	document.getElementById("updateadminform").reset();
          }
        }
	    });
}
function setTh(){
if($('#thstate').datebox('getValue')==''){alert('请选择退回原因！');return;}
if(!confirm('您确定退回吗？提交之后不能修改！')){
return;
}
	$.ajax({
        type:'post',
        url:"<c:url value='/onlinepic/thOnlinePicColl'/>",
        data:{    
             state:$('#thstate').datebox('getValue'),    
             id:$('#thid').val()
    	},  
        success:function(data){
          if(data==0){
          	alert('失败请重试!');
          }else{
         	 alert('退回成功!');
          	 $('#messagetable').datagrid('reload')
          	$('#scanmessageth').window('close');
          }
        }
	    });
}

	function serach(){
	$('#messagetable').datagrid('loadData',{total:0,rows:[],footer:[]});
		var name = $("#name").val();
	    var zjuserid = ${CurrentSession.userinfo.id};
		var typeid = $('#typeid').datebox('getValue');
		$('#messagetable').datagrid('load',{'name':name,'zjuserid':zjuserid,'typeid':typeid,'state':'6',ordercolumn:'yjresultsdate'});
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
   		<td>类型:<input id="typeid" name="typeid" value="" class="easyui-combobox" data-options="url:'<c:url value="/onlinepic/getOnlinePicType"/>', valueField:'id', textField:'name',panelHeight:'auto'">
		<td width="100"><a href="javascript:void(0)" onclick="serach();" class="easyui-linkbutton" iconCls="icon-search">查询</a></td></tr>
	</table>
    <table id="messagetable" class="easyui-datagrid" data-options="url:'<c:url value="/onlinepic/getPicCollForList"/>',queryParams:{'zjuserid':${CurrentSession.userinfo.id},'ordercolumn':'yjresultsdate','state':'6'},title: '图片鉴定藏品列表',frozenColumns:[[{field:'ck',checkbox:true}]],singleSelect:true,fitColumns:true,nowrap:false,pagination:true,rownumbers:true,striped:true,showFooter:true">
		<thead>
			<tr>
<%--				<th data-options="field:'username',width:25,halign:'center'">用户名</th>--%>
<%--				<th data-options="field:'mobile',width:35,halign:'center'">用户电话</th>--%>
<%--				<th data-options="field:'zjname',width:20,halign:'center'">鉴定专家</th>--%>
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
				<th data-options="field:'guzhi',width:35,halign:'center'">估值(万)</th>
				<th data-options="field:'state',width:45,halign:'center',formatter:function(value,row,index){
                   if(value == 1){
                     return '请您尽快鉴定';
                   }else  if(value ==2){
                      return '请您尽快审核';
                   } else if(value ==3){
                    return '审核未通过，图片清晰度不够';
                   }else if(value ==4){
                    return '审核未通过，该藏品所选门类与实际不符';
                   }else if(value ==5){
                     return '审核未通过，请您核对藏品数量再次上传';
                   }else if(value ==6){
                    return '等待复审';
                   }else if(value ==7){
                    return '过期未得到专家审核';
                   }else if(value==8){
                   	return '已鉴定';
                   }else if(value==9){
                   	return '复审未通过，请重新鉴定';
                   }else{
                   	return '';
                   }
                }">状态</th>
                
			 
			</tr>
		</thead>
	</table>
	
		<!--鉴定结果 -->
	<div id="scanmessage" class="easyui-window" data-options="title:'鉴定结果',iconCls:'icon-search',modal:true" style="width:700px;height:700px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<form id="updateadminform" method="post">
				<table id="oneverifytable" width="100%" cellpadding="5" cellspacing="1" align="center">
				<input type="hidden" name="jgid" id="jgid" />
				<input type="hidden" name="jglevel" id="jglevel" />
				<tr id="jgnameidtr"><td>藏品名称:&nbsp;&nbsp;<span id="jgnameid"></span></td></tr>
				<tr id="jgzhpgtr"><td>综合评价:<select id="jgzhpg" name="jgzhpg" class="easyui-combobox" editable="false" style="width: 170px" data-options="panelHeight:'auto',required:true">
						<option value="">---请选择--</option>
						<option value="1">新</option>
					    <option value="2">老</option>
						<option value="3">老仿</option>
		              </select></td></tr>
				<tr id="jgniandaitr"><td>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;代:<input type="text" id="jgniandai"name="jgniandai" width="50px" /><span id="niandaidiv"></span></td></tr>
				<tr id="jgguzhitr"><td>估&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;值:<input type="text" id="jgguzhi"name="jgguzhi"/>(万)<span id="isguizhi"></span></td></tr>
				<tr id="jgisshangpaitr"><td>是否推荐复审:<select id="jgisshangpai" name="jgisshangpai" class="easyui-combobox" editable="false" style="width: 170px" data-options="panelHeight:'auto',required:true">
						<option value="">---请选择--</option>
						<option value="1">不推荐复审</option>
					    <option value="2">推荐复审</option>
		              </select></td></tr>
		         <tr id="jghangqingtr"><td>行情走势:<textarea name="jghangqing" id="jghangqing" cols="30" rows="4"></textarea><br/><span id="hangqingdiv"></span>
				</td></tr>
				<tr><td>详细说明:<textarea name="jgdetailnote" id="jgdetailnote" cols="30" rows="4"></textarea></td></tr>
				</table>
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="setJg();">鉴定</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanmessage').window('close');">关闭</a>
			</div>
		</div>
	</div>
	
	<!--退回 -->
	<div id="scanmessageth" class="easyui-window" data-options="title:'退回',iconCls:'icon-search',modal:true" style="width:300px;height:250px;padding:5px;background: #fafafa;overflow:auto;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
				<table id="oneverifytable" width="100%" cellpadding="5" cellspacing="1" align="center">
				<input type="hidden" name="thid" id="thid" />
				<tr><td>藏品名称:&nbsp;&nbsp;<span id="thnameid"></span></td></tr>
				<tr><td>退回原因:<select id="thstate" name="thstate" class="easyui-combobox" editable="false" style="width: 170px" data-options="panelHeight:'auto',required:true">
						<option value="">---请选择--</option>
						<option value="3">图片清晰度不够</option>
						<option value="4">图片含有色情暴力</option>
						<option value="5">请您核对藏品数量再次上传</option>

		              </select></td></tr>
				</table>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="setTh();">确认退回</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanmessageth').window('close');">关闭</a>
			</div>
		</div>
	</div>
	
  </body>
</html>
