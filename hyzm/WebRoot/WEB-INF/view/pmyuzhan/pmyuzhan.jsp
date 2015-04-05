<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>拍卖预展_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
   <link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
   <link rel="stylesheet" type="text/css" href="<c:url value='/css/pmyuzhan/pmyuzhan.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>

<meta name=keywords content="预展，拍卖预展">
<meta name=description content="拍卖预展">
 <script type="text/javascript">

 function hq_height(){
	 var s1= $("#allpmon1").height();
     var s2 = $("#zhuanchang").height();
     var num1 = $(".btns").length;
     /* alert(s1); */
}


 var jgids='${jgid}';
 var jgid='${jgid}';
  var pmhids='${pmhid}';
 var pmhid='${pmhid}';
 $(function(){
 var con= "<input id='allpfe' type='button' class='btns btn_href' value='拍卖机构'/>";
 	$.ajax({
        type:'post',
         url:"<c:url value='/yclots/getYcinstitutions'/>",
        success:function(data){
         var jsonData = eval(data);//接收到的数据转化为JQuery对象，由JQuery处理
                $.each(jsonData, function(index, objVal) {
                if(objVal["id"]==4){
                	con+="<input id='m1' name='pmjg' date-role='"+objVal["id"]+"' type='button' class='btns a_fell' value='"+objVal["as_name"]+"' onclick='getaction("+objVal["id"]+")'/>";
                }else{
                	con+="<input id='m1' name='pmjg' date-role='"+objVal["id"]+"' type='button' class='btns a_fell' value='"+objVal["as_name"]+"' onclick=\"window.location.href='<c:url value='/redirect?p=daigou/JSD'/>'\"/>";
                }
                if(objVal["id"]==jgid){
               	 getaction(objVal["id"]);
                }
                });
                 $("#paimaijigou").html(con);
        }
     });


     $("#allpmon").height=$("#zhuanchang").height;
 })
function getaction (ins_id){
 clickcss(ins_id,'pmjg');
jgid=ins_id;
//清空拍卖专场
$("#zhuanchang").html("<input id='allpmon1' name='pmh1' date-role='-1' type='button' class='btns btn_href all_pmzc' style='height:29px' value='专场'>");
  var con ="<input id='allpfe' type='button' class='btns btn_href' value='拍卖会'/>";
 	$.ajax({
        type:'post',
         url:"<c:url value='/yclots/getYcactionByinsid'/>",
        data:'ins_id='+ins_id,
        success:function(data){
         var jsonData = eval(data);//接收到的数据转化为JQuery对象，由JQuery处理
                $.each(jsonData, function(index, objVal) {
                con+="<input id='m1' name='pmh' date-role='"+objVal["id"]+"' type='button' class='btns a_fell' value='"+objVal["actionname"]+"' onclick='getspecial("+objVal["id"]+")'/>";
               // alert(jgid+"--"+jgids+"--"+pmhid+"--"+objVal["id"]);
                if(jgid!=jgids&&index==0){
                	getspecial(objVal["id"]);
                }
                else if(pmhids==objVal["id"]){
               	 getspecial(objVal["id"]);
                }
                });
                $("#paimaihui").html(con);
        }
     });
 }
 function getspecial(actionid){
 clickcss(actionid,'pmh');
 pmhid=actionid;
 //qingkong
 var con ="<input id='allpmon1' name='pmzc11' date-role='-1' type='button' class='btns btn_href all_pmzc' value='专场'' style='height:29px'>";
 	$.ajax({
        type:'post',
         url:"<c:url value='/yclots/getYcspecialByactionID'/>",
        data:'actionid='+actionid,
        success:function(data){
         var jsonData = eval(data);//接收到的数据转化为JQuery对象，由JQuery为我们wer32w处理
                $.each(jsonData, function(index, objVal) {
			   if(objVal["id"]==${specialID}){
                 con+="<input id='m"+objVal["id"]+"' name='pmzc' date-role='"+objVal["id"]+"' type='button' class='btns a_fell btn_href' onclick='getYclotsListByspecialID("+objVal["id"]+")' value='"+objVal["specialname"]+"'>";
                }else{
                con+="<input id='m"+objVal["id"]+"' name='pmzc' date-role='"+objVal["id"]+"' type='button' class='btns a_fell' onclick='getYclotsListByspecialID("+objVal["id"]+")' value='"+objVal["specialname"]+"'>";
                }
               });
                 $("#zhuanchang").html(con);
        }
     });
       clickcss(${specialID},'pmzc');

 }
function getYclotsListByspecialID(id){
window.location.href="<c:url value='/yclots/getYclotsListByspecialID'/>?specialID="+id+"&jgid="+jgid+"&pmhid="+pmhid;
 }

function clickcss(id,name) {
 setTimeout(function () {
            $("input:button[name='"+name+"']").each(function(){
                if($(this).attr('date-role')==id){
                    $(this).addClass('btns btn_href');
                }else{
                 $(this).removeClass('btn_href');
                }
            });
 },50);
}

$(document).ready(function() {
           var urlsval = url_request("pager.offset");   // 获取 offset参数

           var urlsval2 = parseInt(urlsval/9)+1;

          // var ahrs =  $(".paging_list>li>a").attr("href");

          // var sd2=ahrs.indexOf(urlsval);  // 比较字符串 看是否存在相同

            $(".paging_list>li>a").each(function(){
                if ($(this).text()==urlsval2) {
                    $(this).addClass('ymseled')
                }
            });
});


 </script>
 <style>
