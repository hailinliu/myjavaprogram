<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>官网活动</title>

    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>">
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>

	<style type="text/css">
	p img {width: 100%;}

	#scroll {
	position:fixed; bottom:50px; right:50px;
	}

	.scrollItem {
		width:20px; height:20px; cursor:pointer; text-align:center; padding-top:10px;
	}
	</style>
	<script type="text/javascript">
	$(function () {
        var speed = 800;//滚动速度
        //回到顶部
        $("#toTop").click(function () {
		  	$('html,body').animate({
				scrollTop: '0px'
			},
			speed);
        });
        $("#toTop1").click(function () {
		  	$('html,body').animate({
				scrollTop: '0px'
			},
			speed);
        });
        $("#toTop2").click(function () {
		  	$('html,body').animate({
				scrollTop: '0px'
			},
			speed);
        });
    });
	</script>

  </head>

  <body>
    <div data-role="page" id="demo-page" class="my-page">
		<jsp:include page="../head/header.jsp?name=官网活动"></jsp:include>
	    <div role="main" class="ui-content">
	         <ul data-role="listview" data-inset="true">
             <li><a data-ajax="false" href="http://wap.wswhly.com/news/getOneNews?id=11215" data-rel="dialog" data-transition="pop">
                <h2>“行家来鉴宝”系列活动——第八期造像</h2>
                <p></p>
                </a></li>
                 <li><a data-ajax="false" href="http://wap.wswhly.com/news/getOneNews?id=11060" data-rel="dialog" data-transition="pop">
                <h2>“行家来鉴宝”系列活动—第七期答案</h2>
                <p></p>
                </a></li>

                <li><a data-ajax="false" href="http://wap.wswhly.com/news/getOneNews?id=10432" data-rel="dialog" data-transition="pop">
                <h2>“行家来鉴宝”系列活动—第七期玉器</h2>
                <p></p>
                </a></li>
              <li><a data-ajax="false" href="http://wap.wswhly.com/news/getOneNews?id=7316" data-rel="dialog" data-transition="pop">
                <h2>喜庆元旦 2015：华豫官网——百宝箱正式上线</h2>
                <p></p>
                </a></li>
                <li><a data-ajax="false" href="http://wap.wswhly.com/news/getOneNews?id=5569" data-rel="dialog" data-transition="pop">
                <h2>藏友必看：华豫假网骗术大曝光！</h2>
                <p></p>
                </a></li>
                <li><a data-ajax="false" href="http://wap.wswhly.com/news/getOneNews?id=3874" data-rel="dialog" data-transition="pop">
                <h2>“国画精粹”拍卖专场已结束 总成交额107万！</h2>
                <p></p>
                </a></li>
                <li><a data-ajax="false" href="http://wap.wswhly.com/news/getOneNews?id=2620" data-rel="dialog" data-transition="pop">
                <h2>“国画精粹”—淘宝网开拍正在进行中</h2>
                <p></p>
                </a></li>
                <li><a data-ajax="false" href="http://wap.wswhly.com/news/getOneNews?id=2316" data-rel="dialog" data-transition="pop">
                <h2>大象融媒体集团：一艘河南文化传媒业的超级航母</h2>
                <p></p>
                </a></li>
                <li><a data-ajax="false" href="http://wap.wswhly.com/news/getOneNews?id=2315" data-rel="dialog" data-transition="pop">
                <h2>大象融媒体集团：一场河南传媒界的革命与进化</h2>
                <p></p>
                </a></li>
                <li><a data-ajax="false" href="http://wap.wswhly.com/news/getOneNews?id=2019" data-rel="dialog" data-transition="pop">
                <h2>关于乐园拍品征集拍摄图片具体要求的说明</h2>
                <p></p>
                </a></li>
                <li><a data-ajax="false" href="http://wap.wswhly.com/news/getOneNews?id=1955" data-rel="dialog" data-transition="pop">
                <h2>卫视文化乐园拍品征集火热进行中</h2>
                <p></p>
                </a></li>
                <li><a data-ajax="false" href="http://wap.wswhly.com/news/getOneNews?id=1608" data-rel="dialog" data-transition="pop">
                <h2>旗舰商家上线啦，华豫官网诚邀您的加盟！</h2>
                <p></p>
                </a></li>
                <li><a data-ajax="false" href="<c:url value='/redirect?p=news/zts0910'/>" data-rel="dialog" data-transition="pop">
                <h2>“2014北美收藏文化之旅”专题报道</h2>
                <p></p>
                </a></li>
                <li><a data-ajax="false" href="http://wap.wswhly.com/news/getOneNews?id=1106" data-rel="dialog" data-transition="pop">
                <h2>2014北美收藏文化之旅正式启动</h2>
                <p></p>
                </a></li>
	         	<li><a data-ajax="false" href="<c:url value='/news/getOneCollectionInfo?id=779'/>" data-rel="dialog" data-transition="pop">
			    <h2>纽约佳士得2014年秋拍玉器观感</h2>
			    <p>古方于2014年8月26日：2014年纽约佳士得中国瓷器及艺术品秋拍将于9月18-19日举行（预展从12日开始）。此次秋拍的中国古代玉器以明清玉器为主。</p>
			    </a></li>
			    <li><a data-ajax="false" href="<c:url value='/news/getOneCollectionInfo?id=673'/>" data-rel="dialog" data-transition="pop">
			    <h2>纽约苏富比2014年秋拍精品观感</h2>
			    <p>古方于2014年8月5日； 位于纽约市曼哈顿约克大道（York Avenue）上的苏富比拍卖公司。注意：大门上方的中国国旗位于中央，凸显中国艺术品的重要性。</p>
			    </a></li>
			    <li><a href="#activity2" data-rel="dialog" data-transition="pop">
			    <h2>《华豫之门》藏家团-国内嘉德、保利和瀚海秋拍收藏文化之旅</h2>
			    <p>由《华豫之门》专家亲自带队，参加国内大型秋季拍卖会活动。藏家团将根据不同藏品种类（分玉器、铜器、字画、瓷器和珠宝首饰）由著名收藏专家王育成、余光仁、黄鼎、高明利、陈建明和古方分别带队组成，到拍卖会预展现场进行拍卖指导分析。</p>
			    </a></li>
			    <li><a href="#activity3" data-rel="dialog" data-transition="pop">
			    <h2>《华豫之门》藏家团-艺术品市场深度交流鉴赏自由行文化活动</h2>
			    <p>由《华豫之门》专家亲自带队，参加国内及周边国家各门类艺术品重要集中地的鉴赏与团购活动，旅行费用由旅游公司收取(仅收取藏友团出行期间住宿和交通费的成本价)，且藏友在参团合同中明确得到组织方在团购活动中绝不收取商家任何回扣和佣金以及绝没有任何强迫性购物的双</p>
			    </a></li>
                <li><a href="#activity1" data-rel="dialog" data-transition="pop">
                <h2>藏家团-美国苏富比与佳士得秋拍文化之旅</h2>
                <p>由《华豫之门》专家亲自带队，九月中旬赴美国纽约参加苏富比和佳士得秋季拍卖会预展及拍卖活动。藏家团将根据不同藏品种类（分玉器、铜器、字画、瓷器和珠宝五大类团）由华豫专家王育成、余光仁、黄鼎、高明利、陈建明和古方分别带队组成，到两个拍卖会预展现场和第五大道的藏家自选珠宝店面进行指导分析，并由专家亲自带团参观游览当地的唐人街古董跳蚤市场，体验异域大众收藏文化风土人情。</p>
                </a></li>
			</ul>
	    </div>
    </div>

