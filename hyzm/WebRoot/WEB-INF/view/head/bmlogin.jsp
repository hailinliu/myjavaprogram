<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <!-- <title></title> -->
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">

	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/heads.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/box111.css'/>"/>
  <script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<meta name=keywords content="鉴定海选报名_艺术品_收藏品_收藏资讯_藏友交流_展览_拍卖_网络拍卖_拍卖会_瓷器_陶器_古籍_书画_玉器_奇石_古钱币_邮品_青铜_佛像">
  <meta name=description content="卫视文化乐园-河南卫视《华豫之门》官方网站，提供鉴定海选报名、艺术品收藏品展览拍卖、收藏资讯和鉴定收藏知识，藏品在线交易平台，网络拍卖，供藏友相互交流交易">
	<link href="<c:url value='/hyzmLogo.ico'/>" mce_href="<c:url value='/hyzmLogo.ico'/>" rel="bookmark" type="image/x-icon" />
	<link href="<c:url value='/hyzmLogo.ico'/>" mce_href="<c:url value='/hyzmLogo.ico'/>" rel="icon" type="image/x-icon" />
	<link href="<c:url value='/hyzmLogo.ico'/>" mce_href="<c:url value='/hyzmLogo.ico'/>" rel="shortcut icon" type="image/x-icon" />
	<script type="text/javascript">
	var errorcount = 0;
	$(document).ready(function() {
		$('#js_loginframe_username').focus(function(){
			var text_value = $(this).val();
			if (text_value == this.defaultValue) {
				$(this).val("");
			}
		});
		$('#logincode').focus(function(){
			var text_value = $(this).val();
			if (text_value == this.defaultValue) {
				$(this).val("");
			}
		});
		if(errorcount > 3 || '${errorcount}' > 2){
			$('#logincodediv').show();
			$('#logincode').blur(function(){
				if($(this).val() == "")
					$(this).val("请输入验证码");
			});
		}
	});

	function login(){
		if($('#js_loginframe_username').val() == ""){
			$('#loginnamep').empty().append("请输入用户名");
			return ;
		}
		if($('#loginpwd').val() == ""){
			$('#loginnamep').empty().append("请输入密码");
			return ;
		}
		var count = '${errorcount}';
		if(errorcount > 3 || count > 2){
			if($('#logincode').val() == ""){
				$('#loginnamep').empty().append("请输入验证码");
				return ;
			}
		}
		var auto = 0;
		if($("#loginauto").attr("checked") == "checked"){
			auto = 1;
		};
		$.ajax({type: "POST",
			dataType: "text",
			url: "<c:url value='/user/Login'/>",
			data: {username:$('#js_loginframe_username').val(),password:$('#loginpwd').val(),verifycode:$('#logincode').val(),auto:auto,d:new Date().getTime()},
			success:function(data){
				if(data == "0000"){
					location.reload();
				}else{
					if(errorcount > 3 || count > 2)
					$('#logincodediv').show();
					$('#loginnamep').empty().append(data);
					document.getElementById('imgcode').src=document.getElementById('imgcode').src+'?';
					errorcount++;
				}
			}
		});
	}

	function logout(){
		$.ajax({type: "POST",
			dataType: "text",
			url: "<c:url value='/user/Logout'/>",
			success:function(data){
				if(data == "0000"){
					window.location.href="<c:url value='/index'/>";
				}
			}
		});
	}

	 String.prototype.startWith=function(s){
		  if(s==null||s==""||this.length==0||s.length>this.length)
		   return false;
		  if(this.substr(0,s.length)==s)
		     return true;
		  else
		     return false;
		  return true;
		 }

/*function KeyDown()
{
    if (event.keyCode == 13)
    {
        event.returnValue=false;
        event.cancel = true;
        login();
    }
}*/

 document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if(e && e.keyCode==108){ //小键盘回车108
                 login();
               }
             if(e && e.keyCode==13){ // enter 键
                 login();
            }
        };

	</script>
  <!-- WPA Button Begin -->
