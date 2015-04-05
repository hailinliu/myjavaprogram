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
            <a href="<c:url value='/redirect?p=qjsj_list'/>" target="_blank" class="fl">旗舰商家</a>
            <span class="fl">&nbsp;>&nbsp;</span>
            <span class="fl">商家动态</span>
            <span class="qj_video_line fr"  style="width:534px;"></span>
        </div>
        <ul class="qj_details_list">
            <li>
                <div class="details_name">
                  <p class="b"><a href="<c:url value='/redirect?p=flagship_doubao/qjsj_onenews01'/>" target="_blank">上海斗宝艺术“汇精藏雅”现场洽购会圆满成功</a></p>
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
                    <a href="<c:url value='/redirect?p=flagship_doubao/qjsj_onenews01'/>" target="_blank">
                      <img src="http://www.dbysgj.cn/uploads/141006/2-141006161Z3H7.jpg" alt="" />
                    </a>
                  </div>
                  <div class="fr qj_details_txt">
                      <p class="">国庆即将来临，七天的小长假早已让人激动不已。上海斗宝艺术展览有限公司为藏友们更是锦上添花。2014年9月26至27日，由上海斗宝艺术展览有限公司承办的为期两天以汇精藏雅为主题的现场洽购会已火热开展，今日则圆满成功。本次洽购会成功邀约了上海市收藏协会........</p>
                    <button class="goto_more" onclick="location.href='<c:url value='/redirect?p=flagship_doubao/qjsj_onenews01'/>'">阅读全文</button>
                  </div>
                </div>
              </li>
              <li>
                <div class="details_name">
                  <p class="b"><a href="<c:url value='/redirect?p=flagship_doubao/qjsj_onenews02'/>" target="_blank">上海斗宝首届艺术品博览交易会暨招商会即将精彩揭幕 </a></p>
                </div>
                <div class="details_time">
                  <span class="clock fl"></span>
                  <span class="fl">09-25&nbsp;14:48</span>
                  <span class="fl" style="margin:0 20px;color:#EEEEEE;">|</span>
                  <span class="fl">点击：</span>
                  <span class="fl">21</span>
                </div>
                <div class="qj_details_box">
                  <div class="fl qj_details_pics">
                    <a href="<c:url value='/redirect?p=flagship_doubao/qjsj_onenews02'/>" target="_blank">
                      <img src="http://www.dbysgj.cn/uploads/allimg/140928/2_140928163622_1.jpg" alt="" />
                    </a>
                  </div>
                  <div class="fr qj_details_txt">
                      <p class="">展厅现场 2014 年 10 月 29 日至 30 日，上海斗宝首届艺术品博览交易会暨招商会即将精彩揭幕。 届时将有 上百 余家参展企业， 几 万余参展观众光临此次盛会。 此次上海斗宝首届艺术品博览交易会暨招商会就是一个融合了多元民族文化的大舞台，展示着来自全国.....</p>
                    <button class="goto_more" onclick="location.href='<c:url value='/redirect?p=flagship_doubao/qjsj_onenews02'/>'">阅读全文</button>
                  </div>
                </div>
              </li>
              <li>
                <div class="details_name">
                  <p class="b"><a href="<c:url value='/redirect?p=flagship_doubao/qjsj_onenews03'/>" target="_blank">上海斗宝艺术“汇精藏雅”现场洽购会即将火热开展</a></p>
                </div>
                <div class="details_time">
                  <span class="clock fl"></span>
                  <span class="fl">09-17&nbsp;14:48</span>
                  <span class="fl" style="margin:0 20px;color:#EEEEEE;">|</span>
                  <span class="fl">点击：</span>
                  <span class="fl">20</span>
                </div>
                <div class="qj_details_box">
                  <div class="fl qj_details_pics">
                    <a href="<c:url value='/redirect?p=flagship_doubao/qjsj_onenews03'/>" target="_blank">
                      <img src="http://www.dbysgj.cn/uploads/140918/2-14091QT001436.jpg" alt="" />
                    </a>
                  </div>
                  <div class="fr qj_details_txt">
                      <p class="">上海斗宝艺术汇精藏雅现场洽购会即将火热开展 2014年9月26至27日，由 上海斗宝艺术展览有限公司 承办的为期两天以汇精藏雅为主题的现场洽购会即将火热开展。上海斗宝艺术展览有限公司此次将以最优质的服务、饱满的信心、令人瞩目的成交额为您奉上一场艺术盛.....</p>
                    <button class="goto_more" onclick="location.href='<c:url value='/redirect?p=flagship_doubao/qjsj_onenews03'/>'">阅读全文</button>
                  </div>
                </div>
              </li>
              <li>
                <div class="details_name">
                  <p class="b"><a href="<c:url value='/redirect?p=flagship_doubao/qjsj_onenews04'/>" target="_blank">金秋九月 上海斗宝＂藏物鉴珍＂鉴宝大会即将火爆开启</a></p>
                </div>
                <div class="details_time">
                  <span class="clock fl"></span>
                  <span class="fl">09-03&nbsp;14:48</span>
                  <span class="fl" style="margin:0 20px;color:#EEEEEE;">|</span>
                  <span class="fl">点击：</span>
                  <span class="fl">20</span>
                </div>
                <div class="qj_details_box">
                  <div class="fl qj_details_pics">
                    <a href="<c:url value='/redirect?p=flagship_doubao/qjsj_onenews04'/>" target="_blank">
                      <img src="http://www.dbysgj.cn/uploads/140903/2-140Z31P2322R.jpg" alt="" />
                    </a>
                  </div>
                  <div class="fr qj_details_txt">
                      <p class="">金秋九月，中秋佳节即将来临，伴着节日的氛围，上海斗宝艺术展览有限公司以藏物鉴珍为主题的鉴宝大会即将于9月13日至14日火爆开启！ 在活动中，各路爱好收藏的英雄好汉们，均可以在这里收获知识，切磋技艺，开阔眼界。虽然收藏热正持续地升温，而初涉艺术品.....</p>
                    <button class="goto_more" onclick="location.href='<c:url value='/redirect?p=flagship_doubao/qjsj_onenews04'/>'">阅读全文</button>
                  </div>
                </div>
              </li>
              <li>
                <div class="details_name">
                  <p class="b"><a href="<c:url value='/redirect?p=flagship_doubao/qjsj_onenews05'/>" target="_blank">中外买家团体＂斗宝斗奇＂ 现场洽购会今日精彩落幕 </a></p>
                </div>
                <div class="details_time">
                  <span class="clock fl"></span>
                  <span class="fl">08-28&nbsp;14:48</span>
                  <span class="fl" style="margin:0 20px;color:#EEEEEE;">|</span>
                  <span class="fl">点击：</span>
                  <span class="fl">20</span>
                </div>
                <div class="qj_details_box">
                  <div class="fl qj_details_pics">
                    <a href="<c:url value='/redirect?p=flagship_doubao/qjsj_onenews05'/>" target="_blank">
                      <img src="http://www.dbysgj.cn/uploads/140828/2-140RQ10000N7.jpg" alt="" />
                    </a>
                  </div>
                  <div class="fr qj_details_txt">
                      <p class="">活动现场 2014年8月26日至27日，为期两天的上海斗宝艺术大型鉴宝暨中外买家团体斗宝斗奇现场洽购会于今日已精彩落幕。现场，收藏与投资各界精英相聚一堂，品鉴艺术、论道收藏、私洽成交、交朋结友，风云际会好不融洽! 俗话说盛世兴收藏，近年来民间收藏正日.....</p>
                    <button class="goto_more" onclick="location.href='<c:url value='/redirect?p=flagship_doubao/qjsj_onenews05'/>'">阅读全文</button>
                  </div>
                </div>
              </li>
              <li>
                <div class="details_name">
                  <p class="b"><a href="<c:url value='/redirect?p=flagship_doubao/qjsj_onenews06'/>" target="_blank">李宗扬“鉴宝鉴心 博古通今”鉴宝活动今日圆满谢幕</a></p>
                </div>
                <div class="details_time">
                  <span class="clock fl"></span>
                  <span class="fl">08-19&nbsp;14:48</span>
                  <span class="fl" style="margin:0 20px;color:#EEEEEE;">|</span>
                  <span class="fl">点击：</span>
                  <span class="fl">20</span>
                </div>
                <div class="qj_details_box">
                  <div class="fl qj_details_pics">
                    <a href="<c:url value='/redirect?p=flagship_doubao/qjsj_onenews06'/>" target="_blank">
                      <img src="http://www.dbysgj.cn/uploads/allimg/140821/1_140821164300_1.jpg" alt="" />
                    </a>
                  </div>
                  <div class="fr qj_details_txt">
                      <p class="">伴着凉凉的秋意，上海斗宝艺术展览有限公司鉴宝鉴心 博古通今为期两天鉴宝活动已圆满谢幕。值得庆贺的是此次活动赢得了藏友们的一致青睐和好评。 活动期间，收藏爱好者络绎不绝地拿着自己的宝贝前来排队等鉴宝，而我们的鉴宝专家李宗扬老师与陈行一老师也不.....</p>
                    <button class="goto_more" onclick="location.href='<c:url value='/redirect?p=flagship_doubao/qjsj_onenews06'/>'">阅读全文</button>
                  </div>
                </div>
              </li>

        </ul>
        <div class="qj_video_ye">
        <a href="#" >首页</a>
        <!-- <a href="#">上一页</a> -->
        <a href="#" class="page_on">1</a>
        <!-- <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">下一页</a> -->
        <a href="#">尾页</a>
        <a href="#">共 1 页</a>
      </div>
    </div>
    <!--  左半部分结束 -->

    <!-- 右半部分 -->
    <jsp:include page="comment/qjsj_right.jsp"></jsp:include>



  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
