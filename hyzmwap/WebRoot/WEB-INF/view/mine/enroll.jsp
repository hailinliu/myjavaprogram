<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html>
<html>
  <head>

    <title>网上报名</title>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>">
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>

<script type="text/javascript">
var currentpage = 1,
pagesize = 10,
typeid = 1,
styleid = 0,
count = -1;

$(document).ready(function(){
	loaddata(1);
});

function loaddata(page){
	if(count != -1 && ((currentpage-1) * pagesize) >= count){
		$('#more').attr('disabled',"true");
		$('#more').html("无更多数据");
		return false;
	}
	$.ajax({
       type: "post",
       dataType: "json",
       url: "<c:url value='/mine/myupload'/>",
       data: {page:page, size:pagesize, d:new Date().getTime(), typeid:typeid, styleid:styleid},
       success: function(data) {
          count = data.count;
          if (count == 0) {
        	  $('#thelist').append("<li>暂无数据</li>");
			  $('#more').remove();
          }
          $.each(data.list,function(index,collection){
              var imagesrc = "<c:url value='/images/nopic.png'/>";
              if (collection.imgurl != null) {
	        	  var imgurlarray = collection.imgurl.split(',');
                  imagesrc = imgurlarray[0];
              }
              var disabledthing = "";
              if (enrollids.in_array(collection.id)){
                  disabledthing = "disabled=''";
              }
        	  $('#thelist').append("<input "+disabledthing+" type='checkbox' name='checkbox-h-6a' id='checkbox-h-6a"+index+"' data-mini='true' onclick='checkCollection("+index+","+collection.id+")'/>"
        	  +"<label for='checkbox-h-6a"+index+"'><nobr><img src='http://116.255.149.172:7080/wswhly/collection/"+imagesrc+"' class='ui-li-thumb' width='60' height='60'>&nbsp;&nbsp;<span style='font-size: 14px;vertical-align: top'>"+collection.name+"</span></nobr></label>");
          });
          $("#thelist").trigger("create");
       }
	});
}

function loadmore(){
    currentpage = currentpage + 1;
	loaddata(currentpage);
}

Array.prototype.in_array = function(e){
   for(i=0;i<this.length;i++){
	  if(this[i] == e){
	    return true;
	  }
   }
   return false;
}

var checkedid = new Array();

var enrollids = new Array();
<%
  List<Long> list = (List<Long>)request.getAttribute("enrollids");
  if (list != null && list.size() != 0) {
    for (int i=0; i<list.size(); i++) {
   %>
         enrollids[<%=i%>] = <%=list.get(i)%>;
   <%
    }
  } else {
   %>
       enrollids = [0];
   <%
  }
%>

function Enroll() {

  if ('${enroll.id}' == 0) {
	$("#noenrolldialog").popup();
	$("#noenrolldialog").popup('open');
  } else if ($('#collectionmoney').text() <= 0) {
	$("#nochoosedialog").popup();
	$("#nochoosedialog").popup('open');
  } else if ($('#usermoney').text() - $('#collectionmoney').text() < 0) {
	$("#nomoneydialog").popup();
	$("#nomoneydialog").popup('open');
  } else {
	$(".payBtn").attr("disabled", true);

	var collectionid = checkedid.join(',');
	$.ajax({
		type:'post',
        url:"<c:url value='/mine/enroll'/>",
        data:{bmid:'${enroll.id}',
            collectionid:collectionid,
            money:$('#collectionmoney').text(),
            postmsg:$('#checkPostId').val(),
            invoicename:$('#invoicenameid').val(),
            recipient:$('#recipientid').val(),
            mobile:$('#mobileid').val(),
            address:$('#addressid').val(),
            zipcode:$('#zipcodeid').val()},
            success:function(data){
              if(data == "0000")
            	{
            	$(".payBtn").attr("disabled", true);
            	$("#successdialog").popup();
            	$("#successdialog").popup('open');
            	}
              else
            	{
            	$("#nogoodenrolldialog").popup();
            	$("#nogoodenrolldialog").popup('open');
            	}
            }
	});
  }
}

function checkCollection(i, value) {
	var collection = document.getElementById("checkbox-h-6a"+i);
	if (collection.checked) {
		checkedid[i] = value;
	} else {
		checkedid[i] = '';
	}
	var num = 0;
	for (var i=0;i<checkedid.length;i++) {
		if (checkedid[i] > 0) {
           num ++;
		}
	}
	$('#collectionnum').html(num);
	$('#collectionmoney').html(num * 100+".00");

	$('#paymentid').html(num * 100+".00");

}

