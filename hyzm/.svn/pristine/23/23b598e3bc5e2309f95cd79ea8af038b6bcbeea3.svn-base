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
function getlylots(specialID,ly,pricearea){
  var url="<c:url value='/collect/getlylotslist'/>?specialID="+specialID+"&ly="+1;
  if(pricearea!=''&&pricearea.length>0){
  url+="&pricearea="+pricearea;
  }
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
           <input id="" name="pmh" date-role="-1" type="button" <c:if test="${3==specialID}"> class="btns1 btn_href" </c:if><c:if test="${3!=specialID}">class="btns1"</c:if> value="国画精粹-已于11月21日在淘宝拍卖结束
" onclick="getlylots('3','${ly}','${pricearea}')"/>
           <input id="" name="pmh" date-role="-1" type="button" <c:if test="${2==specialID}"> class="btns1 btn_href" </c:if><c:if test="${2!=specialID}">class="btns1"</c:if> value="古瓷集萃-从11月起排期上拍" onclick="getlylots('2','${ly}','${pricearea}')"/>
           <input id="" name="pmh" date-role="-1" type="button" <c:if test="${1==specialID}"> class="btns1 btn_href" </c:if><c:if test="${1!=specialID}">class="btns1"</c:if> value="佛器玄览-从11月起排期上拍" onclick="getlylots('1','${ly}','${pricearea}')"/>
           <input id="" name="pmh" date-role="-1" type="button" <c:if test="${4==specialID}"> class="btns1 btn_href" </c:if><c:if test="${4!=specialID}">class="btns1"</c:if> value="传世玉饰-从11月起排期上拍" onclick="getlylots('4','${ly}','${pricearea}')"/>
    </div>
      <div class="hycp_btn1" style="margin-top:0;border-top:0;" id="paimaijigou">
          <input id="" name="pmh" date-role="-1" type="button" class="btns1 btn_href" value="全部价格" onclick="getlylots('${specialID}','${ly}','')"/>
          <input id="" name="pmh" date-role="-1" type="button" <c:if test="${pricearea==0}"> class="btns1 btn_href" </c:if><c:if test="${pricearea!=0}">class="btns"</c:if> value="5万以内" onclick="getlylots('${specialID}','${ly}','0')"/>
          <input id="" name="pmh" date-role="-1" type="button" <c:if test="${pricearea==1}"> class="btns1 btn_href" </c:if><c:if test="${pricearea!=1}">class="btns"</c:if> value="5至10万" onclick="getlylots('${specialID}','${ly}','1')"/>
          <input id="" name="pmh" date-role="-1" type="button" <c:if test="${pricearea==2}"> class="btns1 btn_href" </c:if><c:if test="${pricearea!=2}">class="btns"</c:if> value="10至20万" onclick="getlylots('${specialID}','${ly}','2')"/>
          <input id="" name="pmh" date-role="-1" type="button" <c:if test="${pricearea==3}"> class="btns1 btn_href" </c:if><c:if test="${pricearea!=3}">class="btns"</c:if> value="20至50万" onclick="getlylots('${specialID}','${ly}','3')"/>
          <input id="" name="pmh" date-role="-1" type="button" <c:if test="${pricearea==4}"> class="btns1 btn_href" </c:if><c:if test="${pricearea!=4}">class="btns"</c:if>value="50至100万" style="width:94px;"  onclick="getlylots('${specialID}','${ly}','4')"/>
          <input id="" name="pmh" date-role="-1" type="button" <c:if test="${pricearea==5}"> class="btns1 btn_href" </c:if><c:if test="${pricearea!=5}">class="btns"</c:if> value="100万以上" style="width:90px;"  onclick="getlylots('${specialID}','${ly}','5')"/>
      </div>
      <!-- 专场 -->
     <div style="margin:25px 0 0px 10px;background:#ECECEC;height:40px;line-height:40px;padding-left:20px;border-radius: 3px;">
        <span  style="font-size:18px;font-weight:bold;">拍品信息 </span>
       </div>
    <div class="clear111">
    <ul class="pic_list pmcp_list" style="padding-bottom:5px; width:100%;">

    <c:forEach items="${list}" var="info" varStatus="cdn">
    <li>
         <a href="<c:url value='/collect/${info.id}.dhtml'/>" target="_blank">
           <img src="http://admin.wswhly.com/wswhly/zengjipaipin/${fn:split(info.image,',')[0]}" width="235" height="235" alt="${info.name}"></a>
         <div class="pic_pic_zjjt">

           <p class="zj_title">
             <a href="<c:url value='/collect/${info.id}.dhtml'/>" target="_blank">${info.name}</a>
           </p>
           <p class="" style="margin-top:5px;display:block;color:#ff0000;">
            起拍价格： ${info.qpprice}元

           </p>

         </div>
       </li>
     </c:forEach>

     </ul>
      </div>

    <c:if test="${count / pageSize > 0}">
     <div class="paging clear">
        <pg:pager url="../collect/getlylotslist" items="${count}" maxPageItems="12" maxIndexPages="5">
            <pg:param name="pageSize" value="${pageSize}" />
            <pg:param name="ly" value="${ly}" />
            <c:if test="${pricearea!=''&&fn:length(pricearea)>0}">
            <pg:param name="pricearea" value="${pricearea}" />
            </c:if>
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
