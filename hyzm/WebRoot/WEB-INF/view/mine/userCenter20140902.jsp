<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>华豫之门-用户注册</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/box111.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/userCenter.js'/>"></script>
	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
	<script type="text/javascript">
	$(document).ready(function() {
	addDate();
		$('#newemail').blur(function (){
			verifyemail();
		});

		$('#newemailcode').blur(function (){
			verifycode("newemail");
		});

		$('#oldmobilecode').blur(function (){
			verifyoldmobilecode();
		});

		$('#newmobile').blur(function (){
			verifynewmobile();
		});

		$('#newmobilecode').blur(function (){
			verifynewmobilecode();
		});

		$('#newrealname').blur(function (){
			verifynewrealname();
		});

		$('#newrealnamecode').blur(function (){
			verifycode("newrealname");
		});

		$('#newidcard').blur(function (){
			verifynewidcard();
		});

		$('#newidcardcode').blur(function (){
			verifycode("newidcard");
		});

		$('#newjobcode').blur(function (){
			verifycode("newjob");
		});

		$('#newaddress').blur(function (){
			verifynewaddress();
		});

		$('#newaddresscode').blur(function (){
			verifycode("newaddress");
		});
	});

	//修改时间
	function addDate(){

	var time = '${CurrentSession.leveltime}';
    var leveltime = time.split('-');
    var datetime = new Date(leveltime[0],leveltime[1],leveltime[2]);
    var startyear = datetime.getFullYear()-1;
    $('#starttime').empty().html(startyear+'-'+leveltime[1]+'-'+leveltime[2]);
         }

	//修改邮箱
	function verifyemail(){
		if(!checkemail($('#newemail').val())){
			$('#newemailp').empty().append("输入邮箱格式错误。");
			return false;
		}
		$('#newemailp').empty();
		return true;
	}

	function verifycode(str){
		var flag = false;
		var verifycode = $('#'+str+'code').val();
		if(verifycode.length != 6){
			$('#'+str+'codep').empty().append("* 请输入正确6位有效的手机验证码。");
		}else{
			$.ajax({type: "POST",
				dataType: "text",
				async: false,
				url: "<c:url value='/user/verifyMobileCode'/>",
				data: {mobile:'${CurrentSession.mobile}',verifycode:verifycode,d:new Date().getTime()},
				success:function(data){
					if(data == "0000"){
						$('#'+str+'codep').empty();
						flag = true;
					}else{
						$('#'+str+'codep').empty().append("验证码不正确，请重新输入。");
					}
				}
			});
		}

		return flag;
	}

	function modifyemail(){
		if(!verifyemail())
  			return false;
		if('${CurrentSession.email}' != '')
	  		if(!verifycode("newemail"))
	  			return false;
		$.ajax({type: "POST",
			dataType: "text",
			async: false,
			url: "<c:url value='/user/ModifyUser'/>",
			data: {newemail:$('#newemail').val(),d:new Date().getTime()},
			success:function(data){
				if(data == "0000"){
					$('#email').html($('#newemail').val());
					$(".forgebox1_1").hide();
					$(".forgebox_success").show();
					setTimeout(function(){$(".forgebox_success").hide();location.reload();},3000);
				}else{
					alert("修改失败");
				}
			}
		});
	}

	//修改手机号

	function verifyoldmobilecode(){
		var flag = false;
		var verifycode = $('#oldmobilecode').val();
		if(verifycode.length != 6){
			$('#oldmobilecodep').empty().append("请输入正确6位有效的手机验证码。");
		}else{
			$.ajax({type: "POST",
				dataType: "text",
				async: false,
				url: "<c:url value='/user/verifyMobileCode'/>",
				data: {mobile:'${CurrentSession.mobile}',verifycode:verifycode,d:new Date().getTime()},
				success:function(data){
					if(data == "0000"){
						$('#oldmobilecodep').empty();
						flag = true;
					}else{
						$('#oldmobilecodep').empty().append("验证码不正确，请重新输入。");
					}
				}
			});
		}
		return flag;
	}

	function verifynewmobile(){
  		var flag = false;
 		var mobile = $('#newmobile').val();
 		if(!checkmobile(mobile)){
			$('#newmobilep').empty().append("请输入11位有效的手机号码。");
			$('#newmobilesendsms').empty().append("<img src='<c:url value='/images/send_pic2.jpg'/>' align='middle'/>");
 		}else{
			$.ajax({type: "POST",
				dataType: "text",
				async: false,
				url: "<c:url value='/user/verifyMobile'/>",
				data: {mobile:mobile,d:new Date().getTime()},
				success:function(data){
					if(data == "0000"){
						$('#newmobilep').empty();
						$('#newmobilesendsms').empty().append("<a href='javascript:newmobilesendsms();'><img src='<c:url value='/images/sen_button.jpg'/>' align='middle'/></a>");
						flag = true;
					}else{
						$('#newmobilep').empty().append("该手机号已经注册过了，请使用其他手机号。");
						$('#newmobilesendsms').empty().append("<img src='<c:url value='/images/send_pic2.jpg'/>' align='middle'/>");
					}
				}
			});
		}
 		return flag;
  	}

	function verifynewmobilecode(){
		var flag = false;
		var verifycode = $('#newmobilecode').val();
		if(verifycode.length != 6){
			$('#newmobilecodep').empty().append("请输入正确6位有效的手机验证码。");
		}else{
			$.ajax({type: "POST",
				dataType: "text",
				async: false,
				url: "<c:url value='/user/verifyMobileCode'/>",
				data: {mobile:$("#newmobile").val(),verifycode:verifycode,d:new Date().getTime()},
				success:function(data){
					if(data == "0000"){
						$('#newmobilecodep').empty();
						flag = true;
					}else{
						$('#newmobilecodep').empty().append("验证码不正确，请重新输入。");
					}
				}
			});
		}
		return flag;
	}

	function modifymobile(){
		if(!verifyoldmobilecode())
  			return false;
  		if(!verifynewmobile())
  			return false;
  		if(!verifynewmobilecode())
  			return false;
		$.ajax({type: "POST",
			dataType: "text",
			async: false,
			url: "<c:url value='/user/ModifyUser'/>",
			data: {newmobile:$('#newmobile').val(),d:new Date().getTime()},
			success:function(data){
				if(data == "0000"){
					$('#mobile').html($('#newmobile').val());
					$(".forgebox2").hide();
					$(".forgebox_success").show();
					setTimeout(function(){$(".forgebox_success").hide();location.reload();},3000);
				}else{
					alert("修改失败");
				}
			}
		});
	}

	//修改姓名
	function verifynewrealname(){
		var flag = false;
		var realname = $('#newrealname').val();
		if(realname.length == 0){
			$('#newrealnamep').empty().append("请输入真实姓名。");
		}else{
			$('#newrealnamep').empty();
			flag = true;
		}
		return flag;
	}


	function modifyrealname(){
		if(!verifynewrealname())
  			return false;
		if('${CurrentSession.realname}' != '')
	  		if(!verifycode("newrealname"))
	  			return false;
		$.ajax({type: "POST",
			dataType: "text",
			async: false,
			url: "<c:url value='/user/ModifyUser'/>",
			data: {realname:$('#newrealname').val(),d:new Date().getTime()},
			success:function(data){
				if(data == "0000"){
					$('#realname').html($('#newrealname').val());
					$(".forgebox3_1").hide();
					$(".forgebox_success").show();
					setTimeout(function(){$(".forgebox_success").hide();location.reload();},3000);
				}else{
					alert("修改失败");
				}
			}
		});
	}

	//修改身份证号
	function verifynewidcard(){
		var flag = false;
		var idcard = $('#newidcard').val();
		if(idcard.length == 0){
			$('#newidcardp').empty().append("请输入身份证号。");
		}else{
			$('#newidcardp').empty();
			flag = true;
		}
		return flag;
	}

	function modifyidcard(){
		if(!verifynewidcard())
  			return false;
		if('${CurrentSession.idcard}' != '')
	  		if(!verifycode("newidcard"))
	  			return false;
		$.ajax({type: "POST",
			dataType: "text",
			async: false,
			url: "<c:url value='/user/ModifyUser'/>",
			data: {idcard:$('#newidcard').val(),d:new Date().getTime()},
			success:function(data){
				if(data == "0000"){
					$('#idcard').html($('#newidcard').val());
					$(".forgebox4_1").hide();
					$(".forgebox_success").show();
					setTimeout(function(){$(".forgebox_success").hide();location.reload();},3000);
				}else{
					alert("修改失败");
				}
			}
		});
	}

	function modifyjob(){
		if('${CurrentSession.job}' != '')
	  		if(!verifycode("newjob"))
	  			return false;
		$.ajax({type: "POST",
			dataType: "text",
			async: false,
			url: "<c:url value='/user/ModifyUser'/>",
			data: {job:$('#newjob option:selected').val(),jobname:$('#newjob option:selected').text(),d:new Date().getTime()},
			success:function(data){
				if(data == "0000"){
					$('#job').html($('#newjob option:selected').text());
					$(".forgebox5_1").hide();
					$(".forgebox_success").show();
					setTimeout(function(){$(".forgebox_success").hide();location.reload();},3000);
				}else{
					alert("修改失败");
				}
			}
		});
	}

	//修改家庭住址
	function verifynewaddress(){
		var flag = false;
		var address = $('#newaddress').val();
		if(address.length == 0){
			$('#newaddressp').empty().append("请输入家庭住址。");
		}else{
			$('#newaddressp').empty();
			flag = true;
		}
		return flag;
	}

	function modifyaddress(){
		if(!verifynewaddress())
  			return false;
		if('${CurrentSession.address}' != '')
	  		if(!verifycode("newaddress"))
	  			return false;
		$.ajax({type: "POST",
			dataType: "text",
			async: false,
			url: "<c:url value='/user/ModifyUser'/>",
			data: {address:$('#newaddress').val(),d:new Date().getTime()},
			success:function(data){
				if(data == "0000"){
					$('#address').html($('#newaddress').val());
					$(".forgebox6_1").hide();
					$(".forgebox_success").show();
					setTimeout(function(){$(".forgebox_success").hide();location.reload();},3000);
				}else{
					alert("修改失败");
				}
			}
		});
	}

	function checknames(str) {
		return str;
	}

	function checkmobile(str) {
		return str.match(/^1\d{10}$/);
	}

	function checkemail(str) {
		return str.match(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/);
	}

	function sendsms(str,type) {
		$.ajax({type: "POST",
			dataType: "text",
			url: "<c:url value='/user/SendSms'/>",
			data: {mobile:'${CurrentSession.mobile}',type:type},
			success:function(data){
				if(data == "0000"){
					fun_timedown(180,str,type);
				}else{
					alert("发送失败，请重新发送");
				}
			}
		});
	}
	function fun_timedown(time,str,type) {
		if (time == 'undefined')
			time = 60;
		$('#'+str+'sendsms').html("* 短信已发出，" + time + "秒后可再次发送");
		time = time - 1;
		if (time >= 0) {
			setTimeout("fun_timedown("+time+",'"+str+"','"+type+"')", 1000);
		} else {
			$('#'+str+'sendsms').empty().append("<a href='javascript:sendsms('"+str+"','"+type+"');'><img src='<c:url value='/images/sen_button.jpg'/>'/></a>");
		}
	}

	function oldmobilesendsms() {
		$.ajax({type: "POST",
			dataType: "text",
			url: "<c:url value='/user/SendSms'/>",
			data: {mobile:'${CurrentSession.mobile}',type:"6"},
			success:function(data){
				if(data == "0000"){
					oldmobilefun_timedown(180);
				}else{
					alert("发送失败，请重新发送");
				}
			}
		});
	}
	function oldmobilefun_timedown(time) {
		if (time == 'undefined')
			time = 60;
		$('#oldmobilesendsmsp').html("已向原手机号"+'${CurrentSession.mobile}'+"的号码发送了验证码，" + time + "秒后可再次发送。");
		time = time - 1;
		if (time >= 0) {
			setTimeout("oldmobilefun_timedown("+time+")", 1000);
			$('#oldmobilesendsms').hide();
		} else {
			$('#oldmobilesendsms').empty().append("<a href='javascript:oldmobilesendsms();'><img src='<c:url value='/images/sen_button.jpg'/>'/></a>");
		}
	}

	function newmobilesendsms() {
		$.ajax({type: "POST",
			dataType: "text",
			url: "<c:url value='/user/SendSms'/>",
			data: {mobile:$("#newmobile").val(),type:"6"},
			success:function(data){
				if(data == "0000"){
					newmobilefun_timedown(180);
				}else{
					alert("发送失败，请重新发送");
				}
			}
		});
	}
	function newmobilefun_timedown(time) {
		if (time == 'undefined')
			time = 60;
		$('#newmobilesendsmsp').html("已向新手机号"+'${CurrentSession.mobile}'+"的号码发送了验证码，" + time + "秒后可再次发送。");
		time = time - 1;
		if (time >= 0) {
			setTimeout("newmobilefun_timedown("+time+")", 1000);
			$('#newmobilesendsms').hide();
		} else {
			$('#newmobilesendsms').empty().append("<a href='javascript:newmobilesendsms();'><img src='<c:url value='/images/sen_button.jpg'/>'/></a>");
		}
	}
	</script>
