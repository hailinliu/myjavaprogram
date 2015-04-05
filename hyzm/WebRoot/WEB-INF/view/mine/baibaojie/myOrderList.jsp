<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  <title>我买到的_百宝箱</title>
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/myOrderList.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/shoper.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/version.css'/>"/>
  <script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/slideshow.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
  <meta name=keywords content="百宝箱">
  <meta name=description content="华豫之门百宝箱">
  <script>
  function getWL(showid,com,nu,show,muti,order){
  $.ajax({
		type:'get',
		url:"<c:url value='/getCourier'/>?com="+com+"&nu="+nu+"&show="+show+"&muti="+muti+"&order="+order+"&s="+Math.random(),
		success:function(rsstr){
		$("#"+showid).html("");
			rsstr=jQuery.parseJSON(rsstr);
			if(rsstr.status==1||rsstr.status=='1'){
				var c=rsstr.data;
				$.each(c, function(index, objVal_c) {
				$("#"+showid).append(objVal_c.time+" "+objVal_c.context);
				});
			 }else{
				 $("#"+showid).append("物流单暂无结果！请到官网查询！<a href='javascript:$(\"#"+showid+"\").html(\"正在加载... ...\");getWL(\""+showid+"\",\""+com+"\",\""+nu+"\",\""+show+"\",\""+muti+"\",\""+order+"\")'>点击重试</a>");
			 }
		}
	});
  }
  </script>
  </head>

  <body>
  <jsp:include page="../../head/header.jsp"></jsp:include>
<div class="main_box clear">
  <jsp:include page="../../mine/common/myMenu.jsp"></jsp:include>
  <div class="FR listWrap">
    <h1>我买到的藏品</h1>
    <table width="918" border="0" cellspacing="0" cellpadding="0" class="thead">
      <tr  class="TAC">
        <td width="40%" class="TAC">藏品</td>
        <td width="20%">卖家</td>
        <td width="10%">价格（元）</td>
        <td width="16%">订单状态</td>
        <td width="14%">&nbsp;</td>
      </tr>
    </table>
    <c:forEach items="${list}" var="pur" varStatus="cdn">
      <table width="918" border="0" cellspacing="0" cellpadding="0" class="myOrder">
        <tr class="firstTr">
          <td width="40%"><span class="orderNum">订单号：${pur.ordernumber}</span></td>
          <td width="20%"><a href="javascript:;">${pur.shopname}</a><!--卖家店铺名称--></td>
          <td width="10%">&nbsp;</td>
          <td width="16%">&nbsp;</td>
          <td width="14%">&nbsp;</td>
        </tr>
        <tr class="secondTr TAC">
          <td style="border:none"><a class="FL img DB "><img src="http://116.255.149.172:7080/wswhly/Baibaourl/${fn:split(pur.imgurl,',')[0]}" width="100px" height="100" /></a><a class="FL info DB" target="_blank" href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${pur.collid}">${pur.name}</a></td>
          <td><p>卖家：<a href="javascript:;">${pur.shopusername}<!--卖家昵称--></a></p>
            <p>联系方式：<a href="javascript:;">${pur.shopmobile}</a><!--卖家联系方式--></p></td>
          <td><span class="price">${pur.price}</span></td>
          <td><p><c:if test="${pur.state==1}">等待支付</c:if>
            <c:if test="${pur.state==2}">已支付等待发货</c:if>
            <c:if test="${pur.state==3}">已发货</c:if>
            <c:if test="${pur.state==4}">已收货</c:if>
            <c:if test="${pur.state==5}">平台已打款</c:if>
            <c:if test="${pur.state==100}">买家申请退货</c:if>
            <c:if test="${pur.state==101}">同意退货</c:if>
            <c:if test="${pur.state==102}">不同意退货</c:if>
            <c:if test="${pur.state==103}">买家已发货</c:if>
            <c:if test="${pur.state==104}">卖家已收货</c:if>
            <c:if test="${pur.state==105}">退货完成</c:if>
            <c:if test="${pur.state==200}">卖家取消订单</c:if>
            <c:if test="${pur.state==201}">买家取消订单</c:if>
            <c:if test="${pur.state==202}">系统取消订单</c:if></p>
            <p><a href="<c:url value='/BaiBao_getTransferDetail?id='/>${pur.id}" target="_blank">订单详情</a></p>
            <p><a href="http://m.kuaidi100.com/index_all.html?type=${pur.kdgs}&postid=${pur.couriernumber}" target="_blank">物流信息</a></p>
             <c:if test="${pur.sqkfjr==1}">您已申请客服介入</c:if>
            </td>
            
          <td><c:if test="${pur.state==1}">
               <input type="button" value="付款" onclick="CheckPayTransfer(${pur.collid},${pur.id})" class="button_con"/>
            </c:if>
            <c:if test="${pur.state==2}">
              <input type="button" value="取消订单" onclick="PurchaserCancelOrder(${pur.id})" class="button_con"/>
            </c:if>
            <c:if test="${pur.state==3}">
              <p>
                <input type="button" value="确认收货" onclick="UserConfRes(${pur.id})" class="button_con"/>
              </p>
              <c:if test="${pur.sqycsh==0}">
                <p>
                  <input type="button" value="申请延迟收货" onclick="Receive(${pur.id})" class="button_con"/>
                </p>
              </c:if>
            </c:if>
              <c:if test="${pur.sfreceivetime>=pur.sfnowtime&&pur.state==3&&pur.state!=100&&pur.state!=101&&pur.state!=102}">
                <p>
                  <input type="button" value="申请退货" onclick="UserReceiveResColl(${pur.id})"  class="button_con"/>
                </p>
              </c:if>
             <c:if test="${pur.state==101}">
              <p>
               <input type="button" value="退货" onclick="ffxxShow(${pur.id})"  class="button_con"/>
              </p>
            </c:if>
             <c:if test="${pur.state==102&&pur.sqkfjr!=1}">
             <input type="button" value="申请客服介入" onclick="Intervention(${pur.id})"  class="button_con"/>
             </c:if>
            </td>
        </tr>
      </table>
    </c:forEach>          
				      <div class="fanye_bbj">
				        <pg:pager url="BaiBao_getUserSellerCenter" items="${count}" maxPageItems="5" maxIndexPages="5">
				        <pg:param name="pageSize" value="${pageSize}" />
  				        <pg:first><a href="${pageUrl}">首页</a></pg:first>  
  				        <pg:prev><a href="${pageUrl}">上一页</a></pg:prev>
				        <pg:pages><a href="${pageUrl}">${pageNumber}</a></pg:pages>
				        <pg:next><a href="${pageUrl}">下一页</a></pg:next>
				        <pg:last><a href="${pageUrl}">尾页</a></pg:last>  
				        </pg:pager>
				   </div>

  </div>
