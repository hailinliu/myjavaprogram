<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>会员等级_卫视文化乐园-华豫之门官方网站</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css"
			href="<c:url value='/css/basic.css'/>" />
		<link rel="stylesheet" type="text/css"
			href="<c:url value='/css/user.css'/>" />
		<link rel="stylesheet" type="text/css"
			href="<c:url value='/css/vip.css'/>" />
		<link rel="stylesheet" type="text/css"
			href="<c:url value='/css/box111.css'/>" />
		<link rel="stylesheet" type="text/css"
			href="<c:url value='/css/bnameinfo.css'/>" />
		<script type="text/javascript"
			src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
		<script type="text/javascript"
			src="<c:url value='/js/alert.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/js/vip.js'/>"></script>
		<meta name=keywords content="会员等级，会员服务">
		<meta name=description content="卫视文化乐园-华豫之门官方网站会员等级服务">
		<script type="text/javascript">

function vipUpload() {

	if ($.trim($('#code1').text()) == '****') {
		alert('请选择会员等级！');
	} else if (${money} < $('#code1').html()) {
        alert('支付失败！您的余额不足，请先充值！');
    } else {
	    $.ajax({
        type:'post',
        url:"<c:url value='/survey/surveyInfoNum'/>",
        success:function(data){
        var dateCnt = data.slice(1,data.length-1);
            if(dateCnt=="0"){
             $('.black_overlay').show();
             $('#light').show();
	         return ;
            }else{
            	$('#vipupbtn').attr('disabled', 'true');
             $.ajax({
        	type:'post',
            url:"<c:url value='/mine/vipUpdate'/>",
            data:{userid:'${CurrentSession.id}',
                money:$.trim(parseInt($('#code1').text())),
                level:$('#viplevelid').val()
                },

           	success:function(data){
                 if(data == "0000"){
                 	$('#vipupbtn').attr('disabled', 'true');

                   $("#vipdj2").text($.trim($("#mydengji").text()));
                	$(".forgebox_enroll").show();

                 } else {
                	alert("升级失败！");
                 }
            }
        });
        }
        }
         });

	}

 }
