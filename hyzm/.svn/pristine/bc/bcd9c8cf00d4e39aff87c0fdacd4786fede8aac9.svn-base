<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>专家推荐藏品_卫视文化乐园-华豫之门官方网站</title>

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
  <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>

  <meta name=keywords content="专家推荐藏品">
  <meta name=description content="卫视文化乐园-华豫之门官方网站，专家推荐藏品">
  <script type="text/javascript">
  function queryOneCollection(value){
      // location.href = "<c:url value='/collection/getCollection'/>?id="+value+"&userid=${CurrentSession.id}";
      open( "<c:url value='/collection/getCollection'/>?id="+value+"&userid=${CurrentSession.id}");
  }
  </script>
  </head>

  <body>
  <jsp:include page="../../head/header.jsp"></jsp:include>

<jsp:include page="../../banner/banner.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear">

  <div class="mian_left clear">
     <div class="left_bt">精品一览</div>
     <div class="scpk_box clear">
      <ul class="scpk_list">

           <li>
               <a href="<c:url value='/collection/getHycp?typeid=1&styleid=0'/>
               ">华豫藏品
              </a>
           </li>
           <li>
           <p>
             <span>
                经过海选选拨，曾经登上《华豫之门》节目的藏品，呈现在亿万观众的眼前。
             </span>
           </p>
           </li>


           <li>
               <a href="<c:url value='/collection/getZbcp?typeid=2&styleid=0'/>
               ">珍宝台藏品
              </a>
           </li>
           <li>
             <p>
               <span>
                   在《华豫之门》节目上，经过专家的鉴定，确定是真品的藏品，登上最终的珍宝台。
               </span>
             </p>
           </li>


           <li class="seled">
               <a href="<c:url value='/collection/getZjcp?typeid=3&styleid=0'/>">专家推荐藏品
              </a>
           </li>

           <li>
           <p>
             <span class="newred">
                 历经专家的火眼金睛，确保真品真迹且有很高收藏价值的藏品。专家推荐，值得信赖！
             </span>
           </p>
           </li>

      </ul>

       <!-- <ul class="scpk_list">
         <c:forEach items="${typelist}" var="type">
           <li><a href="<c:url value='/collection/getCollections?type=${type.id}'/>">${type.name}</a></li>
         </c:forEach>
      </ul> -->

    </div>

    <!-- 行业领袖 -->
    <div class="zx_box clear">
      <div class="bt_box">
        <span class="fl hylx"></span>
      </div>
      <div class="zx_hylx">

        <div class="hb_up">
          <p class="hb_left fl">
            <img src="/hyzm/images/hb_top_left.jpg" alt="" /></p>
          <p class="hb_right fr">
            <img src="/hyzm/images/hb_top_right.jpg" alt="" /></p>
        </div>


        <div class="hylx2">

          <div class="hylx_img1 fl">

            <p class="hyl_p">

            <a href="#">
            <img src="/hyzm/images/sub1.jpg" alt="苏富比" /></a>


            </p>
            <p class="hyl_p">
                <a href="#">
              <img src="/hyzm/images/sub2.jpg" alt="苏富比" /></a>
            </p>
          </div>

          <div class="hylx_js2 fl">
            <div class="hulx_title">
                  <a href="#"><b>苏富比</b> </a>
            </div>
            <div class="hulx_ppso">苏富比以让全球客户无束缚地观赏伟大的艺术品而引以为傲。如今可触及到全球艺术市场的每个角落：办事处遍布 达40个国家，总共90 个地方；每年全球范围共10 个拍卖场举行约250 场拍卖会；涵盖的收藏品超过70 种。
    Sotheby’s Holdings,Inc 旗下拥有苏富比全球拍卖业务......</div>
          </div>


        </div>

        <div class="hb_down">
          <p class="hb_left fl">
            <img src="/hyzm/images/bottom_left.jpg" alt="" /></p>
          <p class="hb_right fr">
            <img src="/hyzm/images/hb_bottom_right.jpg" alt="" /></p>
        </div>
      </div>
    </div>


  <!-- 专家讲坛 -->
  <div class="zx_box clear">
       <div class="bt_box"><span class="fl sczj"></span></div>
       <div class="zx_nr3">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt="" /></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt="" /></p></div>

         <div class="tu_pic_zjjt"><a href="<c:url value='/video/${videoList.id}.dhtml'/>"><img src="${videoList.imgurl}" alt="${videoList.title}" /></a><p><a href="<c:url value='/video/${videoList.id}.dhtml'/>">${videoList.title}</a></p></div>

         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt="" /></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt="" /></p></div>
        </div>
    </div>

    <!-- 最新资讯 -->
    <div class="zx_box clear">
      <div class="bt_box"><span class="fl zxzx"></span></div>
       <div class="zx_nr">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt="" /></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt="" /></p></div>
          <ul class="list_box">
              <c:forEach items="${newestList}" var="newest" varStatus="ndn">
                <c:choose>
                  <c:when test="${ndn.count eq 6}">
                  <li class="none"><a target="_blank" href="<c:url value='/news/${newest.id}.dhtml'/>">${newest.title}</a></li>
                  </c:when>
                  <c:otherwise>
                <li><a target="_blank" href="<c:url value='/news/${newest.id}.dhtml'/>">${newest.title}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </ul>
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt="" /></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt="" /></p></div>
        </div>
    </div>


  </div><!--left end-->


  <div class="mian_right clear" style="position:relative">
     <div class="zjcp_pic"><span class="bread_nav">当前位置：首页<span class="jt">></span>专家推荐藏品<c:if test="${not empty typename}"><span class="jt">></span><a target="_blank" href="#">${typename}</a></c:if></span></div>
     <!-- <p class="scpk_wz">当前共有<a target="_blank" href="#">${count}</a>件收藏品信息，感谢藏友们为中国的收藏品文化传播所做的贡献！</p> -->

      <div class="hycp_btn1">
         <input id="allpfe" type="button" class="btns btn_href" onclick='window.location.href="<c:url value='/collection/getZjcp?typeid=3&styleid=0'/>"' value="全部类别">
         <c:forEach items="${liststyle}" var="style" varStatus="cdn">
         <input id="${style.id}" name="styNmae" type="button" class="btns" onclick='window.location.href="<c:url value='/collection/getZjcp?typeid=3&styleid=${style.id}&pricearea=${pricearea}'/>"' value="${style.name}">
         </c:forEach>
      </div>
      <!-- 按照价格区间 -->
     <div class="hycp_btn1 money_btn1" style="margin-top:0";>
        	 <input id="allpmon" name="monNmae" date-role="-1" type="button" class="btns btn_href" onclick='window.location.href="<c:url value='/collection/getZjcp?typeid=3&styleid=${type}&pricearea=-1'/>"' value="全部价格">
            <input id="m1" name="monNmae" date-role="0" type="button" class="btns" onclick='window.location.href="<c:url value='/collection/getZjcp?typeid=3&styleid=${type}&pricearea=0'/>"' value="5万以内">
            <input id="m2" name="monNmae" date-role="1" type="button" class="btns" onclick='window.location.href="<c:url value='/collection/getZjcp?typeid=3&styleid=${type}&pricearea=1'/>"' value="5至10万">
            <input id="m2" name="monNmae" date-role="2" type="button" class="btns" onclick='window.location.href="<c:url value='/collection/getZjcp?typeid=3&styleid=${type}&pricearea=2'/>"' value="10至20万">
            <input id="m2" name="monNmae" date-role="3" type="button" class="btns" onclick='window.location.href="<c:url value='/collection/getZjcp?typeid=3&styleid=${type}&pricearea=3'/>"' value="20至50万">
            <input id="m2" name="monNmae" date-role="4" type="button" class="btns" onclick='window.location.href="<c:url value='/collection/getZjcp?typeid=3&styleid=${type}&pricearea=4'/>"' value="50至100万">
            <input id="m2" name="monNmae" date-role="5" type="button" class="btns" onclick='window.location.href="<c:url value='/collection/getZjcp?typeid=3&styleid=${type}&pricearea=5'/>"' value="100万以上">

      </div>

		<div class="clear111">
       <c:forEach items="${collectionList}" var="collection" varStatus="cdn">
          <c:if test="${cdn.count % 3 == 1}">
          	<ul class="pic_list" style="padding-bottom:15px;">
          	 </c:if>
		      	<li>
            <a href="<c:url value='/collection/${collection.id}.dhtml'/>" target="_blank">
		        	<img src="${collection.imgurltitle}" width="235" height="235" alt="${collection.name}"/>
              </a>
		            <div class="pic_pic_zjjt">

                  <p class="zj_title" >
                    <a href="<c:url value='/collection/${collection.id}.dhtml'/>" target="_blank">${collection.name}</a>
                  </p>
                  <p class="" style="margin-top:15px;display:block;color:#444;">
                     推荐专家：

                      <c:choose>
                   	   <c:when test="${collection.style eq 18}">王育成</c:when>
                   	   <c:when test="${collection.style eq 19}">余光仁</c:when>
                   	   <c:when test="${collection.style eq 20}">黄鼎</c:when>
                   	   <!-- <c:when test="${collection.style eq 21}">高明利</c:when> -->
                   	   <c:when test="${collection.style eq 22}">陈建明</c:when>
                   	   <c:when test="${collection.style eq 23}">古方</c:when>
                   	   <c:when test="${collection.style eq 24}">岳珂</c:when>
                   	 </c:choose>

                   <c:if test="${not empty col.tvnum }">
                    	${col.tvnum}
                    </c:if>
                  </p>

                </div>
		         </li>

		        <c:if test="${cdn.count % 3 == 0}">
          	</ul>
          	</c:if>

         </c:forEach>
        <c:if test="${listsize % 3 != 0}">
          </ul>
        </c:if>
      </div>


    <c:if test="${count / pageSize > 0}">
     <div class="paging clear">
        <pg:pager url="../collection/getZjcp" items="${count}" maxPageItems="9" maxIndexPages="5">
            <pg:param name="pageSize" value="${pageSize}" />
            <pg:param name="type" value="${type}" />
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

           var urlsval2 = parseInt(urlsval/9)+1;

            $(".paging_list>li>a").each(function(){
                if ($(this).text()==urlsval2) {
                    $(this).addClass('ymseled')
                }
            });

             /* 点击专家选项变色 */

            var zjid =  parseInt(url_request("styleid"));
            var typeid =  parseInt(url_request("type"));
            var priceareaid =  parseInt(url_request("pricearea"));


            $("input:button[name='styNmae']").each(function(){

                if ($(this).attr('id')==zjid) {
                  $('#allpfe').removeClass('btn_href');
                    $(this).addClass('btn_href');
                    //alert(zjid);

                } if($(this).attr('id')==typeid){
                    $(this).addClass('btn_href');
                }

            });
            // 点击价格选项变色
            $("input:button[name='monNmae']").each(function(){


                if($(this).attr('date-role')==priceareaid){
                  $('#allpmon').removeClass('btn_href');
                    $(this).addClass('btn_href');
                }

            });


        });


    </script>

  <jsp:include page="../../foot/footer.jsp"></jsp:include>
  </body>
</html>
