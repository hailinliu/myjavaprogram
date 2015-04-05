<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>华豫专家_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/box111.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/scroll.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
	<meta name=keywords content="华豫之门专家，专家介绍">
	<meta name=description content="华豫之门专家介绍">
<style type="text/css">
#demo {
	background: #FFF;
	overflow: hidden;
	width: 950px;
}

#indemo {
	float: left;
	width: 800%;
}

#demo1 {
	float: left;
}

#demo2 {
	float: left;
}
</style>
  </head>

  <body>&nbsp;
  <jsp:include page="../head/header.jsp"></jsp:include>

<jsp:include page="../banner/banner.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear">

  <div class="mian_left clear">

    <div class="zx_box2 clear">
      <div class="bt_box"><span class="fl zxzx"></span></div>
       <div class="zx_nr">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p></div>
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
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div>

    <div class="zx_box clear">
      <div class="bt_box"><span class="fl tjzx"></span></div>
       <div class="zx_nr">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p></div>
          <ul class="list_box">
              <c:forEach items="${recommendList}" var="recommend" varStatus="rdn">
                <c:choose>
                  <c:when test="${rdn.count eq 6}">
              		<li class="none"><a target="_blank" href="<c:url value='/news/${recommend.id}.dhtml'/>">${recommend.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a target="_blank" href="<c:url value='/news/${recommend.id}.dhtml'/>">${recommend.title}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </ul>
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div>

    <div class="zx_box clear">
      <div class="bt_box"><span class="fl rdzx"></span></div>
       <div class="zx_nr">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p></div>
          <ul class="list_box">
              <c:forEach items="${hotList}" var="hot" varStatus="hdn">
                <c:choose>
                  <c:when test="${hdn.count eq 6}">
              		<li class="none"><a target="_blank" href="<c:url value='/news/${hot.id}.dhtml'/>">${hot.title}</a></li>
                  </c:when>
                  <c:otherwise>
		            <li><a target="_blank" href="<c:url value='/news/${hot.id}.dhtml'/>">${hot.title}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </ul>
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div>

    <div class="zx_box clear">
       <div class="bt_box"><span class="fl scpk"></span></div>
       <div class="zx_nr">
         <div class="hb_up"><p class="hb_left fl"><img src="<c:url value='/images/hb_top_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_top_right.jpg'/>" alt=""/></p></div>
         <div class="tu_pic"><a target="_blank" href="<c:url value='/collection/getCollection'/>?id=${col.id}"><img src="<%=PropertiesUtil.getPropertiesValue("collectionurl")%>small/${col.imgurl}" alt="${col.name}"/></a><p><a target="_blank" href="<c:url value='/collection/getCollection'/>?id=${col.id}">${col.name}</a></p></div>
         <div class="hb_down"><p class="hb_left fl"><img src="<c:url value='/images/bottom_left.jpg'/>" alt=""/></p><p class="hb_right fr"><img src="<c:url value='/images/hb_bottom_right.jpg'/>" alt=""/></p></div>
        </div>
    </div>

  </div><!--left end-->

  <div class="mian_right clear">
     <div class="zjjs_pic"><span class="bread_nav">当前位置：首页<span class="jt">></span>华豫专家<span class="jt">></span><a>专家介绍</a></span></div>
     <div class="title">
       <h3>《华豫之门》专家：${pro.name}</h3>
       <p>标签：汝州 华豫之门</p>
     </div>
     <div class="nr_box clear">
          <p class="line"></p>
           <div class="zjjs_nr clear">
              <div class="pic clear"><img src="${pro.imgurl}" width="300" height="452" alt="${pro.name}" /></div>

              <p>${pro.note}</p>
           </div>
          <p class="line"></p>
     </div>



     <!-- <div id="checkCode">
      	报名编码：<input type="text" id="vcode" name="vcode"  style="background-color: red"/><input type="button" value="点击验证报名编码" onclick="checkCode()"/>
      </div> -->
    <!-- 藏品评论  strart -->
        <div id="comments_count" class="comments_count" style="display:none;">
            <!--高速版，加载速度快，使用前需测试页面的兼容性-->
          <jsp:include page="../comments.jsp"></jsp:include>

        </div>
        <!-- 藏品评论  END -->
      <script type="text/javascript" >


        $(document).ready(function() {

           var plof= window.location.hash;   // 获取当前网址 # 内容
           if(plof=='#pl0'){
              $('.forgebox_guowai').show();

           }
           if(plof=='#content'){
              $('#comments_count').show();

           }


         })

      function checkCode(){
       var vcode=$("#vcode").val();
        $.ajax({
	        type:'post',
	        url:'<c:url value='/proficient/checkBmCode'/>',
	        data:'bmcode='+vcode,
	        success:function(data){
	        	if(data=='9999'){
	        		alert('验证失败！');

	        		return false;
	        	}else{
	        		alert('验证成功！');
              $('.forgebox_guowai').hide();
              $('#comments_count').show();
	        		return true;


	        	}
	        }
  		});

      }

      </script>


       <!-- 海选编码 弹出框 -->

      <div class="forgebox_guowai forgebox6_1" id="forgebox6_1" style="">
      <div class="easyDialogBox" style="margin-top:15%;">
      <div id="easyDialogWrapper" class="easyDialog_wrapper">
          <div class="easyDialog_content">
              <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                  <!-- <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_x" id="closeBtn">×</a> -->
                    【 海选报名编码 】 - 输入正确报名编码方可评论
              </h4>

             <!--  <div class="easyDialog_text">
                <font color="red" style="font-size:18px;">提交成功！</font>
              </div> -->

    <!-- ////////////////////// -->
        <ul class="chang_list1" style="margin-left:50px;" >
                <li class="mc">报名编码：</li>
                <li><input type="text" id="vcode" name="vcode" value="" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" style="width:270px;" /></li>
                <li class="" id="newaddressp" style="margin-left:7px;"></li>
          </ul>
          <ul class="chang_list1" style="margin-left:50px;" >

                <li class="" id="newaddressp" style="margin-left:7px;">温馨提示：必须输入正确海选报名‘短信验证码’才可评论专家</li>
          </ul>

         <!-- ///////////////////// -->


              <div class="easyDialog_footer">
                  <!-- <button class="btn_normal off_x">取消</button> -->
                  <button class="btn_highlight" id="easyDialogYesBtn" onclick="checkCode();" style="margin-right: 210px;">我要验证</button>
              </div>

              </div>
          </div>
      </div>
  </div>



    <div class="about_zj"></div>
    <div class="scrollleft" style="width:810px;padding:0;overflow:hidden;" id="demo">
    	<div id="indemo" style="width:800%;float:left;">
    		<ul class="zj_list" style="height:300px;float:left;" id="demo1">
	        <c:forEach items="${proList}" var="pro" varStatus="pdn">
	          <c:choose>
	            <c:when test="${pdn.count eq 10}">
		          <li class="none"><a target="_blank" href="<c:url value='/proficient/${pro.id}.dhtml'/>"><img src="${pro.imgurl}" width="150" height="187" alt="${pro.name}"/></a><p><a target="_blank" href="<c:url value='/proficient/${pro.id}.dhtml'/>">${pro.name}</a></p><p><a target="_blank">${pro.speciality}</a></p></li>
	            </c:when>
	            <c:otherwise>
	              <li><a target="_blank" href="<c:url value='/proficient/${pro.id}.dhtml'/>"><img src="${pro.imgurl}" width="150" height="187" alt="${pro.name}" /></a><p><a target="_blank" href="<c:url value='/proficient/${pro.id}.dhtml'/>">${pro.name}</a></p><p style="color:#666;">${pro.speciality}</p></li>
	            </c:otherwise>
	          </c:choose>
	        </c:forEach>
	     </ul>
	     <div id="demo2" style="float:left;margin-left:10px;height:300px;" class="zj_list"></div>
    	</div>
    </div>

  </div><!--right end-->

</div>

<!--main style end-->
  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
