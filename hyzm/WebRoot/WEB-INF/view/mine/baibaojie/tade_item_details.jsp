<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>交易详情_卫视文化乐园-华豫之门官方网站</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/shoper.css'/>"/>
	 <link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/slideshow.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<meta name=keywords content="交易详情">
	<meta name=description content="华豫之门百宝箱藏品交易详情">
  </head>

  <body>
  <jsp:include page="../../head/header.jsp"></jsp:include>
    <div class="sell_cont">
    <jsp:include page="../../mine/common/myMenu.jsp"></jsp:include>
     <div class="fr" style="margin-top:20px;">
    <div class="crumbs">
        <span>您的位置：</span>
      <a href="<c:url value='/index'/>" class="gray_clor">首页</a><span>&gt;</span>
      <a href="<c:url value='/user/UserCenter'/>" class="gray_clor">会员中心</a><span>&gt;</span>
         <span class="gray_clor">订单详情</span>
      </div>
      <div class="curent_order_details" style="width:858px;">
        <div style="color:#A00104;line-height:28px;height:28px;border-bottom:1px solid #ccc;margin-bottom:8px;">
          <p class="fl" style="font-size:16px;font-weight:700;">订单状态：  <c:if test="${transfermap.state==1}">等待支付</c:if>
                              <c:if test="${transfermap.state==2}">已支付等待发货 </c:if>
                              <c:if test="${transfermap.state==3}">已发货</c:if>
                              <c:if test="${transfermap.state==4}">已收货</c:if>
                              <c:if test="${transfermap.state==5}">平台已打款</c:if>
                              
                              <c:if test="${transfermap.state==100}">买家申请退货</c:if>
                              <c:if test="${transfermap.state==101}">同意退货</c:if>
                              <c:if test="${transfermap.state==102}">不同意退货</c:if>
                              <c:if test="${transfermap.state==103}">买家已发货</c:if>
                              <c:if test="${transfermap.state==104}">卖家已收货</c:if>
                              <c:if test="${transfermap.state==105}">退货完成</c:if>
                              
                              <c:if test="${transfermap.state==200}">卖家取消订单</c:if>
                              <c:if test="${transfermap.state==201}">买家取消订单</c:if>
                              <c:if test="${transfermap.state==202}">系统取消订单</c:if>
                          
                              </p>
                  <!-- 倒计时代码 -->
                  <div id="CountMsg" class="HotDate fr" style="color:#FF0000;">
                  <c:if test="${transfermap.state==3}">
                  <span >系统将在：</span>
                  <span id="t_d">00</span>天
                  <span id="t_h">00</span>时
                  <span id="t_m">00</span>分
                  <span id="t_s">00</span>秒
                  <span>后自动确认收货</span>
                  </c:if>
              </div>
        </div>
          
             <ul  style="overflow:hidden;clear:both;">
              <li style="font-size:14px;line-height:28px;" class="gray_clor">
               生成时间：${transfermap.sfstarttime}
              </li>
              <li style="font-size:14px;line-height:28px;" class="gray_clor">
                支付时间：${transfermap.sfpaytime}
              </li>
              <li style="font-size:14px;line-height:28px;"  class="gray_clor">
                发货时间：${transfermap.sfdeliverytime}
              </li>
               <li style="font-size:14px;line-height:28px;" class="gray_clor">
                <c:if test="${transfermap.state==3}">收货时间：${transfermap.sfreceivetime}(系统自动确认收货时间,到时间系统自动确认收货！)</c:if>
                <c:if test="${transfermap.state!=3}">收货时间：${transfermap.sfreceivetime}</c:if>
              </li>
              <li style="font-size:14px;line-height:28px;" class="gray_clor">
                退货发货时间：${transfermap.sfthfhtime}
              </li>
               <li style="font-size:14px;line-height:28px;" class="gray_clor">
                确认收到退货时间：${transfermap.sfthmjqrtime}
              </li>
              <li>
                  
              </li>
             </ul>
      </div>
       <c:if test="${transfermap.state==3}">
	      <!-- JS倒计时 -->
	      
	      <script type="text/javascript">
	      $(function(){
	countDown("${transfermap.nowtime}","${transfermap.receivetime}","#colockbox1");
});
function countDown(now,time,id){
	var day_elem = $("#t_d");
	var hour_elem = $("#t_h");
	var minute_elem = $("#t_m");
	var second_elem = $("#t_s");
	var end_time = new Date(time).getTime();//月份是实际月份-1
	var now_time=new Date(now).getTime();
	sys_second = (end_time-now_time)/1000;
	var timer = setInterval(function(){
		if (sys_second > 1) {
			sys_second -= 1;
			var day = Math.floor((sys_second / 3600) / 24);
			var hour = Math.floor((sys_second / 3600) % 24);
			var minute = Math.floor((sys_second / 60) % 60);
			var second = Math.floor(sys_second % 60);
			day_elem && $(day_elem).text(day);//计算天
			$(hour_elem).text(hour<10?"0"+hour:hour);//计算小时
			$(minute_elem).text(minute<10?"0"+minute:minute);//计算分钟
			$(second_elem).text(second<10?"0"+second:second);//计算秒杀
		} else { 
			clearInterval(timer);
		}
	}, 1000);
}
	    </script>
	    <!-- JS倒计时-over -->
    </c:if>
    
        <div class="order-detail" style="margin-top:20px;width:858px;">
          <div style="line-height:40px;font-size:20px;height:40px;border-bottom:1px solid #ccc;margin-bottom:16px;color:#A00104;">
          <b>发货订单信息和物流信息</b>
        </div>
            <ul>
              <li style="font-size:14px;">
                <b>买家信息</b>
              </li>
              <li>
                  <span class="gray_clor">收件人：</span>
                  <span>${transfermap.consignee}</span>
                  <span style="margin-left:100px;" class="gray_clor">收件人地址：</span>
                  <span>${transfermap.consigneeaddress}</span>
              </li>
              <li>
                  <span class="gray_clor">收件人电话：</span>
                  <span>${transfermap.consigneemobile}</span>
              </li>
            </ul>
            <table>
                    <tr class="order-hd">
                      <td>
                        <div class="order-details" style="margin:0 152px;">
                          <div class="order-bt">
                            <span class="mar01" style="width:279px;">藏品</span>
                             <span class="mar03">状态</span>
                            <span class="mar04">价格</span>
                          </div>
                          <div class="order-sms">
                            <div class="order-pic fl">
                              <a target="_blank" href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${transfermap.collid}">
                                <img  src="http://116.255.149.172:7080/wswhly/Baibaourl//${fn:split(transfermap.imgurl,',')[0]}" alt="" />
                              </a>
                            </div>
                            <div class="fl order-sna">
                              <p class="shop_nm" style="padding-top:28px;"><a target="_blank" href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${transfermap.collid}">${transfermap.name}</a></p>
                            </div>
                            <div class="fl order-sbox" style="padding-top:45px;height:73px;width:125px;border-left:1px solid #EEEEEE;">
                              <p><c:if test="${transfermap.state==1}">等待支付</c:if>
                              <c:if test="${transfermap.state==2}">已支付等待发货 </c:if>
                              <c:if test="${transfermap.state==3}">已发货</c:if>
                              <c:if test="${transfermap.state==4}">已收货</c:if>
                              <c:if test="${transfermap.state==5}">平台已打款</c:if>
                              
                              <c:if test="${transfermap.state==100}">买家申请退货</c:if>
                              <c:if test="${transfermap.state==101}">同意退货</c:if>
                              <c:if test="${transfermap.state==102}">不同意退货</c:if>
                              <c:if test="${transfermap.state==103}">买家已发货</c:if>
                              <c:if test="${transfermap.state==104}">卖家已收货</c:if>
                              <c:if test="${transfermap.state==105}">退货完成</c:if>
                              
                              <c:if test="${transfermap.state==200}">卖家取消订单</c:if>
                              <c:if test="${transfermap.state==201}">买家取消订单</c:if>
                              <c:if test="${transfermap.state==202}">系统取消订单</c:if></p>
                            </div>
                            <div class="fl order-sbox " style="padding-top:45px;height:73px;border-right:0;width:125px;">
                              <p>${transfermap.price}</p>
                            </div>
                          </div>
                        </div>
                      </td>
                    </tr>
            </table>
            <div class="order-ric">
              <p class="fl">
                <span class="gray_clor">订单编号：</span>
                <span>${transfermap.ordernumber}</span>
              </p>
                
