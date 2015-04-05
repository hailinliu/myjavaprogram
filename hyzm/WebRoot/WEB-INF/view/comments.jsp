<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.hyzm.util.PropertiesUtil" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String id="";
if(request.getParameter("id")!=null && !"".equals(request.getParameter("id"))){
  id=request.getParameter("id");
}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

  <title>评论</title>

  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/commentsbox.css'/>"/>
 <script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
<script>

$(function(){
var count =parseInt('${size}')+parseInt('${counts}');
$("#countSize").html(count);
 var logusername='${CurrentSession.username}';
 if(logusername ==""){
  $("#loginAdd").show();
  $("#loginUer").hide();
 }else{
  $("#loginAdd").hide();
  $("#loginUer").show();

 }
});



 function getCount(id){
   var id= $("#id"+id).val();
   var idlike= parseInt($("#idlike"+id).val())+1;
    $("#like"+id).html(parseInt($("#like"+id).html())+1);
   $.ajax({
  		    type: "POST",
			dataType: "text",
			url: "<c:url value='/froums/updateForumsInfo'/>",
			data: {id:id ,likenum:idlike},
			success:function(data){
            // alert("谢谢您的参与!");
			}
		});
 }
function addForums() {
var my_element=$(".login");
     if(my_element.length>0){
        alert("参与评论，请先登录。若无账户，请先注册。");
        return false;
       }
    var content=document.getElementById("content").value;
   	 var collectionid='<%=id%>';
     if(content == "" || content == "文明上网，登陆评论..."){
         alert("请您输入要回复的内容!");
         $('#content').val('');
       return false;
       }
  		$.ajax({
  		    type: "POST",
			dataType: "text",
			url: "<c:url value='/froums/forumsInfo'/>",
			data: {collectionid:collectionid ,
			        content:content,
			        collectionnum:'${collection.serialnum}',
			        type:'${type}'
			        },
			success:function(data){
               // alert("谢谢您的参与!");
                location.reload();
                if ('${type}' == '2') {
                    location.href = "<c:url value='/vote/gotoHyvote?type=2&id='/>"+collectionid+"#content";
                } else if ('${type}' == '3') {
                    location.href = "<c:url value='/vote/gotoHygem?type=3&id='/>"+collectionid+"#content";
                } else if ('${type}' == '4') {
	                location.href = "<c:url value='/vote/gotoHyvip?type=4&id='/>"+collectionid+"#content";
                } else if('${type}'=='5'){
               	    location.href = "<c:url value='/video/getVideo?id='/>"+collectionid+"#content";
                } else if('${type}'=='6'){
               	    location.href = "<c:url value='/news/getOneNews?id='/>"+collectionid+"#content";
                } else if('${type}'=='7'){
               	    location.href = "<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id='/>"+collectionid+"#content";
                }  else if('${type}'=='8'){
               	    location.href = "<c:url value='/flagshopbaseinfo/getFlagShopvideodetail?baseid=${baseinfo.id}&id='/>"+collectionid+"#content";
                } else if('${type}'=='9'){
               	    location.href = "<c:url value='/proficient/getProficient?id='/>"+collectionid+"#content";
                }else {
                	location.href = "<c:url value='/collection/getCollectionus?id='/>"+collectionid+"#content";
                }
			}
		});
  	}