<div data-role="page" id="activity1">
    <div data-role="header">
        <h1>官网活动</h1>
    </div>
    <div role="main" class="ui-content">
    <h1 style="font-size:24px;margin-bottom:20px;">藏家团-美国苏富比与佳士得秋拍文化之旅</h1>
            <p class="biaoti">活动内容： </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;由《华豫之门》专家亲自带队，九月中旬赴美国纽约参加苏富比和佳士得秋季拍卖会预展及拍卖活动。藏家团将根据不同藏品种类（分玉器、铜器、字画、瓷器和珠宝五大类团）由华豫专家王育成、余光仁、黄鼎、高明利、陈建明和古方分别带队组成，到两个拍卖会预展现场和第五大道的藏家自选珠宝店面进行指导分析，并由专家亲自带团参观游览当地的唐人街古董跳蚤市场，体验异域大众收藏文化风土人情。
    通过华豫官网报名预审后由美国苏富比和佳士得公司出具邀请函到大使馆进行签证，纽约活动期间入住市区临近拍卖现场的五星级酒店，活动全程由空调大巴接送，并由专业翻译全程提供免费服务。</p>
            <p class="biaoti">报名条件： </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;注册成为网站会员，并通过实名认证后，升级为<span class="guibin" style="color:red;">高级</span>会员及以上级别即可参与。<a href="http://www.wswhly.com/redirect?p=mine/vip">查看会员级别服务及收费标准</a></p>
              <p>&nbsp;&nbsp;&nbsp;&nbsp;<span class="red1" style="color:red;">您也可以仅参加本次活动哦！</span>

            </p>
            <p class="biaoti">时间：</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;报名时间：2014年7月1日 -- 2014年8月8日。</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;秋拍时间：2014年9月12日 -- 2014年9月16日。</p>
            <p class="biaoti">注意事项：</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;1、本活动由《华豫之门》官网与康辉旅游公司联合举办，会员费用仅包含专家和翻译等服务人员及相关组织费用，签证和旅费自理并由旅游公司收取或藏友自理。<br>
            &nbsp;&nbsp;&nbsp;&nbsp;2、签证办理及旅费事宜将在报名结束后（8月初），召集报名成员统一商议，将根据报名人员情况及机票住宿要求分别由旅行公司报价，《华豫之门》官网负责统一组织协调，承诺旅行费用仅收取出行期间住宿和交通费用的成本价。<br />
            &nbsp;&nbsp;&nbsp;&nbsp;3、藏友亦可自由行赴美，在团拍期间约定汇合。具体时间将在报名结束后（8月初）统一安排，并通知藏友。<br/>
            <span style="color:red;">
                &nbsp;&nbsp;&nbsp;&nbsp;4、本次活动如因行程安排报名本人无法参团，亦可委托代理人参加。如您或代理人均无法到场，可由我公司专业人员代理竞拍拍卖会藏品，详情请联系客服电话。
            </span><br/>
            &nbsp;&nbsp;&nbsp;&nbsp;5、在团行程期间请遵照国家相应法律法规和与旅游公司签订的出行协议。详细情况请联系客服电话：0371-60110891，报名成功后会有工作人员在一个工作日内与您联系。<br>
            </p>
            <p class="biaoti">特别提醒：</p>
            <span style="color:#A20004;font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;如您需了解美国佳士得和苏富比秋拍品图录后再选择交费，为了能够及时办理签证，您可继续点击报名，并在填写报名资料后选择在网站充值支付<span style="color:#2951F0">1200</span>元签证费用，我们将委托旅行公司先办理美国大使馆签证工作。签证办理后费用不予退回，敬请知晓。</span>
    </div>
    <div id="scroll">
        <div class="scrollItem" id="toTop1"><img src="<c:url value='/images/returntop.gif'/>"></div>
    </div>
