<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.taobao.api.internal.util.WebUtils"/>
<jsp:directive.page import="java.io.IOException"/>
<jsp:directive.page import="com.hyzm.util.ComplTosimple"/>
<%
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  <%
   	String url="http://119.254.110.231:8088/ny/home/index.php?from=singlemessage&isappinstalled=0";

      String s="";
      try{
      s=WebUtils.doPost(url, null, 30000, 30000);
      s=s.replaceAll("/ny/", "http://119.254.110.231:8088/ny/");
      s=s.replace("class=\"row row-black-bg\"", "style=\"display:none;\"");
      s=s.replaceAll("class=\"footer-nav\"", " class=\"footer-nav\" style=\"display: none;\"");
      s=s.replaceAll("class=\"col-xs-12 footer\"", " class=\"col-xs-12 footer\" style=\"display: none;\"");
      s=s.replace("http://119.254.110.231:8088/ny/home/index.php",basePath+"redirect?p=daigou/JSD2&url=");
      }catch(IOException e){
          e.printStackTrace();
      }
   %>

<%--   //繁体转简体--%>
   <%=new ComplTosimple().complTosimple(s)%>
<script>
 $(document).ready(function() {
	  $(".pull-right").hide();
    });
</script>
<script type="text/javascript">
var browser=navigator.appName;
if (browser=="Microsoft Internet Explorer"){
var r=confirm("为了更好的显示效果，建议您更换浏览器继续浏览。如换成chrome、360等浏览器!");
if (r==true)
  {
  window.location.href="http://www.wswhly.com/yclots/getYclotsListByspecialID";
  }
else
  {
  alert("您可能看不到网页内容，再次建议您更换浏览器！如果网页内容未正常显示，请按后退按钮回到上一页。");
  }
  }
</script>