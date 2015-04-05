<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>拍品展示_拍卖会_卫视文化乐园-华豫之门官方网站</title>

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

<meta name=keywords content="拍品展示">
<meta name=description content="卫视文化乐园-华豫之门官方网站，参加拍卖会的拍品展示">
 <style type="text/css">
  .hycp_btn1 .btns{
    margin-left: 22px;
  }
  .pmcp_list p{
      text-align: center;
      padding-left: 0;
    }
    .pic_list li img{
      margin-bottom: 0;
    }
    .pic_list{
      margin-top: 20px;
    }
     .btns1{
      padding: 5px 8px;
    }
    .hycp_btn1 .btns1{
    border: 1px solid;
  border-radius: 2px;
  cursor: pointer;
  font-family: "Microsoft yahei", Arial;
  float: left;
  font-size: 13px;
  margin: 0px 0 0 13px;
  border-color: #ccc;
  background: #f0f0f0;
  color: #333;
  margin-bottom: 15px;
  text-align: center;
  margin-left: 22px;
    }
    .hycp_btn1 .btns1:hover, .hycp_btn1 .btn_href {
  background: #A40809;
  border-color: #fff;
  color: #fff;}

  .pic_pic_zjjt .zj_title a {
color: #666;
font-size: 14px;
font-weight: 600;
height: 25px;
line-height: 25px;
overflow: hidden;
}

 </style>
  </head>
<script>
function getOnlinePic(isshangpai,typeid){
  var url="<c:url value='/onlinepic/onlinePiclist'/>?isshangpai="+isshangpai+"&typeid="+typeid;
  window.location.href=url;
}
</script>
  <body>
<jsp:include page="../banner/banner.jsp"></jsp:include>

    <!--  左半部分结束 -->

    <!-- 右半部分 -->
<div class="main_box clear">


  <div class="mian_right clear" style="position:relative">
     <div class="zjcp_pic pmyz_pic" style="background:url(images/collect/pp_zhanshi_bg.jpg) no-repeat left center;"><span class="bread_nav">仅显示已确定上拍的拍品</span></div>

      <!-- 拍卖会 -->
     <div class="hycp_btn1 money_btn1" style="margin-top:20px;" id="paimaihui">
           <input id="" name="pmh" date-role="-1" type="button" class="btns1 btn_href" value="全部专场" onclick="getlylots('','${ly}','${pricearea}')"/>
			<input id="" name="pmh" date-role="-1" type="button" <c:if test="${3==isshangpai}"> class="btns1 btn_href" </c:if><c:if test="${3!=isshangpai}">class="btns1"</c:if> value="国外大拍行送拍藏品展示" onclick="getOnlinePic('3','${typeid}')"/>
           <input id="" name="pmh" date-role="-1" type="button" <c:if test="${4==isshangpai}"> class="btns1 btn_href" </c:if><c:if test="${4!=isshangpai}">class="btns1"</c:if> value="国内大拍行送拍藏品展示" onclick="getOnlinePic('4','${typeid}')"/>
           <input id="" name="pmh" date-role="-1" type="button" <c:if test="${5==isshangpai}"> class="btns1 btn_href" </c:if><c:if test="${5!=isshangpai}">class="btns1"</c:if> value="淘宝平台网拍藏品展示" onclick="getOnlinePic('5','${typeid}')"/>
           <input id="" name="pmh" date-role="-1" type="button" <c:if test="${6==isshangpai}"> class="btns1 btn_href" </c:if><c:if test="${6!=isshangpai}">class="btns1"</c:if> value="华豫官网微拍藏品展示" onclick="getOnlinePic('6','${typeid}')"/>
    </div>
      <div class="hycp_btn1" style="margin-top:0;border-top:0;" id="paimaijigou">
          <input id="" name="pmh" date-role="-1" type="button" class="btns1 btn_href" value="全部分类" onclick="getOnlinePic('${specialID}','${ly}','')"/>
          <c:forEach items="${typelist}" var="type" varStatus="cdn">
          <input id="" name="pmh" date-role="-1" type="button" <c:if test="${typeid==type.id}"> class="btns1 btn_href" </c:if> <c:if test="${typeid!=type.id}"> class="btns"  </c:if>value="${type.name}" onclick="getOnlinePic('${isshangpai}','${type.id}')"/>
          </c:forEach>

      </div>
      <!-- 专场 -->
     <div style="margin:25px 0 0px 10px;background:#ECECEC;height:40px;line-height:40px;padding-left:20px;border-radius: 3px;">
        <span  style="font-size:18px;font-weight:bold;">藏品信息 </span>
       </div>
    <div class="clear111">
    <ul class="pic_list pmcp_list" style="padding-bottom:5px; width:100%;">

    <c:forEach items="${list}" var="info" varStatus="cdn">
      <li>
           <a href="<c:url value='/onlinepic/olinePicByinfo'/>?id=${info.id}"target="_blank"><img src="http://admin.wswhly.com/zengjipaipin/${fn:split(info.pic,',')[0]}" width="235" height="235" alt="${info.name}"></a>
           <p class="zj_title">
             <a href="<c:url value='/onlinepic/olinePicByinfo'/>?id=${info.id}"target="_blank">${info.name}</a>
             <a style="margin-top:5px;display:block;color:#ff0000;"  target="_blank" href="http://admin.wswhly.com//jqzoom/index.jsp?imgs=<c:forTokens items="${info.pic}" delims="," var="val">http://admin.wswhly.com/wswhly/zengjipaipin/${val},</c:forTokens>">图集 </a>
           </p>
           <p class="" style="margin-top:5px;display:block;color:#ff0000;"> 尺寸/重量：${info.size} </p>
           <p class="" style="margin-top:5px;display:block;color:#ff0000;">年代：${info.niandai}</p>
			<p class="" style="margin-top:5px;display:block;color:#ff0000;">估值（万）：<c:if test="${info.level>=2}">${info.guzhi}（万）</c:if></p>

       </li>
     </c:forEach>

     </ul>
      </div>

    <c:if test="${count / pageSize > 0}">
     <div class="paging clear">
        <pg:pager url="../onlinepic/onlinePiclist" items="${count}" maxPageItems="12" maxIndexPages="5">
            <pg:param name="pageSize" value="${pageSize}" />
            <pg:param name="isshangpai" value="${isshangpai}" />
            <pg:param name="typeid" value="${typeid}" />
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

 <!-- 判断 url参数 页码用** -->
  <script type="text/javascript" language="javascript">

        $(document).ready(function() {
           var urlsval = url_request("pager.offset");   // 获取 offset参数

           var urlsval2 = parseInt(urlsval/12)+1;

          // var ahrs =  $(".paging_list>li>a").attr("href");

          // var sd2=ahrs.indexOf(urlsval);  // 比较字符串 看是否存在相同

            $(".paging_list>li>a").each(function(){
                if ($(this).text()==urlsval2) {
                    $(this).addClass('ymseled')
                }
            });
        });
    </script>




  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
