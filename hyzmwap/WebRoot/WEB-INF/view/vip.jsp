<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>华豫之门官方网站-卫视文化乐园</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
	<style type="text/css">
	.ui-page {
     backface-visibility: hidden;
     -webkit-backface-visibility: hidden; /* Chrome and Safari */
     -moz-backface-visibility: hidden; /* Firefox */  }
	.in, .out {
	-webkit-animation-timing-function: ease-in-out;
    -webkit-animation-duration: 500ms;  }
	</style>
  </head>
  <body>
  <div data-role="page">
  <div data-role="header" data-position='fixed'>
	<h1>会员服务</h1>
  </div>
  	<img src="<c:url value='/images/vip/wapvip_01.jpg'/>" width="100%" style="display: block;"/>
  	<img src="<c:url value='/images/vip/wapvip_02.jpg'/>" width="100%" style="display: block;"/>
  	<img src="<c:url value='/images/vip/wapvip_03.jpg'/>" width="100%" style="display: block;"/>
  	<img src="<c:url value='/images/vip/wapvip_04.jpg'/>" width="100%" style="display: block;"/>
  	<img src="<c:url value='/images/vip/wapvip_05.jpg'/>" width="100%" style="display: block;"/>
  	<img src="<c:url value='/images/vip/wapvip_06.jpg'/>" width="100%" style="display: block;"/>
  	<img src="<c:url value='/images/vip/wapvip_07.jpg'/>" width="100%" style="display: block;"/>
  	<img src="<c:url value='/images/vip/wapvip_08.jpg'/>" width="100%" style="display: block;"/>
  <ul data-role="listview">
  	<li><a href="#vip1" data-rel="dialog" data-transition="pop" data-ajax="false">查看星级会员服务</a></li>
    <li><a href="#vip2" data-rel="dialog" data-transition="pop" data-ajax="false">查看贵宾会员服务</a></li>
    <li><a href="#vip3" data-rel="dialog" data-transition="pop" data-ajax="false">查看高级会员服务</a></li>
    <li><a href="#vip4" data-rel="dialog" data-transition="pop" data-ajax="false">查看超级会员服务</a></li>
  </ul>
  <button class="ui-shadow ui-btn ui-corner-all" onclick="location.href='<c:url value='/mine/gotovip'/>'">会员升级</button>
  </div>

  <div data-role="page" id="vip1">
    <div data-role="header" data-position='fixed'>
		<h1>星级会员</h1>
	</div>
  	<div role="main" class="ui-content">
    <p>网上报名：可在本站进行《华豫之门》的鉴定海选报名。<br/><hr/>
	      浏览藏品：浏览本站收藏品库的所有信息。<br/><hr/>
	      视频观看：免费观看《华豫之门》专家团的视频讲座。<br/><hr/>
	      直达鉴定：华豫海选时，在短信预约的鉴定时间内，专享官网星级会员通道直达专家面前，快速便捷完成鉴定。<br/><hr/>
	      自有藏品展示：藏品通过专家团鉴定、合议、推荐，或登上《华豫之门》电视节目之后，会在“华豫藏品”频道下长期展示，直至交易之后。<br/><hr/>
	      藏品观摩交流：针对“华豫藏品”频道下展示的所有藏品，您与本站商务专员预约后，可到本站合作的旗舰商家实体店中，实物查看，上手观摩，或实物交易。<br/><hr/>
	      国内团购：参加本站组织的华豫专家带团团购会， 目的地为国内各类艺术品市场发源地知名商家和藏家店铺（旅行费用由旅游公司收取，仅收取藏友团出行期间住宿和交通费用的成本价，且参团合同中明确承诺：组织方在团购活动中绝不收取商家任何回扣和佣金，绝没有任何强迫性购物）。</p>
  	</div>
	 <a href="#vip" data-rel="back" class="ui-shadow ui-btn ui-corner-all" data-rel="back">返回</a>
  </div>

  <div data-role="page" id="vip2">
    <div data-role="header" data-position='fixed'>
		<h1>高级会员</h1>
	</div>
  	<div role="main" class="ui-content">
    <p>网上报名：可在本站进行《华豫之门》的鉴定海选报名。<br/><hr/>
	      浏览藏品：浏览本站收藏品库的所有信息。<br/><hr/>
	      视频观看：免费观看《华豫之门》专家团的视频讲座。<br/><hr/>
	      直达鉴定：华豫海选时，在短信预约的鉴定时间内，专享官网星级会员通道直达专家面前，快速便捷完成鉴定。<br/><hr/>
	      自有藏品展示：藏品通过专家团鉴定、合议、推荐，或登上《华豫之门》电视节目之后，会在“华豫藏品”频道下长期展示，直至交易之后。<br/><hr/>
	      藏品观摩交流：针对“华豫藏品”频道下展示的所有藏品，您与本站商务专员预约后，可到本站合作的旗舰商家实体店中，实物查看，上手观摩，或实物交易。<br/><hr/>
	      国内团购：参加本站组织的华豫专家带团团购会， 目的地为国内各类艺术品市场发源地知名商家和藏家店铺（旅行费用由旅游公司收取，仅收取藏友团出行期间住宿和交通费用的成本价，且参团合同中明确承诺：组织方在团购活动中绝不收取商家任何回扣和佣金，绝没有任何强迫性购物）。<br/><hr/>
  	      国内拍卖(2次)：参与国内顶级拍卖行一年两次的春秋大拍会，届时华豫专家现场陪同，提供指导咨询服务。<br/><hr/>
  	      藏品送拍：参加国内或国外大拍会活动后，同时享有在下次对应大拍会开始前送拍经由华豫和拍卖公司专家团鉴定后的藏品送拍权。</p>

  	</div>
	 <a href="#vip" data-rel="back" class="ui-shadow ui-btn ui-corner-all" data-rel="back">返回</a>
  </div>

  <div data-role="page" id="vip3">
    <div data-role="header" data-position='fixed'>
		<h1>贵宾会员</h1>
	</div>
  	<div role="main" class="ui-content">
    <p>网上报名：可在本站进行《华豫之门》的鉴定海选报名。<br/><hr/>
	      浏览藏品：浏览本站收藏品库的所有信息。<br/><hr/>
	      视频观看：免费观看《华豫之门》专家团的视频讲座。<br/><hr/>
	      直达鉴定：华豫海选时，在短信预约的鉴定时间内，专享官网星级会员通道直达专家面前，快速便捷完成鉴定。<br/><hr/>
	      自有藏品展示：藏品通过专家团鉴定、合议、推荐，或登上《华豫之门》电视节目之后，会在“华豫藏品”频道下长期展示，直至交易之后。<br/><hr/>
	      藏品观摩交流：针对“华豫藏品”频道下展示的所有藏品，您与本站商务专员预约后，可到本站合作的旗舰商家实体店中，实物查看，上手观摩，或实物交易。<br/><hr/>
	      国内团购：参加本站组织的华豫专家带团团购会， 目的地为国内各类艺术品市场发源地知名商家和藏家店铺（旅行费用由旅游公司收取，仅收取藏友团出行期间住宿和交通费用的成本价，且参团合同中明确承诺：组织方在团购活动中绝不收取商家任何回扣和佣金，绝没有任何强迫性购物）。<br/><hr/>
  	      国外拍卖(2次)：参与国外及港澳地区一年两次的顶级春秋大拍会，届时华豫专家现场陪同，提供指导咨询服务。<br/><hr/>
  	      藏品送拍：参加国内或国外大拍会活动后，同时享有在下次对应大拍会开始前送拍经由华豫和拍卖公司专家团鉴定后的藏品送拍权。</p>
  	      <!-- <br/><hr/>节目录制(1次)：作为特邀贵宾带上自己的一件收藏品（须经华豫专家团合议通过）参加《华豫之门》现场节目录制。 -->
  	</div>
	 <a href="#vip" data-rel="back" class="ui-shadow ui-btn ui-corner-all" data-rel="back">返回</a>
  </div>

   <div data-role="page" id="vip4">
    <div data-role="header" data-position='fixed'>
		<h1>超级会员</h1>
	</div>
  	<div role="main" class="ui-content">
    <p>网上报名：可在本站进行《华豫之门》的鉴定海选报名。<br/><hr/>
	      浏览藏品：浏览本站收藏品库的所有信息。<br/><hr/>
	      视频观看：免费观看《华豫之门》专家团的视频讲座。<br/><hr/>
	      直达鉴定：华豫海选时，在短信预约的鉴定时间内，专享官网星级会员通道直达专家面前，快速便捷完成鉴定。<br/><hr/>
	      自有藏品展示：藏品通过专家团鉴定、合议、推荐，或登上《华豫之门》电视节目之后，会在“华豫藏品”频道下长期展示，直至交易之后。<br/><hr/>
	      藏品观摩交流：针对“华豫藏品”频道下展示的所有藏品，您与本站商务专员预约后，可到本站合作的旗舰商家实体店中，实物查看，上手观摩，或实物交易。<br/><hr/>
	      国内团购：参加本站组织的华豫专家带团团购会， 目的地为国内各类艺术品市场发源地知名商家和藏家店铺（旅行费用由旅游公司收取，仅收取藏友团出行期间住宿和交通费用的成本价，且参团合同中明确承诺：组织方在团购活动中绝不收取商家任何回扣和佣金，绝没有任何强迫性购物）。<br/><hr/>
  	      国内外拍卖(4次)：参与国内外及港澳地区顶级拍卖行一年两次的春秋大拍会，届时华豫专家现场陪同，提供指导咨询服务。<br/><hr/>
  	      藏品送拍：参加国内或国外大拍会活动后，同时享有在下次对应大拍会开始前送拍经由华豫和拍卖公司专家团鉴定后的藏品送拍权。</p>
  	      <!-- <br/><hr/>节目录制(2次)：作为特邀贵宾带上自己的一件收藏品（须经华豫专家团合议通过）参加《华豫之门》现场节目录制。 -->
  	</div>
	 <a href="#vip" data-rel="back" class="ui-shadow ui-btn ui-corner-all" data-rel="back">返回</a>
  </div>
  </body>
</html>
