<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  <title>参拍贵宾信息表_卫视文化乐园-华豫之门官方网站</title>
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <meta name=keywords content="百宝箱">
  <meta name=description content="华豫之门百宝箱">
  </head>

  <body>
  <jsp:include page="../head/header.jsp"></jsp:include>
  <style>
  #iForm{ width: 850px; margin: 20px auto; overflow: hidden; font-size: 14px; }
  #iForm p label{margin-left:200px;}
  #iForm p input{ border: 1px solid #aaa; width:300px; padding:12px 6px;border-radius: 3px;font-size: 14px;}

  #iForm div,#iForm p{width: 100%; margin: 24px 0;font-weight: normal; border-top: 1px dashed #ccc;padding-top: 24px;}
   #iForm div label{ margin: 0 24px 0 12px;}
  fieldset{border: 1px solid #ccc;  border-bottom-right-radius: 20px; font-size: 16px; font-weight: bold;padding: 24px 24px 48px 24px;}
  #submit{ width: 240px; height: 40px; line-height: 40px;  font-weight: bold;  text-align: center; margin: 20px auto; display: block;font-size: 16px; cursor: pointer; background: #810B0B; color: #fff; border-radius: 5px; box-shadow: 3px 3px 1px 0 #aaa;}
  .alertL{ position: absolute; left: 50%; height: 50%; width: 940px; height: 600px; margin: -600px 0 0 -470px;border: 10px solid #333;}
  .alertR{ display: none;}
  .xxx{position: absolute; top:0; right: 0; width: 48px; height: 48px; font-size: 48px; cursor: pointer; }
  </style>
    <div>
     <form id="iForm">
     	<input id="colloctionurl" name="colloctionurl" type="hidden" value="<%=request.getParameter("conurl") %>"/>
	<input id="cjaction" name="cjaction" type="hidden" value=""/>
	<input id="pmfs" name="pmfs" type="hidden" value=""/>
	<input id="sex" name="sex" type="hidden" value=""/>
      <fieldset>
      <legend>参拍贵宾信息表</legend>
       <div>
         <span style="margin-left: 74px;">您希望参拍哪个拍卖会(必填项)：</span>
        <input type="checkbox" value="苏富比" name="cjaction1" id="cjaction1"><label for="cjaction1">苏富比</label>
        <input type="checkbox" value="佳士得" name="cjaction2" id="cjaction2"><label for="cjaction2">佳士得</label>
       </div>
      <div>
         <span style="margin-left: 107px;">您希望的拍卖方式(必填项)：</span>
        <input type="checkbox" value="现场参拍" name="pmfs1" id="pmfs1"><label for="pmfs1">现场参拍</label>
        <input type="checkbox" value="代理参拍" name="pmfs2" id="pmfs2"><label for="pmfs2">代理参拍</label>
       </div>
       <div>
         <span style="margin-left: 202px;">性别(必填项)：</span>
        <input type="radio" value="男" name="sex" id="sex1" checked=""><label for="sex1">男</label>
        <input type="radio" value="女" name="sex" id="sex2"><label for="sex2">女</label>
       </div>
        <p><label for="fullname">姓氏(必填项)：</label>
       <input type="text" value="" name="name" id="name"></p>
       <p><label for="phone">手机(必填项)：</label>
       <input type="text" value="" name="mobile" id="mobile"></p>
       <p><label for="email">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
       <input type="text" value="" name="email" id="email"></p>
       <p><label for="weixin">微&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信：</label>
       <input type="text" value="" name="weixin" id="weixin"></p>
        <p><label for="address" style="margin-left:130px;">拟定参拍藏品-拍卖编号：</label>
        <input id="lotsid" name="lotsid" type="text" readonly="readonly" style="background:#CCCCCC;" value="<%=request.getParameter("lotsid") %>"/>
        <span style="font-size:12px;color: #999;">（无需更改，自动生成）</span>
       <input type="hidden" value="" name="address" id="address"></p>

       <div><input type="button" value="提    交" id="submit" onclick="sumbitRegister()"></div>
       </fieldset>
     </form>
     <div id="wtn" class="alertR"><img src="/images/wtn.jpg" width="940" height="600"><div class="xxx">X</div></div>
    </div>
    <script>
    // $(function(){
    // 	var wtn=$("#wtn"),iAlert=$("#iAlert"),xxx=$(".xxx");
    // 	iAlert.click(function(){
    // 		wtn.removeClass("alertR").addClass("alertL");
    // 	})
    // 	xxx.click(function(){
    // 		wtn.removeClass("alertL").addClass("alertR");
    // 	})
    // })

    function sumbitRegister(){
	if($('#cjaction1').is(':checked')||$('#cjaction2').is(':checked'))
	{
	}else{
	   alert("您希望参拍哪个拍卖会!");
	   $("#cjaction").val('');
	   return ;
	}
	if($('#cjaction1').is(':checked')){
		if($("#cjaction").val().indexOf('1')<0){
		$("#cjaction").val($("#cjaction").val()+',1');
		}

	}
	if($('#cjaction2').is(':checked')){
		if($("#cjaction").val().indexOf('2')<0){
		$("#cjaction").val($("#cjaction").val()+',2');
		}

	}

	if($('#pmfs1').is(':checked')||$('#pmfs2').is(':checked'))
	{
	}else{
	   alert("您希望的拍卖方式!");
	    $("#pmfs").val('');
	   return ;
	}

	if($('#pmfs1').is(':checked')){
		if($("#pmfs").val().indexOf('1')<0){
		$("#pmfs").val($("#pmfs").val()+',1');
		}

	}
	if($('#pmfs2').is(':checked')){
		if($("#pmfs").val().indexOf('2')<0){
		$("#pmfs").val($("#pmfs").val()+',2');
		}

	}

	if($('#sex1').is(':checked')||$('#sex2').is(':checked'))
	{
	}else{
	   alert("请选择性别!");
	   $("#sex").val('');
	   return ;
	}

	if($('#sex1').is(':checked')){
		$("#sex").val('1');
	}
	if($('#sex2').is(':checked')){
		$("#sex").val('2');
	}
	if($("#name").val()==''){
		alert('请填写姓名！');
		return;
	}
	if($("#mobile").val()==''){
		alert('请填联系电话！');
		return;
	}


	 $.post("<c:url value='/DaiGou_AddDaigou'/>", $('#iForm').serialize(),
				function(result) {
			        if(result==0000) {
						alert("您的信息已收到，卫视文化乐园客服人员会尽快与您联系，谢谢！\n 如需帮助,请致电： 0371 - 60110891 ");
						if('<%=request.getParameter("conurl") %>'!=''&&'<%=request.getParameter("conurl") %>'!='null'){
						   window.location.href="<c:url value='/redirect?p=daigou/JSD'/>";
						}else{
							window.location.href="<c:url value='/yclots/getYclotsListByspecialID'/>";
						}

					}else{
						alert("申请失败，如需帮助,请致电： 0371 - 60110891");
					}
				});
	}
    </script>
  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