function addReply(id) {

 var my_element=$(".login");
     if(my_element.length>0){
        alert("参与评论，请先登录。若无账户，请先注册。");
        return false;
       }
       var content= $('#reContent'+id).val();
       if(content == "" || content == "我要回复。。。"|| content == "文明上网，登陆评论..."){
         alert("请您输入要回复的内容!");
         $('#reContent'+id).val('');
    	 return false;
       }
   	   var collectionid='<%=id%>';
   	  // alert(collectionid);
  		$.ajax({
  		    type: "POST",
			dataType: "text",
			url: "<c:url value='/froums/addReply'/>",
			data: {collectionid:collectionid ,
			        content:content,
			        collectionnum:'${collection.serialnum}',
			        id:id, //回复编号id
			        type:'${type}'
			        },
			success:function(data){
               // alert("谢谢您的参与!");
                 $("#hfreply"+id).hide();
               location.reload();
               if ('${type}' == '2') {
                   location.hash = "<c:url value='/vote/gotoHyvote?type=2&id='/>"+collectionid+"#comment_sohu";
               } else if ('${type}' == '3') {
                   location.hash = "<c:url value='/vote/gotoHygem?type=3&id='/>"+collectionid+"#comment_sohu";
               } else if ('${type}' == '4') {
	               location.hash = "<c:url value='/vote/gotoHyvip?type=4&id='/>"+collectionid+"#content";
               } else if('${type}'=='5'){
               	    location.href = "<c:url value='/video/getVideo?id='/>"+collectionid+"#content";
               }else if('${type}'=='6'){
               	    location.href = "<c:url value='/news/getOneNews?id='/>"+collectionid+"#content";
                }else if('${type}'=='7'){
               	    location.href = "<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id='/>"+collectionid+"#content";
                }else if('${type}'=='8'){
               	    location.href = "<c:url value='/flagshopbaseinfo/getFlagShopvideodetail?baseid=${baseinfo.id}&id='/>"+collectionid+"#content";
                }else if('${type}'=='9'){
                  alert("评论成功！");
               	    location.href = "<c:url value='/proficient/getProficient?id='/>"+collectionid+"#content";
                } else {
	               location.hash = "<c:url value='/collection/getCollectionus?id='/>"+collectionid+"#comment_sohu";
               }
               location.reload();
			}
		});

  	}
 function logins(id){
  var logusername='${CurrentSession.username}';
  var username=$("#username"+id).val();
  var pwd=$("#pwd"+id).val();
 if(logusername==""){
   if(username == "" || pwd == "" ){
      alert("请您输入账户名和密码。若无账户，请先注册。");
   }else{
  $.ajax({type: "POST",
      dataType: "text",
      url: "<c:url value='/user/Login'/>",
      data: {username:username ,password:pwd ,d:new Date().getTime()},
      success:function(data){
        if(data == "0000"){
         alert("登陆成功!");
         location.reload();
            if ('${type}' == '2') {
                   location.hash = "<c:url value='/vote/gotoHyvote?type=2&id='/>"+collectionid+"#comment_sohu";
               } else if ('${type}' == '3') {
                   location.hash = "<c:url value='/vote/gotoHygem?type=3&id='/>"+collectionid+"#comment_sohu";
               } else if ('${type}' == '4') {
	               location.hash = "<c:url value='/vote/gotoHyvip?type=4&id='/>"+collectionid+"#content";
               } else if('${type}'=='5'){
               	    location.href = "<c:url value='/video/getVideo?id='/>"+collectionid+"#content";
               }else if('${type}'=='6'){
               	    location.href = "<c:url value='/news/getOneNews?id='/>"+collectionid+"#content";
                }else if('${type}'=='7'){
               	    location.href = "<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id='/>"+collectionid+"#content";
                }else if('${type}'=='8'){
               	    location.href = "<c:url value='/flagshopbaseinfo/getFlagShopvideodetail?baseid=${baseinfo.id}&id='/>"+collectionid+"#content";
                } else if('${type}'=='9'){
                  alert("评论成功！");
               	    location.href = "<c:url value='/proficient/getProficient?id='/>"+collectionid+"#content";
                }else {
	               location.hash = "<c:url value='/collection/getCollectionus?id='/>"+collectionid+"#comment_sohu";
               }
        // location.reload();
        }else{
         alert("用户名或密码输入错误，请重试!");
        }
      }
    });
    }
  }else{
   alert("您已经登陆!");

  }

 }
 function logout(){
		$.ajax({type: "POST",
			dataType: "text",
			url: "<c:url value='/user/Logout'/>",
			success:function(data){
				if(data == "0000"){
					//window.location.href="<c:url value='/index'/>";
					location.reload();
					   if ('${type}' == '2') {
                   location.hash = "<c:url value='/vote/gotoHyvote?type=2&id='/>"+collectionid+"#comment_sohu";
               } else if ('${type}' == '3') {
                   location.hash = "<c:url value='/vote/gotoHygem?type=3&id='/>"+collectionid+"#comment_sohu";
               } else if ('${type}' == '4') {
	               location.hash = "<c:url value='/vote/gotoHyvip?type=4&id='/>"+collectionid+"#content";
               } else if('${type}'=='5'){
               	    location.href = "<c:url value='/video/getVideo?id='/>"+collectionid+"#content";
               }else if('${type}'=='6'){
               	    location.href = "<c:url value='/news/getOneNews?id='/>"+collectionid+"#content";
                }else if('${type}'=='7'){
               	    location.href = "<c:url value='/flagshopbaseinfo/getFlagShopnewdetail?baseid=${baseinfo.id}&id='/>"+collectionid+"#content";
                }else if('${type}'=='8'){
               	    location.href = "<c:url value='/flagshopbaseinfo/getFlagShopvideodetail?baseid=${baseinfo.id}&id='/>"+collectionid+"#content";
                } else if('${type}'=='9'){
               	    location.href = "<c:url value='/proficient/getProficient?id='/>"+collectionid+"#content";
                }else {
	               location.hash = "<c:url value='/collection/getCollectionus?id='/>"+collectionid+"#comment_sohu";
               }

				}
			}
		});
	}
  	function gotoresetpwd(){
	  location.href = "<c:url value='/resets/resetpwd'/>";

	}

