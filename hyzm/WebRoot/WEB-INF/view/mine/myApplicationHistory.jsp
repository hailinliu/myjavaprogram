<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>报名历史</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>

  </head>
  
  <body>
<jsp:include page="../head/header.jsp"></jsp:include>

    <!--main style ben-->
<div class="main_box clear">

  <jsp:include page="common/myMenu.jsp"></jsp:include>
  
  <div class="user_right fr clear">

     <div class="onuser_tit2">报名历史<span class="fr online_user">当前${enroll.cycle}期，海选网上报名时间：${enroll.begindate} -- ${enroll.enddate}</span></div>
     <div class="onuser_box clear">
             <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bmls">
                  <tr>
                    <th>编号</th>
                    <th>报名时间</th>
                    <th>名称</th>
                    <th class="none">海选期</th>
                  </tr>
                  <c:forEach items="${historyList}" var="history">
                    <tr>
                      <td><span class="red">${history.code}</span></td>
                      <td><span class="red">${history.createdate}</span></td>
                      <td><span class="red">${history.title}</span></td>
                      <td class="none"><span class="red">${history.cycle}</span></td>
                    </tr>
                  </c:forEach>
              </table>
     </div>
     
   <c:if test="${count / pageSize > 1}">
     <div class="paging2 clear">
        <pg:pager url="../mine/applicationHistory" items="${count}" maxPageItems="9" maxIndexPages="5">
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
