<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String id="";
if(request.getParameter("id")!=null && !"".equals(request.getParameter("id"))){
  id=request.getParameter("id");
}
 %>
<!DOCTYPE html><html>
<head>
	<title>华豫专家</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<style type="text/css">
body { padding: 0; margin: 0; background: #DFDCD1; font-family: "Lucida Grande", Helvetica, Arial,Verdana, sans-serif; color: #444340; }
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
div.gallery-item {  margin-left: auto; margin-right: auto; width: 50%;  }
div.gallery-item a { display: block; margin: 5px; border: 1px solid #3c3c3c; }
div.gallery-item img { display: block; width: 100%; height: auto; }
</style>

	<link href="<c:url value='/css/photoswipe.css'/>" type="text/css" rel="stylesheet" />

	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.6.1.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jquery/simple-inheritance.min.js'/>"></script>

	<!-- NOTE: including the jQuery engine version -->
	<script type="text/javascript" src="<c:url value='/jquery/code-photoswipe-jQuery-1.0.11.min.js'/>"></script>


<style type="text/css">

  /*遮蔽层*/
  .bm_over{
    height:200%;width:100%;background:rgba(0,0,0,0.4);background:#000;filter:alpha(Opacity=50);-moz-opacity:0.5;opacity: 0.5;position: absolute;z-index: 1000;text-align:center;font-family:微软雅黑; display: none;
  }
  .yz_Code{background: #fff;position: absolute;padding-top: 20%;padding-left:10%;color: #000;border-radius: 5px;height: 100%;display: none;}
</style>

	<script type="text/javascript">

		$(document).ready(function(){

			$("#Gallery a").photoSwipe();


			var plof= window.location.hash;   // 获取当前网址 # 内容
           if(plof=='#pl0'){
              $('.yz_Code').show();

           }
           if(plof=='#content'){
              $('#comments_count').show();

           }
		});

	</script>



</head>
<body>

<!-- 报名验证码 遮蔽层！！！ -->
<div id="bmover" class="bm_over1">
		<div id="checkCode" class="yz_Code">
      	<p>报名编码：<input type="text" id="vcode" name="vcode"  style=""/></p>
      	<p><input type="button" value="点击验证报名编码" onclick="checkCode()" style="background: #B9270C;padding: 7px;cursor: pointer;font-size: 14px;color: #fff;border-radius: 5px;border: 0;text-shadow: 0 0px 0 #f3f3f3;" /></p>
      	<p style="margin-top:2em;">温馨提示：输入海选报名‘短信验证码’才可评论专家</p>
      </div>
</div>


<div id="Header">

	<div class="centerdiv"><h1>${pro.name}</h1> </div>

</div>

<div id="MainContent">

	<div id="Gallery">

		<div class="gallery-row">

			<div class="gallery-item"><a href="${pro.imgurl}"><img src="${pro.imgurl}" alt="${pro.name}" width="150px"/></a></div>

		</div>

	</div>


</div>

<div id="Footer">
    <ui>
      <li>专长：${pro.speciality}</li>
    </ui>
	<p>简介：${pro.note}</p>
</div>
</div>


   <!-- 藏品评论  strart -->
        <div id="comments_count" class="comments_count" style="display:none;">
            <!--高速版，加载速度快，使用前需测试页面的兼容性-->
          <jsp:include page="../comments.jsp"></jsp:include>
        </div>

      <script type="text/javascript" >



      function checkCode(){
       var vcode=$("#vcode").val();
        $.ajax({
	        type:'post',
	        url:'<c:url value='/proficient/checkBmCode'/>',
	        data:'bmcode='+vcode,
	        success:function(data){
	        	if(data=='9999'){
	        		alert('验证失败！');
	        		return false;
	        	}else{
	        		alert('验证成功！');
	        		$('.yz_Code').hide();
	        		$('#comments_count').show();
	        		return true;
	        	}
	        }
  		});

      }

      </script>

</body>
</html>