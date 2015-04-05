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
	<script type="text/javascript">
	$(document).ready(function() {
		var level = '${CurrentSession.level}';
		if(level == '1'){
			$('#vip1').attr("disabled",true);
		}
		if(level == '2'){
			$('#vip1').attr("disabled",true);
			$('#vip2').attr("disabled",true);
		}
		if(level == '3'){
			$('#vip1').attr("disabled",true);
			$('#vip2').attr("disabled",true);
			$('#vip3').attr("disabled",true);
		}
		if(level == '4'){
			$('#vip1').attr("disabled",true);
			$('#vip2').attr("disabled",true);
			$('#vip3').attr("disabled",true);
			$('#vip4').attr("disabled",true);
		}
	});
	
	
	
	function uploadvip() {
		var value = $('input:radio:checked').val();
		if (value == undefined) {
			alert('请选择会员等级！');
			return false;
		}
		if ('${money}' < $('#paymoney').html()) {
			$("#nomoneydialog").popup();
			$("#nomoneydialog").popup('open');
	        return false;
	    }
	    
	    $.ajax({
	        type:'post',
	        async:false,
	        url:"<c:url value='/surveyInfoNum'/>",
	        data: {d:new Date().getTime()},
	        success:function(data){
	        	if(data == "\"0\"")
	        		location.href='<c:url value='/redirect?p=mine/survey'/>';
	        	else
	        		$.ajax({
			        	type:'post',
			            url:"<c:url value='/mine/vipUpdate'/>",
			            data:{userid:'${CurrentSession.id}',
			                money:value.split(",")[1],
			                level:value.split(",")[0]
			                },
			           	success:function(data){
			                 if(data == "0000"){
			                 	alert("升级成功！");
			                 	history.go(-1);
			                 } else {
			                	alert("升级失败！"+data);
			                 }
			            }
			        });
	        }
	    });
        
	}
	
	function paymoney(){
		var value = $('input:radio:checked').val();
		$('#paymoney').html(value.split(",")[1]);
	}
	
	</script>    
  </head>
  <body>
  <div data-role="page" id="vip">
  <jsp:include page="../head/header.jsp?name=会员升级"></jsp:include>
  <div data-role="content"> 
  	<form>
    <label>
    	<input type="radio" name="vip" id="vip1" value="1,1000" onclick="paymoney()">星级会员<span class="ui-li-count">1000元</span>
    </label>
    <p align="right"><a href="#vip1" data-rel="dialog" data-transition="pop">查看星级会员服务</a></p>
    <label>
    	<input type="radio" name="vip" id="vip2" value="2,10000" onclick="paymoney()">贵宾会员<span class="ui-li-count">10000元</span>
    </label>
    <p align="right"><a href="#vip2" data-rel="dialog" data-transition="pop">查看贵宾会员服务</a></p>
    <label>
    	<input type="radio" name="vip" id="vip3" value="3,20000" onclick="paymoney()">高级会员<span class="ui-li-count">20000元</span>
    </label>
    <p align="right"><a href="#vip3" data-rel="dialog" data-transition="pop">查看高级会员服务</a></p>
    <label>
    	<input type="radio" name="vip" id="vip4" value="4,30000" onclick="paymoney()">超级会员<span class="ui-li-count">30000元</span>
    </label>
    <p align="right"><a href="#vip4" data-rel="dialog" data-transition="pop">查看超级会员服务</a></p>
	</form>
	<ul data-role="listview" data-icon="false">
    <li>账户余额:<span style="color: red" id="money">${money}</span></li>
    <li>需支付:<span style="color: red" id="paymoney"></span></li>
	<button class="ui-shadow ui-btn ui-corner-all" onclick="uploadvip()">立即升级</button>
  </div>
  <jsp:include page="../foot/footer.jsp"></jsp:include>
  	<!-- 余额不足提示框 -->
	<div data-role="popup" id="nomoneydialog" data-dismissible="false">
	    <div data-role="header" data-theme="a">
	    <h1>提示</h1>
	    </div>
	    <div role="main" class="ui-content">
	        <h3 class="ui-title">您的余额不足！</h3>
	    <p>请先充值</p>
	        <a href="<c:url value='/redirect?p=/mine/recharge'/>" data-ajax="false" class="ui-btn ui-corner-all ui-shadow ui-btn-inline" >充值</a>
	        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-inline" data-rel="back">关闭</a>
	    </div>
	</div>
  </div>
  
  <div data-role="page" id="vip1">
    <div data-role="header">
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
    <div data-role="header">
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
    <div data-role="header">
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
  	      <!--  <hr/><br/>节目录制(1次)：作为特邀贵宾带上自己的一件收藏品（须经华豫专家团合议通过）参加《华豫之门》现场节目录制。-->
  	</div>
	 <a href="#vip" data-rel="back" class="ui-shadow ui-btn ui-corner-all" data-rel="back">返回</a>
  </div>
  
   <div data-role="page" id="vip4">
    <div data-role="header">
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
  	      <!--  <hr/><br/>节目录制(2次)：作为特邀贵宾带上自己的一件收藏品（须经华豫专家团合议通过）参加《华豫之门》现场节目录制。-->
  	</div>
	 <a href="#vip" data-rel="back" class="ui-shadow ui-btn ui-corner-all" data-rel="back">返回</a>
  </div>
  
  </body>
</html>