</head>

<body>
  <jsp:include page="../head/header.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear">

  <jsp:include page="common/myMenu.jsp"></jsp:include>

  <div class="user_right fr clear">

     <div class="onuser">
       <div class="hb2_left fl"><p class="hb_top"><img src="<c:url value='/images/hb1_left.jpg'/>" /></p><p class="hb_bottom"><img src="<c:url value='/images/hb2_left.jpg'/>" /></p></div>

         <div class="onuser_nr fl">
         	<div class="onuser_nr_left">
         		<p>当前会员等级：
            	<c:if test="${CurrentSession.level eq 0}"><span class="hy_dj">免费会员</span></c:if>
            	<c:if test="${CurrentSession.level eq 1}"><span class="hy_dj">星级会员</span></c:if>
            	<c:if test="${CurrentSession.level eq 2}"><span class="hy_dj">贵宾会员</span></c:if>
            	<c:if test="${CurrentSession.level eq 3}"><span class="hy_dj">高级会员</span></c:if>
            	<c:if test="${CurrentSession.level eq 4}"><span class="hy_dj">超级会员</span></c:if>
            	</p>

	           	<div class="onuser_mc">
	           		当前账户余额：<span class="red">${money}</span>元
	           	</div>
	           	<div class="onuser_mc">
	           		当前账户积分：<span class="red">${points}</span>分
	           	</div>
         	</div>
         	<div class="onuser_nr_right">
         		<div class="sj_qx">
         			<p class="hy_sj"><a href="http://www.wswhly.com/redirect?p=mine/vip">会员升级</a></p>
            	  <!--<c:choose>
                  <c:when test="${CurrentSession.level eq 0}">
	                <p class="hy_qx">
	                                                    服务期限：无限期</p>
                  </c:when>
                  <c:otherwise>
                    <p class="hy_qx" style="margin-left:20px;">
	                                                    服务期限：<span id="starttime"></span> -- ${CurrentSession.leveltime}</p>
                  </c:otherwise>
                </c:choose> -->
         		</div>
                <div class="link">
                	<a href="<c:url value='/mine/mymoneylist'/>" >收支明细</a><span class="money"><a href="<c:url value='/redirect?p=mine/recharge1'/>">充值</a></span>
                </div>
                <div class="link">
                	<a href="<c:url value='/mine/mypointslist'/>" >积分明细</a>
                </div>

         	</div>
         	<p style="clear:both;">您已上传了<span class="red">${mycount}</span>件收藏品信息，感谢您为中国的收藏品文化传播所做的贡献！</p>
            <c:if test="${not empty enroll}">
            <p style="clear:both;">当前《华豫之门》鉴宝海选网上报名日期为：<span class="disblod">${enroll.begindate} -- ${enroll.enddate}</span>，您已报名<span class="red">${enrollcollection}</span>件收藏品。</p>
       		</c:if>
        	<!--  <div class="hy_jb">
            	<p>当前会员等级：
            	<c:if test="${CurrentSession.level eq 0}"><span class="hy_dj">免费会员</span></c:if>
            	<c:if test="${CurrentSession.level eq 1}"><span class="hy_dj">星级会员</span></c:if>
            	<c:if test="${CurrentSession.level eq 2}"><span class="hy_dj">贵宾会员</span></c:if>
            	<c:if test="${CurrentSession.level eq 3}"><span class="hy_dj">高级会员</span></c:if>
            	<c:if test="${CurrentSession.level eq 4}"><span class="hy_dj">超级会员</span></c:if>
            	</p>
                <p class="hy_sj"><a href="http://www.wswhly.com/redirect?p=mine/vip">会员升级</a></p>
            	  <c:choose>
                  <c:when test="${CurrentSession.level eq 0}">
	                <p class="hy_qx">
	                                                    服务期限：无限期</p>
                  </c:when>
                  <c:otherwise>
                    <p class="hy_qx">
	                                                    服务期限：<span id="starttime"></span> -- ${CurrentSession.leveltime}</p>
                  </c:otherwise>
                </c:choose>

            </div>
           <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="onuser_mc">当前账户余额：<span class="red">${money}</span>元 </td>
                <td class="link"><a href="<c:url value='/mine/mymoneylist'/>" >收支明细</a><span class="money"><a href="<c:url value='/redirect?p=mine/recharge1'/>">充值</a></span></td>
              </tr>
              <tr>
                <td class="onuser_mc">当前账户积分：<span class="red">${points}</span>分</td>
                <td class="link"><a href="<c:url value='/mine/mypointslist'/>" >积分明细</a></td>
              </tr>
            </table>
            <p>您已上传了<span class="red">${mycount}</span>件收藏品信息，感谢您为中国的收藏品文化传播所做的贡献！</p>
            <c:if test="${not empty enroll}">
            	<p>当前《华豫之门》鉴宝海选网上报名日期为：<span class="disblod">${enroll.begindate} -- ${enroll.enddate}</span>，您已报名<span class="red">${enrollcollection}</span>件收藏品。</p>
       		</c:if>  -->
       </div>
       <div class="hb2_right fr"><p class="hb_top"><img src="<c:url value='/images/hb1_right.jpg'/>" /></p><p class="hb_bottom"><img src="<c:url value='/images/hb2_right.jpg'/>" /></p></div>
     </div>

  	<div class="onuser_tit">个人信息<span class="line">--</span><span>参与《华豫之门》鉴宝海选活动网上报名，必须填写实名信息。</span></div>
     <div class="onuser_cont">
       <a href="#" target="_blank"><img src="<c:url value='/images/touxiang.jpg'/>" /></a>
       <div class="user_lis_right">
       		<div>
            	<ul class="onuser_list fl clear">
                     <li><span class="red">用户名：</span>${CurrentSession.username}</li>
                     <li>
                           <span class="red">真实姓名：</span>
                           <span class="revise forget3_1"><a href="#" >修改</a></span>
                           <span id="realname">${CurrentSession.realname}</span>
                       </li>
                     <li>
                         <span class="red">邮箱：</span>
                         <span class="revise forget1_1"><a href="#" >修改</a></span>
                         <span id="email">${CurrentSession.email}</span>
                     </li>

               </ul>
               <ul class="onuser_list fl clear">
               			<li><span class="red">注册时间：</span>${CurrentSession.createdate}</li>

                       <li class="none">
                       		<span class="red">手机号：</span>
                            <span class="revise forget2"><a href="#">修改</a></span>
                            <span id="mobile">${CurrentSession.mobile}</span></li>
                       <li>
                            <span class="red">身份证号码：</span>
                            <span class="revise forget4_1"><a href="#" >修改</a></span>
                            <span id="idcard">${CurrentSession.idcard}</span>

                       </li>

               </ul>
            </div>
            <div class="onuser_list fl clear onuser_list_bottom">
            	<ul>
                	<li>
                    	<span class="red">家庭住址：</span>
                        <span class="revise forget6_1"><a href="#">修改</a></span>
                        <span id="address">${CurrentSession.address}</span>
                    </li>
                </ul>
       </div>
       </div>
     </div>
     <p class="onuser_wz">*完善的实名信息有助于提高您的账户安全</p>

     <!--我的服务表格-->
     <div class="myserve">
     	<div class="tit_fw">我的服务</div>
     	<ul class="f_ul">
            <li></li>
            <li class="chushou li_01 cur_p">发布出售&nbsp;&nbsp;<span>?</span></li>
            <li class="jingpai li_02 cur_p">参与竞拍&nbsp;&nbsp;<span>?</span></li>
            <li class="tuangou li_03 cur_p">国内团购&nbsp;&nbsp;<span>?</span></li>
            <!--  <li class="jiemulz li_04 cur_p">特邀嘉宾&nbsp;&nbsp;<span>?</span></li>  -->
            <li></li>
            <li></li>
            <li class="guoneipm li_05 cur_p">国内拍卖&nbsp;&nbsp;<span>?</span></li>
            <li class="last_li guowaipm li_06 cur_p">国外拍卖&nbsp;&nbsp;<span>?</span></li>
        </ul>
        <ul>
            <li class="li_red">2014年</li>
            <li class="li_01"></li>
            <li class="li_02"></li>
            <li class="li_03"></li>
            <li class="li_04"></li>
            <li class="li_red">2014年秋季</li>
            <li class="li_05"></li>
            <li class="last_li li_06"></li>
        </ul>
        <ul class="last_ul">
            <li class="li_red ">历史记录</li>
            <li class="li_blue li_01"><a href="#">查看</a></li>
            <li class="li_blue li_02"><a href="#">查看</a></li>
            <li class="li_blue li_03"><a href="#">查看</a></li>
            <li class="li_blue li_04"><a href="#">查看</a></li>
            <li class="li_red">历史记录</li>
            <li class="li_blue li_05"><a href="#">查看</a></li>
            <li class="last_li li_blue li_06"><a href="#">查看</a></li>
        </ul>
        <!--指向箭头-->
        <div class="zs_jt"><img src="<c:url value='/images/jiantou7.gif'/>" /></div>
        <!--浮动说明-->
        <!--发布出售-->
        <div class="fd_chushou bg"  style="display:none"><p> 发布在《华豫之门》节目中经专家鉴定是真品的出售信息。</p></div>    <!-- 参与竞拍-->
        <div class="fd_jingpai bg" style="display:none"><p>参与本站平台发布出售收藏品的拍卖和交易。