/*   */

  function surveyInfo(){
	   var  realname="", collectage = "",likeoption="",channel="",collectage="",hopeorganization="",organization="",service="",target="",browse="",isjoin="",isload="",ispush="",price="",suggest="",
	   collection1="",collection2="";
       var realname = document.getElementById("realnameid").value;
	   var age = $("#y").val(); //年龄
	   if(age.length==0){
	    alert("请选择出生于哪一年？");
	    return;
	   }
	    var collectageLen =$("input[name=q1]:checked").length; //收藏履历
	    if(collectageLen==0){
	     alert("请选择收藏履历");
	    return;
	    }
         collectage=$("input[name=q1]:checked").val();
	    $('input[name="VoteOption1"]:checked').each(function(){
          likeoption+=$(this).val()+',';
        });  //收藏投资品类喜好
         if(likeoption.length==0){
         alert("请选择收藏投资品类喜好")
         return;
         }
        $('input[name="VoteOption2"]:checked').each(function(){
          channel+=$(this).val()+',';
        });         //  收藏渠道
         if(channel.length==0){
         alert("请选择收藏渠道")
         return;
         }
        $('input[name="VoteOption3"]:checked').each(function(){
          hopeorganization+=$(this).val()+',';
        });         //鉴定渠道
         var q19= document.getElementById("q1_19_1").value;
         var q20= document.getElementById("q1_20_1").value;
         var q21= document.getElementById("q1_21_1").value;
        if(q19.length>0){
        organization=q19;
        }
          if(q20.length>0){
        collection1=q20;
        }
          if(q21.length>0){
        collection2=q21;
        }
         if(hopeorganization.length==0){
         alert("请选择您的藏品鉴定渠道")
            return;
         }
           if(hopeorganization.length>100){
           alert("您输入的藏品鉴定渠道内容太长")
            return;
         }
          $('input[name="VoteOption5"]:checked').each(function(){
          service+=$(this).val()+',';
        });  //服务
        var ser= document.getElementById("q1_26_1").value;

        if(ser.length>0){
          service =service+ser;
        }
         if(service.length==0){
         alert("请选择网站提供什么样的服务")
            return;
         }
         if(service.length>500){
         alert("您输入的网站服务内容太长");
            return;
         }
          $('input[name="VoteOption6"]:checked').each(function(){
          target+=$(this).val()+',';
          }); //  收藏目的
         if(target.length==0){
         alert("请选择您的收藏目的");
            return;
         }

        var browse = $("#browseid").val();  //浏览的收藏类网站
        if(browse.length>500){
          alert("您输入的收藏类网站太长");
          return;
        }
        //是否参加 海选鉴定活动
        var isjoinLen =  $("input[name=q2]:checked").length;
         if(document.getElementById("q1_29").checked==true){
         isjoin="否";
        }else if(document.getElementById("q1_30").checked==true){
         isjoin="是";
        }
         if(isjoin.length==0){
             alert("请选择是否参加 海选鉴定活动");
              return;
         }

        //  是否登上过《华豫之门》的节目播出
         if(document.getElementById("q1_31").checked==true){
         isload="未上节目";
        }else if(document.getElementById("q1_32").checked==true){
         isload="真品";
        }else if(document.getElementById("q1_33").checked==true){
         isload="仿品";
        }else if(document.getElementById("q1_34").checked==true){
         isload="登过珍宝台";
        }
           if(isload.length==0){
             alert("请选择是否登上过《华豫之门》的节目播出");
              return;
         }
        //您能接受的艺术品价位区间
        if(document.getElementById("q1_35").checked==true){
         price="2万以下";
        }else if(document.getElementById("q1_36").checked==true){
         price="5万以下";
        }else if(document.getElementById("q1_37").checked==true){
         price="10万以下";
        }else if(document.getElementById("q1_38").checked==true){
         price="50万以下";
        }else if(document.getElementById("q1_39").checked==true){
         price="100万以下";
        }else if(document.getElementById("q1_40").checked==true){
         price="100万以上";
        }
          if(price.length==0){
             alert("请选择您能接受的艺术品价位区间");
              return;
         }
        //信息推送
        if(document.getElementById("q1_41").checked==true){
         ispush="愿意";
        }else if(document.getElementById("q1_42").checked==true){
         ispush="不愿意";
        }
         if(ispush.length==0){
             alert("请选择是否愿意接收本站高端服务的信息推送");
              return;
         }
        //建议或意见

        var suggest = document.getElementById("suggestid").value;
          if(suggest.length>1000){
              alert("您输入的建议或意见内容太长");
              return;
          }
           $.ajax({
        type:'post',
        url:"<c:url value='/survey/surveyInfo'/>",
        data:{
            realname:realname,
            birth:age,
            collectage:collectage,
            likeoption:likeoption,
            channel:channel,
            hopeorganization:hopeorganization,
            organization:organization,
            collection1:collection1,
            collection2:collection2,
            service:service,
            target:target,
            browse:browse,
            isjoin:isjoin,
            isload:isload,
            price:price,
            ispush:ispush,
            suggest:suggest
        },
        success:function(data){
            if(data="0000"){
               alert("调查信息填写成功");
               $('#light').hide();
               $('.black_overlay').hide();
	           	return false;
            }else{
                alert("调查信息填写失败");
        }
        }
    });

  }
</script>
<style type="text/css">
.onuser_list .lname_info {
	color: #952708;
	height: 45px;
	line-height: 45px;
	font-size: 13px;
	font-weight: normal;
}

.onuser_list li {
	height: 45px;
	line-height: 45px;
}

.baoming {
	font-size: 14px;
	color: #fff;
}

.input_txt label {
	margin: 0 30px 0 6px;
	cursor: pointer;
}

