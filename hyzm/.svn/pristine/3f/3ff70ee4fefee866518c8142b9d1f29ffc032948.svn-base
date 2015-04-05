<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>我卖出的_百宝箱</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/shoper.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
	  <link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/version.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/slideshow.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
	<meta name=keywords content="百宝箱"/>
	<meta name=description content="华豫之门百宝箱"/>
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
    <div class="sell_cont">
     <jsp:include page="../common/myMenu.jsp"></jsp:include>
                                        <!-- 右部分 -->
          <div class="sel_main_rt">
            <h1>我卖出的藏品</h1>
            <div class="item-list">
              <div>
                <div class="item-thead">
                  <span class="order-sm01 gray_clor">藏品</span>
                  <span class="order-sm02 gray_clor">价格（元）</span>
                  <span class="order-sm03 gray_clor">买家</span>
                  <span class="order-sm04 gray_clor">交易状态</span>
                  <span class="order-sm05 gray_clor">实收（元）</span>
                </div>
                <div>
                  <table>
                     <c:forEach items="${list}" var="tra" varStatus="cdn">                    
                     <tr class="order-hd">
                      <td>
                        <div class="order-details">
                          <div class="order-bt">
                            <span>订单编号：${tra.ordernumber}</span>
<%--                            <span class="order-tim">成交时间：2014-06-04 11:38</span>--%>
                          </div>
                          <div class="order-sms">
                            <div class="order-pic fl">
                               <a target="_blank" href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${tra.collid}">
                                <img  src="http://116.255.149.172:7080/wswhly/Baibaourl//${fn:split(tra.imgurl,',')[0]}" alt="" />
                              </a>
                            </div>
                            <div class="fl order-sna">
                              <p class="shop_nm"><a target="_blank" href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${tra.collid}">${tra.name}</a></p>
                              <p>
                                <span class="gray_clor">商家编码</span>
                                <span class="gray_clor">${tra.baibaonum}</span>
                              </p>
                            </div>
                            <div class="fl order-sbox" style="border-left:1px solid #EEEEEE;">
                              <p>${tra.price}</p>
                            </div>
                            <div class="fl order-sbox">
                             <p>${tra.purchname}</p>
                              <p>手机号：${tra.purchmobile}</p>
                            </div>
                            <div class="fl order-sbox">
                              <c:if test="${tra.state==1}">等待支付</c:if>
                              <c:if test="${tra.state==2}">已支付等待发货 </c:if>
                              <c:if test="${tra.state==3}">已发货</c:if>
                              <c:if test="${tra.state==4}">已收货</c:if>
                              <c:if test="${tra.state==5}">平台已打款</c:if>
                              
                              <c:if test="${tra.state==100}">买家申请退货</c:if>
                              <c:if test="${tra.state==101}">同意退货</c:if>
                              <c:if test="${tra.state==102}">不同意退货</c:if>
                              <c:if test="${tra.state==103}">买家已发货</c:if>
                              <c:if test="${tra.state==104}">卖家已收货</c:if>
                              <c:if test="${tra.state==105}">退货完成</c:if>
                              
                              <c:if test="${tra.state==200}">卖家取消订单</c:if>
                              <c:if test="${tra.state==201}">买家取消订单</c:if>
                              <c:if test="${tra.state==202}">系统取消订单</c:if>
                               <p><a href="<c:url value='/BaiBao_getTransferDetail?id='/>${tra.id}" target="_blank">订单详情</a></p>
                              <p><a href="http://m.kuaidi100.com/index_all.html?type=${tra.kdgs}&postid=${tra.couriernumber}" target="_blank">物流信息</a></p>
                              <c:if test="${tra.sqkfjr==1}">买家已申请客服介入</c:if>
                            </div>
                            <div class="fl order-sbox ">
                               <p>${tra.price}</p>
                            </div>
                            <div class="fl order-price fahuo_btn">
                            <c:if test="${tra.state==2}">
                              <p><input type="button" value="发货" onclick="ffxxShow(${tra.id})" class="fh_btn"/></p>
                              <p><input type="button" value="取消订单" onclick="ShopCancelOrder(${tra.id})" class="fh_btn"/></p>
                            </c:if>
                             <c:if test="${tra.state==100}">
                              <p><input type="button" value="同意退货" onclick="ShopIsfRes(${tra.id},101)" class="fh_btn"/></p>
                               <p><input type="button" value="不同意退货" onclick="ShopIsfResN(${tra.id},102)" class="fh_btn"/></p>
                            </c:if>
                            <c:if test="${tra.state==103}">
                              <p><input type="button" value="确认收到退货" onclick="ShopConfRes(${tra.id})" class="fh_btn"/></p>
                            </c:if>
                            </div>
                          </div>
                        </div>
                      </td>
                    </tr>
                    </c:forEach>
                  </table>
                </div>
              </div>
				      <div class="fanye_bbj">
				        <pg:pager url="BaiBao_getShopSellerCenter" items="${count}" maxPageItems="5" maxIndexPages="5">
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
      </div>
    <div id="ffxx"   style="width:100%;height:100%;position:fixed;top:0;left:0;background-color: rgba(61, 67, 76, 0.7);display: none;z-index:2000;"> 
    	<!-- 发货弹出部分 -->
        <div class="curent_order_details fh_main_box" style="background:#fff;display:block;position:relative;margin:0 auto;top:28%;width:580px;">
            <div class="od_box_bt" style="margin-top:0;">
               <span style="margin-left:20px;" class="gray_clor">为了方便买家查询物流信息，请认真填写发货信息。带<span class="red_clor">*</span>号为必填项。填完，请按确认提交按钮。</span>
            </div>
            <div class="ser_txt">
              <p style="margin-left:36px;margin-bottom:18px;">
                运单号：
                <input type="text" onkeyup="this.value=this.value.replace(/[^\d]/g,'') " name="couriernumber" id="couriernumber" value="" />
                <span class="red_clor">*</span>
              </p>
              <p>
              	  物流公司名称：
                <input type="text" id="kdgsname" name="kdgsname" value="" onclick="$('#wlgslb').show()" readonly="readonly"/> <input type="hidden" id="kdgs" name="kdgs" value="" /> <span class="red_clor">*</span>
                 <!-- 物流选择 -->
 <div class="c_round_gray" id="wlgslb" style="display: none;"> <b class="xtop"><b class="xb1b"></b><b class="xb2b"></b><b class="xb3b"></b><b class="xb4b"></b></b>
      <div class="xboxcontent_b">
        <div class="divlist-new" id="choosecompany" style="display:block;">
          <div class="normal"> <span class="stock">常用</span> <span class="link-bluebg-normal">
            <p><strong><a href="#" onclick="AAA(this);traninput('ems');return false;">EMS</a></strong><strong><a href="#" onclick="AAA(this);traninput('shentong');return false;">申通</a></strong><strong><a href="#" onclick="AAA(this);traninput('yuantong');return false;">圆通</a></strong><strong><a href="#" onclick="AAA(this);traninput('zhongtong');return false;">中通</a></strong><strong><a href="#" onclick="AAA(this);traninput('huitongkuaidi');return false;">汇通</a></strong><strong><a href="#" onclick="AAA(this);traninput('ems');return false;">E邮宝</a></strong></p>
            <p><strong><a href="#" onclick="AAA(this);traninput('ups');return false;">UPS</a></strong><strong><a href="#" onclick="AAA(this);traninput('shunfeng');return false;">顺丰</a></strong><strong><a href="#" onclick="AAA(this);traninput('yunda');return false;">韵达</a></strong><strong><a href="#" onclick="AAA(this);traninput('tiantian');return false;">天天</a></strong><strong><a href="#" onclick="AAA(this);traninput('zhaijisong');return false;">宅急送</a></strong></p>
            </span> </div>
          <div class="clear"></div>
          <div class="public-new">
            <ul>
              <li> <b class="number">A</b> <span class="link-bluebg"><a href="#" onclick="AAA(this);traninput('aae');return false;" class="a2">AAE</a><a href="#" onclick="AAA(this);traninput('anxindakuaixi');return false;" class="a3">安信达</a></span> </li>
              <li> <b class="number">B</b> <span class="link-nobg"><a href="#" onclick="AAA(this);traninput('bht');return false;" class="a2">BHT</a><a href="#" onclick="AAA(this);traninput('baifudongfang');return false;" class="a4">百福东方</a></span> </li>
              <li> <b class="number">C</b> <span class="link-bluebg"><a href="#" onclick="AAA(this);traninput('coe');return false;" class="a2">COE</a></span> </li>
              <li> <b class="number">D</b> <span class="link-nobg"><a href="#" onclick="AAA(this);traninput('dhl');return false;" class="a2">DHL</a><a href="#" onclick="AAA(this);traninput('datianwuliu');return false;" class="a2">大田</a><a href="#" onclick="AAA(this);traninput('debangwuliu');return false;" class="a2">德邦</a></span> </li>
              <li> <b class="number">F</b> <span class="link-bluebg"><a href="#" onclick="AAA(this);traninput('fedex');return false;" class="a2">FedEx</a><a href="#" onclick="AAA(this);traninput('feikangda');return false;" class="a3">飞康达</a></span> </li>
              <li> <b class="number">G</b> <span class="link-nobg"><a href="#" onclick="AAA(this);traninput('guangdongyouzhengwuliu');return false;" class="a4">广东邮政</a><a href="#" onclick="AAA(this);traninput('ganzhongnengda');return false;" class="a4">能达速递</a><a href="#" onclick="AAA(this);traninput('youzhengguonei');return false;" class="a3">挂号信</a></span> </li>
              <li> <b class="number">J</b> <span class="link-bluebg"><a href="#" onclick="AAA(this);traninput('jinguangsudikuaijian');return false;" class="a2">京广</a><a href="#" onclick="AAA(this);traninput('jiajiwuliu');return false;" class="a2">佳吉</a><a href="#" onclick="AAA(this);traninput('jiayiwuliu');return false;" class="a2">佳怡</a><a href="#" onclick="AAA(this);traninput('jixianda');return false;" class="a3">急先达</a></span> </li>
              <li> <b class="number">L</b> <span class="link-nobg"><a href="#" onclick="AAA(this);traninput('longbanwuliu');return false;" class="a2">龙邦</a><a href="#" onclick="AAA(this);traninput('lianbangkuaidi');return false;" class="a4">联邦快递</a><a href="#" onclick="AAA(this);traninput('lianhaowuliu');return false;" class="a3">联昊通</a></span> </li>
            </ul>
            <ul>
              <li> <b class="number">Q</b> <span class="link-bluebg"> <a href="#" onclick="AAA(this);traninput('quanyikuaidi');return false;" class="a2">全一</a><a href="#" onclick="AAA(this);traninput('quanchenkuaidi');return false;" class="a2">全晨</a><a href="#" onclick="AAA(this);traninput('quanritongkuaidi');return false;" class="a3">全日通</a><a href="#" onclick="AAA(this);traninput('quanfengkuaidi');return false;" class="a3">全峰快递</a></span> </li>
              <li> <b class="number">S</b> <span class="link-nobg"><a href="#" onclick="AAA(this);traninput('suer');return false;" class="a2">速尔</a><a href="#" onclick="AAA(this);traninput('shenghuiwuliu');return false;" class="a4">盛辉</a><a href="#" onclick="AAA(this);traninput('shentong');return false;" class="a5">申通E物流</a><a href="#" onclick="AAA(this);traninput('santaisudi');return false;" class="a4">三态</a></span> </li>
              <li> <b class="number">T</b> <span class="link-bluebg"><a href="#" onclick="AAA(this);traninput('tnt');return false;" class="a2">TNT</a><a href="#" onclick="AAA(this);traninput('tiandihuayu');return false;" class="a4">天地华宇</a><a href="#" onclick="AAA(this);traninput('ems');return false;" class="a4">特快专递</a></span> </li>
              <li> <b class="number">X</b> <span class="link-nobg"><a href="#" onclick="AAA(this);traninput('xinbangwuliu');return false;" class="a2">新邦</a><a href="#" onclick="AAA(this);traninput('xinfengwuliu');return false;" class="a2">信丰</a><a href="#" onclick="AAA(this);traninput('xinhongyukuaidi');return false;" class="a3">鑫飞鸿</a><a href="#" onclick="AAA(this);traninput('xingchengjibian');return false;" class="a4">星晨急便</a></span> </li>
              <li> <b class="number">Y</b> <span class="link-bluebg"><a href="#" onclick="AAA(this);traninput('youshuwuliu');return false;" class="a2">优速</a><a href="#" onclick="AAA(this);traninput('yuntongkuaidi');return false;" class="a2">运通</a><a href="#" onclick="AAA(this);traninput('yuanweifeng');return false;" class="a3">源伟丰</a></span><b class="nonumber"></b> <span class="link-nobg"><a href="#" onclick="AAA(this);traninput('yuanchengwuliu');return false;" class="a2">远成</a><a href="#" onclick="AAA(this);traninput('yuefengwuliu');return false;" class="a2">越丰</a><a href="#" onclick="AAA(this);traninput('yafengsudi');return false;" class="a2">亚风</a><a href="#" onclick="AAA(this);traninput('yuanzhijiecheng');return false;" class="a4">元智捷诚</a></span><b class="nonumber"></b><span class="link-bluebg"><a href="#" onclick="AAA(this);traninput('youzhengguonei');return false;" class="a1">邮政国内包裹</a><a href="#" onclick="AAA(this);traninput('ems');return false;" class="a4">邮政快递</a></span></li>
              <li> <b class="number">Z</b> <span class="link-nobg"><a href="#" onclick="AAA(this);traninput('zhongtiewuliu');return false;" class="a5">中铁快运</a><a href="#" onclick="AAA(this);traninput('zhongyouwuliu');return false;" class="a5">中邮物流</a></span> </li>
            </ul>
          </div>
        </div>
      </div>
      <b class="xbottom"><b class="xb4b"></b><b class="xb3b"></b><b class="xb2b"></b><b class="xb1b"></b></b> </div>
                <!-- 物流选择 over-->
              </p>
              <p><input type="hidden" name="id" id="idid" value="" /></p>
              <p style="padding-left:100px;">
              	<button class="OK_go_bt fl" onclick="ShopDelivery()">确认发货</button>
              	<button class="OK_go_bt fl" onclick="ffxxClose()">取消</button>
              </p>
            </div>
        </div>
        <!-- 发货按钮控制 特效-->
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
        	function AAA(s){
        	$("#kdgsname").val($(s).text());
        	$('#wlgslb').hide();
        	}
        	function traninput(va){
        		$("#kdgs").val(va);
        	}
            function ffxxShow(id){
            	$("#ffxx").show();
            	$("#idid").val(id);
            }
            function ffxxClose(){
            	$("#ffxx").hide();
            }
            //发货
            function ShopDelivery(){
            if($("#couriernumber").val()==''){
            	alert('请填写运单号！');
            	return;
            }
             if($("#kdgs").val()==''){
            	alert('请选择快递公司！');
            	return;
            }
		         $.ajax({
			         type:'post',
			         url:'<c:url value='/BaiBao_ShopDelivery'/>?s='+Math.random(),
			         data: {id:$("#idid").val(), couriernumber:$("#couriernumber").val(), kdgs:$("#kdgs").val()},
			         success:function(data){
				         if(data=='0000'){
				         		location.reload();
				         }else{
				        	 alert(data);
				         }
			        }
			     });
            }
            
            //卖家取消订单
            function ShopCancelOrder(id){
	            if(confirm('您确定取消该交易吗？')){
	             $.ajax({
			         type:'post',
			         url:'<c:url value='/BaiBao_ShopCancelOrder'/>?s='+Math.random(),
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
            
            //卖家同意退货
             function ShopIsfRes(id,state){
	            if(confirm('您确定同意退货吗？')){
	             $.ajax({
			         type:'post',
			         url:'<c:url value='/BaiBao_ShopIsfRes'/>?s='+Math.random(),
			         data: {id:id,state:state},
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
             //卖家不同意退货
             function ShopIsfResN(id,state){
	            if(confirm('您确定不同意退货吗？')){
	             $.ajax({
			         type:'post',
			         url:'<c:url value='/BaiBao_ShopIsfRes'/>?s='+Math.random(),
			         data: {id:id,state:state},
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
            
            //卖家确认收到退货
             function ShopConfRes(id){
	            if(confirm('您确定收到退货了吗？')){
	             $.ajax({
			         type:'post',
			         url:'<c:url value='/BaiBao_ShopConfRes'/>?s='+Math.random(),
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
            
            // 申请客服介入
            
        </script>
        <!-- 发货弹出部分-over -->
        
    </div>
                           <!-- 卖家提示内容 -->
    <div class="mm_tishi">
      <h4>
          <i></i>
        卖家注意事项
        <a href="javascript:;"  class="close-btn"></a> <!-- 关闭 -->
      </h4>
      <div class="shoper_rak">
        <p>在买家付款之后，卖家接到通知后，请在2天内发货，2天以上5天以内发货每天将扣除滞纳金1%。</p>
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