</p></div>
		<!--国内团购-->
        <div class="fd_tuangou bg" style="display:none"><p>参加本站组织的华豫专家带团团购会， 目的地为国内各类艺术品市场发源地知名商家和藏家店铺（旅行费用由旅游公司收取，仅收取藏友团出行期间住宿和交通费用的成本价，且参团合同中明确承诺：组织方在团购活动中绝不收取商家任何回扣和佣金，绝没有任何强迫性购物）。</p></div>
        <!--节目录制-->
        <div class="fd_lz bg" style="display:none"><p>作为特邀嘉宾带上自己的一件收藏品（须经华豫专家团合议通过）参加《华豫之门》现场节目录制。</p></div>
        <!--国内拍卖-->
        <div class="fd_paimai bg" style="display:none"><p>参与国内顶级拍卖行一年两次的春秋大拍会，届时华豫专家现场陪同，提供指导咨询服务。</p></div>
        <!--国外拍卖-->
        <div class="fd_paimai2 bg" style="display:none"><p>参与国外及港澳地区一年两次的顶级春秋大拍会，届时华豫专家现场陪同，提供指导咨询服务。</p></div>
     </div>
     <div class="fw_jb"><p><a href="http://www.wswhly.com/redirect?p=mine/vip">查看会员级别服务及收费标准</a></p></div>


  </div><!--user_right end-->

