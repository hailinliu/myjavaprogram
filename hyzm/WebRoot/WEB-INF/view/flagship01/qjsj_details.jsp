<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>商家动态详情</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_details.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
  </head>

  <body>


<jsp:include page="../banner/banner.jsp"></jsp:include>


    <!-- 商家菜单 -->
    <jsp:include page="comment/qjsj_nav.jsp"></jsp:include>

    <!-- 左半部分 -->
    <div class="qjsj_left fl" style="width:784px;">
        <div class="qj_video_head" style="width:784px;">
            <span class="qj_sy_dot fl"></span>
            <a href="<c:url value='/redirect?p=index'/>" target="_blank" class="fl">首页</a>
            <span class="fl">&nbsp;>&nbsp;</span>
            <a href="<c:url value='/redirect?p=flagship01/qjsj_list'/>" target="_blank" class="fl">旗舰商家</a>
            <span class="fl">&nbsp;>&nbsp;</span>
            <a href="<c:url value='/redirect?p=flagship01/qjsj_details'/>" target="_blank" class="fl">商家动态</a>
            <span class="qj_video_line fr"  style="width:534px;"></span>
        </div>
        <ul class="qj_details_list">
            <li>
                <div class="details_name">
                  <p class="b"><a href="<c:url value='/redirect?p=flagship01/qjsj_onenews01'/>" target="_blank">东南拍卖历年最强阵容登场</a></p>
                </div>
                <div class="details_time">
                  <span class="clock fl"></span>
                  <span class="fl">09-29&nbsp;14:48</span>
                  <span class="fl" style="margin:0 20px;color:#EEEEEE;">|</span>
                  <span class="fl">点击：</span>
                  <span class="fl">20</span>
                </div>
                <div class="qj_details_box">
                  <div class="fl qj_details_pics">
                    <a href="<c:url value='/redirect?p=flagship01/qjsj_onenews01'/>" target="_blank">
                      <img src="http://admin.wswhly.com/wswhly/ueditor/jsp/upload/20140929/31661411972540125.jpg" alt="" />
                    </a>
                  </div>
                  <div class="fr qj_details_txt">
                      <p class="">自今年春拍开始，先有福州本土拍卖龙头福建东南拍卖逆势走强，创同比上升50.45%的成交业绩，后有华晨、保利等拍卖大颚先后入驻厦门，福建已成国内艺术品拍卖市场的兵家必争之地。记者昨日了解到，福建本土最大拍卖盛会——福建东南2014秋季艺术品拍卖会即将于10月24日启幕，此次拍卖共设9个专场，函括寿山石雕、金石篆刻、紫砂茶器、翡翠珠宝、名家漆画.....</p>
                    <button class="goto_more">阅读全文</button>
                  </div>
                </div>
              </li>
              <li>
                <div class="details_name">
                  <p class="b"><a href="<c:url value='/redirect?p=flagship01/qjsj_onenews02'/>" target="_blank">书拨：古代文人优雅翻书小物件 </a></p>
                </div>
                <div class="details_time">
                  <span class="clock fl"></span>
                  <span class="fl">09-29&nbsp;14:48</span>
                  <span class="fl" style="margin:0 20px;color:#EEEEEE;">|</span>
                  <span class="fl">点击：</span>
                  <span class="fl">21</span>
                </div>
                <div class="qj_details_box">
                  <div class="fl qj_details_pics">
                    <a href="<c:url value='/redirect?p=flagship01/qjsj_onenews02'/>" target="_blank">
                      <img src="http://admin.wswhly.com/wswhly/ueditor/jsp/upload/20140929/47211411971954574.jpg" alt="" />
                    </a>
                  </div>
                  <div class="fr qj_details_txt">
                      <p class="">书挑又名书拨，顾名思义是古人读书的一种工具，亦可兼作书签用途。与笔、墨、纸、砚等大件文房相比，实属小器物。然而，正是这种小玩意，却又是一个内涵丰富的知识载体。在今年纽约亚洲艺术周的拍卖会 上，一件清十八世纪白玉雕螭龙纹书挑，“乐寿”款，铭文为“拥书万卷”，估价5000至7000美元，就以44.9万美元高价成交.....</p>
                    <button class="goto_more">阅读全文</button>
                  </div>
                </div>
              </li>
              <li>
                <div class="details_name">
                  <p class="b"><a href="<c:url value='/redirect?p=flagship01/qjsj_onenews03'/>" target="_blank">佳士得将对超估价拍品加收2%佣金</a></p>
                </div>
                <div class="details_time">
                  <span class="clock fl"></span>
                  <span class="fl">09-24&nbsp;14:48</span>
                  <span class="fl" style="margin:0 20px;color:#EEEEEE;">|</span>
                  <span class="fl">点击：</span>
                  <span class="fl">20</span>
                </div>
                <div class="qj_details_box">
                  <div class="fl qj_details_pics">
                    <a href="<c:url value='/redirect?p=flagship01/qjsj_onenews03'/>" target="_blank">
                      <img src="http://admin.wswhly.com/wswhly/ueditor/jsp/upload/20140929/81401411970950143.jpg" alt="" />
                    </a>
                  </div>
                  <div class="fr qj_details_txt">
                      <p class="">据报道，佳士得对于超过估价拍品将开始对委托人收取2%的佣金(这一佣金通常免去)。许多人都在抱怨近年来因为过度宣传和过度贪婪，估价已经变得虚高不下。在新政下，佳士得的专家将有新的动力来将估价维持在一个低位水平，并努力超越估价.....</p>
                    <button class="goto_more">阅读全文</button>
                  </div>
                </div>
              </li>
              <li>
                <div class="details_name">
                  <p class="b"><a href="<c:url value='/redirect?p=flagship01/qjsj_onenews04'/>" target="_blank">似曾相识的异国文物</a></p>
                </div>
                <div class="details_time">
                  <span class="clock fl"></span>
                  <span class="fl">09-28&nbsp;14:48</span>
                  <span class="fl" style="margin:0 20px;color:#EEEEEE;">|</span>
                  <span class="fl">点击：</span>
                  <span class="fl">20</span>
                </div>
                <div class="qj_details_box">
                  <div class="fl qj_details_pics">
                    <a href="<c:url value='/redirect?p=flagship01/qjsj_onenews04'/>" target="_blank">
                      <img src="http://admin.wswhly.com/wswhly/ueditor/jsp/upload/20140928/87141411892007091.jpg" alt="" />
                    </a>
                  </div>
                  <div class="fr qj_details_txt">
                      <p class="">伊朗国家博物馆里的一件玻璃瓶令我惊叹，因为几乎一模一样的物品曾在中国陕西隋代清禅寺出土过。中国那个时代，玻璃是罕见之物，那件玻璃瓶的造型和装饰又十分奇特，当时和以后很长时间都没人解读过它。1994年，我在日本访问时，无意中在博物馆看到了类似的器物，在查阅了大量资料后，我撰写了一篇考释文章，推测是传到中国的伊朗萨珊时期的作品，却苦无更有力的证.....</p>
                    <button class="goto_more">阅读全文</button>
                  </div>
                </div>
              </li>
              <li>
                <div class="details_name">
                  <p class="b"><a href="<c:url value='/redirect?p=flagship01/qjsj_onenews05'/>" target="_blank">流失海外文物返还阻碍多 将建被盗文物数据库 </a></p>
                </div>
                <div class="details_time">
                  <span class="clock fl"></span>
                  <span class="fl">09-26&nbsp;14:48</span>
                  <span class="fl" style="margin:0 20px;color:#EEEEEE;">|</span>
                  <span class="fl">点击：</span>
                  <span class="fl">20</span>
                </div>
                <div class="qj_details_box">
                  <div class="fl qj_details_pics">
                    <a href="<c:url value='/redirect?p=flagship01/qjsj_onenews05'/>" target="_blank">
                      <img src="http://admin.wswhly.com/wswhly/ueditor/jsp/upload/20140926/31251411721775644.jpg" alt="" />
                    </a>
                  </div>
                  <div class="fr qj_details_txt">
                      <p class="">作为四大文明古国之一，中国拥有丰富的文化遗产资源，这不仅是中国人民的宝贵财富，也是全人类共同的文化遗产。然而，因为复杂的历史与现实原因，我国饱受战争劫掠和文物盗窃、盗掘、走私之害，成为世界上文物流失严重的国家之一.....</p>
                    <button class="goto_more">阅读全文</button>
                  </div>
                </div>
              </li>
              <li>
                <div class="details_name">
                  <p class="b"><a href="<c:url value='/redirect?p=flagship01/qjsj_onenews06'/>" target="_blank">庞能：藏友爱“钱”，取之有“道”</a></p>
                </div>
                <div class="details_time">
                  <span class="clock fl"></span>
                  <span class="fl">09-24&nbsp;14:48</span>
                  <span class="fl" style="margin:0 20px;color:#EEEEEE;">|</span>
                  <span class="fl">点击：</span>
                  <span class="fl">20</span>
                </div>
                <div class="qj_details_box">
                  <div class="fl qj_details_pics">
                    <a href="<c:url value='/redirect?p=flagship01/qjsj_onenews06'/>" target="_blank">
                      <img src="http://admin.wswhly.com/wswhly/ueditor/jsp/upload/20140929/15331411955305376.jpg" alt="" />
                    </a>
                  </div>
                  <div class="fr qj_details_txt">
                      <p class="">中国上下五千年的文明史，钱币的历史大概有三四千年，钱币的发展史可以说是中国历史发展的活的见证。我国有着基数庞大的古钱币存储量，藏友用“钱”，爱“钱”，藏“钱”，形成了完整的古钱币系统。面对鱼龙混杂的古钱市场，我们怎样立足?面对种类繁多的古钱，我们怎样分类?中国文物网记者近日采访了资深钱币收藏家，前文化部艺术评估委员会委员庞能(笔名)，他告诉我们，藏友.....</p>
                    <button class="goto_more">阅读全文</button>
                  </div>
                </div>
              </li>
              
        </ul>
        <div class="qj_video_ye">
        <a href="#" >首页</a>
        <a href="#">上一页</a>
        <a href="#" class="page_on">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">下一页</a>
        <a href="#">尾页</a>
        <a href="#">共三页</a>
      </div>
    </div>
    <!--  左半部分结束 -->

    <!-- 右半部分 -->
    <jsp:include page="comment/qjsj_right.jsp"></jsp:include>



  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
