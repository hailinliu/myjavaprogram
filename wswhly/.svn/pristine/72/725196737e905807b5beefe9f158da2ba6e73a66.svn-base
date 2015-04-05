<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<%--<html>--%>
<%--	<head>--%>
<%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--%>
<%--</head>--%>
<%--<body>--%>
<%--    <a class="zoom" href="http://admin.wswhly.com/zengjipaipin/20150423/b9e5563c-d7cb-4460-989f-71127f8298da.JPG"><img src="http://admin.wswhly.com/zengjipaipin/20150423/b9e5563c-d7cb-4460-989f-71127f8298da.JPG" /></a>--%>
<%--<script type="text/javascript" src="<c:url value="/jquery/jquery-1.8.0.min.js"/>"></script>--%>
<%-- 	    <link rel="stylesheet" type="text/css" href="<c:url value="/css/zoomy0.5.css"/>">--%>
<%--    <script type="text/javascript" src="<c:url value="/jquery/jquery.zoomy0.5.min.js"/>"></script>--%>
<%--    <script type="text/javascript">--%>
<%--    //This is it--%>
<%--    $(function(){    --%>
<%--        $('.zoom').zoomy();--%>
<%--    });--%>
<%--    </script>--%>
<%--</body>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>图片浏览</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<script type="text/javascript" src="<c:url value="/jquery/jquery-1.8.0.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="//jqzoom/jquery.jqzoom-core.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/jqzoom/jqzoom.css"/>" type="text/css"/>
<script type="text/javascript">
var type = navigator.userAgent.match(/.*Mobile.*/)?"mo":"pc";
$(document).ready(function() {

	if(type=='pc'){  
		$('.jqzoom').jqzoom({
		  zoomWidth:500,
	      zoomHeight:500,
		  position:'right',
		  zoomType: 'standard',
		});	
	}else{
	   $('.jqzoom').jqzoom({
		  zoomWidth:800,
	      zoomHeight:800,
		  position:'bottom',
		  zoomType: 'standard',
		});	
	}
});
</script>
<body>
<div class="box-163css" align="center">
<%
	String imgs=request.getParameter("imgs");
	if(imgs!=null&&imgs!=""){
		String pics[]=imgs.split(",");
		for(int i=0;i<pics.length;i++){
			String pic=pics[i];
			if(pic!=null&&pic!=""){
				if(i==0){
				%>
				<div class="part01-pic">
			        <a href="<%=pic %>" class="jqzoom" rel='gal1'><img class="spic" src="<%=pic %>"></a>
			    </div>
			    <div class="part02-pic" >
			    <ul id="thumblist" class="clearfix" >
			    <li><a   class="zoomThumbActive" href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '<%=pic %>',largeimage: '<%=pic %>'}"><img src='<%=pic %>'></a></li>
				<%
				}else{
				%>
				<li><a style="width: 1000;height: 1000" href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '<%=pic %>',largeimage: '<%=pic %>'}"><img src='<%=pic %>'></a></li>
				<%
				}
			}
		}
	}
 %>
	</ul>
	 </div>
</div>
</body>
</html>