function reloadPage() {
	location.reload();
}

function charge(){
	location.href = "<c:url value='/redirect?p=/mine/recharge'/>";
}
// 判断 报名关闭 自动加载 遮蔽层
$(function() {
  if (${enroll.state} == 2) {
    $("#bmover").show();  // 遮蔽层出来
  }else{
    $("#bmover").hide();
  }

})
</script>
<style type="text/css">

  /*遮蔽层*/
  .bm_over{
    height:100%;width:100%;background:rgba(0,0,0,0.4);background:#000;filter:alpha(Opacity=50);-moz-opacity:0.5;opacity: 0.5;position: absolute;z-index: 1000;text-align:center;font-family:微软雅黑;/* display: none; */
  }
</style>
  </head>

  <body>
  <div data-role="page" id="demo-page" class="my-page">

<!-- 报名结束 遮蔽层！！！ -->
<div id="bmover" class="bm_over">
	<h3 style="font-size:50px;color:#F6ED10;padding-top:20%;">本期报名已结束！O(∩_∩)O</h3>
</div>

    <jsp:include page="../head/header.jsp?name=网上报名"></jsp:include>
        <ul data-role="listview">
		    <li style="color: red"><a data-ajax="false" href="<c:url value='/mine/gotoupload'/>" data-transition="flow" style="color: #40A8CF;">没有藏品？立即上传</a></li>
		</ul>
    <div role="main" class="ui-content">
	    <fieldset id="thelist" data-role="controlgroup" data-iconpos="right">
	    </fieldset>

		<button id="more" class="ui-shadow ui-btn ui-corner-all" onclick="loadmore()">更多</button>
		<!-- 报名未开启提示框 -->
		<div data-role="popup" id="noenrolldialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">本期报名暂未开始！</h3>
		    <p>请耐心等待</p>
		        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" data-rel="back">确定</a>
		    </div>
		</div>

		<!-- 未选择提示框 -->
		<div data-role="popup" id="nochoosedialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">您还没有选择藏品！</h3>
		    <p>请选择藏品</p>
		        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b" data-rel="back">确定</a>
                <a href="<c:url value="/mine/gotoupload"/>" class="ui-btn ui-corner-all ui-shadow ui-btn-inline ui-btn-b" data-transition="flow">上传图片</a>
		    </div>
		</div>

		<!-- 余额不足提示框 -->
		<div data-role="popup" id="nomoneydialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">您的余额不足！</h3>
		    <p>请先充值</p>
		        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" data-rel="back">确定</a>
		    </div>
		</div>

		<!-- 报名成功提示框 -->
		<div data-role="popup" id="successdialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">报名成功！</h3>
		      <p>1、60秒内您将收到包含报名编码的短信通知，请勿删除此短信，海选现场凭此编码进行换票。</p>
              <p>2、超过60秒没有收到短信通知，请及时联系客服人员。</p>
              <p>3、可进入收支明细查看该次支付记录，也可进入报名历史查看此次报名详情。</p>
		        <a class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" onclick="reloadPage();">确定</a>
		    </div>
		</div>

		<!-- 报名失败提示框 -->
		<div data-role="popup" id="nogoodenrolldialog" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
		    <div data-role="header" data-theme="a">
		    <h1>提示</h1>
		    </div>
		    <div role="main" class="ui-content">
		        <h3 class="ui-title">报名失败！</h3>
		    <p>请联系工作人员</p>
		        <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check" data-rel="back">确定</a>
		    </div>
		</div>
	</div>
	<ul data-role="listview" data-icon="false">
	    <li>共<span id="collectionnum" style="color: red">0</span>件藏品，总计<span id="collectionmoney" style="color: red">0.00</span>元</li>
	    <li>账户余额为<span id="usermoney" style="color: red">${money}</span>元</li>
	    <li>共需支付：<span id="paymentid" style="color: red">0.00</span>元</li>
	    <li class="ui-body ui-body-b">
            <fieldset class="ui-grid-a">
                    <div class="ui-block-a"><button onclick="charge()" class="ui-btn ui-corner-all ui-btn-a">充值</button></div>
                    <div class="ui-block-b"><button id="paybtn" onclick="Enroll()" type="button" class="ui-btn ui-corner-all ui-btn-a">支付</button></div>
            </fieldset>
        </li>
	</ul>

  </div>

  </body>
</html>
