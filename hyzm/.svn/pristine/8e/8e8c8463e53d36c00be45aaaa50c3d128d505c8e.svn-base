<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>我的上传_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/gotohyzm/goto_hy.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  <meta name=keywords content="我的上传">
  <meta name=description content="会员上传的藏品">
<script type="text/javascript">
function myCollections() {
	location.href = "<c:url value='/vote/myvipupload'/>";
}

function gotoUpload() {
	location.href = "<c:url value='/vote/gotovipupload?count=${count}'/>";
}

function deleteUpload(value) {
	if (confirm("确认要删除该藏品？")) {
        $.ajax({
           type:'post',
           url:"<c:url value='/vote/deleteVipCollection'/>?id="+value,
           success:function(data){
        	   if(data == "0000"){
  	             alert("删除藏品成功!");
  	             location.reload();
  	            }else{
  	            alert("删除藏品失败!");
  	        	}
           }
        });
	}
}
</script>
  </head>

  <body>


    <!--main style ben-->
<div class="main_box clear">

  <jsp:include page="common/myMenu.jsp"></jsp:include>

<div class="user_right fr clear">
     <div class="onuser_tit2">我的上传</div>
     <div class="onuser_box4 clear">
     <p class="tiile_wz">您已上传了<span class="red">${count}</span>件收藏品信息，感谢您为中国的收藏品文化传播所做的贡献！</p>
         <ul class="charge_list">
            <li onclick="gotoUpload()" style="cursor: pointer;">我要发布</li>
           <li class="red" onclick="myCollections()" style="cursor: pointer;">查看已上传</li>

         </ul>
        <div class="bottom_line"></div>
         <c:forEach items="${uploadList}" var="upload" varStatus="cdn">
           <c:if test="${cdn.count % 3 == 1}">
	         <ul class="pic_list2">
           </c:if>
            <li>
                 <img src="<%=PropertiesUtil.getPropertiesValue("uploadVoteurl")%>/${upload.imgurl}" width="235" height="216" alt="${upload.name}"/>
                  <div class="tab">
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td class="name">收藏品名称：</td>
                          <td>${upload.name}</td>
                        </tr>
                        <tr>
                          <td class="name">收藏品编号：</td>
                          <td>${upload.serialnum}</td>
                        </tr>
                        <tr>
                          <td class="name">所属类别：</td>
                          <td>${upload.typename}</td>
                        </tr>
                        <tr>
                          <td class="name">上传时间：</td>
                          <td>${upload.uploaddate}</td>
                        </tr>
                        <tr>
                          <td class="name">上 传 者：</td>
                          <td>${upload.uploadusername}</td>
                        </tr>
                      </table>
                </div>
                <ul class="button_box">
                  <li><a href="<c:url value='/vote/${upload.id}.dhtml'/>" target="_blank"><img src="<c:url value='/images/chakan.jpg'/>" alt="查看"/></a></li>
                  <li><a href="<c:url value='/vote/${upload.id}.dhtml'/>"><img src="<c:url value='/images/xiugai.jpg'/>" alt="修改"/></a></li>
                  <li><a href="javascript:void(0)" onclick="deleteUpload(${upload.id})"><img src="<c:url value='/images/shanchu.jpg'/>" alt="删除"/></a></li>
                </ul>

          </li>
          <c:if test="${cdn.count % 3 == 0}">
            </ul>
          </c:if>
         </c:forEach>
         <c:if test="${listsize % 3 != 0}">
      </ul>
      </c:if>


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

<jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
