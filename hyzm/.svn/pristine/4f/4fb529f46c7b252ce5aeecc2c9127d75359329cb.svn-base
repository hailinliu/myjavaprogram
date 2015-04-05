<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!-- <title>登陆框</title> -->
<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/heads.css'/>"/>
  <script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
  <meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 华豫之门官方网站 卫视文化乐园">
  <meta name=description content="华豫之门官方网站 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门 华豫之门官方网站 卫视文化乐园">
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
        $('#logincodediv').show();
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
          // location.href="./";
          // close();
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

  <!--[if IE 6]>

    <script type="text/javascript" src="<c:url value='/js/ie6_png.js'/>"></script>
    <script type="text/javascript">DD_belatedPNG.fix('.ie_pngs');</script>
    <![endif]-->

    <!--[if lte IE 6]>
    <style type="text/css">
    body { behavior:url("<c:url value='/css/csshover.htc'/>"); }
    </style>
    <script type="text/javascript">

      //    下拉菜单 效果
      $(document).ready(function() {
      $('.nav_box li').mouseover(function(){

          $(this).children("div.menu").show();
      })
      $('.nav_box li').mouseout(function(){

          $(this).children("div.menu").hide();
      })
      })
    </script>


    <![endif]-->
  </head>

<body>


<div class="ntes-nav-loginframe-pop" id="js_N_login_wrap" style="display:block;top:100px;left:50%;margin-left:6%;">
      <div class="ntes-loginframe clearfix">
          <div class="ntes-loginframe-blank clearfix">
            <!-- <span class="ntes-loginframe-tips ma3">乐园账号&nbsp;</span> -->
                <p class="ma4" id="loginnamep"></p>
              <br />
              <span class="loginframe-hidden">账号：</span>
              <label class="ntes-loginframe-label clearfix">
                <input id="js_loginframe_username" type="text" class="ntes-loginframe-label-ipt" myholder="请输入帐号" autocapitalize="off"  name="username" placeholder="请输入帐号" />
              </label>
          </div>
          <div style="clear:both;"></div>
          <div class="ntes-loginframe-blank clearfix" style="margin-top:20px;">
              <span class="loginframe-hidden" style="">密码：</span>
              <label class="ntes-loginframe-label clearfix">
                  <input type="password" class="ntes-loginframe-label-ipt" id="loginpwd" myholder="请输入密码" autocapitalize="off"  name="password" placeholder="请输入密码"/>
                </label>

                  <span class="ntes-loginframe-label ma6 clearfix forget" style="margin:10px 0 10px 61px;"> <label class="c-fl">
                      <input type="checkbox" id="loginauto" class="ntes-loginframe-checkbox" style="margin-top:8px;" />
                      <span class="c-fl" style="font-size:14px;color:#404040;">自动登录</span></label> <a href="<c:url value='/resets/resetpwd'/>" target="_blank" class="c-fr" style="font-size:14px;font-family:微软雅黑;">忘记密码？</a> </span>
                <div class="ma5"  style="display: none;height:44px;width:330px;" id="logincodediv">
                    <input type="text" id="logincode" class="ntes-loginframe-label-ipt " myholder="请输入验证码" autocapitalize="off"  name="yanzhengma" placeholder="请输入验证码" style="margin-left:58px;width:150px;" />
                    <a href="javascript:void(0);" onclick="document.getElementById('imgcode').src=document.getElementById('imgcode').src+'?'" ><img id="imgcode" src="<c:url value="/validateCode"/>" style="height: 30px; vertical-align: middle;margin:6px 20px 0 0;foat:left;" class="fr"/></a>
              </div>
                <button onclick="login()" id="loginbutton" class="ntes-loginframe-btn" name="btnsubmit" style="margin-top:10px;margin-left:60px;">登　录</button>
          </div>
    </div>
  </div>


    <script language="javascript">
  mfx=function(isWin){
  var t=0,z=3,del=function(){clearInterval(mfx.ID);return mfx};
    del().ID=setInterval(function(){
     var i=t/180*Math.PI,x=Math.sin(i)*z,y=Math.cos(i)*z,s=js_N_login_wrap.style;
    isWin?window.moveBy(x,y):(s.top=x+'px',s.left=y+'px');
    if((t+=90)>1080)del();
    },60);
  }

</script>

</body>
</html>
