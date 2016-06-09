<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>文件管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="<c:url value="/js/jquery-1.5.1.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/jquery.contextmenu.r2.js"/>"></script>
    <link href="<c:url value="/css/fileManager.css"/>" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<c:url value="/js/jquery.blockUI.js"/>"></script>
    <!--http://destroydrop.com/javascripts/tree/api/-->
    <link rel="StyleSheet" href="<c:url value="/dtree/dtree.css"/>" type="text/css" />
    <script type="text/javascript" src="<c:url value="/dtree/dtree.js"/>"></script>
    <script src="<c:url value="/jquery.alerts/js/jquery.alerts.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/jquery.alerts/js/jquery.ui.draggable.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/jquery.alerts/css/jquery.alerts.css"/>" rel="stylesheet" type="text/css" />

    <!--本页面最重要的js代码-->
    <script type="text/javascript" src="<c:url value="/js/fileSelect.js"/>"></script>

  </head>
  
  <!--页面中所有的按钮事件都用jquery绑定，样式基本用css控制-->
    <body  >
        <div id="wholeFileManager">
            <!--菜单不需要设置样式，jquery.contextmenu会设置。class不能删，contextmenu.js加载时隐藏这个菜单-->
            <div class="contextMenu" id="menuForTreeLeaf">
                <ul>
                    <li id="add"><img src="../image/addFolder.png" />新建目录</li>
                    <li id="delete"><img src="../image/delete.png" />删除目录</li>
                    <li id="rename"><img src="../image/rename.png" />重命名</li>
                </ul>
            </div>
            <div class="contextMenu" id="menuForTreeRoot">
                <ul>
                    <li id="addFolderAtRoot"><img src="../image/addFolder.png" />新建目录</li>
                </ul>
            </div>
            <div id="leftSideDiv">
                <div id="directoryTreeDiv"></div>
            </div>
            <div id="rightDiv">
                <div id="fileListDiv">
                    <table id="fileListTable">
                        <tr id="title">
                            <th class="fileNameTh">文件(右击另存为)</th>
                            <th class="fileSizeTh">文件大小</th>
                            <th class="createTimeTh">创建时间</th>
                            <th class="operationTh">操作</th>
                        </tr>
                    </table>
                </div>
                <div id="noFileMessageDiv" class="hiddenDiv infoDiv">
                    没有任何文件。
                </div>
            </div>
        </div>
    </body>
</html>
