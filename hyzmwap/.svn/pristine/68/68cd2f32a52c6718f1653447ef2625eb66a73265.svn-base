<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
  <head>
  <title>华豫之门官方网站-海选报名</title>
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
  <script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
  <script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
  <style>
   .bottom_11{
      /*position:absolute;top:32%;right:10%;*/background: #B9270C;padding: 5px;cursor: pointer;font-size: 12px;color: #fff;border-radius: 5px;border: 0;text-shadow: 0 0px 0 #f3f3f3;/*display: none;*/
    }
    .bsnone{
        display: none;
    }
  </style>
  <script type="text/javascript">
    // 判断登陆
      function pnlogin(ids) {
        // ids专家的id号

        if('${CurrentSession}' == ''){
              alert("参与评论，请先登录");
              location.href = "<c:url value='/redirect?p=login'/>";
              return false;
         }else{
              location.href="<c:url value='/proficient/getProficient?id='/>"+ids+"#pl0";
         }

      }
 $(function(){
 	//加载专家
 	$("#zjjs").html("正在加载，请稍候... ...");
	   var con="";
	   $.ajax({
	         type:'post',
	         url:'<c:url value='/proficient/getBqProficients'/>?s='+Math.random(),
	         success:function(data){
	         var jsonData = eval(data);
	         if(data!='9999'){
	          $.each(jsonData, function(index, objVal) {
	           	if(objVal.isbqhx=='1'||objVal.isbqhx==1){
		            con+="<li class='ui-li-has-thumb'><a data-ajax='false' href='javascript:void(0)' class='ui-btn ui-btn-icon-right ui-icon-carat-r'>";
		        }else{
		          con+="<li class='ui-li-has-thumb'><a data-ajax='false' href='<c:url value='/proficient/getProficient?id='/>"+objVal.id+"' class='ui-btn ui-btn-icon-right ui-icon-carat-r'>";
		        }
			        con+=" <img src='"+objVal.imgurl+"' width='25%' height='100%'>";
			        con+="<h2>"+objVal.name;
			         if(objVal.isbqhx=='1'||objVal.isbqhx==1){
			        	 con+="（"+objVal.hxqh+"海选专家）";
			         }
			        con+="</h2>";
			        con+="<p>"+objVal.speciality+"</p>";
			        if(objVal.isbqhx=='1'||objVal.isbqhx==1){
			        con+="<span onclick=\"pnlogin("+objVal.id+")\" class='bottom_11'>我要评论</span>";
			        }
			        con+="</a></li>";
	          });
	             $("#zjjs").html(con);
	         }else{
	         	$("#zjjs").html("加载失败！");
	         }
	        }
	     });
 });
</script>
  </head>
  <body>
  <div data-role="page">
  <div data-role="header" data-position='fixed'>
  <h1>海选报名流程 </h1>
  </div>
    <img src="<c:url value='/images/qtsimg/hxbmxBj2.jpg'/>" width="100%" style="display: block;"/>

  <!-- <ul data-role="listview">
    <li><a href="javascript:void(0)" onclick="location.href='<c:url value="/mine/gotoupload"/>'">还没上传？【立即上传】 </a></li>
    <li><a href="javascript:void(0)" onclick="location.href='<c:url value="/redirect?p=/mine/recharge"/>'">余额不足？【充&nbsp;&nbsp;&nbsp;&nbsp;值】</a></li>
  </ul>
  <button class="ui-shadow ui-btn ui-corner-all" onclick="location.href='<c:url value="/mine/gotoenroll"/>'">点击此处 【海选报名】</button> -->

<div style="background:#B9270C;text-align:center;color:#fff;padding:8px 0;font-size:16px;">专家介绍</div>
  <ul id="zjjs" name="zjjs" data-role="listview" data-inset="true" class="ui-listview ui-listview-inset ui-corner-all ui-shadow">

    </ul>

<div data-role="footer" data-position="fixed">
  <div data-role="navbar">
    <ul>
      <li><a href="#" data-iconpos="top" data-icon="home" data-ajax="false" onclick="location.href='<c:url value="/mine/gotoupload"/>'">立即上传</a></li>
      <li><a href="#" onclick="location.href='<c:url value="/mine/gotoenroll"/>'" data-iconpos="top" data-icon="star" data-ajax="false">点此报名</a></li>
      <li><a href="<c:url value="/index"/>" data-iconpos="top" data-icon="info" data-ajax="false">返回首页</a></li>

    </ul>
  </div><!-- /navbar -->
</div>

</div><!-- /page -->


  </body>
</html>