<%--                 <p class="fr">--%>
<%--                   <span>实收款：</span>--%>
<%--                  <span class="red_clor" style="font-size:16px;"><b>${transfermap.price}</b></span>--%>
<%--                  <span>元</span>--%>
<%--                 </p>--%>
            </div>
            <ul>
              <li style="margin-top:10px;font-size:14px;" class="gray_clor">
                <b>物流信息</b>
              </li>
              <li>
                  <span class="gray_clor">物流公司名称：</span>
                  <span><c:if test="${transfermap.kdgs=='aae'}">aae全球专递</c:if>
						<c:if test="${transfermap.kdgs=='anjie'}">安捷快递</c:if>
						<c:if test="${transfermap.kdgs=='anxindakuaixi'}">安信达快递</c:if>
						<c:if test="${transfermap.kdgs=='biaojikuaidi'}">彪记快递</c:if>
						<c:if test="${transfermap.kdgs=='bht'}">bht</c:if>
						<c:if test="${transfermap.kdgs=='baifudongfang'}">百福东方国际物流</c:if>
						<c:if test="${transfermap.kdgs=='coe'}">中国东方（COE）</c:if>
						<c:if test="${transfermap.kdgs=='changyuwuliu'}">长宇物流</c:if>
						<c:if test="${transfermap.kdgs=='datianwuliu'}">大田物流</c:if>
						<c:if test="${transfermap.kdgs=='debangwuliu'}">德邦物流</c:if>
						<c:if test="${transfermap.kdgs=='dhl'}">dhl</c:if>
						<c:if test="${transfermap.kdgs=='dpex'}">dpex</c:if>
						<c:if test="${transfermap.kdgs=='dsukuaidi'}">d速快递</c:if>
						<c:if test="${transfermap.kdgs=='disifang'}">递四方</c:if>
						<c:if test="${transfermap.kdgs=='ems'}">ems快递</c:if>
						<c:if test="${transfermap.kdgs=='fedex'}">fedex（国外）</c:if>
						<c:if test="${transfermap.kdgs=='feikangda'}">飞康达物流</c:if>
						<c:if test="${transfermap.kdgs=='fenghuangkuaidi'}">凤凰快递</c:if>
						<c:if test="${transfermap.kdgs=='feikuaida'}">飞快达</c:if>
						<c:if test="${transfermap.kdgs=='guotongkuaidi'}">国通快递</c:if>
						<c:if test="${transfermap.kdgs=='ganzhongnengda'}">港中能达物流</c:if>
						<c:if test="${transfermap.kdgs=='guangdongyouzhengwuliu'}">广东邮政物流</c:if>
						<c:if test="${transfermap.kdgs=='gongsuda'}">共速达</c:if>
						<c:if test="${transfermap.kdgs=='huitongkuaidi'}">汇通快运</c:if>
						<c:if test="${transfermap.kdgs=='hengluwuliu'}">恒路物流</c:if>
						<c:if test="${transfermap.kdgs=='huaxialongwuliu'}">华夏龙物流</c:if>
						<c:if test="${transfermap.kdgs=='haihongwangsong'}">海红</c:if>
						<c:if test="${transfermap.kdgs=='haiwaihuanqiu'}">海外环球</c:if>
						<c:if test="${transfermap.kdgs=='jiayiwuliu'}">佳怡物流</c:if>
						<c:if test="${transfermap.kdgs=='jinguangsudikuaijian'}">京广速递</c:if>
						<c:if test="${transfermap.kdgs=='jixianda'}">急先达</c:if>
						<c:if test="${transfermap.kdgs=='jjwl'}">佳吉物流</c:if>
						<c:if test="${transfermap.kdgs=='jymwl'}">加运美物流</c:if>
						<c:if test="${transfermap.kdgs=='jindawuliu'}">金大物流</c:if>
						<c:if test="${transfermap.kdgs=='jialidatong'}">嘉里大通</c:if>
						<c:if test="${transfermap.kdgs=='jykd'}">晋越快递</c:if>
						<c:if test="${transfermap.kdgs=='kuaijiesudi'}">快捷速递</c:if>
						<c:if test="${transfermap.kdgs=='lianb'}">联邦快递（国内）</c:if>
						<c:if test="${transfermap.kdgs=='lianhaowuliu'}">联昊通物流</c:if>
						<c:if test="${transfermap.kdgs=='longbanwuliu'}">龙邦物流</c:if>
						<c:if test="${transfermap.kdgs=='lijisong'}">立即送</c:if>
						<c:if test="${transfermap.kdgs=='lejiedi'}">乐捷递</c:if>
						<c:if test="${transfermap.kdgs=='minghangkuaidi'}">民航快递</c:if>
						<c:if test="${transfermap.kdgs=='meiguokuaidi'}">美国快递</c:if>
						<c:if test="${transfermap.kdgs=='menduimen'}">门对门</c:if>
						<c:if test="${transfermap.kdgs=='ocs'}">OCS</c:if>
						<c:if test="${transfermap.kdgs=='peisihuoyunkuaidi'}">配思货运</c:if>
						<c:if test="${transfermap.kdgs=='quanchenkuaidi'}">全晨快递</c:if>
						<c:if test="${transfermap.kdgs=='quanfengkuaidi'}">全峰快递</c:if>
						<c:if test="${transfermap.kdgs=='quanjitong'}">全际通物流</c:if>
						<c:if test="${transfermap.kdgs=='quanritongkuaidi'}">全日通快递</c:if>
						<c:if test="${transfermap.kdgs=='quanyikuaidi'}">全一快递</c:if>
						<c:if test="${transfermap.kdgs=='rufengda'}">如风达</c:if>
						<c:if test="${transfermap.kdgs=='santaisudi'}">三态速递</c:if>
						<c:if test="${transfermap.kdgs=='shenghuiwuliu'}">盛辉物流</c:if>
						<c:if test="${transfermap.kdgs=='shentong'}">申通</c:if>
						<c:if test="${transfermap.kdgs=='shunfeng'}">顺丰</c:if>
						<c:if test="${transfermap.kdgs=='sue'}">速尔物流</c:if>
						<c:if test="${transfermap.kdgs=='shengfeng'}">盛丰物流</c:if>
						<c:if test="${transfermap.kdgs=='saiaodi'}">赛澳递</c:if>
						<c:if test="${transfermap.kdgs=='tiandihuayu'}">天地华宇</c:if>
						<c:if test="${transfermap.kdgs=='tiantian'}">天天快递</c:if>
						<c:if test="${transfermap.kdgs=='tnt'}">tnt</c:if>
						<c:if test="${transfermap.kdgs=='ups'}">ups</c:if>
						<c:if test="${transfermap.kdgs=='wanjiawuliu'}">万家物流</c:if>
						<c:if test="${transfermap.kdgs=='wenjiesudi'}">文捷航空速递</c:if>
						<c:if test="${transfermap.kdgs=='wuyuan'}">伍圆</c:if>
						<c:if test="${transfermap.kdgs=='wxwl'}">万象物流</c:if>
						<c:if test="${transfermap.kdgs=='xinbangwuliu'}">新邦物流</c:if>
						<c:if test="${transfermap.kdgs=='xinfengwuliu'}">信丰物流</c:if>
						<c:if test="${transfermap.kdgs=='yafengsudi'}">亚风速递</c:if>
						<c:if test="${transfermap.kdgs=='yibangwuliu'}">一邦速递</c:if>
						<c:if test="${transfermap.kdgs=='youshuwuliu'}">优速物流</c:if>
						<c:if test="${transfermap.kdgs=='youzhengguonei'}">邮政包裹挂号信</c:if>
						<c:if test="${transfermap.kdgs=='youzhengguoji'}">邮政国际包裹挂号信</c:if>
						<c:if test="${transfermap.kdgs=='yuanchengwuliu'}">远成物流</c:if>
						<c:if test="${transfermap.kdgs=='yuantong'}">圆通速递</c:if>
						<c:if test="${transfermap.kdgs=='yuanweifeng'}">源伟丰快递</c:if>
						<c:if test="${transfermap.kdgs=='yuanzhijiecheng'}">元智捷诚快递</c:if>
						<c:if test="${transfermap.kdgs=='yunda'}">韵达快运</c:if>
						<c:if test="${transfermap.kdgs=='yuntongkuaidi'}">运通快递</c:if>
						<c:if test="${transfermap.kdgs=='yuefengwuliu'}">越丰物流</c:if>
						<c:if test="${transfermap.kdgs=='yad'}">源安达</c:if>
						<c:if test="${transfermap.kdgs=='yinjiesudi'}">银捷速递</c:if>
						<c:if test="${transfermap.kdgs=='zhaijisong'}">宅急送</c:if>
						<c:if test="${transfermap.kdgs=='zhongtiekuaiyun'}">中铁快运</c:if>
						<c:if test="${transfermap.kdgs=='zhongtong'}">中通速递</c:if>
						<c:if test="${transfermap.kdgs=='zhongyouwuliu'}">中邮物流</c:if>
						<c:if test="${transfermap.kdgs=='zhongxinda'}">忠信达</c:if>
						<c:if test="${transfermap.kdgs=='zhimakaimen'}">芝麻开门</c:if>
						</span>
              </li>
              <li>
                <span class="gray_clor">运单号：</span>
                <span>${transfermap.couriernumber}</span>
              </li>
              <li>
                <span><a href="http://m.kuaidi100.com/index_all.html?type=${transfermap.kdgs}&postid=${transfermap.couriernumber}" style="color:#3385FF;" target="_blank">查询物流信息</a></span>
                <c:if test="${transfermap.couriernumber!=null&&transfermap.couriernumber!=''}">