.vip_input {
	margin-top: 16px;
	cursor: pointer;
}
</style>
	</head>

	<body>
		<jsp:include page="../head/header.jsp"></jsp:include>

		<!--main style ben-->
		<div class="main_box clear">

			<jsp:include page="common/myMenu.jsp"></jsp:include>

			<!-- 右部分-->
			<div class="user_right fr clear">
				<div class="onuser_tit2">
					会员等级
				</div>
				<p class="dengji">
					您当前的会员等级：
					<span class="red dahao" id="status" value="1"> <c:choose>
							<c:when test="${CurrentSession.level eq 0}">免费会员</c:when>
							<c:when test="${CurrentSession.level eq 1}">星级会员</c:when>
							<c:when test="${CurrentSession.level eq 2}">贵宾会员</c:when>
							<c:when test="${CurrentSession.level eq 3}">高级会员</c:when>
							<c:when test="${CurrentSession.level eq 4}">超级会员</c:when>
						</c:choose> </span>
				</p>
				<table class="table" cellspacing="1">
					<tr>
						<td colspan="6" class="tr01">
							会员级别服务及收费标准
						</td>
					</tr>
					<tr>
						<td class="red">
							会员等级
						</td>
						<td class="red">
							免费会员
						</td>
						<td class="red">
							星级会员
						</td>
						<td class="red">
							贵宾会员
						</td>
						<td class="red">
							高级会员
						</td>
						<td class="red">
							超级会员
						</td>
					</tr>
					<tr>
						<td>
							服务
						</td>
						<td>
							免费
						</td>
						<td>
							1000元
						</td>
						<td>
							10000元
						</td>
						<td>
							20000元
						</td>
						<td>
							30000元
						</td>
					</tr>
					<tr class="tr1">
						<td class="lvse ws">
							网上报名&nbsp;&nbsp;
							<span>?</span>
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
					</tr>
					<tr class="tr2">
						<td class="lvse LL">
							浏览藏品&nbsp;&nbsp;
							<span>?</span>
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
					</tr>
					<tr class="tr3">
						<td class="lvse sp">
							视频观看&nbsp;&nbsp;
							<span>?</span>
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
					</tr>

					<tr class="tr4">
						<td class="lvse jd">
							直达鉴定&nbsp;&nbsp;
							<span>?</span>
						</td>
						<td></td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
					</tr>
					<tr class="tr5">
						<td class="lvse fb">
							自有藏品展示&nbsp;&nbsp;
							<span>?</span>
						</td>
						<td></td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
					</tr>
					<tr class="tr6">
						<td class="lvse jp">
							藏品观摩交流&nbsp;&nbsp;
							<span>?</span>
						</td>
						<td></td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
					</tr>
					<tr class="tr7">
						<td class="lvse tg">
							国内团购&nbsp;&nbsp;
							<span>?</span>
						</td>
						<td></td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
					</tr>
					<tr class="tr8">
						<td height="81" class="lvse guoneipaimai">
							国内拍卖&nbsp;&nbsp;
							<span>?</span>
						</td>
						<td></td>
						<td></td>
						<td>
							2次
						</td>
						<td></td>
						<td rowspan="2" class="td_4">
							4次
						</td>
					</tr>
					<tr class="tr9">
						<td class="lvse guowaipaimai">
							国外拍卖&nbsp;&nbsp;
							<span>?</span>
						</td>
						<td></td>
						<td></td>
						<td></td>
						<td>
							2次
						</td>
					</tr>
					<!-- <tr class="tr12">
						<td class="lvse cpsp">
							藏品送拍&nbsp;&nbsp;
							<span>?</span>
						</td>
						<td></td>
						<td></td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
						<td>
							&radic;
						</td>
					</tr> -->
					<tr  class="tr12">
                <td class="lvse wangpai">网拍藏品送拍&nbsp;&nbsp;<span>?</span></td>

                <td>N件</td>
                <td>3N件</td>
                <td>6N件</td>
                <td>10N件</td>
                <td>不限</td>
            </tr>
            <tr  class="tr13">
                <td class="lvse dapaihui">大拍会藏品送拍&nbsp;&nbsp;<span>?</span></td>
                <td></td>
                <td></td>
                <td>&radic;</td>
                <td>&radic;</td>
                <td>&radic;</td>
            </tr>
					<!--  <tr class="tr10">
						<td class="lvse lz">
							特邀嘉宾&nbsp;&nbsp;
							<span>?</span>
						</td>
						<td></td>
						<td></td>
						<td></td>
						<td>
							1次
						</td>
						<td>
							2次
						</td>
					</tr>  -->
					<tr class="tr11">
						<td></td>
						<td></td>
						<td class="shengji sj1">
							<p>
								升级为星级
							</p>
						</td>
						<td class="shengji sj2">
							<p>
								升级为贵宾
							</p>
						</td>
						<td class="shengji sj3">
							<p>
								升级为高级
							</p>
						</td>
						<td class="shengji sj4">
							<p>
								升级为超级
							</p>
						</td>
					</tr>

				</table>
				<input type="hidden" id="viplevelid" />
				<div class="zs_jt">
					<img src="<c:url value='/images/jiantou7.gif'/>" alt=""/>
				</div>
				<div style="clear: both" class="sj_div">
					<p class="paymore pm">
						由&nbsp;&nbsp;
						<span class="red dahao" id="initvipid"><script>$('#initvipid').html($("#status").html());</script>
						</span>&nbsp;&nbsp;晋升为&nbsp;&nbsp;
						<span class="red dahao" id="mydengji">****</span>&nbsp;&nbsp;，&nbsp;&nbsp;需支付&nbsp;&nbsp;&nbsp;
						<span class="red dahao" id="code">****</span>&nbsp;&nbsp;&nbsp;元
					</p>
				</div>
				<div style="clear: both" class="sj_div">
					<p class="paymore">
						账户余额为
						<span class="red dahao">&nbsp;&nbsp;${money}</span>&nbsp;&nbsp;元&nbsp;&nbsp;
						<a href="javascript:window.location.reload()" class="sc">刷新</a>&nbsp;&nbsp;
						<a href="<c:url value='/redirect?p=mine/recharge1'/>" class="sc">充值</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共需支付：&nbsp;&nbsp;
						<span class="red dahao" id="code1">****</span>&nbsp;&nbsp;&nbsp;元
					</p>
				</div>
				<div class="user_right_bottom">
					<p>
						会员服务费用不可退还，您确认支付么？
					</p>
					<!-- <input type="button" value="" onclick="window.location.href='<c:url value='/redirect?p=mine/recharge1'/>'" /> -->
					<input type="button" value="" id="vipupbtn" onclick="vipUpload()" />
				</div>
				<!--浮动层-start-->
				<div class="fd_baoming bg" style="display: none">
					<p>
						可在本站进行《华豫之门》的鉴定海选报名。
					</p>
				</div>
				<div class="fd_liulan bg" style="display: none">
					<p>
						浏览本站收藏品库的所有信息。
					</p>
				</div>
				<div class="fd_guankan bg" style="display: none">
					<p>
						免费观看《华豫之门》专家团的视频讲座。
					</p>
				</div>
				<div class="fd_jianding bg" style="display: none">
					<p>
						参加华豫海选，凭借编号直接换票鉴定，无需排队领号等待。
					</p>
				</div>
				<div class="fd_chushou bg" style="display: none">
					<p>
						藏品通过专家团鉴定、合议、推荐，或登上《华豫之门》电视节目之后，会在“华豫藏品”频道下长期展示，直至交易之后。
					</p>
				</div>
				<div class="fd_jingpai bg" style="display: none">
					<p>
						针对“华豫藏品”频道下展示的所有藏品，您与本站商务专员预约后，可到本站合作的旗舰商家实体店中，实物查看，上手观摩，或实物交易。
					</p>
				</div>
				<div class="fd_tuangou bg" style="display: none">
					<p>
						参加本站组织的华豫专家带团团购会，
						目的地为国内各类艺术品市场发源地知名商家和藏家店铺（旅行费用由旅游公司收取，仅收取藏友团出行期间住宿和交通费用的成本价，且参团合同中明确承诺：组织方在团购活动中绝不收取商家任何回扣和佣金，绝没有任何强迫性购物）。
					</p>
				</div>
				<div class="fd_paimai bg" style="display: none">
					<p>
						参与国内顶级拍卖行一年两次的春秋大拍会，届时华豫专家现场陪同，提供指导咨询服务。
					</p>
				</div>
				<div class="fd_paimai2 bg" style="display: none">
					<p>
						参与国外及港澳地区一年两次的顶级春秋大拍会，届时华豫专家现场陪同，提供指导咨询服务。
					</p>
				</div>
				<div class="fd_wangpai bg" style="display:none;bottom: 262px;">
           <p>“淘宝” “华豫之门”两大品牌联合，网拍专场征集的藏品送拍权</p>
       </div>
       <div class="fd_dapaihui bg" style="display:none;bottom: 198px;">
           <p>参加国内或国外大拍会活动后，同时享有在下次对应大拍会开始前送拍经由华豫和拍卖公司专家团鉴定后的藏品送拍权。</p>
       </div>
				<!-- <div class="fd_cpsp bg" style="display: none">
					<p>
						参加国内或国外大拍会活动后，同时享有在下次对应大拍会开始前送拍经由华豫和拍卖公司专家团鉴定后的藏品送拍权。
					</p>
				</div>
				<div class="fd_lz bg" style="display: none">
					<p>
						作为特邀嘉宾带上自己的一件收藏品（须经华豫专家团合议通过）参加《华豫之门》现场节目录制。
					</p>
				</div> -->
			</div>
		</div>
		<!--user_right end-->

		<!-- 选择年 -->
		<script>
	function YYstart()
	{
	//先给年下拉框赋内容
	var y   = new Date().getFullYear();
	document.getElementById("y").options.add(new Option("请选择年",""));

	for (var i = (y-100); i < (y-10); i++) //以今年为准，前*年，后年
	     document.form1.YY.options.add(new Option(" "+ i +" 年", i));
	 	 document.form1.YY.value = y;
		document.getElementById("y").options[0].selected="true";
	    }
