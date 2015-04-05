<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String id = "";
	if (request.getParameter("id") != null	&& !"".equals(request.getParameter("id"))) {
		id = request.getParameter("id");
	}
%>
<script type="text/javascript">
	$(function(){
		$("#content").blur(function(){
		    $("#content").attr("placeholder","我要评论...");
		});
	});

	function submitforum(){
		if('${CurrentSession}' == ""){
			alert("请登录后进行评论！");
			return false;
		}
		if($("#replyid").val() != ""){
			var content= $('#content').val();
			if(content == ""){
				alert("请您输入要回复的内容!");
				return false;
			}
			var collectionid='<%=id%>';
			$.ajax({
	  		    type: "POST",
				dataType: "text",
				url: "<c:url value='/froums/addReply'/>",
				data: {collectionid:collectionid ,
				        content:content,
				        collectionnum:'${collection.serialnum}',
				        id:$("#replyid").val(),
				        type:'${type}'
				        },
				success:function(data){
	               location.reload();
	               if ('${type}' == '2') {
	                   location.hash = "<c:url value='/vote/gotoHyvote?type=2&id='/>"+collectionid+"#content";
	               } else if ('${type}' == '3') {
	                   location.hash = "<c:url value='/vote/gotoHygem?type=3&id='/>"+collectionid+"#content";
	               } else if ('${type}' == '4') {
		               location.hash = "<c:url value='/vote/gotoHyvip?type=4&id='/>"+collectionid+"#content";
	               } else if('${type}'=='9'){
	               	alert('评论成功');
               	    	location.href = "<c:url value='/proficient/getProficient?id='/>"+collectionid+"#content";
              	  }else {
		               location.hash = "<c:url value='/collection/getCollectionus?id='/>"+collectionid+"#content";
	               }
	               location.reload();
				}
			});
		}else{
			var content = $("#content").val();
			if(content == ""){
				alert("请您输入评论内容!");
				return false;
			}
			var collectionid='<%=id%>';
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
	                // location.reload();
	                if ('${type}' == '2') {
	                    location.href = "<c:url value='/vote/gotoHyvote?type=2&id='/>"+collectionid+"#content";
	                } else if ('${type}' == '3') {
	                    location.href = "<c:url value='/vote/gotoHygem?type=3&id='/>"+collectionid+"#content";
	                } else if ('${type}' == '4') {
		                location.href = "<c:url value='/vote/gotoHyvip?type=4&id='/>"+collectionid+"#content";
	                } else if('${type}'=='9'){
	                	alert('评论成功');
               	    	location.href = "<c:url value='/proficient/getProficient?id='/>"+collectionid+"#content";

              		  }else {
	                	location.href = "<c:url value='/collection/getCollectionus?id='/>"+collectionid+"#content";
	                }
	                location.reload();
				}
			});
		}
  	}

  	function reply(id){
  		$("#replyid").val(id);
  		$("#content").attr("placeholder","我要回复...");
  		$("#content").focus();
  	}

	function likenum(id){
		var likenum = $("#likebutton"+id).val();
		likenum = likenum.replace("赞","");
		likenum = parseInt(likenum)+1;
		$.ajax({
			type: "POST",
			dataType: "text",
			url: "<c:url value='/froums/updateForumsInfo'/>",
			data: {id:id ,likenum:likenum},
			success:function(data){
				$("#likenum").html(parseInt($("#likenum").html())+1);
				$("#likebutton"+id).val(likenum+"赞");
			}
		});
	}

</script>
<style type="text/css">
	.fl{
		float: left;
	}
	.fr{
		float: right;
	}
	.comm_username{
		background: #DADADA;
		overflow: hidden;
		padding: 3px;
		padding-left: 10px;
		line-height: 36px;
		border-left: 5px solid #a10000;
	}
	.comm_text{
		text-indent: 1em;
		padding: 10px 10px;
	}
	textarea{
		border-color:#ccc;
	}
</style>


<div style="width:100%">

<hr/>
	<span id="likenum">${likenum}</span>
	人参与 ，${forumSize} 条评论
	<br/>
	<div style="padding:5px;">
		<input type="hidden" id="replyid"  name="replyid">
		<textarea id="content" placeholder="我要评论..." rows="5" style="padding:5px;width:96%;"></textarea>
	</div>
	<input id="submitbutton" type="button" style="background:#B9270C;height:30px;padding:0 7px;cursor:pointer;font-size:14px;color:#fff;border-radius:5px;border:0;" value="发表评论" onclick="submitforum()"/>
	<hr/>
	<c:forEach items="${forumList}" var="forum" varStatus="cdn">
		<div class="comm_username">
			<span class="fl">
				${forum.username} [ <i><c:if test="${forum.level eq 0}">免费会员</c:if>
					<c:if test="${forum.level eq 1}">星级会员</c:if>
					<c:if test="${forum.level eq 2}">贵宾会员</c:if>
					<c:if test="${forum.level eq 3}">高级会员</c:if>
					<c:if test="${forum.level eq 4}">超级会员</c:if></i>
				]
			</span>

			<span class="fr">
				<input id="replybutton" type="button" style="background:#B9270C;height:30px;padding:0 8px;border-radius:5px;border:0;cursor:pointer;font-size:14px;color:#fff;" value="回复" onclick="reply(${forum.id})"/>
			</span>
		</div>
		<div class="comm_text">
			评论内容：${forum.content}
		</div>
		<div>
		<c:forEach items="${repalyList}" var="repaly" varStatus="cdn">
			<c:if test="${forum.id eq repaly.countnum}">
				&nbsp;&nbsp;${repaly.username}[ <i><c:if test="${repaly.level eq 0}">免费会员</c:if>
					<c:if test="${repaly.level eq 1}">星级会员</c:if>
					<c:if test="${repaly.level eq 2}">贵宾会员</c:if>
					<c:if test="${repaly.level eq 3}">高级会员</c:if>
					<c:if test="${repaly.level eq 4}">超级会员</c:if></i>
				]
				<br/>
				&nbsp;&nbsp;回复内容：${repaly.content}
				<br/>
			</c:if>
		</c:forEach>
		</div>
		<!-- <input id="likebutton${forum.id}" type="button" style="background:#B9270C;height:30px;width:94px;border-radius:3px;cursor:pointer;font-size:14px;color:#fff;" value="${forum.likenum}赞" onclick="likenum(${forum.id})"/>
		<hr/>
		-->
	</c:forEach>

</div>