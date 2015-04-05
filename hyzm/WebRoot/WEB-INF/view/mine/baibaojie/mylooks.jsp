<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>百宝箱我的关注_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
  <meta name=keywords content="上传">
  <meta name=description content="我的上传">
<script type="text/javascript">
function myCollections() {
	location.href = "<c:url value='/redirect?p=mine/baibaojie/myupload'/>";
}

function gotoUpload() {
	location.href = "<c:url value='/redirect?p=mine/baibaojie/editcollection'/>";
}

function deleteUpload(id) {
	if (confirm("确认要取消关注该藏品？")) {
		  $.ajax({
	         type:'post',
	         url:'<c:url value='/BaiBaoMine_DeleteAttention'/>?id='+id,
	         success:function(data){
	         var jsonData = eval(data);
	         if(data=='0000'){
	         	alert("成功取消关注！");
	         	location.reload() ;
	         }else{
	         	alert(data);
	         }
	        }
	     });
    }
}
</script>
<style type="text/css">
    .pic_list2 li{
      display: block;
      margin-bottom: 20px;
    }
    .bbj_gz_cp{
      width: 248px;
      height: 40px;
      line-height: 40px;
    }
    .bbj_gz_cpname{
      width: 174px;
      _width: 160px;
      white-space:nowrap;
      overflow: hidden;
      white-space:nowrap;

    }
</style>
  </head>

  <body>
<jsp:include page="../../head/header.jsp"></jsp:include>

    <!--main style ben-->
<div class="main_box clear">

  <jsp:include page="../common/myMenu.jsp"></jsp:include>

<div class="user_right fr clear">
     <div class="onuser_tit2">我的关注</div>
     <div class="onuser_box4 clear">
     <p class="tiile_wz">您已关注了<span class="red">${count}</span>件收藏品！</p>

        <div class="bottom_line"></div>
		<ul class="pic_list2" style="height:auto;ovflow:hidden;">
 		<c:forEach items="${list}" var="att" varStatus="cdn">
            <li>
                 <img src="http://116.255.149.172:7080/wswhly/Baibaourl//${fn:split(att.imgurl,',')[0]}" width="235" height="216" alt="${att.name}" />
                  <div class="bbj_gz_cp">
                    <p class="fl">
                        收藏品名称：
                    </p>
                    <p class="fl bbj_gz_cpname">
                      ${att.name}
                    </p>
                </div>
                <div class="button_box" style="height:31px;margin-top:0;">
                  <p style="margin-left:66px;" class="fl">
                    <a href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${att.collectionid}" target="_blank" style="background:#A00203;color:#fff;width:57px;height:21px;line-height:21px;display:block;text-align:center;">
                      查看
                    </a>
                  </p>

                  <p class="fl" style="margin-left:20px;">
                    <a href="javascript:void(0)" onclick="deleteUpload(${att.id})" style="background:#A00203;color:#fff;width:57px;height:21px;line-height:21px;display:block;text-align:center;">取消
                    </a>
                  </p>
                </div>

          </li>
	</c:forEach>
            </ul>

     </div>

   <c:if test="${count / pageSize > 1}">
     <div class="paging2 clear">
        <pg:pager url="BaiBaoMine_getAttentionForList" items="${count}" maxPageItems="6" maxIndexPages="5">
            <pg:param name="pageSize" value="${pageSize}" />
            <pg:param name="redirect" value="mine/baibaojie/mylooks" />
	        <ul class="paging_list2">
	             <pg:first><li class="bg_box"><a href="${pageUrl}">首页</a></li></pg:first>
                 <pg:pages><li><a href="${pageUrl}">${pageNumber}</a></li></pg:pages>
                 <pg:last><li class="bg_box"><a href="${pageUrl}">尾页</a></li></pg:last>
	        </ul>
        </pg:pager>
   </div>
   </c:if>

  </div><!--user_right end-->
</div>
<!--main style end-->
<script type="text/javascript" language="javascript">

        $(document).ready(function() {
           var urlsval = url_request("pager.offset");   // 获取 offset参数
           var urlsval2 = parseInt(urlsval/9)+1;
            $(".paging_list2>li>a").each(function(){
                if ($(this).text()==urlsval2) {
                    $(this).addClass('ymseled')
                }
            });


        });
    </script>

<jsp:include page="../../foot/footer.jsp"></jsp:include>
  </body>
</html>
