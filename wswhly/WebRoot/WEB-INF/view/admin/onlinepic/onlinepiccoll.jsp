<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>${item.name}详细信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="<c:url value="/jquery/jquery-1.8.0.min.js"/>"></script>
		    <link rel="stylesheet" type="text/css" href="<c:url value="/css/zoomy0.5.css"/>">
    <script type="text/javascript" src="<c:url value="/jquery/jquery.zoomy0.5.min.js"/>"></script>
<style type="text/css">
textarea{
	width:200px;
	border:1px solid #ccc;
	padding:2px;
}

TD {
	FONT: 12px 微软雅黑
}
</style>   
<script type="text/javascript">
$(function(){
  	setimgpic();
});
function setimgpic(){
	var pics='${item.pic}';
	var picsa= new Array();   
	picsa=pics.split(",");      
	var imgsfd="";
	for(var i=0;i<picsa.length;i++){
		if(picsa[i]!=null&&picsa[i]!=''&&picsa[i]!=' '){
		 $('#picdiv').append("<a class='zoom'> <img src='http://admin.wswhly.com/zengjipaipin/"+picsa[i]+"' width='50' onclick=\"window.open('http://admin.wswhly.com/zengjipaipin/"+picsa[i]+"')\" /></a>");
		 imgsfd+="http://admin.wswhly.com/zengjipaipin/"+picsa[i]+",";
		}
	}
	 $('#picdiv').append("<a href='<c:url value='/jqzoom/index.jsp'/>?imgs="+imgsfd+"'> 点击查看图集</a>");
}
</script>
</head>
  
  <body >
	   <table id="onecollectiontable" width="100%" border="0" align="center" cellpadding="10" cellspacing="10" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
				<tr><td align="right" width="20%">类型:</td><td align="left">${item.typename}</td><td align="right">鉴定专家:</td><td align="left">${item.zjname}</td></tr>
				<tr><td align="right">藏品名称:</td><td align="left">${item.name}</td><td align="right">尺寸/重量:</td><td align="left">${item.size}</td></tr>
				<tr><td align="right">备注描述:</td><td align="left">${item.note}</td><td align="right">上传时间:</td><td align="left">${item.uploaddate}</td></tr>
				<tr><td align="right">预计回复时间:</td><td align="left">${item.yjresultsdate}</td><td align="right">回复时间:</td><td align="left">${item.resultsdate}</td></tr>
				<tr><td align="right">综合评价:</td>
				<td align="left"><c:if test="${item.zhpg==1}">新</c:if><c:if test="${item.zhpg==2}">老</c:if><c:if test="${item.zhpg==3}">老仿</c:if></td></tr>
				<tr><td align="right">年代:</td><td align="left">${item.niandai}</td><td align="right">估值（万）:</td><td align="left">${item.guzhi}（万）</td></tr>
				<tr><td align="right">行情走势:</td><td align="left">${item.hangqing}</td><td align="right">详细说明:</td><td align="left">${item.detailnote}</td></tr>
				<tr><td align="right">是否推荐复审:</td><td align="left"><c:if test="${item.isshangpai==1}">不推荐复审</c:if><c:if test="${item.isshangpai==2}">推荐复审</c:if>
				<c:if test="${item.isshangpai==3}">送拍到国外大拍行送拍藏品展示</c:if><c:if test="${item.isshangpai==4}">送拍到国内大拍行送拍藏品展示</c:if><c:if test="${item.isshangpai==5}">送拍到淘宝平台网拍藏品展示</c:if>
				<c:if test="${item.isshangpai==6}">送拍到华豫官网微拍藏品展示</c:if></td><td align="right">退回次数:</td><td align="left">${item.thcs}</td></tr>
				<tr><td align="right">状态:</td><td align="left">
				<c:if test="${item.state==1}">等待鉴定</c:if>
				<c:if test="${item.state==2}">等待鉴定</c:if>
				<c:if test="${item.state==3}">审核未通过，图片清晰度不够</c:if>
				<c:if test="${item.state==4}">审核未通过，该藏品所选门类与实际不符</c:if>
				<c:if test="${item.state==5}">审核未通过，请您核对藏品数量</c:if>
				<c:if test="${item.state==6}">专家已审核</c:if>
				<c:if test="${item.state==7}">过期未得到专家审核</c:if>
				<c:if test="${item.state==8}">后台复审通过</c:if>
				<c:if test="${item.state==9}">后台复审未通过</c:if>
				</td></tr>
				<tr><td align="right">图片点击放大:</td><td  align="left" id="picdiv" rowspan="2"></td></tr>
				
				</table>
  </body>
</html>
