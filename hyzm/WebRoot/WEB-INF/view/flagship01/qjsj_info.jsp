<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>旗舰商家</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- <link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/> -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_info.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_tuzhan.css'/>"/>
  <script type="text/javascript" src="<c:url value='/js/slideshow.js'/>"></script>
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
        <dl class="qj_lefttop">
          <dt class="qj_adbox fl">
            <!-- banner1  开始 -->
                <div class="comiis_wrapad" id="slideContainer" style="width:413px;height:334px;">
                  <div id="frameHlicAe" class="cl">
                    <div class="temp"></div>
                    <div class="block" style="width:auto;">
                      <div class="cl">
                        <ul class="slideshow" id="slidesImgs" style="height:334px">
                          <li style="background:url(<c:url value='/images/zt0910_img/lb1/3.jpg'/>) no-repeat top center;height:334px;"><a href="#" target="_blank" style="width:100%;height:100%;cursor:pointer;display:block;"></a></li>
                          <li style="background:url(<c:url value='/images/zt0910_img/lb1/4.jpg'/>) no-repeat top center;height:334px;">
                            <a href="#" target="_blank" style="width:100%;height:100%;cursor:pointer;display:block;"></a>
                          </li>
                          <li style="background:url(<c:url value='/images/zt0910_img/lb1/a0.jpg'/>) repeat-y top center;height:334px;"><a href="http://www.wswhly.com/news/getOneNews?id=1119" target="_blank" style="width:100%;height:100%;cursor:pointer;display:block;"></a></li>
                          <li style="background:url(<c:url value='/images/zt0910_img/lb1/1.jpg'/>) no-repeat top center;height:334px;"><a href="http://www.wswhly.com/news/getOneNews?id=1061" style="width:100%;height:100%;cursor:pointer;display:block;" target="_blank"></a></li>
                          <li style="background:url(<c:url value='/images/zt0910_img/lb1/a1.jpg'/>) repeat-y top center;height:334px;"><a href="http://www.wswhly.com/news/getOneNews?id=1119" target="_blank" style="width:100%;height:100%;cursor:pointer;display:block;"></a></li>
                          <li style="background:url(<c:url value='/images/zt0910_img/lb1/a2.jpg'/>) repeat-y top center;height:334px;"><a href="http://www.wswhly.com/news/getOneNews?id=1119" target="_blank" style="width:100%;height:100%;cursor:pointer;display:block;"></a></li>
                        </ul>
                      </div>
                      <div class="butbg_box"></div>
                      <div class="slidebar slidebar_qjsjinfo" id="slideBar">
                        <ul>
                          <li class="on" id="">1</li>
                          <li class="ie_pngs" id="">2</li>
                          <li class="ie_pngs" id="">3</li>
                          <li class="ie_pngs" id="">4</li>
                           <li class="ie_pngs" id="">5</li>
                            <li class="ie_pngs" id="">6</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
            <!--banenr end-->
          </dt>
          <dd class="qj_newsbox fr">
            <p class="qj_tits">华豫官网旗舰商家</p>
            <ul>
              <li>
                  <a href="<c:url value='/redirect?p=flagship01/qjsj_onenews01'/>" target="_blank" class="fl">东南拍卖历年最强阵容登场</a>
                  <span class="fr">09-29</span>
              </li>
              <li>
                  <a href="<c:url value='/redirect?p=flagship01/qjsj_onenews02'/>
" target="_blank" class="fl">书拨：古代文人优雅翻书小物件</a>
                  <span class="fr">09-29</span>
              </li>
              <li>
                  <a href="<c:url value='/redirect?p=flagship01/qjsj_onenews03'/>" target="_blank" class="fl">佳士得将对超估价拍品加收2%佣金</a>
                  <span class="fr">09-29</span>
              </li>
              <li>
                  <a href="<c:url value='/redirect?p=flagship01/qjsj_onenews04'/>
" target="_blank" class="fl">似曾相识的异国文物</a>
                  <span class="fr">09-29</span>
              </li>
              <li>
                  <a href="<c:url value='/redirect?p=flagship01/qjsj_onenews05'/>
" target="_blank" class="fl">流失海外文物返还阻碍多 将建被盗文物数据库</a>
                  <span class="fr">09-29</span>
              </li>
              <li>
                  <a href="<c:url value='/redirect?p=flagship01/qjsj_onenews06'/>