<!-- <script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzgwMDA5ODc3Nl8xODM0MTVfODAwMDk4Nzc2Xw"></script> -->
<!-- WPA Button END -->
  </head>

  <body>
    <!--top ben-->
 <div class="t_top" style="height:35px;">
  <div class="channelHead ">
    <div class="top_box">
       <ul class="top_list" style="width:auto;overflow:hidden;">

       <c:choose>
        <c:when test="${CurrentSession == null}">
          <li class="login"><a href="javascript:void(0);">会员登录</a></li>
           <li class="line">|</li>
           <li><a href="<c:url value='/redirect?p=register'/>" target="_blank">免费注册</a></li>
        </c:when>
        <c:otherwise>
          <li>欢迎您，<a style="color:#C10000;" href="<c:url value='/user/UserCenter'/>">${CurrentSession.username}</a></li>
          <li style="margin-left:15px;"><a href="<c:url value='/user/UserCenter'/>">会员中心</a></li>
          <li class="line">|</li>
          <li><a href="javascript:logout();">退出登录</a></li>
        </c:otherwise>
       </c:choose>
         <!-- <li class="line">|</li>
         <li style="padding-top:5px;">
            <script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzgwMDA5ODc3Nl8xODM0NjhfODAwMDk4Nzc2Xw"></script>
         </li> -->
         <li class="line">|</li>
         <li><span style="cursor: pointer;" onClick="AddFavorite('华豫之门官方网站',location.href)" title="网址">收藏本站</span></li>
       </ul>

       <span class="fl" style="margin-right:10px;margin-left:10px;"><img src="<c:url value='/images/qtzs/logo.png'/>" alt="卫视文化乐园" width="28" /></span>
      <span class="top_wz">欢迎访问卫视文化乐园 - 华豫之门官方网站</span>
    </div>
    <div style="clear:both;"></div>
  </div>

 <!-- 收藏本站代码 -->
 <script type="text/javascript">
//设为首页
function SetHome(obj,url){
    try{
        obj.style.behavior='url(#default#homepage)';
       obj.setHomePage(url);
   }catch(e){
       if(window.netscape){
          try{
              netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
         }catch(e){
              alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
          }
       }else{
        alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【"+url+"】设置为首页。");
       }
  }
}

//收藏本站
function AddFavorite(title, url) {
  try {
      window.external.addFavorite(url, title);
  }
catch (e) {
     try {
       window.sidebar.addPanel(title, url, "");
    }
     catch (e) {
         alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
     }
  }
}
</script>

<!-- 登陆 弹出框 -->
  <div class="pop_upbox" id="login_box" style="">

      <div class="easyDialogBox md-content" style="margin-top:13%;width:450px;">
        <div id="easyDialogWrapper" class="easyDialog_wrapper">
            <div class="easyDialog_content" style="background:url(images/main_bg2.jpg) repeat top center);">
                <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                    <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_x" id="closeBtn">×</a>
                      【 登 陆 】
                </h4>
            <jsp:include page="../login_in.jsp"></jsp:include>
                  <div class="zhuce">
                      <p >没有账号？
                          <a href="<c:url value='/redirect?p=register'/>" target="_blank" style="margin-right:10px;">免费注册</a>
                      </p>
                  </div>
                  <div class="otherCount" style="font-size: 14px;padding-left: 50px; line-height:56px">
                    <span>合作网站账号登录：</span>
                    <!-- <a href="https://graph.qq.com/oauth2.0/authorize?client_id=101198326&response_type=token&scope=all&redirect_uri=http%3A//www.wswhly.com/redirect%3Fp%3DQQ" style="display:inline-block;vertical-align: middle;">
                      <img src="http://www.wswhly.com/images/qq_login.png" alt="" width="42" height="42"></a> -->
                    <a href="https://api.t.sina.com.cn/oauth2/authorize?client_id=2718441686&redirect_uri=http%3A//www.wswhly.com/redirect%3Fp%3DWB&response_type=code" style="display:inline-block;vertical-align: middle;">
                      <img src="http://www.wswhly.com/images/weibo_login.png" alt="" width="42" height="42"></a>
                      <a href="https://open.weixin.qq.com/connect/qrconnect?appid=wxab49c0333cba7cd1&redirect_uri=http%3A//www.wswhly.com/redirect%3Fp%3DWX&response_type=code&scope=snsapi_login&STATE#wechat_redirect" style="display:inline-block;vertical-align: middle;">
                      <img src="http://pic.58pic.com/58pic/12/25/00/37c58PICuME.png" alt="" width="42" height="42"></a>
                  </div>
                </div>
          </div>
      </div>

      <!-- 遮蔽层 半透明 -->
      <div class="pop_bgs box_100" id="pop_bgs">&nbsp;</div>

  </div>


<!--top end-->
 <div style="display:none;">
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1253698178'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/stat.php%3Fid%3D1253698178%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
 <!-- CNZZ统计代码 -->
 </div>
  </body>
</html>