</div>
<div id="ffxx"   style="width:100%;height:100%;position:fixed;top:0;left:0;background-color: rgba(61, 67, 76, 0.7);display: none;z-index:2000;">
  <!-- 发货弹出部分 -->
  <div class="curent_order_details fh_main_box" style="background:#fff;display:block;position:relative;margin:0 auto;top:28%;width:580px;">
    <div class="od_box_bt" style="margin-top:0;"><span style="margin-left:20px;" class="gray_clor">为了方便卖家查询物流信息，请认真填写发货信息。带<span class="red_clor">*</span>号为必填项。填完，请按确认提交按钮。</span></div>
    <div class="ser_txt">
      <p style="margin-left:60px;margin-bottom:18px;">收件人：
        <input type="text"  name="thconsignee" id="thconsignee" value="" />
        <span class="red_clor">*</span></p>
      <p style="margin-left:36px;margin-bottom:18px;">收件人电话：
        <input type="text" name="thconsigneemobile" id="thconsigneemobile" value="" />
        <span class="red_clor">*</span></p>
      <p style="margin-left:36px;margin-bottom:18px;">收件人地址：
        <input type="text"  name="thconsigneeaddress" id="thconsigneeaddress" value="" />
        <span class="red_clor">*</span></p>
      <p style="margin-left:60px;margin-bottom:18px;">运单号：
        <input type="text"  name="thcouriernumber" id="thcouriernumber" value="" />
        <span class="red_clor">*</span></p>
      <p style="margin-left:23px;">物流公司名称：
        <input type="text" id="kdgsname" name="kdgsname" value="" onclick="$('#wlgslb').show()" readonly="readonly"/>
        <input type="hidden" id="thkdgs" name="thkdgs" value="" />
        <span class="red_clor">*</span>
        <!-- 物流选择 -->
      <div class="c_round_gray" id="wlgslb" style="display: none;"><b class="xtop"><b class="xb1b"></b><b class="xb2b"></b><b class="xb3b"></b><b class="xb4b"></b></b>
        <div class="xboxcontent_b">
          <div class="divlist-new" id="choosecompany" style="display:block;">
            <div class="normal"><span class="stock">常用</span><span class="link-bluebg-normal">
              <p><strong><a href="#" onclick="AAA(this);traninput('ems');return false;">EMS</a></strong><strong><a href="#" onclick="AAA(this);traninput('shentong');return false;">申通</a></strong><strong><a href="#" onclick="AAA(this);traninput('yuantong');return false;">圆通</a></strong><strong><a href="#" onclick="AAA(this);traninput('zhongtong');return false;">中通</a></strong><strong><a href="#" onclick="AAA(this);traninput('huitongkuaidi');return false;">汇通</a></strong><strong><a href="#" onclick="AAA(this);traninput('ems');return false;">E邮宝</a></strong></p>
              <p><strong><a href="#" onclick="AAA(this);traninput('ups');return false;">UPS</a></strong><strong><a href="#" onclick="AAA(this);traninput('shunfeng');return false;">顺丰</a></strong><strong><a href="#" onclick="AAA(this);traninput('yunda');return false;">韵达</a></strong><strong><a href="#" onclick="AAA(this);traninput('tiantian');return false;">天天</a></strong><strong><a href="#" onclick="AAA(this);traninput('zhaijisong');return false;">宅急送</a></strong></p>
              </span></div>
            <div class="clear"></div>
            <div class="public-new">
              <ul>
                <li><b class="number">A</b><span class="link-bluebg"><a href="#" onclick="AAA(this);traninput('aae');return false;" class="a2">AAE</a><a href="#" onclick="AAA(this);traninput('anxindakuaixi');return false;" class="a3">安信达</a></span></li>
                <li><b class="number">B</b><span class="link-nobg"><a href="#" onclick="AAA(this);traninput('bht');return false;" class="a2">BHT</a><a href="#" onclick="AAA(this);traninput('baifudongfang');return false;" class="a4">百福东方</a></span></li>
                <li><b class="number">C</b><span class="link-bluebg"><a href="#" onclick="AAA(this);traninput('coe');return false;" class="a2">COE</a></span></li>
                <li><b class="number">D</b><span class="link-nobg"><a href="#" onclick="AAA(this);traninput('dhl');return false;" class="a2">DHL</a><a href="#" onclick="AAA(this);traninput('datianwuliu');return false;" class="a2">大田</a><a href="#" onclick="AAA(this);traninput('debangwuliu');return false;" class="a2">德邦</a></span></li>
                <li><b class="number">F</b><span class="link-bluebg"><a href="#" onclick="AAA(this);traninput('fedex');return false;" class="a2">FedEx</a><a href="#" onclick="AAA(this);traninput('feikangda');return false;" class="a3">飞康达</a></span></li>
                <li><b class="number">G</b><span class="link-nobg"><a href="#" onclick="AAA(this);traninput('guangdongyouzhengwuliu');return false;" class="a4">广东邮政</a><a href="#" onclick="AAA(this);traninput('ganzhongnengda');return false;" class="a4">能达速递</a><a href="#" onclick="AAA(this);traninput('youzhengguonei');return false;" class="a3">挂号信</a></span></li>
                <li><b class="number">J</b><span class="link-bluebg"><a href="#" onclick="AAA(this);traninput('jinguangsudikuaijian');return false;" class="a2">京广</a><a href="#" onclick="AAA(this);traninput('jiajiwuliu');return false;" class="a2">佳吉</a><a href="#" onclick="AAA(this);traninput('jiayiwuliu');return false;" class="a2">佳怡</a><a href="#" onclick="AAA(this);traninput('jixianda');return false;" class="a3">急先达</a></span></li>
                <li><b class="number">L</b><span class="link-nobg"><a href="#" onclick="AAA(this);traninput('longbanwuliu');return false;" class="a2">龙邦</a><a href="#" onclick="AAA(this);traninput('lianbangkuaidi');return false;" class="a4">联邦快递</a><a href="#" onclick="AAA(this);traninput('lianhaowuliu');return false;" class="a3">联昊通</a></span></li>
              </ul>
              <ul>
                <li><b class="number">Q</b><span class="link-bluebg"><a href="#" onclick="AAA(this);traninput('quanyikuaidi');return false;" class="a2">全一</a><a href="#" onclick="AAA(this);traninput('quanchenkuaidi');return false;" class="a2">全晨</a><a href="#" onclick="AAA(this);traninput('quanritongkuaidi');return false;" class="a3">全日通</a><a href="#" onclick="AAA(this);traninput('quanfengkuaidi');return false;" class="a3">全峰快递</a></span></li>
                <li><b class="number">S</b><span class="link-nobg"><a href="#" onclick="AAA(this);traninput('suer');return false;" class="a2">速尔</a><a href="#" onclick="AAA(this);traninput('shenghuiwuliu');return false;" class="a4">盛辉</a><a href="#" onclick="AAA(this);traninput('shentong');return false;" class="a5">申通E物流</a><a href="#" onclick="AAA(this);traninput('santaisudi');return false;" class="a4">三态</a></span></li>
                <li><b class="number">T</b><span class="link-bluebg"><a href="#" onclick="AAA(this);traninput('tnt');return false;" class="a2">TNT</a><a href="#" onclick="AAA(this);traninput('tiandihuayu');return false;" class="a4">天地华宇</a><a href="#" onclick="AAA(this);traninput('ems');return false;" class="a4">特快专递</a></span></li>
                <li><b class="number">X</b><span class="link-nobg"><a href="#" onclick="AAA(this);traninput('xinbangwuliu');return false;" class="a2">新邦</a><a href="#" onclick="AAA(this);traninput('xinfengwuliu');return false;" class="a2">信丰</a><a href="#" onclick="AAA(this);traninput('xinhongyukuaidi');return false;" class="a3">鑫飞鸿</a><a href="#" onclick="AAA(this);traninput('xingchengjibian');return false;" class="a4">星晨急便</a></span></li>
                <li><b class="number">Y</b><span class="link-bluebg"><a href="#" onclick="AAA(this);traninput('youshuwuliu');return false;" class="a2">优速</a><a href="#" onclick="AAA(this);traninput('yuntongkuaidi');return false;" class="a2">运通</a><a href="#" onclick="AAA(this);traninput('yuanweifeng');return false;" class="a3">源伟丰</a></span><b class="nonumber"></b><span class="link-nobg"><a href="#" onclick="AAA(this);traninput('yuanchengwuliu');return false;" class="a2">远成</a><a href="#" onclick="AAA(this);traninput('yuefengwuliu');return false;" class="a2">越丰</a><a href="#" onclick="AAA(this);traninput('yafengsudi');return false;" class="a2">亚风</a><a href="#" onclick="AAA(this);traninput('yuanzhijiecheng');return false;" class="a4">元智捷诚</a></span><b class="nonumber"></b><span class="link-bluebg"><a href="#" onclick="AAA(this);traninput('youzhengguonei');return false;" class="a1">邮政国内包裹</a><a href="#" onclick="AAA(this);traninput('ems');return false;" class="a4">邮政快递</a></span></li>
                <li><b class="number">Z</b><span class="link-nobg"><a href="#" onclick="AAA(this);traninput('zhongtiewuliu');return false;" class="a5">中铁快运</a><a href="#" onclick="AAA(this);traninput('zhongyouwuliu');return false;" class="a5">中邮物流</a></span></li>
              </ul>
            </div>
          </div>
        </div>
        <b class="xbottom"><b class="xb4b"></b><b class="xb3b"></b><b class="xb2b"></b><b class="xb1b"></b></b></div>
      <!-- 物流选择 over-->
      </p>
      <p>
        <input type="hidden" name="id" id="idid" value="" />
      </p>
      <p style="padding-left:133px;">
        <button class="OK_go_bt fl" onclick="PurchaserDelivery()">确认退货</button>
        <button class="OK_go_bt fl" onclick="ffxxClose()">取消</button>
      </p>
    </div>
  </div>
