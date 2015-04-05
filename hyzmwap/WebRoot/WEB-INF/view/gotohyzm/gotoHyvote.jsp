<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String id="";
if(request.getParameter("id")!=null && !"".equals(request.getParameter("id"))){
  id=request.getParameter("id");
}
 %>
<!DOCTYPE html>
<html>
  <head>

<title>藏品详情</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
<style type="text/css">
body { padding: 0; margin: 0; background: #fff; font-family: "Lucida Grande", Helvetica, Arial,Verdana, sans-serif; color: #444340; }
h1 { font-size: 1.3em; padding: 10px 10px; margin: 0 ; color: #fff}
img { border: none; }
a { color: #444340; }

	hr{
		background:#ccc;
		border:0;
		height: 1px;
	}


#Header { background: #ccc; height: 42px; border-bottom: 1px solid #3c3c3c; text-align: center;}
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
div.gallery-item a { display: block; margin: 5px; border: 1px solid #ccc; }
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

function vote(collectionid) {
	if('${CurrentSession}' == ''){
	 	alert("参与投票请先登录。");
	 	location.href = "<c:url value='/redirect?p=login'/>";
	 	return false;
	 }else{
	 	$.ajax({
        type:'post',
        url:"<c:url value='/vote/vote'/>",
        data:{ collectionid:collectionid
        },
        success:function(data){
        	if(data == '0000'){
        		alert("投票成功！");
        		location.reload();
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

	<div id="Header">
		<div class="centerdiv"><h1>${activity.name}</h1> </div>
	</div>

	<div id="MainContent">

		<div id="Gallery">
		   <%
		     String image = (String)request.getAttribute("imgarray");
		     String[] imgarray = image.split(",");
	         for (int i=0;i<imgarray.length;i++) {
	        	 if ((i+1) % 3 == 1){
	       %>
			  <div class="gallery-row">
	       <%
	        	 }
		   %>
				<div class="gallery-item"><a href="http://116.255.149.172:7080/wswhly/voteactivity/<%=imgarray[i]%>"><img src="http://116.255.149.172:7080/wswhly/voteactivity/<%=imgarray[i]%>" alt="${activity.name}"/></a></div>
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
		                 收藏品名称：${activity.name}<hr/>
  		  收藏品编号：${activity.serialnum}<hr/>
		  所属类别：${activity.typename}<hr/>
		  当前票数：${activity.votenum}票 &nbsp; &nbsp; &nbsp;<input type="button" id="but" value="投票" style="background:#B9270C;height:30px;padding:0 10px;border-radius:5px;border:0;cursor:pointer;font-size:14px;color:#fff;" onclick="vote(${activity.id});"/><hr/>

          ${activity.note}
		  </p>
</div>
	<jsp:include page="../comments.jsp?id=${activity.id}"></jsp:include>
    <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