</div>

<div data-role="page" id="activity2">
    <div data-role="header">
		<h1>官网活动</h1>
	</div>
  	<div role="main" class="ui-content">
    <h1 style="font-size:24px;margin-bottom:20px;">《华豫之门》藏家团-国内嘉德、保利和瀚海秋拍收藏文化之旅</h1>
            <p class="biaoti">活动内容： </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;由《华豫之门》专家亲自带队，参加国内大型秋季拍卖会活动。藏家团将根据不同藏品种类（分玉器、铜器、字画、瓷器和珠宝首饰）由著名收藏专家王育成、余光仁、黄鼎、高明利、陈建明和古方分别带队组成，到拍卖会预展现场进行拍卖指导分析。</p>
            <p class="biaoti">报名条件： </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;注册成为网站会员，并通过实名认证后，升级为<span class="guibin">贵宾</span>会员及以上级别即可参与。<a href="http://www.wswhly.com/redirect?p=mine/vip">查看会员级别服务及收费标准</a></p>
              <p>&nbsp;&nbsp;&nbsp;&nbsp;<span class="red1" style="color:red;">您也可以仅参加本次活动哦！</span>

            </p>
            <p class="biaoti">时间：</p>
            <!-- <p>&nbsp;&nbsp;&nbsp;&nbsp;报名时间：2014年7月1日 -- 2014年9月19日。</p> -->
            <p>&nbsp;&nbsp;&nbsp;&nbsp;秋拍时间：三家拍卖行2014秋拍时间。</p>
            <p class="biaoti">注意事项：</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;1、本活动由《华豫之门》官网与康辉旅游公司联合举办，会员费用仅包含专家等服务人员及相关组织费用，旅行费用由旅游公司收取或藏友自理。<br>
            &nbsp;&nbsp;&nbsp;&nbsp;2、会员报名成功后，将于每月底根据当月报名情况举行一次说明会，最后一次说明会将在拍卖会开始一周前举行，说明会统一与会员确认集合方式及旅行费用，将根据报名人员情况及机票住宿要求分别由旅行公司报价，《华豫之门》官网负责统一组织协调，承诺旅行费用仅收取出行期间住宿和交通费用的成本价。<br />
            &nbsp;&nbsp;&nbsp;&nbsp;3、自由行会员将在每月报名说明会举行后通知您具体汇合时间流程安排。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;4、所有参团会员将在拍卖会举办前一天在拍卖会预展现场或周边酒店举行专家见面会，由专家对拍品讲解分析。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;5、本次活动如因行程安排报名本人无法参团，亦可委托代理人参加。<br>
            &nbsp;&nbsp;&nbsp;
            <span style="color:red;">6、如您或代理人无法到场，可由我公司专业人员代理竞拍拍卖会藏品，详情请联系客服电话。</span><br>
            &nbsp;&nbsp;&nbsp;&nbsp;7、客服电话：书画古籍-小孙（13733823055）、瓷器陶器-小张（18503788804）、 青铜佛像-小万（15838299008）、玉器国石-小亮（15890071113）。
            </p>
  	</div>
  	<div id="scroll">
        <div class="scrollItem" id="toTop1"><img src="<c:url value='/images/returntop.gif'/>"></div>
    </div>
