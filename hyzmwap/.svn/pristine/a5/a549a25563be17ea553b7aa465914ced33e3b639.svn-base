<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String id="";
if(request.getParameter("id")!=null && !"".equals(request.getParameter("id"))){
  id=request.getParameter("id");
}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>华豫藏品</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="<c:url value='/css/ratchet.css'/>" rel="stylesheet" />
    <link rel="stylesheet" href="<c:url value='/css/ratchet-theme-ios.min.css'/>">
    <script src="<c:url value='/js/ratchet.min.js'/>"></script>
    <script src="<c:url value='/js/zepto.min.js'/>"></script>
<script type="text/javascript">
function orederLooks() {
  	 var my_element=$(".login");
    if(my_element.length>0){
       alert("观摩预约，请先登录。若无账户，请先注册。");
       return false;
      }
  	 var orderid='<%=id %>';
 		$.ajax({
 		    type: "POST",
			dataType: "text",
			url: "<c:url value='/collection/getCollectionOrder'/>",
			data: {orderid:orderid},
			success:function(data){
			//alert(data);
			var str=data.split("=");
			var s=str[1].substring(0,16);
			if(str[0]=='0'){
			  if(str[2] =='0'){
			  $('#collectionsuc').empty().append("对不起，仅星级以上会员才能观摩预约。 <a style='color:blue' href='<c:url value='/mine/gotovip'/>'>查看会员级别服务及收费标准</a>");
			  }else{
			  orederLook();
			  }
			}else{
			$('#but').css({"background":"#ccc"});
			$('#but').attr({"disabled":"disabled"});
				var mess="此件藏品，您已于&nbsp;"+s+"&nbsp;提交过预约了。"
			$('#time').empty().append(mess);
			}

			}
		});
 	}
</script>
  </head>

  <body>

	<header class="bar bar-nav">
	    <h1 class="title">藏品详情</h1>
	</header>
	<div class="content">

	   <div class="slider">
        <div class="slide-group">
           <%
	         String[] imgarray = (String[])request.getAttribute("imgsarray");
	         for (int i=0;i<imgarray.length;i++) {
	       %>
	          <div class="slide">
	             <img src="<%=imgarray[i]%>" alt="Skyfall" width="640" height="300">
	          </div>
	       <%
	         }
	       %>
        </div>
      </div>

	  <ul class="table-view">
		  <li class="table-view-cell">收藏品名称：${collection.name}</li>
		  <li class="table-view-cell">收藏品编号：${collection.serialnum}</li>
		  <li class="table-view-cell">所属类别：${collection.typename}</li>
		  <c:if test="${not empty col.tvnum}">
			  <li class="table-view-cell">
	                节目期号：${col.tvnum}
			  </li>
          </c:if>
		  <li class="table-view-cell">
		  推荐专家：<c:choose>
 	   <c:when test="${collection.style eq 18}">王育成</c:when>
 	   <c:when test="${collection.style eq 19}">余光仁</c:when>
 	   <c:when test="${collection.style eq 20}">黄鼎</c:when>
 	   <c:when test="${collection.style eq 21}">高明利</c:when>
 	   <c:when test="${collection.style eq 22}">陈建明</c:when>
 	   <c:when test="${collection.style eq 23}">古方</c:when>
 	 </c:choose>
		  </li>
		  <li class="table-view-cell"><span style="font-size:25px;"><em style="font-style: italic;font-weight:bold;">若</em></span>&nbsp;有意上手观摩，实物交流，&nbsp;&nbsp;请致电&nbsp;<span style="font-size:16px;">0371-60110891</span>,&nbsp;<span style="font-size:16px;">18790282811</span>，&nbsp;或点击
                   		<input type="button" id="but" value="观摩预约" style="background:#A10005;height:30px;width:94px;border-radius:3px;cursor:pointer;font-size:14px;color:#fff;" onclick="orederLooks();"/>
          </li>
          <li class="table-view-cell">${collection.note}</li>
	  </ul>
          <p style="font-size:14px;color:#9E9E9E;margin-left:28px;margin-top:10px;"><span id="collectionsuc"></span></p>
            <p style="font-size:14px;color:#9E9E9E;margin:20px 0 0 28px;"><span id="time"></span></p>
	</div>
    <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
