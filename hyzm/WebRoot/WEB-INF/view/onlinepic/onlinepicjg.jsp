<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>${item.name}_拍品征集_卫视文化乐园-华豫之门官方网站</title>

  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
   <link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
   <link rel="stylesheet" type="text/css" href="<c:url value='/css/pmyuzhan/onlinepicjg.css'/>"/>
  <script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>

<meta name=keywords content="${item.name}">
<meta name=description content="${item.name}">

 <style type="text/css">
    .qujp,.qujp2{
      width:100px;
      height:28px;
      color:#fff;
      font-size:14px;
      cursor:pointer;
      border-radius:6px;
      font-weight:bold;
    }
    .qujp2{
      background: #999;
    }
    .qujp{
       background:#CD3200;
    }
    .qujp:hover{
      background: #ED3900;
    }
    .content{width:1140px;height:500px;margin:80px auto 0;}
    .smh_1 {
  text-align: center;
  font-size: 20px;
  background: #ba0000;
  padding: 5px 0;
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

	for(var i=0;i<picsa.length;i++){
		if(picsa[i]!=null&&picsa[i]!=''&&picsa[i]!=' '){
		 $('#picdiv').append("<img src='http://admin.wswhly.com/zengjipaipin/"+picsa[i]+"' width='200' onclick=\"window.open('http://admin.wswhly.com/zengjipaipin/"+picsa[i]+"')\" />");
		}
	}
}
</script>
  </head>

  <body>





  <div id="content" style="min-height: 602px;">

<!--内容区 start-->
<div class="icp-content" data-spm="a3c20">
    <!--form start-->
    <div class="icp-content-wrapper">
        <div class="icp-content-block-title">
			鉴定结果：
        </div>
        <div class="icp-content-block">
            <div class="icp-content-block-title font-14 margin-bottom-18 margin-top-12">
              <ul class="clear-fix">
                <li class="margin-right-50 margin-left-15 float-left list-style-type-square">
					藏品名称：${item.name}
				</li>
                <li class="margin-right-50 margin-left-15 float-left">
					藏品类型：<span class="font-color-green">${item.typename}</span>
				</li>
                <li class="margin-right-50 margin-left-15 float-left">
					退回次数：<span class="font-color-green">${item.thcs}</span>
				</li>
                <li class="margin-right-20 margin-left-15 float-left">
					首次提交审核：${item.sfuploaddate}
				</li>
              </ul>
            </div>
            <table class="icp-table-list width-939">
            	<colgroup>
            	<col width="30%">
            	<col width="20%">
            	<col width="20%">
            	<col width="30%">

            	</colgroup>
            <thead>
            	<tr>
            		<td>回复时间</td>
            		<td>鉴定状态</td>
           		<td><%-- 鉴定专家--%></td>
            		<td  >是否推荐复审</td>

            	</tr>
            </thead>

            <tbody>
            	<tr>
            		<td title="${item.sfresultsdate}">${item.sfresultsdate}</td>
            		<td align="left" title="鉴定阶段">
            			<c:if test="${item.state==1}">等待鉴定</c:if>
            			<c:if test="${item.state==2}">等待鉴定</c:if>
            			<c:if test="${item.state==3}">审核未通过，图片清晰度不够</c:if>
            			<c:if test="${item.state==4}">审核未通过，该藏品所选门类与实际不符</c:if>
            			<c:if test="${item.state==5}">审核未通过，请您核对藏品数量</c:if>
            			<c:if test="${item.state==6}">等待鉴定</c:if>
            			<c:if test="${item.state==7}">过期未得到专家审核</c:if>
            			<c:if test="${item.state==8}">已鉴定</c:if>
            			<c:if test="${item.state==9}">等待鉴定</c:if>
            		</td>
           		<td class="font-color-green"><%-- ${item.zjname}--%></td>
            		<td  >
            			<c:if test="${item.isshangpai==1}">不推荐复审</c:if>
            			<c:if test="${item.isshangpai==2}">推荐复审</c:if>
            			<c:if test="${item.isshangpai==3}">送拍到国外大拍行送拍藏品展示</c:if>
            			<c:if test="${item.isshangpai==4}">送拍到国内大拍行送拍藏品展示</c:if>
            			<c:if test="${item.isshangpai==5}">送拍到淘宝平台网拍藏品展示</c:if>
            			<c:if test="${item.isshangpai==6}">送拍到华豫官网微拍藏品展示</c:if>
            		</td>

            	</tr>
            	<tr  style="height:350px;">
            		<td align="right">图片 点击放大:</td>
            		<td align="left" id="picdiv" colspan="3"></td>

            	</tr>


            	<tr>
            		<td align="right">藏品名称:</td>
            		<td align="left">${item.name}</td>
            		<td align="right">尺寸/重量:</td>
            		<td align="left">${item.size}</td>
            	</tr>
            	<tr>
            		<td align="right" >备注描述:</td>
            		<td align="left">${item.note}</td>
            		<td align=""></td>
            		<td align=""></td>
            	</tr>


              <tr>
                <td colspan="4">
                   <div class="smh_1" ><i style="color:#fff">专家图片审核建议</i></div>
                </td>


              </tr>




            	<tr>
            		<td align="right">综合评价:</td>
            		<td align="left">
            			<c:if test="${item.zhpg==1}">新</c:if>
            			<c:if test="${item.zhpg==2}">老</c:if>
            			<c:if test="${item.zhpg==3}">老仿</c:if>
            		</td>
            		<td align="right">年代:</td>
            		<td align="left">${item.niandai}</td>

            	</tr>
            	<c:if test="${item.zhpg!=1}">
            	<tr>
            		<td align="right">估值（万）:</td>
            		<td align="left"><c:if test="${item.level>=2}">${item.guzhi}</c:if></td>
            		<td align="right">行情走势:</td>
            		<td align="left">${item.hangqing}</td>
            	</tr>
				</c:if>
            	<tr>
            		<td align="right" rowspan="">详细说明:</td>
            		<td align="left" rowspan="">${item.detailnote}</td>
            		<td align=""></td>
            		<td align=""></td>
            	</tr>


            </tbody>
            </table>
            <div></div>
        </div>
        <div class="icp-form-type-block-bottom-operation center width-939">
			<a href="javascript:location.href='<c:url value='/onlinepic/myUpOlinePic'/>';" class="icp-button-main-invert icp-button-size-large ">返回</a>
        </div>
    </div>
</div>
<!--内容区 end-->

    </div>




  </body>
</html>
