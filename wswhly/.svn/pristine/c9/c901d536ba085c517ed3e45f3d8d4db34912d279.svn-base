<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改新闻</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/default/easyui.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/icon.css"/>">
	<script type="text/javascript" src="<c:url value="/jquery/jquery-1.8.0.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.easyui.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/locale/easyui-lang-zh_CN.js"/>"></script>
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "<c:url value='/ueditor/'/>";
    </script>
	<script type="text/javascript" src="<c:url value="/ueditor/ueditor.config.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/ueditor/ueditor.all.min.js"/>"></script>
    
<script type="text/javascript">
function formsubmit(){
	$('#editnewsform').form('submit', {
		url: "<c:url value='/news/editnews'/>",
		onSubmit: function() {
			return $(this).form('validate');
		},
		success: function(data) {
			if(data == "0000"){
				$.messager.alert('提示', "处理成功！", 'info',function(){
					document.getElementById("editnewsform").reset();
					location.href = '<c:url value="/sys/redirect?p=admin/news/schoolInfoManage"/>';
				});
			}else{
				$.messager.alert('警告', data, 'warning');
			}
		}
	});
}
</script>
  </head>
  
  <body>
    <!-- 修改新闻 -->
	<form id="editnewsform" method="post">
	   <input type="hidden" name="id" value="${news.id}"/>
	   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size: 12px;padding: 5px;background-color: #efefef;border:1px solid #A4BED4;">
			<tr>
				<td>学院下属标题:<input name="title" value="${news.title}" class="easyui-validatebox" data-options="required:true"/></td>
				<td>收藏资讯类型:<input name="style" value="${news.style}" class="easyui-combobox" data-options="url:'<c:url value="/news/gettypecombobox"/>?parentid=2', valueField:'id', textField:'style', panelHeight:'auto'"/></td>
				<td>标签:<input name="label" value="${news.label}" class="easyui-validatebox" /></td>
			</tr>
		</table>
 		<textarea name="content" id="myEditor">${news.content}</textarea>
		<script type="text/javascript">
		    UE.getEditor('myEditor')
		</script>
	</form>
	<div style="text-align:right;padding:5px 0;">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="formsubmit();">修改</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="history.go(-1);">返回</a>
       </div>
  </body>
</html>
