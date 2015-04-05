<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>网上报名</title>

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

<script type="text/javascript">
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
$(function(){
myCollection(1,9);
})
function myCollection(currentPage, pageSize) {
  $.ajax({
        type:'get',
        url:"<c:url value='/mine/getMyCollections'/>",
        data:'currentPage='+currentPage+'&pageSize='+pageSize,
        success:function(data){
            var result = eval("("+data+")");
            var j = (currentPage-1)*pageSize;
            $('#mycollectiontable').empty().append("<tr><th>编号</th><th>上传时间</th><th>名称</th><th class='none'>参加本次海选</th></tr>");
            $.each(result.list, function (i, o) {
                 if (result.count == 0) {
                  $('#mycollectiontable').append("<tr><td colspan='4'><span class='red'>您还没有上传过藏品哦！！！</span></td></tr>");
                 } else {
                    if (enrollids.in_array(o.id)) {
                     $('#mycollectiontable').append("<tr><td><span class='red'>"+o.serialnum+"</span></td><td><span class='red'>"+o.uploaddate+"</span></td><td><span class='red'>"+o.name+"</span></td><td class='none'></td></tr>");
                    } else {
                       j=j+1;
                       if (checkedid[j] == o.id) {
                  $('#mycollectiontable').append("<tr><td><span class='red'>"+o.serialnum+"</span></td><td><span class='red'>"+o.uploaddate+"</span></td><td><span class='red'>"+o.name+"</span></td><td class='none'><input id='checkCollectionId"+j+"' type='checkbox' name='collectionid' value='"+o.id+"' checked='checked' onclick='checkCollection("+j+","+o.id+")'/></td></tr>");
                       } else {
                  $('#mycollectiontable').append("<tr><td><span class='red'>"+o.serialnum+"</span></td><td><span class='red'>"+o.uploaddate+"</span></td><td><span class='red'>"+o.name+"</span></td><td class='none'><input id='checkCollectionId"+j+"' type='checkbox' name='collectionid' value='"+o.id+"' onclick='checkCollection("+j+","+o.id+")'/></td></tr>");
                       }
                    }
                 }
            });
        }
    });
}

function checkCollection(i, value) {
  var collection = document.getElementById("checkCollectionId"+i);
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


function checkPostMsg() {
  var cpm = document.getElementById("checkPostId");
  if (cpm.checked) {
       $('#postMsgId').show();
       $('#postTellId').show();
  } else {
       $('#postMsgId').hide();
       $('#postTellId').hide();
    }
}

function Enroll() {
  if ('${enroll.id}' == 0) {

  alert("本期报名暂未开始");
  } else if ($('#collectionmoney').text() <= 0) {
  alert("您还没有选择藏品");
  } else if ($('#usermoney').text() - $('#collectionmoney').text() < 0) {
  alert("您的余额不足，请充值");
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
            if(data = "0000")

              {
                  $("#payBtn").attr('disabled', true);
                  $("#payBtn").css({
                    background: '#8B8B8B',
                    color: '#fff'
                  });
                  $("#payBtn").val("已支付")
                $(".forgebox_guowai").show();
              }

            else
              {alert("报名失败");}
        }
  });
  }
}

// 判断 报名关闭 自动加载 遮蔽层
$(function() {
  if ('${enroll.id}' == 0) {

  // $("#bmover").show();
  }
 // alert('${enroll.id}');
})
</script>