</div>
<!--main style end-->

<!-- 修改姓名 弹出框 -->
  <div class="forgebox_guowai forgebox3_1">
      <div class="easyDialogBox" style="margin-top:15%;">
      <div id="easyDialogWrapper" class="easyDialog_wrapper">
          <div class="easyDialog_content">
              <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                  <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_x" id="closeBtn">×</a>
                    【 修改姓名 】
              </h4>

             <!--  <div class="easyDialog_text">
                <font color="red" style="font-size:18px;">提交成功！</font>
              </div> -->

		<!-- ////////////////////// -->
				<ul class="chang_list1">
			          <li class="mc">新姓名：</li>
			          <li><input type="text" id="newrealname" value="" maxlength="50" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" /></li>
			       	 <li class="" id="newrealnamep" style="margin-left:7px;"></li>
			        </ul>
			        <div style="height:30px;padding-left:196px;">  <!-- 修改姓名发送验证码按钮 -->
			        	<div class="tisxx" id="newrealnamesendsms" ><a class="block1" href="javascript:sendsms('newrealname','7')" style="display:block;width:93px;"><img src='<c:url value='/images/sen_button.jpg'/>' align='middle'/></a></div>
			        </div>
			        <c:if test="${not empty CurrentSession.realname}">
				        <ul class="chang_list1">
				        <li class="mc">手机验证码：</li>
					      <li><input type="text" id="newrealnamecode" maxlength="6" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" style="width:110px;" /></li>

					      <li class="codxx" id="newrealnamecodep" style="margin-left:7px;"></li>
					    </ul>

				     </c:if>
				   		 <!-- <div class="tjan"><input type="button" onclick="modifyrealname();" />
				   		</div> -->

			   <!-- ///////////////////// -->

		          <div class="easyDialog_footer">
		              <button class="btn_normal off_x">取消</button>
		              <button class="btn_highlight" id="easyDialogYesBtn" onclick="modifyrealname();">确定</button>
		          </div>

              </div>
          </div>
      </div>
  </div>