/*
	    if(document.attachEvent)
	          {window.attachEvent("onload", YYstart);}
	           else{
	          window.addEventListener('load', YYstart, false);}*/

	         $(function() {
	         	YYstart();
	         })


	</script>

		<div id="fade" class="black_overlay" style="height: 1320px;"></div>
		<!-- 会员信息调查表-->
		<div class="ww_box">
			<div class="content content2 white_content" id="light"
				style="padding-bottom: 60px; left: 46%;">
				<a class="close" href="javascript:void(0)"
					onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">

				</a>
				<div
					style="position: absolute; left: 453px; bottom: 10px; background: #fff; padding: 0px;">
					<input
						style="width: 150px; height: 40px; -moz-border-radius: 5px; -webkit-border-radius: 5px; background: #B82326; font-size: 20px; cursor: pointer;"
						type="button" value="提&nbsp;&nbsp;交" class="baoming vip_research "
						onclick="surveyInfo();" />

				</div>



				<div class="onuser_tit t_center" style="width: 1002px;">
					收费会员信息调查表
				</div>
				<div class="onuser_cont" style="width: 1040px;">
					<form name="form1">


						<ul class="onuser_list fl clear" style="height: auto;">
							<li style="text-align: center; color: red; font-size: 14px;">
								<p>
									为了给您提供更优质细致、高端完善的服务，请认真完善下述信息。
								</p>
							</li>
							<li>
								<span class="lname_info">您的真实姓名：</span>
								<span><input id="realnameid"  class="input_out input_text" name="realname" type="text" style="width: 120px;" /> </span>
							</li>
							<li>
								<span class="lname_info">您的年龄：</span>
								<span>出生于 <select name="YY" id="y"
										style="border: 1px solid #ccc;">
									</select> </span>
							</li>
							<li>
								<span class="lname_info">您的收藏履历：</span>
								<span> <input id="q1_1" name="q1" type="radio" value="2年以下"
										class="fl vip_input" /> <span class="fl input_txt"><label
											for="q1_1">
											2年以下
										</label> </span> <input id="q1_2" name="q1" type="radio" value="2-5年"
										class="fl vip_input" /> <span class="fl input_txt"> <label
											for="q1_2">
											2-5年
										</label> </span> <input id="q1_3" name="q1" type="radio" value="5-10年"
										class="fl vip_input" /> <span class="fl input_txt"><label
											for="q1_3">
											5-10年
										</label> </span> <input id="q1_4" name="q1" type="radio" value="10年以上"
										class="fl vip_input" /> <span class="fl input_txt"><label
											for="q1_4">
											10年以上
										</label> </span> </span>
							</li>
							<li>
								<span class="lname_info">收藏投资品类喜好：</span>
								<span style="padding-right: 15px; height: 39px;"> <input id="q1_5" type='checkbox' name='VoteOption1' value="瓷器陶器" class="fl vip_input">
										<span class="fl input_txt"><label for="q1_5">
												瓷器陶器
											</label> </span> <input id="q1_6" type='checkbox' name='VoteOption1'
											value="玉器杂项" class="fl vip_input">
											<span class="fl input_txt"><label for="q1_6">
													玉器杂项
												</label> </span> <input id="q1_7" type='checkbox' name='VoteOption1'
												value="书画古籍" class="fl vip_input">
												<span class="fl input_txt"><label for="q1_7">
														书画古籍
													</label> </span> <input id="q1_8" type='checkbox' name='VoteOption1'
													value="青铜佛像" class="fl vip_input">
													<span class="fl input_txt"><label for="q1_8">
															青铜佛像
														</label> </span> <input id="q1_9" type='checkbox' name='VoteOption1'
														value="家具木器" class="fl vip_input">
														<span class="fl input_txt"><label for="q1_9">
																家具木器
															</label> </span> <input id="q1_10" type='checkbox' name='VoteOption1'
															value="珠宝国石" class="fl vip_input">
															<span class="fl input_txt"><label for="q1_10">
																	珠宝国石
																</label> </span>
								</span>
							</li>
							<li>
								<span class="lname_info">您的收藏渠道有哪些：</span>
								<span style="padding-right: 15px; height: 39px;"> <input
										id="q1_11" type='checkbox' name='VoteOption2' value="朋友圈"
										class="fl vip_input">
										<span class="fl input_txt"><label for="q1_11">
												朋友圈
											</label> </span> <input id="q1_12" type='checkbox' name='VoteOption2'
											value="古玩城 " class="fl vip_input">
											<span class="fl input_txt"><label for="q1_12">
													古玩城
												</label> </span> <input id="q1_13" type='checkbox' name='VoteOption2'
												value="拍卖会" class="fl vip_input">
												<span class="fl input_txt"> <label for="q1_13">
														拍卖会
													</label> </span> <input id="q1_14" type='checkbox' name='VoteOption2'
													value="商家" class="fl vip_input">
													<span class="fl input_txt"><label for="q1_14">
															商家
														</label> </span> <input id="q1_15" type='checkbox' name='VoteOption2'
														value="网络购买" class="fl vip_input">
														<span class="fl input_txt"><label for="q1_15">
																网络购买
															</label> </span>
								</span>
							</li>
							<li style="height: 90px;">
								<span class="lname_info"
									style="height: 90px; line-height: 2.5; padding-top: 14px; margin-right: 0;">您的藏品经常或希望通过哪些渠道进行价值鉴定：</span>
								<span
									style="padding-right: 15px; height: 45px; padding-left: 15px;">
									<input id="q1_16" type='checkbox' name='VoteOption3'
										value="朋友圈" class="fl vip_input">
										<span class="fl input_txt"><label for="q1_16">
												朋友圈
											</label> </span> <input id="q1_17" type='checkbox' name='VoteOption3'
											value="古玩商 " class="fl vip_input">
											<span class="fl input_txt"><label for="q1_17">
													古玩商
												</label> </span> <input id="q1_18" type='checkbox' name='VoteOption3'
												value="商家朋友" class="fl vip_input">
												<span class="fl input_txt"><label for="q1_18"
														>
														商家朋友
													</label> </span>
										<span> <input id="q1_19" type='checkbox'
											name='VoteOption3' value="专业鉴定机构" class="fl vip_input" /> <span
										class="fl input_txt"><label for="q1_19"
												style="margin-right: 5px;">
												专业鉴定机构
											</label> </span> <input id="q1_19_1" rel="q1_1" class="input_out input_text"
											name="" type="text" style="width: 240px;" class="fl" /> </span>
								</span>
								<span
									style="border-top: 1px dotted #bcbcbc; padding-left: 15px; width: 824px;">
									 <span>
										<input id="q1_20" type='checkbox' name='VoteOption3'
											value="行业类项专家" class="fl vip_input"
											>
											<span class="fl input_txt"><label for="q1_20"
													style="margin-right: 5px;">
													行业类项专家
												</label> </span> <input id="q1_20_1" class="input_out input_text" name=""
												type="text" style="width: 240px;" class="fl" />
								</span> <span> <input id="q1_21" type='checkbox'
											name='VoteOption3' value="华豫之门专家" class="fl vip_input"
											style="margin-left: 26px;">
											<span class="fl input_txt"><label for="q1_21"
													style="margin-right: 5px;">
													华豫之门专家
												</label> </span> <input id="q1_21_1" class="input_out input_text" name=""
												type="text" style="width: 240px;" class="fl" />
								</span> </span>

							</li>

							<li>
								<span class="lname_info"
									style="height: 50px; line-height: 1.5; padding-top: 3px;">您希望网站提供什么样的服务：</span>
								<span style="height: 39px;"> <input id="q1_22"
										type='checkbox' name='VoteOption5' value="出手藏品"
										class="fl vip_input">
										<span class="fl input_txt"><label for="q1_22">
												出手藏品
											</label> </span> <input id="q1_23" type='checkbox' name='VoteOption5'
											value="购买藏品 " class="fl vip_input">
											<span class="fl input_txt"><label for="q1_23">
													购买藏品
												</label> </span> <input id="q1_24" type='checkbox' name='VoteOption5'
												value="鉴定估值" class="fl vip_input">
												<span class="fl input_txt"><label for="q1_24">
														鉴定估值
													</label> </span> <input id="q1_25" type='checkbox' name='VoteOption5'
													value="浏览其他信息" class="fl vip_input">
													<span class="fl input_txt"><label for="q1_25">
															浏览其他信息
														</label> </span>
								</span>
								<span> <input id="q1_26" type='checkbox'
										name='VoteOption5' value="其他" class="fl vip_input">
										<span class="fl input_txt"><label for="q1_26"
												style="margin-right: 5px;">
												其他
											</label> </span> <input id="q1_26_1" class="input_out input_text" name=""
											type="text" style="width: 300px;" class="fl vip_input" />
								</span>
							</li>
							<li>
								<span class="lname_info">您的收藏目的：</span>
								<span style="padding-right: 15px; height: 39px;"> <input
										id="q1_27" type='checkbox' name='VoteOption6' value="个人爱好"
										class="fl vip_input">
										<span class="fl input_txt"><label for="q1_27">
												个人爱好
											</label> </span> <input id="q1_28" type='checkbox' name='VoteOption6'
											value="投资 " class="fl vip_input">
											<span class="fl input_txt"><label for="q1_28">
													投资
												</label> </span>
								</span>
							</li>
							<li>
								<span class="lname_info">您经常浏览的收藏类网站：</span>
								<span><input id="browseid" class="input_out input_text"
										name="browse" type="text" style="width: 778px;"
										class="fl vip_input" /> </span>
							</li>
							<li>
								<span class="lname_info"
									style="height: 50px; line-height: 1.5; padding-top: 3px;">您是否曾经参加过《华豫之门》的海选鉴定活动：</span>
								<span> <input id="q1_29" name="q2" type="radio" value="1"
										class="fl vip_input" /> <span class="fl input_txt"><label
											for="q1_29">
											否
										</label> </span> <input id="q1_30" name="q2" type="radio" value="2"
										class="fl vip_input" /> <span class="fl input_txt"><label
											for="q1_30">
											是
										</label> </span> </span>
							</li>
							<li>
								<span class="lname_info"
									style="line-height: 1.5; padding-top: 3px;">您的藏品是否登上过《华豫之门》的节目播出：</span>
								<span> <input id="q1_31" name="q3" type="radio" value="1"
										class="fl vip_input" /> <span class="fl input_txt"><label
											for="q1_31" style="margin-right: 50px;">
											未上节目
										</label> </span> <span class="fl">上过节目&nbsp;[&nbsp;</span> <input id="q1_32"
										name="q3" type="radio" value="1" class="fl vip_input" /> <span
									class="fl input_txt" style="font-size: 14px;"><label
											for="q1_32" style="margin-right: 8px;">
											真品&nbsp;、
										</label> </span> <input id="q1_33" name="q3" type="radio" value="1"
										class="fl vip_input" /> <span class="fl input_txt"
									style="font-size: 14px;"><label for="q1_33"
											style="margin-right: 0;">
											仿品
										</label>]</span> <input id="q1_34" name="q3" type="radio" value="1"
										class="fl vip_input" style="margin-left: 50px;" /> <span
									class="fl input_txt"><label for="q1_34">
											登过珍宝台
										</label> </span> </span>
							</li>
							<li>
								<span class="lname_info">您能接受的艺术品价位区间：</span>
								<span> <input id="q1_35" name="q4" type="radio" value="1"
										class="fl vip_input" /> <span class="fl input_txt"><label
											for="q1_35">
											2万以下
										</label> </span> <input id="q1_36" name="q4" type="radio" value="2"
										class="fl vip_input" /> <span class="fl input_txt"><label
											for="q1_36">
											5万以下
										</label> </span> <input id="q1_37" name="q4" type="radio" value="1"
										class="fl vip_input" /> <span class="fl input_txt"><label
											for="q1_37">
											10万以下
										</label> </span> <input id="q1_38" name="q4" type="radio" value="1"
										class="fl vip_input" /> <span class="fl input_txt"><label
											for="q1_38">
											50万以下
										</label> </span> <input id="q1_39" name="q4" type="radio" value="1"
										class="fl vip_input" /> <span class="fl input_txt"><label
											for="q1_39">
											100万以下
										</label> </span> <input id="q1_40" name="q4" type="radio" value="1"
										class="fl vip_input" /> <span class="fl input_txt"><label
											for="q1_40">
											100万以上
										</label> </span> </span>
							</li>
							<li>
								<span class="lname_info"
									style="height: 50px; line-height: 1.5; padding-top: 3px;">您是否愿意接收本站高端服务的信息推送：</span>
								<span> <input id="q1_41" name="q5" type="radio" value="1"
										class="fl vip_input" /> <span class="fl input_txt"><label
											for="q1_41">
											愿意
										</label> </span> <input id="q1_42" name="q5" type="radio" value="2"
										class="fl vip_input" /> <span class="fl input_txt"><label
											for="q1_42">
											不愿意
										</label> </span> </span>
							</li>

							<li style="height: 62px; text-align: center; line-height: 20px;">
								<p class="t_bold fl"
									style="font-weight: normal; font-size: 13px; height: 62px; border-right: 1px dotted #bcbcbc; width: 185px; line-height: 62px; color: #952708;">
									您的其他建议或意见：
								</p>
								<textarea id="suggestid" name="suggest"
									style="height: 61px; width: 837px; font-size: 14px; resize: none; float: left;"></textarea>
							</li>

						</ul>
					</form>
				</div>
       </div></div>


				<!-- vip会员弹出框 -->

				<div class="forgebox_enroll">
					<div class="easyDialogBox">
						<div id="easyDialogWrapper" class="easyDialog_wrapper"
							style="display: block; margin: 0px;">
							<div class="easyDialog_content">
								<h4 class="easyDialog_title" id="easyDialogTitle"
									style="cursor: move;">
									<a href="<c:url value='/user/UserCenter'/>" title="关闭窗口"
										class="close_btn off_enroll" id="closeBtn">×</a> 【 信息提示 】
								</h4>

								<div class="easyDialog_text" style="width: 240px;">
									<font color="#d6d6d6" style="font-size: 16px;"> 恭喜您升级为：</font>&nbsp;&nbsp;
									<span id="vipdj2" class="iomred" style="font-size: 20px;"></span>
								</div>

								<!-- <div class="info_text">
                恭喜您升级为：
              </div> -->

								<!--  <div class="info_text info_textmoney">
                您当前账户余额：
                  <span id="success_currentmoney"></span>
                  元， 参与活动需支付：
                  <span id="success_money"></span>
                  元。

              </div> -->

								<div class="info_text a_sj">

									<a href="<c:url value='/user/UserCenter'/>"
										style="margin-left: 205px;"> 返回个人中心 </a>

									<a href="<c:url value='/user/UserCenter'/>"
										style="margin-left: 20px;"> 关闭窗口 </a>

									<!-- <a href="javascript:void(0)" onclick="location.reload()">关闭窗口</a> -->
								</div>



								<!--  <div class="easyDialog_footer">
              <button class="btn_normal" id="easyDialogNoBtn">取消</button>
              <button class="btn_highlight" id="easyDialogYesBtn">确定</button>
          </div> -->
							</div>
						</div>
					</div>
				</div>
				<script type="text/javascript">

/*
	$(function(){
		$(".shengji").click(function(){
			$("#light").css("display","block");
			$("#fade").css("display","block");
		});

		*/
	  $(function(){
		$(".shengji").click(function(){
		  $.ajax({
        type:'post',
        url:"<c:url value='/survey/surveyInfoNum'/>",
        success:function(data){
        var dateCnt = data.slice(1,data.length-1);
            if(dateCnt=="0"){
             $('.black_overlay').show();
             $('#light').show();
	         return ;
            }
        }
         });

		});


	})
$(function(){
	 $.ajax({
        type:'post',
        url:"<c:url value='/survey/surveyInfoNum'/>",
        success:function(data){
        var dateCnt = data.slice(1,data.length-1);
             if(dateCnt=="0"&&${CurrentSession.level}>0){
             $('.black_overlay').show();
             $('#light').show();
	         return ;
            }
        }
      });
});
		/*
		$(".vip_research").click(function(){
			alert("请填写内容");
     	})
     */
</script>


			</div>
			<!--main style end-->

			<jsp:include page="../foot/footer.jsp"></jsp:include>
	</body>
</html>