<%--                <iframe width="100%" height="250px" src="http://m.kuaidi100.com/index_all.html?type=${transfermap.kdgs}&postid=${transfermap.couriernumber}"></iframe>--%>
                </c:if>
              </li>
            </ul>
        </div>
        
        <div class="order-detail" style="margin-top:20px;width:858px;">
          <div style="line-height:40px;font-size:20px;height:40px;border-bottom:1px solid #ccc;margin-bottom:16px;color:#A00104;">
          <b>退货物流信息</b>
        </div>
            <ul>
              <li style="font-size:14px;" class="gray_clor">
                <b>买家信息</b>
              </li>
              <li>
                  <span class="gray_clor">收件人：</span>
                  <span>${transfermap.thconsignee}</span>
                  <span style="margin-left:100px;" class="gray_clor">收件人地址：</span>
                  <span>${transfermap.thconsigneeaddress}</span>
              </li>
              <li>
                  <span class="gray_clor">收件人电话：</span>
                  <span>${transfermap.thconsigneemobile}</span>
              </li>
            </ul>
            <ul>
              <li style="margin-top:10px;font-size:14px;">
                <b>物流信息</b>
              </li>
              <li>
                  <span class="gray_clor">物流公司名称：</span>
                  <span><c:if test="${transfermap.kdgs=='aae'}">aae全球专递</c:if>
						<c:if test="${transfermap.thkdgs=='anjie'}">安捷快递</c:if>
						<c:if test="${transfermap.thkdgs=='anxindakuaixi'}">安信达快递</c:if>
						<c:if test="${transfermap.thkdgs=='biaojikuaidi'}">彪记快递</c:if>
						<c:if test="${transfermap.thkdgs=='bht'}">bht</c:if>
						<c:if test="${transfermap.thkdgs=='baifudongfang'}">百福东方国际物流</c:if>
						<c:if test="${transfermap.thkdgs=='coe'}">中国东方（COE）</c:if>
						<c:if test="${transfermap.thkdgs=='changyuwuliu'}">长宇物流</c:if>
						<c:if test="${transfermap.thkdgs=='datianwuliu'}">大田物流</c:if>
						<c:if test="${transfermap.thkdgs=='debangwuliu'}">德邦物流</c:if>
						<c:if test="${transfermap.thkdgs=='dhl'}">dhl</c:if>
						<c:if test="${transfermap.thkdgs=='dpex'}">dpex</c:if>
						<c:if test="${transfermap.thkdgs=='dsukuaidi'}">d速快递</c:if>
						<c:if test="${transfermap.thkdgs=='disifang'}">递四方</c:if>
						<c:if test="${transfermap.thkdgs=='ems'}">ems快递</c:if>
						<c:if test="${transfermap.thkdgs=='fedex'}">fedex（国外）</c:if>
						<c:if test="${transfermap.thkdgs=='feikangda'}">飞康达物流</c:if>
						<c:if test="${transfermap.thkdgs=='fenghuangkuaidi'}">凤凰快递</c:if>
						<c:if test="${transfermap.thkdgs=='feikuaida'}">飞快达</c:if>
						<c:if test="${transfermap.thkdgs=='guotongkuaidi'}">国通快递</c:if>
						<c:if test="${transfermap.thkdgs=='ganzhongnengda'}">港中能达物流</c:if>
						<c:if test="${transfermap.thkdgs=='guangdongyouzhengwuliu'}">广东邮政物流</c:if>
						<c:if test="${transfermap.thkdgs=='gongsuda'}">共速达</c:if>
						<c:if test="${transfermap.thkdgs=='huitongkuaidi'}">汇通快运</c:if>
						<c:if test="${transfermap.thkdgs=='hengluwuliu'}">恒路物流</c:if>
						<c:if test="${transfermap.thkdgs=='huaxialongwuliu'}">华夏龙物流</c:if>
						<c:if test="${transfermap.thkdgs=='haihongwangsong'}">海红</c:if>
						<c:if test="${transfermap.thkdgs=='haiwaihuanqiu'}">海外环球</c:if>
						<c:if test="${transfermap.thkdgs=='jiayiwuliu'}">佳怡物流</c:if>
						<c:if test="${transfermap.thkdgs=='jinguangsudikuaijian'}">京广速递</c:if>
						<c:if test="${transfermap.thkdgs=='jixianda'}">急先达</c:if>
						<c:if test="${transfermap.thkdgs=='jjwl'}">佳吉物流</c:if>
						<c:if test="${transfermap.thkdgs=='jymwl'}">加运美物流</c:if>
						<c:if test="${transfermap.thkdgs=='jindawuliu'}">金大物流</c:if>
						<c:if test="${transfermap.thkdgs=='jialidatong'}">嘉里大通</c:if>
						<c:if test="${transfermap.thkdgs=='jykd'}">晋越快递</c:if>
						<c:if test="${transfermap.thkdgs=='kuaijiesudi'}">快捷速递</c:if>
						<c:if test="${transfermap.thkdgs=='lianb'}">联邦快递（国内）</c:if>
						<c:if test="${transfermap.thkdgs=='lianhaowuliu'}">联昊通物流</c:if>
						<c:if test="${transfermap.thkdgs=='longbanwuliu'}">龙邦物流</c:if>
						<c:if test="${transfermap.thkdgs=='lijisong'}">立即送</c:if>
						<c:if test="${transfermap.thkdgs=='lejiedi'}">乐捷递</c:if>
						<c:if test="${transfermap.thkdgs=='minghangkuaidi'}">民航快递</c:if>
						<c:if test="${transfermap.thkdgs=='meiguokuaidi'}">美国快递</c:if>
						<c:if test="${transfermap.thkdgs=='menduimen'}">门对门</c:if>
						<c:if test="${transfermap.thkdgs=='ocs'}">OCS</c:if>
						<c:if test="${transfermap.thkdgs=='peisihuoyunkuaidi'}">配思货运</c:if>
						<c:if test="${transfermap.thkdgs=='quanchenkuaidi'}">全晨快递</c:if>
						<c:if test="${transfermap.thkdgs=='quanfengkuaidi'}">全峰快递</c:if>
						<c:if test="${transfermap.thkdgs=='quanjitong'}">全际通物流</c:if>
						<c:if test="${transfermap.thkdgs=='quanritongkuaidi'}">全日通快递</c:if>
						<c:if test="${transfermap.thkdgs=='quanyikuaidi'}">全一快递</c:if>
						<c:if test="${transfermap.thkdgs=='rufengda'}">如风达</c:if>
						<c:if test="${transfermap.thkdgs=='santaisudi'}">三态速递</c:if>
						<c:if test="${transfermap.thkdgs=='shenghuiwuliu'}">盛辉物流</c:if>
						<c:if test="${transfermap.thkdgs=='shentong'}">申通</c:if>
						<c:if test="${transfermap.thkdgs=='shunfeng'}">顺丰</c:if>
						<c:if test="${transfermap.thkdgs=='sue'}">速尔物流</c:if>
						<c:if test="${transfermap.thkdgs=='shengfeng'}">盛丰物流</c:if>
						<c:if test="${transfermap.thkdgs=='saiaodi'}">赛澳递</c:if>
						<c:if test="${transfermap.thkdgs=='tiandihuayu'}">天地华宇</c:if>
						<c:if test="${transfermap.thkdgs=='tiantian'}">天天快递</c:if>
						<c:if test="${transfermap.thkdgs=='tnt'}">tnt</c:if>
						<c:if test="${transfermap.thkdgs=='ups'}">ups</c:if>
						<c:if test="${transfermap.thkdgs=='wanjiawuliu'}">万家物流</c:if>
						<c:if test="${transfermap.thkdgs=='wenjiesudi'}">文捷航空速递</c:if>
						<c:if test="${transfermap.thkdgs=='wuyuan'}">伍圆</c:if>
						<c:if test="${transfermap.thkdgs=='wxwl'}">万象物流</c:if>
						<c:if test="${transfermap.thkdgs=='xinbangwuliu'}">新邦物流</c:if>
						<c:if test="${transfermap.thkdgs=='xinfengwuliu'}">信丰物流</c:if>
						<c:if test="${transfermap.thkdgs=='yafengsudi'}">亚风速递</c:if>
						<c:if test="${transfermap.thkdgs=='yibangwuliu'}">一邦速递</c:if>
						<c:if test="${transfermap.thkdgs=='youshuwuliu'}">优速物流</c:if>
						<c:if test="${transfermap.thkdgs=='youzhengguonei'}">邮政包裹挂号信</c:if>
						<c:if test="${transfermap.thkdgs=='youzhengguoji'}">邮政国际包裹挂号信</c:if>
						<c:if test="${transfermap.thkdgs=='yuanchengwuliu'}">远成物流</c:if>
						<c:if test="${transfermap.thkdgs=='yuantong'}">圆通速递</c:if>
						<c:if test="${transfermap.thkdgs=='yuanweifeng'}">源伟丰快递</c:if>
						<c:if test="${transfermap.thkdgs=='yuanzhijiecheng'}">元智捷诚快递</c:if>
						<c:if test="${transfermap.thkdgs=='yunda'}">韵达快运</c:if>
						<c:if test="${transfermap.thkdgs=='yuntongkuaidi'}">运通快递</c:if>
						<c:if test="${transfermap.thkdgs=='yuefengwuliu'}">越丰物流</c:if>
						<c:if test="${transfermap.thkdgs=='yad'}">源安达</c:if>
						<c:if test="${transfermap.thkdgs=='yinjiesudi'}">银捷速递</c:if>
						<c:if test="${transfermap.thkdgs=='zhaijisong'}">宅急送</c:if>
						<c:if test="${transfermap.thkdgs=='zhongtiekuaiyun'}">中铁快运</c:if>
						<c:if test="${transfermap.thkdgs=='zhongtong'}">中通速递</c:if>
						<c:if test="${transfermap.thkdgs=='zhongyouwuliu'}">中邮物流</c:if>
						<c:if test="${transfermap.thkdgs=='zhongxinda'}">忠信达</c:if>
						<c:if test="${transfermap.thkdgs=='zhimakaimen'}">芝麻开门</c:if>
						</span>
              </li>
              <li>
                <span class="gray_clor">运单号：</span>
                <span>${transfermap.thcouriernumber}</span>
              </li>
              <li>
                <span><a href="http://m.kuaidi100.com/index_all.html?type=${transfermap.thkdgs}&postid=${transfermap.thcouriernumber}" style="color:#3385FF;" target="_blank">查询物流信息</a></span>
              </li>
            </ul>
        </div>
      </div>
    </div>
   </div>
  <jsp:include page="../../foot/footer.jsp"></jsp:include>
  </body>
</html>