<!-- 修改手机号 弹出框 -->
  <div class="forgebox_guowai forgebox2" id="forgebox2">
      <div class="easyDialogBox" style="margin-top:5%;">
      <div id="easyDialogWrapper" class="easyDialog_wrapper">
          <div class="easyDialog_content">
              <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                  <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_x" id="closeBtn">×</a>
                    【 修改手机号码 】
              </h4>

	              <ul class="chang_list1">
			          <li class="mc"  style="color:#474747">原手机号：</li>
			          <li class="mc">${CurrentSession.mobile}</li>
			          <li class="tisxx" style="color:#474747;margin-left:12px;"><span>若原手机号已停用，请联系客服。</span></li>


		        	</ul>

		        	<div style="padding-left:196px;">
		        		<div class="tisxx" style="top:123px;" id="oldmobilesendsms" ><a class="block1" href="javascript:oldmobilesendsms()" style="display:block;width:93px;"><img src='<c:url value='/images/sen_button.jpg'/>' align='middle'/></a></div>
		        	</div>
			        <ul class="chang_list1">
			        <li class="mc">手机验证码：</li>
				      <li><input type="text" id="oldmobilecode" maxlength="6" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" style="width:110px;" /></li>

						<li class="codxx" style="margin-left:8px;" id="oldmobilecodep">

						</li>
				      <li class="codxx" style="margin-left:16px;" id="oldmobilesendsmsp"></li>


				    </ul>


					<div class="easyDialog_footer"></div>
		<!-- ////////////////////// -->
				<ul class="chang_list1">
			          <li class="mc">新手机号：</li>
			          <li><input type="text" id="newmobile" maxlength="11" value="" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" style="width:160px;" onkeyup="value=value.replace(/[^\d]/g,'') " /></li>

			          <li class="cod_no1" style="margin-left:7px;" id="newmobilep"></li>

			        </ul>
			       <div style="padding-left:196px;">
			       		<div class="tisxx" id="newmobilesendsms" ><img src='<c:url value='/images/send_pic2.jpg'/>' align='middle'/></div>
			       </div>
				        <ul class="chang_list1">
				        <li class="mc">手机验证码：</li>
					      <li><input type="text" id="newmobilecode" maxlength="6" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" style="width:110px;" /></li>

							<li class="codxx" id="newmobilecodep" style="margin-left:8px;"></li>



					      <li class="codxx" style="margin-left:16px;" id="newmobilesendsmsp"></li>

					    </ul>


		          <div class="easyDialog_footer">
		              <button class="btn_normal off_x">取消</button>
		              <button class="btn_highlight" onclick="modifymobile();">确定</button>
		          </div>

              </div>
          </div>

      </div>
  </div>