#aaa a{ margin-left: 13px; cursor: pointer; }
 </style>
  </head>

  <body>
<div class="banner" style="background:url(<c:url value='/images/absimg/tonglan02.jpg'/>) top center no-repeat;height:400px;">
  <a href="<c:url value='/redirect?p=app'/>" target="_blank" style="width:100%;height:100%;cursor:pointer;display:block;"></a>
</div>

<div class="main_box clear">
  <div class="mian_right clear" style="position:relative">
     <div class="zjcp_pic pmyz_pic"><span class="bread_nav">当前共有：拍卖会 <b class="gg_num">${ycount.pmhcount} </b> 个， 专场 <b class="gg_num"> ${ycount.zccount}</b> 个 ，拍品 <b class="gg_num">  ${ycount.ppcount}</b>件</span></div>

      <!-- 拍卖机构 拍卖会 专场 -->
   <!-- <div class="hycp_btn1" style="margin-top:0"; id="paimaijigou"></div>

     <div class="hycp_btn1 money_btn1" style="margin-top:0"; id="paimaihui">
       <input id="allpmon" name="pmh" date-role="-1" type="button" class="btns btn_href" value="拍卖会"/></div>
-->

  <div class="hycp_btn1" style="margin-top:0"; id="aaa">
  <input  type="button" class="btns btn_href all_pmzc" value="拍卖机构" style="height:29px">
  <a onclick="window.location.href='http://www.wswhly.com/yclots/getYclotsListByspecialID?specialID=61&jgid=4&pmhid=9'"><img src="<c:url value='/images/pmSfb.jpg'/>" width="202" height="110"></a>
  <a onclick="window.location.href='http://www.wswhly.com/yclots/getYclotsListByspecialID?specialID=59&jgid=5&pmhid=8'"><img src="<c:url value='/images/pmJsd.jpg'/>" width="202" height="110"></a>
  </div>
    <!-- 专场 -->
  <div class="hycp_btn1" style="margin-top:0"; id="zhuanchang"></div>

     <div style="margin:25px 0 0px 10px;background:#ECECEC;height:40px;line-height:40px;padding-left:20px;border-radius: 3px;">
        <span  style="font-size:18px;font-weight:bold;">拍品信息 </span>
       </div>
    <div class="clear111">
    <c:forEach items="${yclotslist}" var="yclots" varStatus="cdn">
    <c:if test="${cdn.count % 4 ==1}">
    <ul class="pic_list pmcp_list" style="padding-bottom:5px; width:100%;">
    </c:if>
 			<li>
             <a href="<c:url value='/yclots/${yclots.id}.dhtml'/>" target="_blank">
               <img  src="http://admin.wswhly.com/wswhly/zengjipaipin/${fn:split(yclots.image,',')[0]}"   width="235" height="235" alt="${yclots.name}"></a>
             <div class="pic_pic_zjjt">

               <p class="zj_title">
                 <a href="<c:url value='/yclots/${yclots.id}.dhtml'/>" target="_blank">${yclots.name}</a>
               </p>
               <p class="" style="margin-top:5px;display:block;color:#ff0000;">
               <c:if test="${yclots.cjprice!=null&&yclots.cjprice!='null'&&yclots.cjprice!=''}">
                 成交价： &nbsp;${yclots.cjprice}
			  </c:if>
			  <c:if test="${yclots.cjprice==null||yclots.cjprice=='null'||yclots.cjprice==''}">
                 估价： &nbsp;${yclots.price}
			  </c:if>
               </p>
               <p class="" style="margin-top:5px;display:block;color:#444;">

                 尺寸：${yclots.size}
               </p>
<%--               <p class="" style="margin-top:5px;display:block;color:#444;">--%>
<%----%>
<%--                 说明： <c:choose>--%>
<%--                         <c:when test="${fn:length(yclots.suggest) > 45}">--%>
<%--                           ${fn:substring(yclots.suggest,0,45)}...--%>
<%--                         </c:when>--%>
<%--                         <c:otherwise>--%>
<%--                           ${yclots.suggest}--%>
<%--                         </c:otherwise>--%>
<%--                       </c:choose>--%>
<%--               </p>--%>

             </div>
           </li>
     <c:if test="${cdn.count % 4 == 0}">
     </ul>
     </c:if>
      </c:forEach>
      </div>


    <c:if test="${count / pageSize > 0}">
     <div class="paging clear">
        <pg:pager url="../yclots/getYclotsListByspecialID" items="${count}" maxPageItems="12" maxIndexPages="5">
            <pg:param name="pageSize" value="${pageSize}" />
            <pg:param name="jgid" value="${jgid}" />
            <pg:param name="pmhid" value="${pmhid}" />
            <pg:param name="specialID" value="${specialID}" />
          <ul class="paging_list">
            <pg:first>
              <li class="bg_box">
                <a href="${pageUrl}">首页</a>
              </li>
            </pg:first>
            <pg:prev>
              <li class="bg_box bg_box2">
                <a href="${pageUrl}">上一页</a>
              </li>
            </pg:prev>
            <pg:pages>
              <li>
                <a href="${pageUrl}">${pageNumber}</a>
              </li>
            </pg:pages>

            <pg:next>
              <li class="bg_box bg_box3">
                <a href="${pageUrl}">下一页</a>
              </li>
            </pg:next>
            <pg:last>
              <li class="bg_box">
                <a href="${pageUrl}">尾页</a>
              </li>
            </pg:last>
          </ul>
        </pg:pager>

   </div>
   </c:if>

  </div><!--right end-->

</div>
<!--main style end-->



  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
