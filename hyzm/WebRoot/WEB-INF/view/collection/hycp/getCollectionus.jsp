<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String id="";
if(request.getParameter("id")!=null && !"".equals(request.getParameter("id"))){
  id=request.getParameter("id");
}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>${collection.name}_卫视文化乐园-华豫之门官方网站</title>

  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>

  <script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  <meta name=keywords content="${collection.name}">
  <meta name=description content="卫视文化乐园-华豫之门官方网站,${collection.name}">
   <script>
    function orederLook() {

     var orderid='<%=id %>';
     var collectionname='${collection.name}';
      $.ajax({
          type: "POST",
      dataType: "text",
      url: "<c:url value='/collection/addCollectionOrder'/>",
      data: {orderid:orderid,state:'1',collectionname:collectionname},
      success:function(data){
      $('#but').css({"background":"#ccc"});
      $('#but').attr({"disabled":"disabled"});
      $('#collectionsuc').empty().append("预约成功，2个工作日内将有商务专员与您联系，请保持通讯畅通。");
      //$('#time').empty().append("此件藏品，您已于2014-08-01 13:13 提交过预约了。");
      }
    });
    }
   function orederLooks() {
     var my_element=$(".login");
     if(my_element.length>0){
        //$('#login_box').show();       // 未登录 弹出登陆框！
        $("#login_box").addClass('mod_show');

        return false;
       }
     var orderid='<%=id %>';
      $.ajax({
          type: "POST",
      dataType: "text",
      url: "<c:url value='/collection/getCollectionOrder'/>",
      data: {orderid:orderid},
      success:function(data){
      //alert(data);
      var str=data.split("=");
      var s=str[1].substring(0,16);
      if(str[0]=='0'){
        if(str[2] =='0'){
        $('#collectionsuc').empty().append("对不起，仅星级以上会员才能观摩预约。 <a style='color:blue' href='<c:url value='/mine/gotovip'/>'>查看会员级别服务及收费标准</a>");
        }else{
        orederLook();
        }
      }else{
      $('#but').css({"background":"#ccc"});
      $('#but').attr({"disabled":"disabled"});
        var mess="此件藏品，您已于&nbsp;"+s+"&nbsp;提交过预约了。"
      $('#time').empty().append(mess);
      }

      }
    });
    }


   </script>
  </head>
  <body>
  <jsp:include page="../../head/header.jsp"></jsp:include>

<jsp:include page="../../banner/banner.jsp"></jsp:include>

<a style="color:blue"></a>
<!--main style ben-->
<div class="main_box clear">
   <div class="scpjs_pic">
      <span class="bread_nav">当前位置：首页<span class="jt">></span>${collection.typename}<span class="jt">></span> <a href="#" target="_blank">${collection.name}</a></span>
   </div>
   <div class="scpjs_nr clear">
     <img src="${collection.imgurltitle}" alt="${collection.name}" />
     <div class="scpjs_list">
         <table width="100%" border="0" cellspacing="1" cellpadding="1" style="text-align:left;">
              <tr>
                <td class="red">收藏品名称：</td>
                <td>${collection.name}</td>
              </tr>
              <tr>
                <td class="red">收藏品编号：</td>
                <td>${collection.serialnum}</td>
              </tr>
              <tr>
                <td class="red">所属类别：</td>
                <td>${collection.typename}</td>
              </tr>
              <c:if test="${not empty col.tvnum }">
                 <tr>
                   <td class="red">节目期号：</td>
                   <td>${col.tvnum}</td>
                 </tr>
                 </c:if>
                 <c:if test="${empty col.tvnum && not empty col.style}">
                   <tr>
                   <td class="red">推荐专家：</td>
                   <td>
                   <c:choose>
                 <c:when test="${collection.style eq 18}">王育成</c:when>
                 <c:when test="${collection.style eq 19}">余光仁</c:when>
                 <c:when test="${collection.style eq 20}">黄鼎</c:when>
                 <c:when test="${collection.style eq 21}">高明利</c:when>
                 <c:when test="${collection.style eq 22}">陈建明</c:when>
                 <c:when test="${collection.style eq 23}">古方</c:when>
                </c:choose>
               </td>
                 </tr>
               </c:if>

            </table>
             <div style="padding-left:25px;padding-top:5px;color:#817429;padding-bottom:10px;">
                         <span style="font-size:25px;"> <em style="font-style: italic;font-weight:bold;">若</em>
                         </span>
                         &nbsp;有意上手观摩，实物交流，
                      </div>

            <div style="color:#817429;padding-bottom:10px;padding-left:10px;font-size:14px;">
               &nbsp;&nbsp;请致电&nbsp;
               <span style="font-size:16px;">0371-60110891</span>
               <!-- ,&nbsp;
               <span style="font-size:16px;">18790282811</span>
               ， -->
               &nbsp;或点击
               <input type="button" id="but" value="观摩预约" style="background:#A10005;height:30px;width:94px;border-radius:3px;cursor:pointer;font-size:14px;color:#fff;" onclick="orederLooks();"/>
             </div>
            <p style="font-size:14px;color:#9E9E9E;margin-left:28px;margin-top:10px;">
              <span id="collectionsuc"></span>
            </p>
            <p style="font-size:14px;color:#9E9E9E;margin:15px 0 0 28px;">
              <span id="time"></span>
            </p>

            <p class="comments_box1" style="width:730px;">

                已有 <span>

                <a style="color:#a10000;font-weight:bold;" href="#comments_count" id="changyan_count_unit" ></a>${size}</span> 人评论，<a href="#comments_count">我要评论</a>
                <script type="text/javascript" src="http://assets.changyan.sohu.com/upload/plugins/plugins.count.js"></script>

            </p>
             <!-- 分享功能 -->
            <div class="bdsharebuttonbox" style="margin-left: 28px;margin-top: 15px;"><a href="#" class="bds_more" data-cmd="more">藏品分享到：</a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博">新浪微博</a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间">QQ空间</a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博">腾讯微博</a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信">微信</a><a href="#" class="bds_kaixin001" data-cmd="kaixin001" title="分享到开心网">开心网</a></div>
            <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"24"},"share":{"bdSize":16},"image":{"viewList":["tsina","qzone","tqq","weixin","kaixin001"],"viewText":"藏品分享到：","viewSize":"24"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["tsina","qzone","tqq","weixin","kaixin001"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>

       </div>



   </div>

   <div class="scpjs_cont">
       <p>${collection.note}</p>
       <%
         String[] imgarray = (String[])request.getAttribute("imgsarray");
         for (int i=0;i<imgarray.length;i++) {
       %>
       <p align="center"><img src="<%= imgarray[i]%>" width="1140" alt="${collection.name}"/></p>
       <%
         }
       %>
   </div>
        <!-- 藏品评论  strart -->
        <div id="comments_count" class="comments_count">
            <!--高速版，加载速度快，使用前需测试页面的兼容性-->
          <jsp:include page="../../comments.jsp"></jsp:include>

        </div>
        <!-- 藏品评论  END -->

  </div>

  <jsp:include page="../../foot/footer.jsp"></jsp:include>
  </body>
</html>