<!-- 修改邮箱 弹出框 -->
  <div class="forgebox_guowai forgebox1_1" id="forgebox1_1">
      <div class="easyDialogBox" style="margin-top:15%;">
      <div id="easyDialogWrapper" class="easyDialog_wrapper">
          <div class="easyDialog_content">
              <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                  <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_x" id="closeBtn">×</a>
                    【 修改邮箱 】
              </h4>

		<!-- ////////////////////// -->
				<ul class="chang_list1" style="margin-left:65px;">
			          <li class="mc">新邮箱：</li>
			          <li><input type="text" id="newemail" value="" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" /></li>

			          <li class="cod_no1" id="newemailp" style="margin-left:7px;"></li>

			        </ul>
			        <div style="margin-left:176px;">
			        	 <div class="tisxx" id="newemailsendsms" ><a class="block1" href="javascript:sendsms('newemail','5')" style="display:block;width:93px;"><img src='<c:url value='/images/sen_button.jpg'/>' align='middle'/></a></div>
			        </div>
			        <c:if test="${not empty CurrentSession.email}">
				        <ul class="chang_list1" style="margin-left:65px;">
				        <li class="mc">手机验证码：</li>
					      <li><input type="text" id="newemailcode" maxlength="6" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" style="width:110px;" /></li>

							<li class="codxx" id="newemailcodep" style="margin-left:7px;"></li>
					    </ul>

				     </c:if>
				   		 <!-- <div class="tjan"><input type="button" onclick="modifyrealname();" />
				   		</div> -->


			   <!-- ///////////////////// -->


		          <div class="easyDialog_footer">
		              <button class="btn_normal off_x">取消</button>
		              <button class="btn_highlight" onclick="modifyemail();">确定</button>
		          </div>

              </div>
          </div>
      </div>
  </div>



