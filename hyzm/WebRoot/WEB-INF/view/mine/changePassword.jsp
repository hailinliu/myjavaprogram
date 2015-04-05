<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>华豫之门-修改密码</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/box111.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
	<script type="text/javascript">
  	$(document).ready(function() {
  		$('#oldpassword').blur(function (){
  			verifyoldpassword();
  		});
  		
  		$('#password').blur(function (){
  			verifypassword();
  		});
  		
  		$('#repassword').blur(function (){
  			verifyrepassword();
  		});
  		
	}); 
  	
  	function verifyoldpassword(){
		var password = $('#oldpassword').val();
		if (password.length > 20 || password.length < 6) {
			$('#oldpasswordp').empty().append("密码长度不符合要求，请重新输入。");
			return false;
		}else{
			$('#oldpasswordp').empty();
			return true;
		}
	}
  	
  	function verifypassword(){
		var password = $('#password').val();
		if (password.length > 20 || password.length < 6) {
			$('#passwordp').empty().append("密码长度不符合要求，请重新输入。");
			return false;
		}else{
			var repassword = $('#repassword').val();
			if(repassword.length != 0){
				if(password == repassword){
					$('#repasswordp').empty();
					return true;
				}else{
					$('#repasswordp').empty().append("密码不一致，请重新输入。");
					return false;
				}
			}else{
				$('#passwordp').empty();
				return true;
			}
		}
	}
	
	function verifyrepassword(){
		var password = $('#password').val();
		var repassword = $('#repassword').val();
		if(password == repassword){
			$('#repasswordp').empty();
			return true;
		}else{
			$('#repasswordp').empty().append("密码不一致，请重新输入。");
			return false;
		}
	}


  	function win_href() {

  		window.location.href="<c:url value='/user/UserCenter'/>";

  	}
	
	function submitform() {
		if(!verifyoldpassword())
  			return false;
  		if(!verifypassword())
  			return false;
  		if(!verifyrepassword())
  			return false;
  		$.ajax({type: "POST",
			dataType: "text",
			async: false,
			url: "<c:url value='/user/ChangePassword'/>",
			data: {oldpassword:$('#oldpassword').val(),password:$('#password').val(),d:new Date().getTime()},
			success:function(data){
				if(data == "0000"){
					$(".forgebox").hide();
					$(".forgebox_success").show();
					setTimeout(function(){$(".forgebox_success").hide();location.href="<c:url value='/user/UserCenter'/>";},3000);  
				}else{
					$('#oldpasswordp').empty().append(data);
				}
			}
		});
  		$("#changepasswordform").submit();
  	}

  	</script>
</head>

<body>
 <jsp:include page="../head/header.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear">

  <jsp:include page="common/myMenu.jsp"></jsp:include>
  
  <div class="user_right fr clear">
     <div class="onuser_tit2">修改密码<span class="fr online_user"></span></div>
     <div class="onuser_box2 clear">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="password">
            <tr>
              <td class="tit_mc">请输入原密码：</td>
              <td class="text_box"><input type="password" name="oldpassword" id="oldpassword" maxlength="20" /><span class="red" id="oldpasswordp"></span></td>
            </tr>
            <tr>
              <td class="tit_mc">请输入新密码：</td>
              <td class="text_box"><input type="password" name="password" id="password" maxlength="20" /><span class="red" id="passwordp"></span></td>
            </tr>
            <tr>
              <td class="tit_mc">请再次输入新密码：</td>
              <td class="text_box"><input type="password" name="repassword" id="repassword" maxlength="20" /><span class="red" id="repasswordp"></span></td>
            </tr>
            <tr>
              <td colspan="2" class="submit"><input type="button" onclick="submitform();" /></td>
            </tr>
        </table>
   </div>
     
  </div><!--user_right end-->
  
</div>
<!--main style end-->  

<!-- 修改成功 -->
<div class="forgebox_guowai forgebox_success">
      <div class="easyDialogBox" style="margin-top:15%;">
      <div id="easyDialogWrapper" class="easyDialog_wrapper">
          <div class="easyDialog_content">
              <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                  <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_x" id="closeBtn">×</a>
                    【 信息提示 】
              </h4>

              <div class="easyDialog_text">
                <font color="red" style="font-size:18px;">修改成功！</font>
              </div>

               <div class="info_text" style="margin-bottom:10px;"> 
                提示：该窗口将在3秒后关闭
              </div>

		<!-- ////////////////////// -->
		

		          <div class="easyDialog_footer">
		              <button class="btn_normal" onclick="win_href();">取消</button>
		              <button class="btn_highlight" id="easyDialogYesBtn" onclick="win_href();">确定</button>
		          </div>

              </div>
          </div>
      </div>
  </div>
 
<jsp:include page="../foot/footer.jsp"></jsp:include>

</body>
</html>