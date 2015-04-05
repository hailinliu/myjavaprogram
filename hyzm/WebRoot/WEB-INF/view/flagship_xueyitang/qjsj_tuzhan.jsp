<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>商家图展</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_tuzhan.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>


	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">

  </head>

  <body>


<jsp:include page="../banner/banner.jsp"></jsp:include>


    <!-- 商家菜单 -->
    <jsp:include page="comment/qjsj_nav.jsp"></jsp:include>

    <!-- 左半部分 -->
    <div class="qjsj_left fl">
        <div class="qj_video_head" style="margin-bottom:20px;">
            <span class="qj_sy_dot fl"></span>
            <a href="<c:url value='/redirect?p=index'/>" target="_blank" class="fl">首页</a>
            <span class="fl">&nbsp;>&nbsp;</span>
            <a href="<c:url value='/redirect?p=qjsj_list'/>" target="_blank" class="fl">旗舰商家</a>
            <span class="fl">&nbsp;>&nbsp;</span>
            <span class="fl">商家图展</span>
            <span class="qj_video_line fr"></span>
        </div>
        <div class="qj_picss">
                         <!-- 第一列图片 -->
          <ul class="fl qj_pic_lit">
            <li>
              <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg01'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/flagship_xueyitang/shopimg/s1.jpg'/>" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg01'/>" target="_blank">清康熙米黄釉暗刻缠枝莲纹碗</a>
              </div>
            </li>

            <li>
              <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg04'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/flagship_xueyitang/shopimg/s4.jpg'/>" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg04'/>" target="_blank">明崇祯青花莲子罐</a>
              </div>
            </li>
            <li>
              <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg07'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/flagship_xueyitang/shopimg/s7.jpg'/>" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg07'/>" target="_blank">清光绪浅绛彩山水人物图盖碗</a>
              </div>
            </li>
            <li>
              <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg08'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/flagship_xueyitang/shopimg/s8.jpg'/>" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg08'/>" target="_blank">清光绪青花云龙纹盘</a>
              </div>
            </li>
          </ul>
                          <!-- 第二列图片 -->
          <ul class="fl qj_pic_lit qj_pic_lit2">
            <li>
              <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg06'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/flagship_xueyitang/shopimg/s6.jpg'/>" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg06'/>" target="_blank">清康熙斗彩盘</a>
              </div>
            </li>

            <li>
              <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg03'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/flagship_xueyitang/shopimg/s3.jpg'/>" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg03'/>" target="_blank">清雍正斗彩开光缠枝莲罐</a>
              </div>
            </li>
            <li>
              <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg09'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/flagship_xueyitang/shopimg/s9.jpg'/>" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg09'/>" target="_blank">清康熙青花花卉盘</a>
              </div>
            </li>
            <li>
              <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg12'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/flagship_xueyitang/shopimg/s12.jpg'/>" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg12'/>" target="_blank">清乾隆蓝料彩带钩</a>
              </div>
            </li>
          </ul>
               <!-- 第三列图片 -->
          <ul class="fl qj_pic_lit">
            <li>
              <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg05'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/flagship_xueyitang/shopimg/s5.jpg'/>" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg05'/>" target="_blank">清道光粉彩耕织图诗文盖碗</a>
              </div>
            </li>

            <li>
              <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg02'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/flagship_xueyitang/shopimg/s2.jpg'/>" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg02'/>" target="_blank">清雍正斗彩花蝶碗</a>
              </div>
            </li>
            <li>
              <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg10'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/flagship_xueyitang/shopimg/s10.jpg'/>" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg10'/>" target="_blank">清康熙青花梅瓶</a>
              </div>
            </li>
            <li>
              <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg11'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/flagship_xueyitang/shopimg/s11.jpg'/>" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship_xueyitang/qjsj_lookimg11'/>" target="_blank">清乾隆官窑祭红釉盘</a>
              </div>
            </li>
          </ul>

        </div>

    </div>
    <!--  左半部分结束 -->

    <!-- 右半部分 -->
    <jsp:include page="comment/qjsj_right.jsp"></jsp:include>



  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