<!-- 修改身份证号 弹出框 -->
  <div class="forgebox_guowai forgebox4_1" id="forgebox4_1">
      <div class="easyDialogBox" style="margin-top:15%;">
      <div id="easyDialogWrapper" class="easyDialog_wrapper">
          <div class="easyDialog_content">
              <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                  <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_x" id="closeBtn">×</a>
                    【 修改身份证号 】
              </h4>

		<!-- ////////////////////// -->
				<ul class="chang_list1">
			          <li class="mc">新身份证号：</li>
			          <li><input type="text" id="newidcard" value="" maxlength="19" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" /></li>

			          <!-- <li class="cod_no1" id="newemailp"></li> -->
			          <li class="" id="newidcardp" style="margin-left:7px;"></li>

			        </ul>
			        <div style="padding-left:196px;">
			        	<div class="tisxx" id="newidcardsendsms" ><a class="block1" href="javascript:sendsms('newidcard','8')" style="display:block;width:93px;"><img src='<c:url value='/images/sen_button.jpg'/>' align='middle'/></a></div>
			        </div>
			        <c:if test="${not empty CurrentSession.idcard}">
				        <ul class="chang_list1">
				        <li class="mc">手机验证码：</li>
					      <li><input type="text" id="newidcardcode" maxlength="6" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" style="width:110px;" /></li>

							<li class="codxx" id="newidcardcodep" style="margin-left:7px;"></li>

					    </ul>

				     </c:if>

		          <div class="easyDialog_footer">
		              <button class="btn_normal off_x">取消</button>
		              <button class="btn_highlight" onclick="modifyidcard();">确定</button>
		          </div>

              </div>
          </div>
      </div>
  </div>

