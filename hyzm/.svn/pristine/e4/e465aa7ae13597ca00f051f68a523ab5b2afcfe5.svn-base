<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title></title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/style.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/zixun/zixun.css'/>"/>
  <script type="text/javascript" src="<c:url value='/js/jquery-1.8.2.min.js'/>"></script>
	<meta name=keywords content="资讯">
	<meta name=description content="华豫之门资讯">
		<script>
		function AddAttention(id){
        var my_element=$(".login");
            if(my_element.length>0){         //如果’会员登录‘dom 存在

                // $('#login_box').show();        // 未登录 弹出登陆框！
                $("#login_box").addClass('mod_show');
                return false;

            } else {
					 $.ajax({
			         type:'post',
			         url:'<c:url value='/BaiBao_AddAttention'/>?collectionid='+id,
			         success:function(data){
			         if(data=='0000'){
			         	alert("成功关注！");
			         }else{
			         	alert(data);
			         }
			        }
			     });
          }
			}
		</script>
  </head>

  <body>
  <div class="zixun_box_right" style="width:356px;">
      <div class="bbj_zx_rt_tit">    <!-- 推荐藏品 4-->
          <p>推荐藏品</p>
      </div>
      <div class="tj_cp">
         <ul>
          <c:forEach items="${randcollectionlist3}" var="randInfo3" varStatus="cdn" >
          <li>
              <div class="tj_cp_pic">
                 <a href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${randInfo3.id}" class="tuijian_cl_img" target="_blank">
                    <img src="http://116.255.149.172:7080/wswhly/Baibaourl//${fn:split(randInfo3.imgurl,',')[0]}" alt=" ${randInfo3.name}" class="tuijian_simal_img" />
                  </a>
              </div>
              <div class="tj_cp_details">
                <p> <a href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${randInfo3.id}" target="_blank">
                    ${randInfo3.name}
                    </a></p>
                <p>
                  <span class="gray_clor">￥</span>
                  <span class="red_clor"> ${randInfo3.price}</span>
                  <span class="gray_clor">元</span>
                </p>
                <p class="cp_guanzhu">
                  <button onclick="AddAttention(${randInfo3.id})"></button>
                </p>
              </div>
          </li>
          </c:forEach>
        </ul>

    <!--     <div class="bbj_zx_rt_tit">  热门评论 4
          <p>热门评论</p>
        </div>
        <div class="remen_pl">
            <p class="pl_news">
              <span class="gray_clor">原文：</span>
              <span><a href="#" target="_blank">11111111111111111111111111111111111</a></span>
            </p>
            <div class="pl_name">
              <img src="#" alt="" />
              <p>百宝箱网友**</p>
            </div>
            <div class="pl_contain">
                <p>1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</p>
            </div>
        </div>
        <div class="remen_pl">
            <p class="pl_news">
              <span class="gray_clor">原文：</span>
              <span><a href="#" target="_blank">11111111111111111111111111111111111</a></span>
            </p>
            <div class="pl_name">
              <img src="#" alt="" />
              <p>百宝箱网友**</p>
            </div>
            <div class="pl_contain">
                <p>1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</p>
            </div>
        </div>
        <div class="remen_pl">
            <p class="pl_news">
              <span class="gray_clor">原文：</span>
              <span><a href="#" target="_blank">11111111111111111111111111111111111</a></span>
            </p>
            <div class="pl_name">
              <img src="#" alt="" />
              <p>百宝箱网友**</p>
            </div>
            <div class="pl_contain">
                <p>1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</p>
            </div>
        </div> -->
      </div>
  </div>
  </body>
</html>