$(function() {
  $('.icon-gw').click(function(){

      $(this).next().show();

  })


//   输入框事件
  $(document).ready(function(){
 //focusblur
    jQuery.focusblur = function(focusid) {

 var focusblurid = $(focusid);
 var defval = focusblurid.val();
         focusblurid.focus(function(){

 var thisval = $(this).val();
 if(thisval==defval){
                 $(this).val("");

            }
         });
         focusblurid.blur(function(){

 var thisval = $(this).val();
 if(thisval==""){
                 $(this).val(defval);

             }
        });
     };
 /*下面是调用方法*/
     $.focusblur("#content");
     $.focusblur("#username");
    $.focusblur("#pwd")
    $.focusblur("#reContent");
    $.focusblur(".textarea-fw");
     $.focusblur(".username_i_w");
    $.focusblur(".password_i_w")
 });

})

</script>
</head>
<body>

  <!-- 藏品评论  strart -->
  <!--高速版，加载速度快，使用前需测试页面的兼容性-->
  <div id="SOHUCS" style="width: 100%; height: auto;">
    <div id="SOHU_MAIN">
      <div id="SOHU-comment-main" class="sohu-comment-wrapper">
        <div id="article_info_sohu">
          <div class="reset-g clear-g section-title-w section-title-loginStyle">
            <div class="title-join-w">
              <div class="join-wrap-w join-wrap-b"> <strong class="wrap-name-w wrap-name-b">藏友评论</strong>
                <span class="wrap-join-w wrap-join-b">
                  ( <em class="join-strong-gw join-strong-bg" id="countSize">0</em>
                  人参与 <i class="gap-b">，</i> <em class="join-strong-gw join-strong-bg">${size}</em>
                  条评论)
                </span>
              </div>
            </div>

           <!--  <div class="title-user-w">
              <div class="clear-g user-wrap-w user-wrap-b">
                <span class="wrap-name-w wrap-name-b">用户名</span>
                <span class="wrap-icon-w wrap-icon-b"></span>
                <div class="wrap-menu-dw wrap-menu-bd">
                  <div class="menu-box-dw menu-box-bd">
                    <a href="javascript:void(0)"> <i class="gap-dgw">我的评论</i>
                    </a>

                    <a href="javascript:void(0)" class="menu-box-dw-quit">
                      <i class="gap-dgw gap-bdg">退出</i>
                    </a>
                  </div>
                </div>
              </div>
            </div> -->

          </div>
        </div>

        <!-- 评论输入框 -->
        <div id="comment_sohu">
          <div class="reset-g section-cbox-w">
            <!-- <div style="width:1px;height:1px;overflow:hidden;">
              <img src="http://changyan.itc.cn/v2/asset/scs/imgs/vcode.jpg" style="visibility:hidden;width:1px;height:1px;" alt="" /></div> -->
            <div class="clear-g cbox-block-w">
              <div class="block-head-w">
                <div class="head-img-w">
                  <a href="javascript:void(0)" target="_self">
                    <img src="../images/pinglun/pic42_null.gif" onerror="SOHUCS.isImgErr(this)" width="42" height="42" alt="" /></a>
                </div>

              </div>
              <div class="block-post-w block-post-default-e">
                <div class="post-wrap-w post-wrap-b">
                  <div class="wrap-area-w">
                    <div class="area-textarea-w"style="position:relative;zoom:1;z-index:9;">
                      <textarea name="content" id="content" class="textarea-fw textarea-bf" onkeydown='if (this.value.length>=200){event.returnValue=false}' placeholder="请输入评论内容">文明上网，登陆评论...</textarea>
                    </div>
                  </div>
                  <div class="clear-g wrap-action-w wrap-action-b">
                    <div class="action-function-w action-function-b relative-z-w">
                      <ul class="clear-g">
                        <li class="function-face-w">
                          <a href="javascript:void(0)" class="effect-w" title="表情">
                            <i class="face-b"></i>
                          </a>
                        </li>


                        <!-- <li class="function-at-w">
                          <a href="javascript:void(0)" class="effect-w">
                            <i class="at-b"></i>
                          </a>
                        </li> -->

                    </ul>

                    <!-- 表情包 -->


                    <!-- end 表情包 -->


                  </div>

                  <!-- 登陆框 -->
                  <div class="login_w" id="loginAdd">

                    <div class="cmnt_name" style="">
                  					  账号：
                      <input name="user" id ="username" autocomplete="off" placeholder="乐园账号" value="乐园账号" class="form_input_long  J_Login_User" value="${CurrentSession.username}"></div>

                    <div class="cmnt_name" style="">密码：
                      <input  name="user" type="password"  id="pwd" autocomplete="off" placeholder="请输入密码" value="请输入密码" class="form_input_long  J_Login_User" value=""></div>

                    <div class="cmnt_usertext" style="">
                      <a href="javascript:logins('')">登陆</a>
                           |
                      <a href="http://www.wswhly.com/redirect?p=register">注册</a>
                         |
                      <a href="javascript:gotoresetpwd();">忘记密码？</a>
                    </div>

                  </div>

                   <div class="login_w" id="loginUer">

                    <div class="cmnt_usertext" style="float:left;">
                      <a href="javascript:logins('')">用户名：<i class="newred">${CurrentSession.username}</i></a>
                       <a href="javascript:logout()">退出</a>
                    </div>

                  </div>

                  <div class="clear-g action-issue-w">
                    <div class="issue-btn-w">
                      <a href="javascript:void(0)">
                        <button class="btn-fw btn-bf btn-fw-main"  onclick="javascript:addForums();">发布</button>
                      </a>
                    </div>
                  </div>
                </div>
              </div>

              <!-- 登陆框 -->


            </div>
          </div>
        </div>
      </div>

      <!-- 最新评论 -->

      <div id="list_sort_sohu"></div>
      <div id="list_sohu">
        <div class="reset-g section-list-w">
          <div class="list-block-gw list-newest-w list-newest-b">
            <div class="block-title-gw">
              <ul class="clear-g">
                <li> <strong class="title-name-gw title-name-bg">最新评论</strong>
                </li>
              </ul>
            </div>
              <c:forEach items="${listForum}" var="forums" varStatus="cdn">
               <input type="hidden" id="id${forums.id}" value="${forums.id}"/>
               <input type="hidden" id="idlike${forums.id}" value="${forums.likenum}"/>
            <div class="clear-g block-cont-gw block-cont-bg" >
              <div class="cont-head-gw">
                <div class="head-img-gw">
                  <a href="javascript:void(0)" commhref="javascript:void(0)">
                    <img src="../images/pinglun/pic42_null.gif" onerror="SOHUCS.isImgErr(this)" width="42" height="42" alt=""></a>
                </div>
              </div>
              <div class="cont-msg-gw">
                <div class="msg-wrap-gw">
                  <div class="wrap-user-gw">

                    <span class="user-time-gw user-time-bg evt-time">
                     <c:choose>
                         <c:when test="${fn:length(forums.forumtime) > 10}">
                           ${fn:substring(forums.forumtime,0,19)}
                         </c:when>
                         <c:otherwise>
                           ${forums.forumtime}
                         </c:otherwise>
                       </c:choose>

                    </span>
                    <span class="user-name-gw">
                      <a href="javascript:void(0)" commhref="javascript:void(0)" title="靓影" uid="180422260">${forums.username}</a>
                    </span>
                    <span class="user-address-gw">
                        [ <i>
                 <c:if test="${forums.level eq 0}"><span class="hy_dj">免费会员</span></c:if>
            	 <c:if test="${forums.level eq 1}"><span class="hy_dj">星级会员</span></c:if>
            	 <c:if test="${forums.level eq 2}"><span class="hy_dj">贵宾会员</span></c:if>
            	 <c:if test="${forums.level eq 3}"><span class="hy_dj">高级会员</span></c:if>
            	 <c:if test="${forums.level eq 4}"><span class="hy_dj">超级会员</span></c:if>
            	       </i>]
                    </span>
                  </div>
                  <div class="wrap-issue-gw">
                    <p class="issue-wrap-gw">
                      <span class="wrap-word-bg">${forums.content}</span>
                    </p>
                  </div>
                  <div class="clear-g wrap-action-gw">
                    <div class="action-click-gw" style="position:relative;">
                      <i class="gap-gw"></i>
                      <span class="click-ding-gw">
