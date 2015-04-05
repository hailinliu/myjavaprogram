<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>华豫之门官方网站-卫视文化乐园</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
	<script type="text/javascript">
	var flag = true;
	$(document).ready(function() {
		
	});

	function submitform(){
		if(!flag){
			alert('不允许重复提交');
			return false;
		}
		flag = false;
		if ($('#typeid').val() == 0) {
		   alert('请选择藏品类型');
		   flag = true;
	       return false;
		} 
		if ($.trim($('#nameid').val()).length <= 0) {
		   alert('请输入藏品名称');
		    flag = true;
	       return false;
		}
		$("#uploadform").submit();
	}
	
	</script>
  </head>
  <body>
  <div data-role="page">
  	<jsp:include page="../head/header.jsp?name=藏品上传"></jsp:include>
  	<div data-role="content">
			<button class="btn btn-primary btn-block btn-outlined" onclick="location.href='<c:url value="/mine/gotoMyUpload"/>'">我的上传</button>
		<form id="uploadform" method="post" action="<c:url value='/mine/uploadCollection'/>" enctype="multipart/form-data" data-ajax="false">
			<div>
		      <label>分类</label>
		      <select id="typeid" name="type">
	            <option value="0" selected="selected">-- 请选择 --</option>
	            <c:forEach items="${typeList}" var="type">
	              <option <c:if test="${col.type eq type.id}">selected="selected"</c:if> value="${type.id}">${type.name}</option>
	            </c:forEach>
	          </select>
		    </div>
		    <div>
		      <label>藏品名称</label>
		      <input id="nameid" type="text" name="name" maxlength="300" placeholder="1-20个汉字" />
		    </div>
		    <div>
		      <label>图片</label>
		      <input type="file" accept="image/png" name="fileField" id="fileField" />
		    </div>
		    <div>
		      <label>归属</label>
		      <label><input type="radio" name="owner" value="自有" checked="checked">自有</label>
		      <label><input type="radio" name="owner" value="受人委托">受人委托</label>
		      <label><input type="radio" name="owner" value="他人拥有">他人拥有</label>
		    </div>
		    <div>
		      <label>来源</label>
		      <label><input type="radio" name="source" value="家传" checked="checked">家传</label>
		      <label><input type="radio" name="source" value="普通买卖">普通买卖</label>
		      <label><input type="radio" name="source" value="拍卖">拍卖</label>
		      <label><input type="radio" name="source" value="其他方式">其他方式</label>
		    </div>
		    <div>
		      <label>藏品介绍</label>
		      <textarea name="memo" placeholder="200个汉字" rows="10"></textarea>
		    </div>
		</form>
		<input id="submitbutton" type="button" name="submit" class="btn" value="提交" onclick="submitform()"/>
	</div>
  	<jsp:include page="../foot/footer.jsp"></jsp:include>
  </div>
</body>
</html>