" target="_blank" class="fl">庞能：藏友爱“钱”，取之有“道”</a>
                  <span class="fr">09-29</span>
              </li>
            </ul>
            <div class="qjnews_more">
              <a href="<c:url value='/redirect?p=flagship01/qjsj_details'/>" target="_blank">查看更多新闻&nbsp;>&nbsp;></a>
            </div>
          </dd>
        </dl>
         <!-- 商家视频 -->
        <div class="qj_tit1">
           <span class="red">商</span>家视频
           <span class="more_pics"><a href="<c:url value='/redirect?p=flagship01/qjsj_video'/>" target="_blank">更多<span style="font-size:16px;">>></span></a></span>
        </div>
        <div style="height:340px;">
          <div class="big_video">
              <img class="video_icon"  src="images/zt0910_img/zt_butt.png"/>
              <a href="<c:url value='/redirect?p=flagship01/qjsj_onevideo01'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/1409172.jpg' />" width="389"height="340" alt="" />
              </a>
              <div class="video_tit_box"></div>
              <p class="video_tit">
                    <a href="<c:url value='/redirect?p=flagship01/qjsj_onevideo01'/>" target="_blank">专家藏友同行  知识眼力大增</a>
              </p>
          </div>
          <ul class="qj_videos">    <!-- 小视频列表 -->
            <li>
              <div class="qj_video_top"></div>
              <img class="video_icon2"  src="images/zt0910_img/zt_butt.png"/>
              <div class="lit_video">
                <a href="<c:url value='/redirect?p=flagship01/qjsj_onevideo02'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/140915.jpg'/>" width="216"height="162" alt="" />
              </a>
              </div>
              <div class="video_tit_box2">
              </div>
              <p class="video_tit2">
                    <a href="<c:url value='/redirect?p=flagship01/qjsj_onevideo02'/>" target="_blank">佳士得高管接受采访  预感掐丝珐琅创新高</a>
              </p>
            </li>
            <li>
              <div class="qj_video_top"></div>
              <img class="video_icon2"  src="images/zt0910_img/zt_butt.png"/>
              <div class="lit_video">
                <a href="<c:url value='/redirect?p=flagship01/qjsj_onevideo03'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/140913.jpg'/>" width="216"height="162" alt="" />
              </a>
              </div>
              <div class="video_tit_box2">
              </div>
              <p class="video_tit2">
                    <a href="<c:url value='/redirect?p=flagship01/qjsj_onevideo03'/>" target="_blank">苏富比高级董事访谈 拍卖适应时代潮流</a>
              </p>
            </li>
            <li class="no_margin">
              <div class="qj_video_top"></div>
              <img class="video_icon2"  src="images/zt0910_img/zt_butt.png"/>
              <div class="lit_video">
                <a href="<c:url value='/redirect?p=flagship01/qjsj_onevideo04'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/140911.jpg'/>" width="216"height="162" alt="" />
              </a>
              </div>
              <div class="video_tit_box2">
              </div>
              <p class="video_tit2">
                    <a href="<c:url value='/redirect?p=flagship01/qjsj_onevideo04'/>" target="_blank">机场出发 专家简略访谈</a>
              </p>
            </li>
            <li class="no_margin">
              <div class="qj_video_top"></div>
              <img class="video_icon2"  src="images/zt0910_img/zt_butt.png"/>
              <div class="lit_video">
                <a href="<c:url value='/redirect?p=flagship01/qjsj_onevideo05'/>" target="_blank">
                  <img src="<c:url value='/images/flagship/0929.jpg'/>" width="216"height="162" alt="" />
              </a>
              </div>
              <div class="video_tit_box2">
              </div>
              <p class="video_tit2">
                    <a href="<c:url value='/redirect?p=flagship01/qjsj_onevideo05'/>" target="_blank">锦卢艺术馆书画展</a>
              </p>
            </li>
          </ul>
        </div>

                                         <!-- 商家图展 -->
        <div class="qj_tit1">
           <span class="red">商</span>家图展
           <span class="more_pics"><a href="<c:url value='/redirect?p=flagship01/qjsj_tuzhan'/>" target="_blank">更多<span style="font-size:16px;">>></span></a></span>
        </div>
        <div class="qj_picss">
                         <!-- 第一列图片 -->
          <ul class="fl qj_pic_lit">
            <li>
              <a href="<c:url value='/redirect?p=flagship01/qjsj_lookimg01'/>" target="_blank">
                  <img src="http://admin.wswhly.com/wswhly/ueditor/jsp/upload/20140911/42681410426722733.JPG" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship01/qjsj_lookimg01'/>" target="_blank">北美收藏文化之旅</a>
              </div>
            </li>
            <li>
              <a href="<c:url value='/redirect?p=flagship01/qjsj_lookimg04'/>" target="_blank">
                  <img src="http://admin.wswhly.com/wswhly/ueditor/jsp/upload/20140911/7711410426799584.JPG" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship01/qjsj_lookimg04'/>" target="_blank">北美收藏文化之旅</a>
              </div>
            </li>
          </ul>
                          <!-- 第二列图片 -->
          <ul class="fl qj_pic_lit qj_pic_lit2">
            <li>
              <a href="<c:url value='/redirect?p=flagship01/qjsj_lookimg02'/>" target="_blank">
                  <img src="http://admin.wswhly.com/wswhly/ueditor/jsp/upload/20140912/65851410514761424.JPG" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship01/qjsj_lookimg02'/>" target="_blank">北美收藏文化之旅</a>
              </div>
            </li>
            <li>
              <a href="<c:url value='/redirect?p=flagship01/qjsj_lookimg05'/>" target="_blank">
                  <img src="http://admin.wswhly.com/wswhly/ueditor/jsp/upload/20140914/29391410681982068.JPG" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship01/qjsj_lookimg05'/>" target="_blank">北美收藏文化之旅</a>
              </div>
            </li>
          </ul>
               <!-- 第三列图片 -->
          <ul class="fl qj_pic_lit">
            <li>
              <a href="<c:url value='/redirect?p=flagship01/qjsj_lookimg03'/>" target="_blank">
                  <img src="http://admin.wswhly.com/wswhly/ueditor/jsp/upload/20140915/44221410765991326.JPG" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship01/qjsj_lookimg03'/>" target="_blank">北美收藏文化之旅</a>
              </div>
            </li>
            <li>
              <a href="<c:url value='/redirect?p=flagship01/qjsj_lookimg06'/>" target="_blank">
                  <img src="http://admin.wswhly.com/wswhly/ueditor/jsp/upload/20140913/33451410583879835.JPG" alt="" />
              </a>
              <div class="tuzhan_pic">
                  <a href="<c:url value='/redirect?p=flagship01/qjsj_lookimg06'/>" target="_blank">北美收藏文化之旅</a>
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
