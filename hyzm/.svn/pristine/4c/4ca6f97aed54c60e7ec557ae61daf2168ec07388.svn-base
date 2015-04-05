<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  <title>确认订单信息</title>
  <meta http-equiv="pragma" content="no-cache"/>
  <meta http-equiv="cache-control" content="no-cache"/>
  <meta http-equiv="expires" content="0"/>
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
  <meta http-equiv="description" content="This is my page"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/mallConfirmOrder.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
  <script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/slideshow.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/baibao/mallConfirmOrder.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  <meta name=keywords content="百宝箱"/>
  <meta name=description content="华豫之门百宝箱"/>

  <script type="text/javascript">
  	function addTransferUser(){
  	  if($("#consignee").val()==''){
          alert('请填写收件人姓名！');
          return ;
            }
       if($("#consigneemobile").val()==''){
          alert('请填写收件人电话！');
          return ;
            }
        if($("#consigneeaddress").val()==''){
          alert('请填写收件人地址！');
          return ;
            }
     $.ajax({
		type:'post',
		url:"<c:url value='/BaiBao_PayTransfer'/>?s="+Math.random(),
		data: {id:${item.id}, collectionid:${item.collid}, consignee:$('#consignee').val(), consigneeaddress:$('#consigneeaddress').val(), consigneemobile:$('#consigneemobile').val()},
		 success:function(data){
	        if(data =='0000'){
	          window.location.href="<c:url value='/BaiBao_getUserSellerCenter'/>";
	        }else{
	        	alert(data);
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
    <div id="mallMainC" class="clearfix">
      <ul id="addressUl">
        <li style="display:none"></li>
      </ul>
      <div id='creatAddress'>
        <h4 class="F16">填写收货信息</h4>
        <p class=' F14 clearfix'>
          <label>收件人姓名：
            <input type="text" type="text" name="consignee" id="consignee"  maxlength="40"/>
          </label>
          <label>收件人电话：
            <input type="text" type="text" name="consigneemobile" id="consigneemobile"  maxlength="11"/>
          </label>
        </p>
        <p class=' F14 address clearfix'>
          <label><span class='FL'>收货地址：</span>
            <textarea class='FL' id='consigneeaddress' name='consigneeaddress'></textarea>
          </label>
        </p>
        <p class=" F14 button clearfix">
          <input type="button" value="确定" class="jsBtn POINTER" id="beCreat" />
          <input type="button" value="取消" class="jsBtn POINTER" id="cancelCreat"/>
        </p>
      </div>
      <div class="orderinfoWrap clearfix">
        <h3 class="F16 clearfix"><strong>确认订单信息</strong></h3>
        <div class="sellerInfo">
          <p class="F14"><strong>卖家信息</strong></p>
          <p><span>店铺：<a href="<c:url value='/BaiBao_getShop?redirect=/baibaojie/seller&id='/>${item.shopid}">${item.shopname}</a></span><span>卖家：<a href="javascript:;">${item.shopusername}</a></span></p>
          <p>联系方式：<a href="javascript:;">${item.mobile}</a></p>
          <p>订单编号：<a href="javascript:;">${item.ordernumber}</a></p>
        </div>
        <table width="90%" border="0" cellspacing="0" cellpadding="0" id="orderTable">
          <tr class="thead F14 TAC">
            <td width="50%">藏品</td>
            <td width="25%">价格（元）</td>
          </tr>
          <tr class="tbody F14 TAC">
            <td class="tdGoods F12"><div class="goodsPic FL"><a href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${item.collid}" target="_blank" class="DB"><img src="http://116.255.149.172:7080/wswhly/Baibaourl/${fn:split(item.imgurl,',')[0]}" width="50" height="50"></a></div>
              <div class="goodsWord FL"><a href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${item.collid}" target="_blank">${item.name}</a></div></td>
            <td>${item.price}</td>
          </tr>
        </table>
        <table width="400" border="0" cellspacing="0" cellpadding="0" class="priceTable FR">
          <tr>
            <td style="text-align:right" width="50%" class="FFY">实付款：</td>
            <td width="50%"><span class="totalPrice">￥<b>${item.price}</b></span></td>
          </tr>
          <tr>
            <td style="text-align:right" class="FFY">账户可用余额：</td>
            <td><span class="balance">￥<b>${yemoney}</b></span></td>
          </tr>
          <tr>
            <td colspan="2"><input type="button"  id="submitOrders" value="确认支付" onclick="addTransferUser()" class="F16 WHITE POINTER DB"/></td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</div>
</div>
</div>
<jsp:include page="../../foot/footer.jsp"></jsp:include>

</body>
</html>
