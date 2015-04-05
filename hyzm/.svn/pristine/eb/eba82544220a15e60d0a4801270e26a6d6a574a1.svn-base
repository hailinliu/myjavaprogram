<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String imgarray = (String)request.getAttribute("imgarray");
String[] images = imgarray.split(",");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>${activity.name}_珍品征集令_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/box111.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<meta name=keywords content="${activity.name}">
	<meta name=description content="${activity.name}">
    <script type="text/javascript">
	function queryOneCollection(value){
      location.href = "<c:url value='/collection/getCollection'/>?id="+value;
	}

function vote(collectionid) {
  var my_element=$(".login");
  if(my_element.length>0){
    //$('#login_box').show();       // 未登录 弹出登陆框！
    $("#login_box").addClass('mod_show');

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
            alert(data)
          }
          }
    });
   }

}

	function updateNote(id) {
		var note = $('#noteid').val();
		$.ajax({
			type:'post',
			url:"<c:url value='/vote/updateNote'/>",
			data:{ id:id,note:note},
			success:function(data){
				if (data == '0000') {
					alert("补充成功！");
					location.reload();
				} else {
					alert(data);
					$('forgebox4_1').hide();
				}
			}
		});
	}

	</script>
	<style type="text/css">
		.bianji:link,.binaji:visited{color:#338de6;text-decoration:none;}
		.bianji:hover{color:#A80000;text-decoration:none;}
		.bianji{background:url(images/gotohyzm/icon_bit11.gif) no-repeat 1px -40px;padding-left:21px;font-size:18px;text-align:right;}
		.bianji:hover{background:url(images/gotohyzm/icon_bit11.gif) no-repeat 1px 0;}
	</style>

  </head>

  <body>
  <jsp:include page="../head/header.jsp"></jsp:include>

<jsp:include page="../banner/banner.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear">
   <div class="scpjs_pic">
      <span class="bread_nav">当前位置：首页<span class="jt">></span><a href="<c:url value='/vote/collectAllList'/>">珍品征集令</a> <span class="jt">></span><span class="jt">${activity.name}</span> </span>
   </div>
   <div class="scpjs_nr clear">
     <img src="<%=PropertiesUtil.getPropertiesValue("uploadVoteurl")+"/"+images[0]%>" alt="${activity.name}"/>
     <div class="scpjs_list">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="red">收藏品名称：</td>
                <td>${activity.name}</td>
              </tr>
              <tr>
                <td class="red">收藏品编号：</td>
                <td>${activity.serialnum}</td>
              </tr>
              <tr>
                <td class="red">所属类别：</td>
                <td>${activity.typename}</td>
              </tr>
              <tr>
                <td class="red">上传者：</td>
                <td>${activity.uploadusername}</td>
              </tr>
              <tr>
                <td class="red">上传时间：</td>
                <td>${activity.uploaddate }</td>
              </tr>
              <tr>
                <td class="red"><button style="width:90px;height:32px;border-radius:4px;font-size:16px;color:#fff;background:#A80000;font-weight:bold;cursor:pointer;line-height:32px;" onclick="vote(${activity.id})">投&nbsp;&nbsp;票</button></td>
                <td>当前票数<span class="red" style="font-weight:bold;">&nbsp;&nbsp;${activity.votenum}&nbsp;&nbsp;</span>票</td>
              </tr>
            </table>
       </div>

       <p class="comments_box1 fl">

                已有 <span>

                <a style="color:#a10000;font-weight:bold;" href="#comments_count" id="changyan_count_unit" ></a>${size}</span> 人评论，<a href="#comments_count">我要评论</a>
                <script type="text/javascript" src="http://assets.changyan.sohu.com/upload/plugins/plugins.count.js"></script>

            </p>
            <!-- 分享功能 -->
            <div class="bdsharebuttonbox fl" style="margin-left: 28px;margin-top: 15px;"><a href="#" class="bds_more" data-cmd="more">藏品分享到：</a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博">新浪微博</a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间">QQ空间</a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博">腾讯微博</a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信">微信</a><a href="#" class="bds_kaixin001" data-cmd="kaixin001" title="分享到开心网">开心网</a></div>
            <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"24"},"share":{"bdSize":16},"image":{"viewList":["tsina","qzone","tqq","weixin","kaixin001"],"viewText":"藏品分享到：","viewSize":"24"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["tsina","qzone","tqq","weixin","kaixin001"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
   </div>

   <div style="text-align:right;margin-bottom:20px;" >

   		<c:if test="${activity.updatenum < 3 && not empty CurrentSession && CurrentSession.username eq activity.uploadusername}"><a href="javascript:void(0)" class="bianji box_block">我要补充</a></c:if>
   		<!--  <div style="width:1035px;height:1px;background:#E6E6E6;position:absolute;top:10px;left:0;"></div>	 -->
   </div>

   <!-- 补充弹出层 -->
   <div class="forgebox_guowai forgebox4_1" id="forgebox4_1">
      <div class="easyDialogBox" style="margin-top:15%;">
      <div id="easyDialogWrapper" class="easyDialog_wrapper">
          <div class="easyDialog_content">
              <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                  <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_x" id="closeBtn">×</a>
                    【 请在下方输入您要补充的内容，然后提交。】
              </h4>

		<!-- ////////////////////// -->

				<textarea id="noteid" style="width:480px;max-width:480px;height:200px;border-left:1px solid #ccc;margin-left:20px;border-right:1px solid #ccc;padding:10px;text-indent:2em;"></textarea>
		          <div class="easyDialog_footer">
		              <button class="btn_normal off_x">取消</button>
		              <button class="btn_highlight" onclick="updateNote(${activity.id});">确定</button>
		          </div>

              </div>
          </div>
      </div>
  </div>


   <div class="scpjs_cont">
   		<p>
   			${fn:replace(activity.note, '#', '<br/>&nbsp;&nbsp;&nbsp;&nbsp;')}
   		</p>
       <p></p>

	     <p align="center">
	        <%
	           for (String str : images) {
       	    %>
		        <img src="<%=PropertiesUtil.getPropertiesValue("uploadVoteimg")+"/"+str%>" width="800" alt="${activity.name}"/>
       	    <%
	           }
	        %>
	     </p>

   </div>

   <!-- 藏品评论  strart -->
        <div id="comments_count" class="comments_count">
            <!--高速版，加载速度快，使用前需测试页面的兼容性-->
          <jsp:include page="../comments.jsp"></jsp:include>

        </div>
        <!-- 藏品评论  END -->


</div>



  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
