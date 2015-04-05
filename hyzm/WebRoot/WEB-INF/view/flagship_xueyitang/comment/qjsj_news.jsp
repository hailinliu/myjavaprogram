<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title></title>

 	 <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_comment.css'/>"/>

	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>

  </head>

  <body>

 <!-- 商家动态 -->
	<div class="sjtit_news">

            <h3>商家动态:</h3>

          <ul>
              <li>
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_onenews01'/>" target="_blank" class="fl">东南拍卖历年最强阵容登场</a>
                  <span class="">2014-09-29</span>
              </li>
              <li>
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_onenews02'/>" target="_blank" class="fl">书拨：古代文人优雅翻书小物件</a>
                  <span class="">2014-09-29</span>
              </li>
              <li>
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_onenews03'/>" target="_blank" class="fl">佳士得将对超估价拍品加收2%佣金</a>
                  <span class="">2014-09-10</span>
              </li>
              <li>
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_onenews04'/>" target="_blank" class="fl">似曾相识的异国文物</a>
                  <span class="">2014-09-10</span>
              </li>
              <li>
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_onenews05'/>" target="_blank" class="fl">流失海外中国文物返还阻碍多 将建被盗文物数据库</a>
                  <span class="">2014-09-10</span>
              </li>
            </ul>
        </div>

 </body>
</html>