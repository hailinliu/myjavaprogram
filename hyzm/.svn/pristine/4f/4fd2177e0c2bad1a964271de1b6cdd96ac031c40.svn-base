<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.taobao.api.internal.util.WebUtils"/>
<jsp:directive.page import="java.io.IOException"/>
<jsp:directive.page import="com.hyzm.util.ComplTosimple"/>
  <%
   	String url="http://119.254.110.231:8088/ny/home/index.php?from=singlemessage&isappinstalled=0";
     
      String s="";
      try{
      s=WebUtils.doPost(url, null, 30000, 30000);
      s=s.replaceAll("/ny/", "http://119.254.110.231:8088/ny/");
      s=s.replace("class=\"row row-black-bg\"", "style=\"display:none;\"");
      s=s.replaceAll("class=\"footer-nav\"", " class=\"footer-nav\" style=\"display: none;\"");
      s=s.replaceAll("class=\"col-xs-12 footer\"", " class=\"col-xs-12 footer\" style=\"display: none;\"");
      s=s.replace("http://119.254.110.231:8088/ny/home/index.php","redirect?p=JSD2&url=");
      }catch(IOException e){
          e.printStackTrace();
      }
   %>
   
<%--   //繁体转简体--%>
   <%=new ComplTosimple().complTosimple(s)%>
