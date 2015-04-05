<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>我的收藏</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
<script type="text/javascript">
function deleteMyCollection(value) {
	if(confirm('确定要取消收藏该藏品吗？')){
	   alert('取消成功');
       location.href = "<c:url value='/mine/deleteMyCollection'/>?collectionid="+value;
	}
}
</script>
  </head>
  
  <body>
<jsp:include page="../head/header.jsp"></jsp:include>

    <!--main style ben-->
<div class="main_box clear">

  <jsp:include page="common/myMenu.jsp"></jsp:include>
  
  <div class="user_right fr clear">
     <div class="onuser_tit2">我的收藏</div>   
     <div class="onuser_box4 clear">
        <c:forEach items="${colList}" var="collection" varStatus="cdn">
           <c:if test="${cdn.count % 3 == 1}">
	         <ul class="pic_list2">
           </c:if>
            <li> 
                 <c:choose>
                   <c:when test="${collection.state eq 3}">
	                 <img src="<c:url value='/images/delete_pic.jpg'/>" width="235" height="216" alt="${collection.state eq 3}"/>
                   </c:when>
                   <c:otherwise>
                     <img src="<%=PropertiesUtil.getPropertiesValue("collectionurl")%>small/${collection.imgurl}" width="235" height="216" alt="${collection.state eq 3}"/>
                   </c:otherwise>
                 </c:choose>
                  <div class="tab">
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td class="name">收藏品名称：</td>
                          <c:choose>
                          <c:when test="${collection.state eq 3}">
                            <td><span class="red">已被上传者删除</span></td>
		                  </c:when>
		                  <c:otherwise>
                            <td>${collection.name}</td>
		                  </c:otherwise>
		                  </c:choose>
                        </tr>
                        <tr>
                          <td class="name">收藏品编号：</td>
                          <td><a href="<c:url value='/collection/getCollection?id=${upload.id}&userid=${CurrentSession.id}'/>" target="_blank"> ${collection.serialnum}</a></td>
                        </tr>
                        <tr>
                          <td class="name">所属类别：</td>
                          <td>${collection.typename}</td>
                        </tr>
                        <tr>
                          <td class="name">上传时间：</td>
                          <td>${collection.uploaddate}</td>
                        </tr>
                        <tr>
                          <td class="name">上 传 者：</td>
                          <td>${collection.uploadusername}</td>
                        </tr>
                      </table>
                </div>
                <ul class="button_box2">
                  <c:choose>
                  <c:when test="${collection.state eq 3}">
                     <li></li>
                  </c:when>
                  <c:otherwise>
                  	 <li><a href="<c:url value='/collection/getCollection?id=${collection.id}&userid=${CurrentSession.id}'/>" target="_blank"><img src="<c:url value='/images/chakan.jpg'/>" /></a></li>
                  </c:otherwise>
                  </c:choose>
                  <li><a href="javascript:void(0)" onclick="deleteMyCollection(${collection.id})"><img src="<c:url value='/images/shanchu.jpg'/>" /></a></li>
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
        <pg:pager url="../mine/mypointslist" items="${count}" maxPageItems="9" maxIndexPages="5">
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
