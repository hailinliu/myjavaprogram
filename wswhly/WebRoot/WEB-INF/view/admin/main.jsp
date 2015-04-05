<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>华豫之门管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<c:url value="/images/favicon.ico"/>" rel="SHORTCUT ICON" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/default/easyui.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/jquery/themes/icon.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>">
	<script type="text/javascript" src="<c:url value="/jquery/jquery-1.8.0.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/jquery.easyui.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/jquery/locale/easyui-lang-zh_CN.js"/>"></script>

<style type="text/css">
body{
FONT: 9pt 微软雅黑;
}
A {
	FONT: 12px 微软雅黑;
	COLOR: #000000;
	TEXT-DECORATION: none
}

A:hover {
	COLOR: #428eff;
	TEXT-DECORATION: underline
}
#bg{
	height:153px;
    background:url('<c:url value="/images/backTop.jpg"/>');
    filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale')";
    -moz-background-size:100% 100%;
	background-size:100% 100%;
	background-position:center 0;
}
</style>

<script type="text/javascript">
$(function(){

	/*$('#menu1_child').show();
	$(".menuitem").click(function(){
		if($("#"+ this.id +"_child").css("display")=='none'){
			$("#"+ this.id +"_child").slideDown("slow");
			var arg = this.id;
			$.each($(".menuitem"),function(i,val){
				if(arg != val.id){
					$("#"+ this.id +"_child").slideUp("slow");		
				}
			})
		}else {
			$("#"+ this.id +"_child").slideUp("slow");
			$.each($(".menuitem"),function(i,val){
				if(arg != val.id){
					$("#"+ this.id +"_child").slideUp("slow");		
				}
			})
		}
	});*/
	
	$('#menutree').tree({
        url: '<c:url value="/sys/getmenu"/>',
        onClick: function(node){
            if(!$('#menutree').tree('isLeaf',node.target)){
                 $('menutree').tree('toggle',node.target);
            }else{
                 addTab(node.attributes.url,node.text);
            }
        }
	});
});

function addTab(href,title){
	var tt = $('#mytab');
	if (tt.tabs('exists', title)) {
        tt.tabs('select', title);
        refreshTab({
            tabTitle : title,
            url : href
        });
	} else {
		if (href) {
			var content = '<iframe scrolling="yes" frameborder="0"  src="'+href+ '" style="width:100%;height:100%;"></iframe>';
		} else {
			var content = '未实现';
		}
		tt.tabs('add', {
			title : title,
			closable : true,
			content : content,
			iconCls : 'icon-tip',
			tools:[{
				iconCls:'icon-mini-refresh',
				handler:function(){
					refreshTab({tabTitle:title,url:href});
				}
			}]   
		});
	}
}

function refreshTab(cfg) {
	var refresh_tab = cfg.tabTitle ? $('#mytab').tabs('getTab',
			cfg.tabTitle) : $('#mytab').tabs('getSelected');
	if (refresh_tab && refresh_tab.find('iframe').length > 0) {
		var _refresh_ifram = refresh_tab.find('iframe')[0];
		var refresh_url = cfg.url ? cfg.url : _refresh_ifram.src;
		_refresh_ifram.contentWindow.location.href = refresh_url;
	}
}

function toExit(){
	$.messager.confirm('退出', '确定要退出吗?', function(r){
		if (r){
		   top.location="../sys/logout";
		}
	});
}
</script>


  </head>
  
<body class="easyui-layout">
  <div data-options="region:'north'" style="height: 40px; padding: 0px;background-color: #D6DFF7;">
	<p id="bg" align="right">
	  <a href="javascript:toExit()">安全退出</a>
	</p>
  </div>
  <div data-options="region:'west',split:true,iconCls:'icon-admins'" title="当前用户：${CurrentSession.userinfo.username}" style="width: 205px; padding1: 1px; overflow: auto;background-color: #D6DFF7">
	<!-- <div class="sidebarmenu">
	  <c:forEach items="${menulist}" var="menu" varStatus="menuid">
	   <a id="menu${menuid.count}" class="menuitem submenuheader" style="cursor: pointer;">${menu.text}</a>
          <div id="menu${menuid.count}_child" class="submenu" style="display: none">
              <ul>
               <c:forEach items="${menu.children}" var="child" varStatus="childid">
                <li style="background-color: #DEFE45"><A href="javascript:void(0)" onclick="addTab('${child.url}','${child.text}')">&nbsp;&nbsp;${child.text}</A></li>
               </c:forEach>
              </ul>
          </div>
         </c:forEach>
	</div>-->
	
	<div style="padding:10px;overflow:hidden;">
		<ul id="menutree"></ul>
	</div>
  </div>
  <div id="mytab" data-options="region:'center'" class="easyui-tabs"
		style="overflow: hidden;">
	<div title="首页" iconCls="icon-home"  style="text-align:center;">
	  <%--  <iframe scrolling="auto" frameborder="0" src="<c:url value="redirect?p=admin/index"/>" style="width:100%; height:100%"></iframe> --%>
	<img src="<c:url value='/images/fengmian320.png'/>" >  
	</div>
  </div>
</body>
</html>
