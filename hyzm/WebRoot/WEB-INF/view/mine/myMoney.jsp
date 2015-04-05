<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    
    <title>收支明细_卫视文化乐园-华豫之门官方网站</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  <meta name=keywords content="收支，明细">
  <meta name=description content="卫视文化乐园-华豫之门官方网站收支明细">
<script type="text/javascript">
function getMoneyListByYear(value) {
	location.href = "<c:url value='/mine/mymoneylist'/>?year="+value;
}
</script>
  </head>
  
  <body>
<jsp:include page="../head/header.jsp"></jsp:include>

    <!--main style ben-->
<div class="main_box clear">

  <jsp:include page="common/myMenu.jsp"></jsp:include>
  
  <div class="user_right fr clear">

     <div class="onuser_tit2">收支明细</div>
     <div class="onuser_box clear">
             <div class="onuser_jfmx">
                 <span class="fl online_jf">当前余额：<span class="red">${money}</span>元</span>
                 <span class="fr select_box">
                   <select name="year" accesskey="" onchange="getMoneyListByYear(this.value)">
                      <option value="1" <c:if test="${year eq 1}">selected="selected"</c:if>>最近一年</option>
                      <option value="2" <c:if test="${year eq 2}">selected="selected"</c:if>>最近两年</option>
                      <option value="3" <c:if test="${year eq 3}">selected="selected"</c:if>>最近三年</option>
                   </select>
                 </span>
             </div>
             <table width="100%" border="0" cellspacing="0" cellpadding="0" class="jfmx">
                  <tr>
                    <th>时间</th>
                    <th>交易类型</th>
                    <th>订单号</th>
                    <th>收入</th>
                    <th>支出</th>
                    <th>余额</th>
                    <th class="none">备注</th>
                  </tr>
                  <c:forEach items="${moneyList}" var="money">
                    <tr>
                      <td><span class="red">${money.tradedate}</span></td>
                      <td>
                        <c:if test="${money.type eq 1}">
                                                                      充值
                        </c:if>
                        <c:if test="${money.type eq 2}">
                         <c:if test="${money.tradetype eq 4}">
                                                                      报名
                         </c:if>
                          <c:if test="${money.tradetype eq 5}">
                                                                      交易中转
                         </c:if>
						  <c:if test="${money.tradetype eq 6}">
                                                                     拍品征集鉴定
                         </c:if>
                         <c:if test="${money.tradetype eq 2}">
                                                                      会员升级
                         </c:if>
                         <c:if test="${money.tradetype eq 3}">
                                                                     拍品征集
                         </c:if>
                        </c:if>
                      </td>
                      <td>${money.orderid}</td>
                      <td>
                        <c:if test="${money.type eq 1}">
                           ${money.money}
                        </c:if>
                      </td>
                      <td>
                        <c:if test="${money.type eq 2}">
                           ${money.money}
                        </c:if>
                      </td>
                      <td>${money.leftmoney}</td>
                      <td class="none"></td>
                    </tr>
                  </c:forEach>
                </table>

            
     </div>
     
    <c:if test="${count / pageSize > 1}">
     <div class="paging2 clear">
        <pg:pager url="../mine/mymoneylist" items="${count}" maxPageItems="9" maxIndexPages="5">
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
