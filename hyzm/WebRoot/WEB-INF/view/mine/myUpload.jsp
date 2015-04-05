<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>我的藏品</title>

  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
  <script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>

  </head>
<script type="text/javascript">
function myCollections() {
	location.href = "<c:url value='/mine/myupload'/>";
}

function gotoUpload() {
	location.href = "<c:url value='/mine/gotoupload?count=${count}'/>";
}

function deleteUpload(value) {
	if (confirm("确认要删除该藏品？")) {
		alert('删除藏品成功');
		location.href = "<c:url value='/mine/deleteUpload'/>?id="+value;
    }
}
</script>
  <body>
<jsp:include page="../head/header.jsp"></jsp:include>

    <!--main style ben-->
<div class="main_box clear">

  <jsp:include page="common/myMenu.jsp"></jsp:include>

  <div class="user_right fr clear">

     <div class="onuser_tit2">我的藏品<span class="fr online_user"></span></div>

     <div class="onuser_box clear">
	 <p class="tiile_wz">您已上传了<span class="red">${count}</span>件收藏品信息，感谢您为中国的收藏品文化传播所做的贡献！</p>
         <ul class="charge_list">
            <li onclick="gotoUpload()" style="cursor: pointer;">我要上传</li> 
           <li class="red" onclick="myCollections()" style="cursor: pointer;">查看已上传</li>
           
         </ul>
        <div class="bottom_line"></div>
             <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bmls">
                  <tr>
                    <th>收藏品名称</th>
                    <th>收藏品编号</th>
                    <th>所属类别</th>
                    <th>上传时间</th>
                    <th>上 传 者</th>
                    <th class="none">操作</th>
                  </tr>
                 <c:forEach items="${uploadList}" var="upload" varStatus="cdn">
         <tr style="height:50px;">
                    <td>${upload.name}</td>
                    <td>${upload.serialnum}</td>
                    <td>${upload.typename}</td>
                    <td>${upload.uploaddate}</td>
                     <td>${upload.uploadusername}</td>
                     <td>
                  <a href="<c:url value='/mine/gotoUpdateCollection?id=${upload.id}'/>"><img src="<c:url value='/images/xiugai.jpg'/>" alt="修改" /></a>
                  <a href="javascript:void(0)" onclick="deleteUpload(${upload.id})"><img src="<c:url value='/images/shanchu.jpg'/>" alt="删除" /></a></td>
                  
                  </tr>
         </c:forEach>

              </table>
     </div>

 <c:if test="${count / pageSize > 1}">
     <div class="paging2 clear">
        <pg:pager url="../mine/myupload" items="${count}" maxPageItems="9" maxIndexPages="5">
            <pg:param name="pageSize" value="${pageSize}" /> 
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


        });
    </script>
<jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>