</div>

<script type="text/javascript">   	

 			function AAA(s){
	        	$("#kdgsname").val($(s).text());
	        	$('#wlgslb').hide();
        	}
        	function traninput(va){
        		$("#thkdgs").val(va);
        	}
            function ffxxShow(id){
            	$("#ffxx").show();
            	$("#idid").val(id);
            }
            function ffxxClose(){
            	$("#ffxx").hide();
            }    
            //退货
            function PurchaserDelivery(){
	            if($("#thconsignee").val()==''){
	            	alert('请填写收件人！');
	            	return;
	            }
	            if($("#thconsigneemobile").val()==''){
	            	alert('请填收件人电话！');
	            	return;
	            }
	            if($("#thconsigneeaddress").val()==''){
	            	alert('请填收件人地址！');
	            	return;
	            }
	            if($("#thcouriernumber").val()==''){
	            	alert('请填运单号！');
	            	return;
	            }
	            if($("#thkdgs").val()==''){
	            	alert('请选择快递公司！');
	            	return;
	            }
	             if(confirm('您确定要退货吗？')){
		             $.ajax({
				         type:'post',
				         url:'<c:url value='/BaiBao_PurchaserDelivery'/>?s='+Math.random(),
				         data: {id:$("#idid").val(),thconsignee:$("#thconsignee").val(),thconsigneemobile:$("#thconsigneemobile").val(),thconsigneeaddress:$("#thconsigneeaddress").val(),thkdgs:$("#thkdgs").val(),thcouriernumber:$("#thcouriernumber").val()},
				         success:function(data){
					         if(data=='0000'){
					         		location.reload();
					         }else{
					        	 alert(data);
					         }
				        }
				     });
		            }
            }
                   
            //买家取消订单
             function PurchaserCancelOrder(id){
	            if(confirm('您确定取消该交易吗？')){
	             $.ajax({
			         type:'post',
			         url:'<c:url value='/BaiBao_PurchaserCancelOrder'/>?s='+Math.random(),
			         data: {id:id},
			         success:function(data){
				         if(data=='0000'){
				         		location.reload();
				         }else{
				        	 alert(data);
				         }
			        }
			     });
	            }
            }
            
            
            //申请退货
             function UserReceiveResColl(id){
	            if(confirm('您确定申请退货吗？')){
	             $.ajax({
			         type:'post',
			         url:'<c:url value='/BaiBao_PurchaserReceiveResColl'/>?s='+Math.random(),
			         data: {id:id},
			         success:function(data){
				         if(data=='0000'){
				         		location.reload();
				         }else{
				        	 alert(data);
				         }
			        }
			     });
	            }
            }
            //买家确认收货
             function UserConfRes(id){
	            if(confirm('您确定收到货了吗？')){
	             $.ajax({
			         type:'post',
			         url:'<c:url value='/BaiBao_PurchaserConfReceived'/>?s='+Math.random(),
			         data: {id:id},
			         success:function(data){
				         if(data=='0000'){
				         		location.reload();
				         }else{
				        	 alert(data);
				         }
			        }
			     });
	            }
            }
              //买家延迟收货
             function Receive(id){
	            if(confirm('您确定延迟收货吗？')){
	             $.ajax({
			         type:'post',
			         url:'<c:url value='/BaiBao_PurchaserReceive'/>?s='+Math.random(),
			         data: {id:id},
			         success:function(data){
				         if(data=='0000'){
				         		location.reload();
				         }else{
				        	 alert(data);
				         }
			        }
			     });
	            }
            }
            //
            
            // 申请客服介入
              function Intervention(id){
	            if(confirm('您确定申请【百宝箱】介入吗？')){
	             $.ajax({
			         type:'post',
			         url:'<c:url value='/BaiBao_Intervention'/>?s='+Math.random(),
			         data: {id:id},
			         success:function(data){
				         if(data=='0000'){
				         		location.reload();
				         }else{
				        	 alert(data);
				         }
			        }
			     });
	            }
            }
           //支付验证
           function CheckPayTransfer(collid,id){
             $.ajax({
			         type:'post',
			         url:'<c:url value='/BaiBao_CheckPayTransfer'/>?s='+Math.random(),
			         data: {collectionid:collid},
			         success:function(data){
				         if(data=='0000'){
				         		window.location.href="<c:url value='/BaiBao_getTransfer'/>?id="+id;
				         }else{
				        	 alert(data);
				         }
			        }
			     });
            }
        </script>
        <script type="text/javascript">  
        	$(document).ready(function() {
           var urlsval = url_request("pager.offset");   // 获取 offset参数
           var urlsval2 = parseInt(urlsval/5)+1;
             $(".fanye_bbj>a").each(function(){
                if ($(this).text()==urlsval2) {
                     $(this).css("background-color","#c91818");
                     $(this).css("color","#fff");
                }
            });
});
           </script>
                      <!-- 买家提示内容 -->
    <div class="mm_tishi">
      <h4>
          <i></i>
        买家注意事项
        <a href="javascript:;" class="close-btn"></a> <!-- 关闭 -->
      </h4>
      <div class="shoper_rak">
        <p>买家在确认购买后，请在24小时内付款。超过24小时未付款，订单将自动取消。</p>
      </div>
      <div class="about_mor_dd">
        <span class="fl">咨询客服</span>
        <p class="fl" style="padding-top:4px;">
          <script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzgwMDA5ODc3Nl8xODM0NjhfODAwMDk4Nzc2Xw"></script>
        </p>
         
      </div>
    </div>
    <!-- 提示框关闭 -->
    <script type="text/javascript">
      $(function(){
        $(".close-btn").click(function(){
          $(".mm_tishi").css("display","none");
        })
      })
    </script>
<jsp:include page="../../foot/footer.jsp"></jsp:include>
</body>
</html>