<!--修改职业-->
<div class="forgebox5_1">
    <div class="find_pass">
   <div class="find_bt"><span class="bt_wz">修改职业</span><span class="off5_1"><a href="#" onclick="">关闭</a></span></div>
        <ul class="list2_box">
          <li class="mc">新职业：</li>
          <li><select id="newjob" >
          	<c:forEach items="${jobs}" var="col">
          	<option value="${col.id}">${col.name}</option>
          	</c:forEach>
          </select></li>
        </ul>

       <c:if test="${not empty CurrentSession.job}">
	        <ul class="list2_box">
	        <li class="mc">手机验证码：</li>
		      <li><input type="text" id="newjobcode" maxlength="6" /><span id="newjobcodep"></span></li>
		    </ul>
		    <ul class="list2_box">
		      <li class="mc">&nbsp;</li>
		      <li id="newjobsendsms"><a href="javascript:sendsms('newjob','8')"><img src='<c:url value='/images/sen_button.jpg'/>' align='middle'/></a></li>
		    </ul>
	     </c:if>
    <div class="tjan"><input type="button" onclick="modifyjob();" /></div>
   <div class="hb_bottom"><p class="hb_left fl"><img src="<c:url value='/images/hb2_left.jpg'/>" /></p><p class="hb_right fr"><img src="<c:url value='/images/hb2_right.jpg'/>" /></p></div>
</div>
</div>



 <!-- 修改家庭住址 弹出框 -->
  <div class="forgebox_guowai forgebox6_1" id="forgebox6_1">
      <div class="easyDialogBox" style="margin-top:15%;">
      <div id="easyDialogWrapper" class="easyDialog_wrapper">
          <div class="easyDialog_content">
              <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                  <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_x" id="closeBtn">×</a>
                    【 修改家庭住址 】
              </h4>

             <!--  <div class="easyDialog_text">
                <font color="red" style="font-size:18px;">提交成功！</font>
              </div> -->

		<!-- ////////////////////// -->
				<ul class="chang_list1" style="margin-left:50px;" >
			          <li class="mc">新家庭住址：</li>
			          <li><input type="text" id="newaddress" value="" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" style="width:270px;" /></li>
			          <li class="" id="newaddressp" style="margin-left:7px;"></li>
			    </ul>
			    <div style="padding-left:160px;">
			    	<div class="tisxx" id="newaddresssendsms" ><a class="block1" href="javascript:sendsms('newaddress','10')" style="display:block;width:93px;"><img src='<c:url value='/images/sen_button.jpg'/>' align='middle'/></a></div>
			    </div>
			        <c:if test="${not empty CurrentSession.address}">
				        <ul class="chang_list1"  style="margin-left:50px;">
				        <li class="mc">手机验证码：</li>
					      <li><input type="text" id="newaddresscode" maxlength="6" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" style="width:110px;" /></li>
					      <li class="codxx" id="newaddresscodep" style="margin-left:7px;"></li>
					    </ul>

				     </c:if>
				   		 <!-- <div class="tjan"><input type="button" onclick="modifyrealname();" />
				   		</div> -->


			   <!-- ///////////////////// -->


		          <div class="easyDialog_footer">
		              <button class="btn_normal off_x">取消</button>
		              <button class="btn_highlight" id="easyDialogYesBtn" onclick="modifyaddress();">确定</button>
		          </div>

              </div>
          </div>
      </div>
  </div>

<!-- 修改成功 -->
<div class="forgebox_guowai forgebox_success">
      <div class="easyDialogBox" style="margin-top:15%;">
      <div id="easyDialogWrapper" class="easyDialog_wrapper">
          <div class="easyDialog_content">
              <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                  <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_x" id="closeBtn">×</a>
                    【 信息提示 】
              </h4>

              <div class="easyDialog_text">
                <font color="red" style="font-size:18px;">修改成功！</font>
              </div>

               <div class="info_text" style="margin-bottom:10px;">
                提示：该窗口将在3秒后关闭
              </div>

		<!-- ////////////////////// -->


		          <div class="easyDialog_footer">
		              <button class="btn_normal off_x winload">取消</button>
		              <button class="btn_highlight off_x winload" id="easyDialogYesBtn">确定</button>
		          </div>

              </div>
          </div>
      </div>
  </div>
<jsp:include page="../foot/footer.jsp"></jsp:include>

</body>
</html>