</div>

<div data-role="page" id="activity3">
    <div data-role="header">
		<h1>官网活动</h1>
	</div>
  	<div role="main" class="ui-content">
    <h1 style="font-size:24px;margin-bottom:20px;">《华豫之门》藏家团-艺术品市场深度交流鉴赏自由行文化活动</h1>
            <p class="biaoti">活动内容： </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;由《华豫之门》专家亲自带队，参加国内及周边国家各门类艺术品重要集中地的鉴赏与团购活动，旅行费用由旅游公司收取(仅收取藏友团出行期间住宿和交通费的成本价)，且藏友在参团合同中明确得到组织方在团购活动中绝不收取商家任何回扣和佣金以及绝没有任何强迫性购物的双重承诺。年度活动地区：翡翠缅甸行或腾冲行、金丝楠四川行、黄花梨仙游行、水晶东海行、珊瑚台湾行、寿山福建行、鸡血石内蒙行、字画日本行，到各地进行艺术品鉴赏与交流活动。</p>
            <p class="biaoti">报名条件： </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;注册成为网站会员，并通过实名认证后，升级为<span class="guibin">星级</span>会员及以上级别即可参与。<a href="http://www.wswhly.com/redirect?p=mine/vip">查看会员级别服务及收费标准</a></p>
            <p class="biaoti">报名时间：</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;每个地区30人报名即可组团出行。</p>
            <p class="biaoti">注意事项：</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp; 本活动由《华豫之门》官网与康辉旅游公司联合举办，会员费用仅包含专家等服务人员及相关组织费用，签证和旅费自理、且由旅游公司收取。详细情况请联系客服电话：0371-60110891，报名成功后会有工作人员1个工作日内与您联系。</p>
  	</div>
  	<div id="scroll">
        <div class="scrollItem" id="toTop2"><img src="<c:url value='/images/returntop.gif'/>"></div>
    </div>
</div>

  </body>
</html>