<!-- 点击查看网络报名鉴定流程 -->
<style type="text/css">
  .djck:link,.djck:visited{color:#0000CC;text-decoration:underline;font-size:16px;font-family:"微软雅黑"；}
  .djck:hover{color:#a00104;}

  /*遮蔽层*/
  .bm_over{
    height:100%;width:100%;background:rgba(0,0,0,0.4);background:#000;filter:alpha(Opacity=50);-moz-opacity:0.5;opacity: 0.5;position: absolute;z-index: 1000;text-align:center;font-family:微软雅黑;display: none;
  }
</style>


  </head>

  <body >
<jsp:include page="../head/header.jsp"></jsp:include>

    <!--main style ben-->
<div class="main_box clear">

  <jsp:include page="common/myMenu.jsp"></jsp:include>

<div class="user_right fr clear" style="position:relative;width:892px;">

<!-- 报名结束 遮蔽层！！！ -->
<div id="bmover" class="bm_over">
    <h3 style="font-size:50px;color:#F6ED10;padding-top:40%;">本期报名已结束！O(∩_∩)O</h3>
</div>

     <div class="onuser_tit2">网上报名<span class="line">--</span><span>河南卫视《华豫之门》鉴宝海选活动网上报名</span></div>

     <div class="onuser_box4 clear" style="padding-top:0" >
        <div class="auditions">
          <!-- <h1>
            <c:choose>
              <c:when test="${enroll.id == 0}">
                          当前没有报名信息
              </c:when>
              <c:otherwise>
                ${enroll.title}
              </c:otherwise>
            </c:choose>
          </h1>
            <ul>
              <li>地点：</li>
                <li>时间：</li>
                <li>莅临专家：</li>
                <li>行车路线：</li>
                <li>住宿指引：</li>
            </ul> -->
            <div style="position:relative;">
              <img src="<c:url value='/images/place_bg.png'/>" usemap="#Map" style="border-bottom:1px solid #d6d1cb;" alt="网上报名流程介绍" />
              <map name="Map" id="Map">
          <area shape="rect" coords="47,147,163,179" href="#zc" target="_blank" />
          <area shape="rect" coords="113,66,206,101" href="<c:url value='/mine/gotoupload'/>" target="_blank" />
          <area shape="rect" coords="222,147,310,182" href="<c:url value='/mine/gotoenroll'/>" target="_blank" />
          <area shape="rect" coords="458,67,531,99" href="<c:url value='/redirect?p=mine/recharge1'/>" target="_blank" />
          <area shape="rect" coords="529,147,620,182" href="<c:url value='/mine/gotoenroll'/>" target="_blank" />
        </map>
        <p style="font-size:24px;font-weight:bold;position:absolute;top:15px;left:330px;color:#66BCE9;">网上报名流程介绍</p>
        <p style="position:absolute;bottom:20px;right:20px;font-size:14px;background:url(../images/lithand.png) no-repeat center right;padding-right:20px;"><a href="<c:url value='/redirect?p=haixuan'/>" target="_blank" class="djck">点击查看网络报名现场鉴定流程</a></p>
            </div>

            <div class="bm">
                <h3 style="margin-top:10px;">网上报名有何好处？</h3>
                <p>1.海选现场无需排号等候，提前安排行程，大大缩短现场排队等候时间。</p>
                <p>2.可获得本站消积分，积分用于参加以后网站的活动和优惠措施。</p>
                <p>报名缴费成功后，您将收到一条含报名编码的短信通知，在海选现场凭报名编码进行确认。报名费恕不退还。</p>
                <p style="color: #DD6F75;margin-top:6px;">温馨提示：网上报名可以提前安排鉴定时间，并不能在网上进行藏品鉴定。还需藏友带上您的藏品来到活动现场，由专家为您亲自鉴定。</p>

            </div>
        </div>
    <p style="font-size:14px;color:#fff;font-weight:normal;" class="onuser_tit2">预约鉴定时间，当前已排序至：${enrolltime}</p>
          <div class="onuser_tit3"><span class="blod fl">确认藏品信息</span><span class="fr">没有信息？<a id="a_upload" href="<c:url value='/mine/gotoupload'/>">立刻上传</a></span></div>
             <div class="wsbm_box clear">
                  <table id="mycollectiontable" width="100%" border="0" cellspacing="0" cellpadding="0" class="bmls">
                      <tr>
                        <th>编号</th>
                        <th>上传时间</th>
                        <th>名称</th>
                        <th class="none">参加本次海选</th>
                      </tr>
              </table>
            </div>

        <c:if test="${mypage > 1}">
            <div class="paging2 clear">
                <ul class="paging_list2">
                     <li class="bg_box"><a href="javascript:void(0)" onclick="myCollection(1,9)">首页</a></li>
                     <%
                       Integer mypage = (Integer)request.getAttribute("mypage");
                       for (int i=1;i<=mypage;i++) {
                     %>
                         <li><a href="javascript:void(0)" onclick="myCollection(<%=i%>,9)"><%=i%></a></li>
                     <%
                       }
                     %>
                     <li class="bg_box"><a href="javascript:void(0)" onclick="myCollection(${mypage},9)">末页</a></li>
                </ul>
            </div>
        </c:if>

        <div class="pay">
          <p>单件（套、对）藏品海选收取报名鉴定费<span class="red">100</span>元，您共选择了<span id="collectionnum" class="red">0</span>件藏品，累计费用<span id="collectionmoney" class="red">0.00</span>元</p>
            <p>账户余额为<span id="usermoney" class="red">${money}</span>元<a href="javascript:location.reload()">刷新</a> <a href="<c:url value='/redirect?p=mine/recharge1'/>">充值</a>共需支付：<span id="paymentid" class="red">0.00</span>元</p>
            <div class="mt38">
              <ul class="mt38_list fr" style="position:relative;">
                <li>报名费不可退还，您确认支付么？</li>
                <li><input class="payBtn" id="payBtn" type="button" onclick="Enroll()"/></li>

              </ul>
           </div>
            <p class="fp"><input id="checkPostId" type="checkbox" value="1" onclick="checkPostMsg()"/>索要发票</p>
        </div>

       <div id="postMsgId" class="postMsg" style="display: none">
              <ul class="longTxt">
                 <li><label>发票名称：</label></li>
                 <li><input id="invoicenameid" type="text" placeholder="请输入姓名或单位名称" value="请输入姓名或单位名称" onfocus="if(value=='请输入姓名或单位名称'){value=''}"/></li>
              </ul>

              <ul class="shortTxt">
                 <li><label>收件人：</label></li>
                 <li class="short1"><input id="recipientid" type="text" placeholder="请输入收件人" value="请输入收件人" onfocus="if(value=='请输入收件人'){value=''}"/></li>
                 <li><label>电话：</label></li>
                 <li class="short2"><input id="mobileid" type="text" placeholder="请输入电话号码" value="请输入电话号码" onfocus="if(value=='请输入电话号码'){value=''}"/></li>
              </ul>

               <ul class="longTxt">
                   <li><label>邮寄地址：</label></li>
                   <li><input id="addressid" type="text" placeholder="请输入邮件地址" value="请输入邮件地址" onfocus="if(value=='请输入邮件地址'){value=''}"/></li>
                </ul>

             <ul class="shortTxt">
               <li><label>邮编：</label></li>
               <li class="short3"><input id="zipcodeid" type="text" placeholder="请输入邮编" value="请输入邮编" onfocus="if(value=='请输入邮编'){value=''}"/></li>
             </ul>

     </div>
      <p id="postTellId" class="red" style="display: none">*发票邮寄费用由网站负责。</p>

     </div>

  </div><!--user_right end-->

</div>
<!--main style end-->

<!--<div class="forgebox_enroll">
    <div class="find_pass">
   <div class="find_bt"><span class="bt_wz">支付成功！</span><span class="off_enroll"><a href="javascript:void(0)" onclick="location.href='<c:url value="/mine/applicationHistory"/>'">关闭</a></span></div>
    <table width="100%" height="50%"><tr><td align="center"><font color="red" style="font-size:x-large;">支付成功！</font></td></tr><tr><td align="center">
      <p>60秒内您将收到包含报名编码的短信通知，请勿删除此短信，海选现场凭此编码进行确认。</p>
      <p>超过60秒没有收到短信通知，请及时联系客服人员。</p>
      <p>可进入收支明细查看该次支付记录，也可进入报名历史查看此次报名详情。</p>
<span class="off_enroll"><a href="javascript:void(0)" onclick="location.href='<c:url value="/mine/applicationHistory"/>'">关闭窗口</a></span></td></tr></table>
   <div class="hb_bottom"><p class="hb_left fl"><img src="<c:url value='/images/hb2_left.jpg'/>" /></p><p class="hb_right fr"><img src="<c:url value='/images/hb2_right.jpg'/>" /></p></div>
</div>
</div>-->


<div class="forgebox_guowai" style="display: none; margin: 0px;">
      <div class="easyDialogBox">
      <div id="easyDialogWrapper" class="easyDialog_wrapper" style="display: block; margin: 0px;">
          <div class="easyDialog_content">
              <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                  <a href="javascript:void(0)" onclick="location.href='<c:url value="/mine/applicationHistory"/>'" title="关闭窗口" class="close_btn off_guowai" id="closeBtn">×</a>
                    【 信息提示 】
              </h4>

              <div class="easyDialog_text">
                <font color="red" style="font-size:18px;">提交成功！</font>
              </div>

              <div class="info_text" style="height:150px;text-align:left;padding:0 31px;">
                <p>1、60秒内您将收到包含报名编码的短信通知，请勿删除此短信，海选现场凭此编码进行确认。</p>
                <p>2、超过60秒没有收到短信通知，请及时联系客服人员。</p>
                <p>3、可进入收支明细查看该次支付记录，也可进入报名历史查看此次报名详情。</p>
              </div>

              <!-- <a href="javascript:void(0)" onclick="location.href='<c:url value="/mine/applicationHistory"/>'">关闭窗口</a> -->
              </div>



         <!--  <div class="easyDialog_footer">
              <button class="btn_normal" id="easyDialogNoBtn">取消</button>
              <button class="btn_highlight" id="easyDialogYesBtn">确定</button>
          </div> -->
              </div>
          </div>
      </div>
  </div>


  <!-- dddddddd -->


<jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