<%--                        <a href="javascript:getCount('${forums.id}')" title="顶" class="evt-support">--%>
<%--                          <i class="icon-gw icon-ding-bg"  ></i>--%>
<%--                           <i class="zb_ssss" style="display:block;display:none;width:37px;height:15px;background:none;position:absolute;top: 0;left: 20px;"></i>--%>
<%--                          <em class="icon-name-bg" id="like${forums.id}">${forums.likenum}</em>--%>
<%--                        </a>--%>

                      </span>
                      <i class="gap-gw"></i>
                      <span class="click-reply-gw click-reply-eg">
                        <a href="javascript:void(0)" class="evt-reply" id="reply_1" onclick="hf_comment1('${forums.id}','0')">回复</a>
                      </span>
                      <i class="gap-gw"></i>
                     <!--  <span class="click-share-gw click-reply-eg">
                        <a href="javascript:void(0)" class="evt-share">分享</a>
                      </span> -->
                    </div>
                    <div class="action-from-gw action-from-bg"></div>
                  </div>

                  <script type="text/javascript">
                    function hf_comment1(id){
                    var logusername='${CurrentSession.username}';
                       $("#hfreply"+id).show();
						 if(logusername ==""){
						  $(".login_w_s").show();
						$(".login_w_uss").hide();
						 }else{
						  $(".login_w_s").hide();

						  $(".login_w_uss").show();

						 }

                    }
                  </script>

          <!-- 回复评论框 -->
                  <div class="wrap-reply-gw" id="hfreply${forums.id}" style="display:none">
                    <div class="reset-g section-cbox-w">
                      <div class="clear-g cbox-block-w">
                        <div class="block-head-w">
                          <div class="head-img-w"></div>
                        </div>
                        <div class="block-post-w block-post-default-e">
                          <div class="post-wrap-w post-wrap-b">
                            <div class="wrap-area-w">
                              <div class="area-textarea-w" style="position:relative;zoom:1;z-index:9;">
                                <textarea name="" id="reContent${forums.id}" class="textarea-fw textarea-bf" onfocus="javascript:this.value=''">我要回复。。。</textarea>
                              </div>
                            </div>

                            <div class="clear-g wrap-action-w wrap-action-b">
                              <div class="action-function-w action-function-b relative-z-w">
                                <ul class="clear-g">
                                  <li class="function-face-w">
                                    <a href="javascript:void(0)" class="effect-w" title="表情"> <i class="face-b"></i>
                                    </a>
                                  </li>

                              </ul>
                            </div>
                            <!-- 登陆框 -->
                  <div class="login_w login_w2 login_w_s" id="loginAdd1">

                    <div class="cmnt_name" style="">
                  					  账号：
                      <input name="user" id ="username${forums.id}" value="乐园账号" autocomplete="off" placeholder="乐园账号" class="form_input_long  J_Login_User username_i_w" value="${CurrentSession.username}"></div>

                    <div class="cmnt_name" style="">密码：
                      <input  name="user" id="pwd${forums.id}" type="password" autocomplete="off" placeholder="请输入密码" class="form_input_long  J_Login_User password_i_w" value="请输入密码"></div>

                    <div class="cmnt_usertext" style="">
                      <a href="javascript:logins('${forums.id}')">登陆</a> |
                      <a href="http://www.wswhly.com/redirect?p=register">注册</a> |
                      <a href="javascript:gotoresetpwd();">忘记密码？</a>
                    </div>

                  </div>
                  <div class="login_w login_w_uss" id="loginUer1">

                    <div class="cmnt_usertext" style="float:left;">
                      <a href="">用户名：<i class="newred">${CurrentSession.username}</i></a>
                       <a href="javascript:logout()">退出</a>
                    </div>

                  </div>
                            <div class="clear-g action-issue-w">
                              <div class="issue-btn-w">
                                <a href="javascript:void(0)">
                                  <button class="btn-fw btn-bf btn-fw-main" onclick="addReply('${forums.id}');">发布</button>
                                </a>
                              </div>

                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  </div>

          <!-- END 回复框 -->

          <!-- 回复评论内容  -->
           <c:forEach items="${listRepaly}" var="repaly" varStatus="cdn">
                       <c:if test="${forums.id eq repaly.countnum}">
                <div class="wrap-build-gw">
                    <div class="build-floor-gw">
                      <!--div class="build-floor-gw"-->
                      <div class="build-msg-gw borderbot">
                        <div class="wrap-user-gw">

                          <span class="user-time-gw user-time-bg user-floor-gw">
                           <c:choose>
                         <c:when test="${fn:length(repaly.forumtime) > 10}">
                           ${fn:substring(repaly.forumtime,0,19)}
                         </c:when>
                         <c:otherwise>
                           ${repaly.forumtime}
                         </c:otherwise>
                       </c:choose>
                         </span>
                          <span class="user-name-gw">
                            <a href="javascript:void(0)">${repaly.username}</a>
                          </span>
                           <span class="user-address-gw">
                        [ <i>
                 <c:if test="${forums.level eq 0}"><span class="hy_dj">免费会员</span></c:if>
            	 <c:if test="${forums.level eq 1}"><span class="hy_dj">星级会员</span></c:if>
            	 <c:if test="${forums.level eq 2}"><span class="hy_dj">贵宾会员</span></c:if>
            	 <c:if test="${forums.level eq 3}"><span class="hy_dj">高级会员</span></c:if>
            	 <c:if test="${forums.level eq 4}"><span class="hy_dj">超级会员</span></c:if>
            	       </i>]
                    </span>

                        </div>
                        <!--div class="wrap-hidden-gw wrap-hidden-bg">
                        <a href="#">评论已被折叠，查看请点击。</a>
                      </div-->
                      <div class="wrap-issue-gw">
                        <p class="issue-wrap-gw">
                          <span class="wrap-word-bg">${repaly.content}</span>
                        </p>
                      </div>
                      <!-- picture show  Begin -->
                      <!-- picture show  End -->

                      <div class="clear-g wrap-action-gw evt-active-wrapper" style="visibility: hidden;">
                        <div class="action-click-gw">
                          <i class="gap-gw"></i>
                          <span class="click-ding-gw">
                            <a href="javascript:void(0)" title="顶" class="evt-support">
                              <i class="icon-gw icon-ding-bg"></i> <em class="icon-name-bg"></em>
                            </a>
                          </span>
                          <i class="gap-gw"></i>
                          <span class="click-cai-gw">
                            <a href="javascript:void(0)" title="踩" class="evt-opposed">
                              <i class="icon-gw icon-cai-bg"></i> <em class="icon-name-bg"></em>
                            </a>
                          </span>
                          <i class="gap-gw"></i>
                          <span class="click-reply-gw click-reply-eg">
                            <a href="javascript:void(0)" class="evt-reply" id="reply_1" onclick="hf_comment1()">回复</a>
                          </span>
                          <i class="gap-gw"></i>
                          <!-- <span class="click-share-gw click-reply-eg">
                            <a href="javascript:void(0)" class="evt-share">分享</a>
                          </span> -->
                        </div>
                        <div class="action-from-gw action-from-bg"></div>
                      </div>

                    </div>
                    <!--/div--> </div>
                </div>
                 </c:if>
                </c:forEach>
                <!-- END 回复评论内容  -->

                </div>
              </div>
            </div>
            </c:forEach>



            <!-- 回复评论 -->


          </div>
        </div>
      </div>


      <!-- <div class="reset-g section-newslist-w">
        <div class="newslist-title-w">
          <h3 class="title-name-w">热评话题</h3>
        </div>
        <div class="newslist-conts-w clear-g">
          <ul class="conts-col conts-col-1 clear-g">
            <li style="width:343.3333333333333px;float:left;">
              <a index="0" href="http://192.168.122.88:8080/hyzm/collection/getCollectionus?id=47" target="_blank" title="宋柿釉定窑穿带瓶">宋柿釉定窑穿带瓶</a>
            </li>
            <li style="width:343.3333333333333px;float:left;margin-left:30px;">
              <a index="1" href="http://192.168.122.88:8080/hyzm/collection/getCollectionus?id=33#comments_count" target="_blank" title="明代晚期漆金文殊菩萨像">明代晚期漆金文殊菩萨像</a>
            </li>
            <li style="width:343.3333333333333px;float:right;">
              <a index="2" href="http://192.168.122.88:8080/hyzm/collection/getCollectionus?id=38#comments_count" target="_blank" title="铜鎏金弥勒佛站像">铜鎏金弥勒佛站像</a>
            </li>
          </ul>
        </div>
      </div> -->

      <!-- page -->
      <div id="page_sohu"></div>

    </div>
  </div>
</div>


<!-- 藏品评论  END -->
</body>
</html>