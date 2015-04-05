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

<title>藏品详情</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<style type="text/css">
body { padding: 0; margin: 0; background: #fff; font-family: "Lucida Grande", Helvetica, Arial,Verdana, sans-serif; color: #444340; }
h1 { font-size: 1.3em; padding: 10px 10px; margin: 0 ; color: #fff}
img { border: none; }
a { color: #444340; }

#Header { background: #000; height: 42px; border-bottom: 1px solid #3c3c3c; text-align: center;}
/*#Header img {float: left}*/
#Header .leftdiv {float: left; padding: 10px 10px;}
#Header .centerdiv {display: inline;}

#MainContent { background: #ffffff; padding-bottom: 30px; }

#Footer { padding: 10px; border-top: none; }

#SocialLinks { padding: 10px 0 0 0; }
#SocialLinks:after { clear: both; content: "."; display: block; height: 0; visibility: hidden; }
#SocialLinks a { display: block; float: left; padding-right: 15px; }

div.gallery-row:after { clear: both; content: "."; display: block; height: 0; visibility: hidden; }
div.gallery-item { float: left; width: 33.333333%; }
div.gallery-item a { display: block; margin: 5px; border: 1px solid #3c3c3c; }
div.gallery-item img { display: block; width: 150px; height: 100px; max-width:100%; }
</style>

<link href="<c:url value='/css/photoswipe.css'/>" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="<c:url value='/jquery/jquery-1.6.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/simple-inheritance.min.js'/>"></script>

<!-- NOTE: including the jQuery engine version -->
<script type="text/javascript" src="<c:url value='/jquery/code-photoswipe-jQuery-1.0.11.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("#Gallery a").photoSwipe();

});

function orederLook() {
  	 var orderid='<%=id %>';
  	 var collectionname='${collection.name}';
 		$.ajax({
 		    type: "POST",
		dataType: "text",
		url: "<c:url value='/collection/addCollectionOrder'/>",
		data: {orderid:orderid,state:'1',collectionname:collectionname},
		success:function(data){
		$('#but').css({"background":"#ccc"});
		$('#but').attr({"disabled":"disabled"});
		$('#collectionsuc').empty().append("预约成功，2个工作日内将有商务专员与您联系，请保持通讯畅通。");
		//$('#time').empty().append("此件藏品，您已于2014-08-01 13:13 提交过预约了。");
		}
	});
}

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
			if (str.length > 1) {
				var s=str[1].substring(0,16);
				if(str[0]=='0'){
				    if(str[2] =='0'){
				      if(window.confirm('对不起，仅星级以上会员才能观摩预约。查看会员级别服务及收费标准？')){
				    	location.href="<c:url value='/mine/gotovip'/>";
				      }
				    }else{
				      orederLook();
				    }
				}else{
					var mess="此件藏品，您已于&nbsp;"+s+"&nbsp;提交过预约了。"
					alert(mess);
			    }
			} else {
				alert(str);
			}

			}
		});
 	}
</script>
  </head>

  <body>

	<div id="Header">
		<div class="centerdiv"><h1>${collection.name}</h1> </div>
	</div>

	<div id="MainContent">

		<div id="Gallery">
		   <%
		     String[] imgarray = (String[])request.getAttribute("imgsarray");
	         for (int i=0;i<imgarray.length;i++) {
	        	 if ((i+1) % 3 == 1){
	       %>
			  <div class="gallery-row">
	       <%
	        	 }
		   %>
				<div class="gallery-item"><a href="<%=imgarray[i]%>"><img src="<%=imgarray[i]%>" alt="${collection.name}"/></a></div>
		   <%
		         if ((i+1) % 3 == 0) {
		   %>
			  </div>
		   <%
		         }
		   %>
	       <%
	         }
	         if (imgarray.length % 3 != 0) {
	       %>
	         </div>
	       <%
	         }
	       %>
	    </div>
   </div>

<div>

		  <p>
		                 收藏品名称：${collection.name}<hr/>
		  收藏品编号：${collection.serialnum}<hr/>
		  所属类别：${collection.typename}<hr/>
		  <c:if test="${not empty col.tvnum}">

	                节目期号：${col.tvnum}<hr/>

          </c:if>

		  推荐专家：<c:choose>
 	   <c:when test="${collection.style eq 18}">王育成</c:when>
 	   <c:when test="${collection.style eq 19}">余光仁</c:when>
 	   <c:when test="${collection.style eq 20}">黄鼎</c:when>
 	   <c:when test="${collection.style eq 21}">高明利</c:when>
 	   <c:when test="${collection.style eq 22}">陈建明</c:when>
 	   <c:when test="${collection.style eq 23}">古方</c:when>
 	 </c:choose>
		  <hr/>
		  <span style="font-size:25px;"><em style="font-style: italic;font-weight:bold;">若</em></span>&nbsp;有意上手观摩，实物交流，&nbsp;&nbsp;请致电&nbsp;<span style="font-size:16px;">0371-60110891</span>，&nbsp;或点击
                   		<input type="button" id="but" value="观摩预约" style="background:#A10005;height:30px;width:94px;border-radius:3px;cursor:pointer;font-size:14px;color:#fff;" onclick="orederLooks();"/>
         <hr/>
          <span style="width: 100%;word-wrap: break-word;">${collection.note}</span>
		  </p>
          <p style="font-size:14px;color:#9E9E9E;margin-left:28px;margin-top:10px;"><span id="collectionsuc"></span></p>
            <p style="font-size:14px;color:#9E9E9E;margin:20px 0 0 28px;"><span id="time"></span></p>
</div>
	<jsp:include page="../comments.jsp?id=${collection.id}"></jsp:include>
    <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
