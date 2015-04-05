<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>华豫之门官方网站-卫视文化乐园</title>
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>
  <script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
   <script type="text/javascript" src="<c:url value='/js/swfobject.js'/>"></script>
  <script type="text/javascript" src="<c:url value="/js/Marquee.js"/>"></script>
  <script type="text/javascript" src="<c:url value='/js/slideshow.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>


  <meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
  <meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
<script type="text/javascript">

//TAB  切换
  $(function(){

      // first - last 效果
      $("#sczx_list").find("li:last").addClass("none");

      $(".m_l_void1").find("li:first").addClass("m_l_none");
      $(".m_l_void1").find("li:eq(3)").addClass("m_l_none");

      //  tab  切换
      $("#tabs").tabs().tabs('option', 'event', 'mouseover');
      $( "#tabs-jp" ).tabs().tabs('option', 'event', 'mouseover');
      // $( "#tabs-paim" ).tabs().tabs('option', 'event', 'mouseover');
      $("#tabs-newss").tabs().tabs('option', 'event', 'mouseover');
      // $("#tabs-jp").tabs().tabs('disabled');

      //       设置什么事件将触发选中一个标签页。
      // 初始：$('.selector').tabs({ event: 'mouseover' });
      // 获取：var event = $('.selector').tabs('option', 'event');
      // 设置：$('.selector').tabs('option', 'event', 'mouseover');

    });


 // <!-- 背景音乐 -->
  var sound1="<c:url value='/music/1yuzhou.mp3'/>"
  var sound2="<c:url value='/music/2gaoshan.mp3'/>"

  var suijilujing=Math.round(Math.random()*1)   //随机两次

  if (suijilujing==0) {
    suijilujing=sound1
  }
  else if (suijilujing==1) {
    suijilujing=sound2
  }


  // <!-- 背景音乐 -->
  // 判断是什么浏览器
  if($.browser.msie) {  //是否IE

    document.write('<div style="width:100px;height:30px;border:1px solid #ccc;position: absolute;z-index:1000000;top: 2px;left: 50%;margin-left:-80px;"><embed src='+'"'+suijilujing+'"'+' hidden="false" border="0" width="100" height="30" autostart="true" loop="1"></embed></div>')
  }else{
    document.write('<div style="width:100px;height:30px;border:1px solid #ccc;position: absolute;z-index:1000000;top: 2px;left: 50%;margin-left:-80px;"><object data='+'"'+suijilujing+'"'+' type="application/x-mplayer2" width="100" height="30"><param name="src" value='+'"'+suijilujing+'"'+'><param name="autostart" value="1"><param name="playcount" value="infinite"></object></div>');
  }



  // <!-- 背景音乐 -->


</script>


  </head>

  <body>


  <jsp:include page="head/header.jsp"></jsp:include>


  <div class="div_box1"></div>  <!--banner ben-->
<div class="comiis_wrapad" id="slideContainer">
  <div id="frameHlicAe" class="cl">
    <div class="temp"></div>
    <div class="block" style="width:auto;">
      <div class="cl">
        <ul class="slideshow" id="slidesImgs">

          <li style="background:url(<c:url value='/images/ads_img/nanner0924mingxi.jpg'/>) no-repeat top center;"><a href="<c:url value='/redirect?p=benefitlist'/>" target="_blank" style="width:100%;height:100%;cursor:pointer;display:block;"></a></li>
          <li style="background:url(<c:url value='/images/ads_img/banner2.jpg'/>) no-repeat top center;">
            <a href="<c:url value='/redirect?p=zts/zt0910'/>" target="_blank" style="width:100%;height:100%;cursor:pointer;display:block;"></a>
          </li>
          <li style="background:url(<c:url value='/images/banner4.jpg'/>) no-repeat top center;"><a href="<c:url value='/redirect?p=temp/hdguonei'/>" style="width:100%;height:100%;cursor:pointer;display:block;" target="_blank"></a></li>
          <li style="background:url(<c:url value='/images/banner8.jpg'/>) no-repeat top center;"><a href="<c:url value='/redirect?p=viplever'/>" target="_blank" style="width:100%;height:100%;cursor:pointer;display:block;"></a></li>
          <li style="background:url(<c:url value='/images/banner2.jpg'/>) no-repeat top center;">
            <a href="<c:url value='vote/activityAllList'/>" target="_blank" style="width:100%;height:100%;cursor:pointer;display:block;"></a>
          </li>

        </ul>
      </div>
      <div class="slidebar" id="slideBar">
        <ul>
          <li class="on" id="t1">1</li>
          <li class="ie_pngs" id="t2">2</li>
          <li class="ie_pngs" id="t3">3</li>
          <li class="ie_pngs" id="t4">4</li>
          <li class="ie_pngs" id="t5">5</li>
        </ul>
      </div>
    </div>
  </div>
</div>
<!--banenr end-->
<div class="div_box1"></div>

<!-- 第一列 -->
  <div class="main_one">
  <!--收藏咨询 start-->
      <div class="sczx fl">

        <div class="tit">

          <h3 class="ls_i"><img src="<c:url value='/images/icon_tree_03.jpg'/>" alt="" /></h3>
          <h3>收藏资讯</h3>
          <h6>Information</h6>

          <s></s>

          <span class="mores fr">
            <a target="_blank" href="<c:url value='/news/getCollectionInfo'/>">更多 &gt;&gt;</a>
          </span>
        </div>

        <div class="b_cont">
             <c:forEach items="${collectionInfoList}" var="collectionInfo" varStatus="cdn" begin="0" end="6">
              <c:choose>
                <c:when test="${cdn.count eq 1}">
                  <div class="zx_nr">
                     <p class="blod" onclick="" style="cursor:pointer;">
                        <a href="<c:url value='/news/getOneNews?id=${collectionInfo.id}'/>" target="_blank">${collectionInfo.title}</a>
                     </p>
                     <p class="wz">
                       <c:choose>
                         <c:when test="${fn:length(collectionInfo.content) > 45}">
                           ${fn:substring(collectionInfo.content,0,45)}...
                         </c:when>
                         <c:otherwise>
                           ${collectionInfo.content}
                         </c:otherwise>
                       </c:choose>
                     </p>
                  </div>
              <ul class="list01" id="sczx_list">
                </c:when>
                <c:otherwise>
              <li class="">
                <a target="_blank" href="<c:url value='/news/getOneNews?id=${collectionInfo.id}'/>">
                  ${collectionInfo.title}
                </a>
                <span class="fr">
                  <c:choose>
                    <c:when test="${fn:length(collectionInfo.createdate) >10}">
                           ${fn:substring(collectionInfo.createdate,5,10)}
                    </c:when>
                    <c:otherwise>${collectionInfo.createdate}</c:otherwise>
                  </c:choose>
                </span>
              </li>
                </c:otherwise>
              </c:choose>
            </c:forEach>
            </ul>


        </div>

      </div>

  <!--  收藏咨询 end-->

  <!--官网活动 strat-->

      <div class="sczx gwgg fl">

        <div class="tit">

          <h3 class="ls_i"><img src="<c:url value='/images/icon_tree_03.jpg'/>" alt="" /></h3>
          <h3>官网活动</h3>
          <h6>Official</h6>

          <s></s>

          <!-- <span class="mores fr">
            <a target="_blank" href="/news/getCollectionInfo">更多 &gt;&gt;</a>
          </span> -->
        </div>

        <div class="b_cont">
        <!--

				 <ul class="list01 gwgg_list" style="position:relative;">
                 <c:forEach items="${huodongInfoList}" var="bulletin" begin="0" end="5">
                  <li class="">
                    <a   target="_blank" href="<c:url value='/news/getOneNews?id=${bulletin.id}'/>">${bulletin.title}</a>
                  </li>
               </c:forEach>
                </ul>
-->
		<ul class="list01 gwgg_list">
              <li class="red">
                <a href="http://www.wswhly.com/redirect?p=zts/zt0910" target="_blank">“2014北美收藏文化之旅”专题报道</a>

                <s class="hot-icon1"></s> <!-- Hot图标 -->

              </li>
              <li class="red">
                <a  href="http://www.wswhly.com/news/getOneNews?id=1106" target="_blank">2014北美收藏文化之旅正式启动</a>

                <s class="new-icon1"></s> <!-- new图标 -->

              </li>
              <li class="">
                    <a href="/news/getOneNews?id=779
                    " target="_blank">纽约佳士得2014年秋拍玉器观感
                  </a>

                  <s class="new-icon1"></s>
                </li>
              <li class="">
                  <a href="/news/getOneNews?id=673
                  " target="_blank">纽约苏富比2014年秋拍精品观感-古方
                </a>
                <s class="hot-icon1"></s> <!-- Hot图标 -->
              </li>

              <li class="">

                <a href="/redirect?p=temp/hdguonei" target="_blank">藏家团-国内嘉德、保利和瀚海秋拍文化之旅&nbsp;&nbsp;开始啦！</a>

              </li>
              <li class="">

                <a href="/redirect?p=temp/hdtuangou" target="_blank">藏家团-艺术品市场深度交流鉴赏自由行&nbsp;&nbsp;开始啦！</a>

              </li>
              <li class="">
                <a href="/redirect?p=temp/hdguowai" target="_blank">藏家团-美国苏富比与佳士得秋拍文化之旅</a>

              </li>

              <!-- <li class="">
                <a href="meiguo1.html" target="_blank">藏家团赴美之旅-备选行程一览！</a>

              </li> -->
              <!-- <li class="red">

                <a href="<c:url value='/news/getOneNews?id=456'/>" target="_blank">华豫之门官网赴美秋拍活动正式承诺！！</a>

              </li> -->

              <!--  <div style="position:absolute;top:11px;left:248px;"><img src="<c:url value='/images/new.gif'/>" /></div>  -->
                   <!--<div style="position:absolute;top:40px;right:35px;"><img src="<c:url value='/images/new.gif'/>" /></div> -->

            </ul>
        </div>

      </div>
  <!--官网活动 end-->


  <!--会员服务-->
      <div class="fr vipfw">
          <!-- <div class="tit_box"><span class="fl"><img src="<c:url value='/images/pic_bt5.jpg'/>" /></span>
          </div> -->
          <div class="">

            <a href="<c:url value='/redirect?p=viplever'/>" target="_blank"><img src="<c:url value='/images/viplever/vip_bm2.jpg'/>" alt="星级会员招募" /></a>

          </div>

      </div>
    <!--会员服务 END-->

  </div>
<!-- 第一列 END -->
<!-- 第二列 -->
  <div class="main_two">
    <!-- 专家讲坛 start-->
      <div class="sczx zjjt fl">

        <div class="tit">

          <h3 class="ls_i"><img src="<c:url value='/images/icon_tree_03.jpg'/>" alt="" /></h3>
          <h3>专家讲坛</h3>
          <h6>Rostrum</h6>

          <s></s>

          <span class="mores fr">
            <a target="_blank" href="<c:url value='video/getVideoList'/>">更多 &gt;&gt;</a>
          </span>
        </div>

        <div class="b_cont">


            <ul class="list03">
            <c:forEach items="${videoList}" var="video" varStatus="vdn" begin="0" end="1">
             <li class="">
                      <a  class="vo_imgs" target="_blank" href="<c:url value='/video/getVideo?id=${video.id}'/>
                      ">
                      <img src="${video.imgurl}" width="156" height="142" alt="${video.title}" /></a>
                     <p class="zj_title">
                      <a target="_blank" href="<c:url value='/video/getVideo?id=${video.id}'/>
                      ">
                      <c:choose>
                        <c:when test="${fn:length(video.title) >
                          10}">
                           ${fn:substring(video.title,0,10)}...
                        </c:when>
                        <c:otherwise>${video.title}</c:otherwise>
                      </c:choose>
                    </a>
                  </p>
                </li>

              </c:forEach>


            </ul>
        </div>

      </div>
  <!-- 专家讲坛 END-->

  <!-- 华豫视频 start-->
      <div class="sczx zjjt hysp fl" id="tabs">

        <div class="tit">

          <h3 class="ls_i"><img src="<c:url value='/images/icon_tree_03.jpg'/>" alt="" /></h3>
          <h3>华豫视频</h3>
          <h6>Video</h6>

          <s></s>
          <!-- tab -->
          <div class="in_t">
            <ul>
              <li class="">
                <a href="#tabs-1" onclick="window.open('<c:url value='/video/getHyvideoList'/>');">华豫视频</a>
              </li>
              <li class="">
                <a href="#tabs-2" onclick="window.open('<c:url value='proficient/getProficients'/>');">华豫专家</a>
              </li>

            </ul>
          </div>

        </div>

      <!-- tab-华豫视频 -->
        <div class="b_cont" id="tabs-1">


            <ul class="list03">

              <li class="">
                <a class="vo_imgs" target="_blank" href="http://tv.sohu.com/20140924/n404622939.shtml">
                  <img src="<c:url value='/images/video/v20140924.jpg'/>" alt="20140924期"/>

                  <!-- 播放按钮 -->
                  <img src="<c:url value='/images/video/v_play.png'/>" class="vo_play ie_pngs" alt="20140924期" />
                </a>
                <p class="zj_title">
                  <a target="_blank" href="http://tv.sohu.com/20140924/n404622939.shtml">20140924期</a>
                </p>
              </li>

            <li>
                <a class="vo_imgs" target="_blank" href="http://tv.sohu.com/20140917/n404406116.shtml">
                  <img src="<c:url value='/images/video/v20140917.jpg'/>" alt="20140917期"/>
                  <!-- 播放按钮 -->
                  <img src="<c:url value='/images/video/v_play.png'/>" class="vo_play ie_pngs" alt="20140917期"/>
                </a>
                <p class="zj_title">
                  <a target="_blank" href="http://tv.sohu.com/20140917/n404406116.shtml">20140917期</a>
                </p>
              </li>

            </ul>
        </div>

        <!-- tab-华豫专家 -->
        <div class="b_cont" id="tabs-2" style="display:none">
            <ul class="list03">
             <c:forEach items="${proficientList}" var="pro" varStatus="pdn" begin="0" end="1">
                 <li class="ed">
                <a class="vo_imgs" target="_blank" href="<c:url value='/proficient/getProficient?id=${pro.id}'/>">
                <img src="${pro.imgurl}" alt="${pro.name} -- ${pro.speciality}" /></a>
                 <p class="zj_title">
              <a target="_blank" href="<c:url value='/proficient/getProficient?id=${pro.id}'/>">${pro.name} -- ${pro.speciality}</a>
              </p>
              </li>
            </c:forEach>

            </ul>
        </div>

      </div>
  <!-- 华豫视频 END-->



  </div>
<!-- 第二列 END -->

<!-- 第三列 -->


  <div class="main_three">

    <!-- 左侧 -->
    <div class="fl">

      <!--华豫快讯 strat-->
          <div class="sczx news1_box" id="tabs-newss">

            <div class="tit">

              <h3 class="ls_i"><img src="<c:url value='/images/icon_tree_03.jpg'/>" alt="" /></h3>
              <h3>资讯中心</h3>
              <h6>NEWS</h6>

              <s></s>

             <!-- tab -->
              <div class="in_t left_in_t">
                <ul>
                <li class="">
                    <a href="#tabs-news-2" onclick="window.open('<c:url value='/news/getAnnounce'/>');">网站公告</a>
                  </li>
                  <li class="">
                    <a href="#tabs-news-1" onclick="window.open('<c:url value='/news/getCollectionInfoByStyle?style=212'/>');">华豫快讯</a>
                  </li>


                </ul>
              </div>
            </div>


            <!-- tab-网站公告 -->
            <div class="b_cont" id="tabs-news-2">
                <ul class="list01 wzgg_list">
                 <c:forEach items="${bulletinList}" var="bulletin" begin="0" end="5">
                  <li class="">
                    <a target="_blank" href="<c:url value='/news/getOneNews?id=${bulletin.id}'/>">${bulletin.title}</a>
                    <span class="fr">
                    <c:choose>
                    <c:when test="${fn:length(bulletin.createdate) >10}">
                           ${fn:substring(bulletin.createdate,5,10)}
                    </c:when>
                    <c:otherwise>${bulletin.createdate}</c:otherwise>
                  </c:choose>
                    </span>
                  </li>
               </c:forEach>
                </ul>
            </div>


            <!-- tab-华豫快讯 -->
            <div class="b_cont" id="tabs-news-1" style="display:none">
                <ul class="list01 hykx_list">
<c:forEach items="${huayuInfoList}" var="collectionInfo" varStatus="cdn" begin="0" end="6">

              <li class="">
                <a target="_blank" href="<c:url value='/news/getOneNews?id=${collectionInfo.id}'/>">
                  ${collectionInfo.title}
                </a>
                <span class="fr">
                  <c:choose>
                    <c:when test="${fn:length(collectionInfo.createdate) >10}">
                           ${fn:substring(collectionInfo.createdate,5,10)}
                    </c:when>
                    <c:otherwise>${collectionInfo.createdate}</c:otherwise>
                  </c:choose>
                </span>
              </li>
            </c:forEach>
            </ul>
            </div>



          </div>
      <!--华豫快讯 end-->

      <!--拍卖机构 strat-->
          <div class="sczx qjshop">

            <div class="tit">

              <h3 class="ls_i"><img src="<c:url value='/images/icon_tree_03.jpg'/>" alt="" /></h3>
              <h3>拍卖机构</h3>
              <h6>Auction</h6>

              <s></s>

              <span class="mores fr">
                <a href="javascript:void(0);">更多 &gt;&gt;</a>
              </span>
            </div>

            <div class="b_cont">


                <ul class="list05">

                  <li class="">


                        <div class="qjsj_img fl">


                          <p class="qjsj_p">
                              <a href="javascript:void(0);">
                            <img src="images/sub2.jpg" alt="苏富比"></a>
                          </p>
                        </div>

                        <div class="qjsj_title fl">
                          <div class="qjsj_names">
                                <a href="javascript:void(0);">苏富比</a>
                          </div>

                          <div class="qjsj_js">苏富比以让全球客户无束缚地观赏伟大的艺术品而引以为傲。如今全球艺术市场的每个角落：办事处遍布 达40个国家，总共90个地方；每年全球范围共10个拍卖场举行约250 场拍卖会；涵盖的收藏品超过70种...</div>
                        </div>

                  </li>
                  <li class="gr2">


                        <div class="qjsj_img fl">


                          <p class="qjsj_p">
                              <a href="javascript:void(0);">
                            <img src="images/jiashid.jpg" alt="佳士得"></a>
                          </p>
                        </div>

                        <div class="qjsj_title fl">
                          <div class="qjsj_names">
                                <a href="javascript:void(0);">佳士得</a>
                          </div>

                          <div class="qjsj_js">佳士得，世界著名艺术品拍卖行之一，拍品汇集了来自全球各地的珍罕艺术品、名表、珠宝首饰、汽车等精品。办事处分布于全球共90个主要城市，并在全球16个地点定期举行拍卖会，包括艺术品贮存及保安、教育、艺术图片库及物业等方面...</div>
                        </div>

                  </li>

                </ul>
            </div>

          </div>
      <!--期间商家 end-->
    </div>

    <!-- 右侧 -->
    <div class="fr">
  <!-- 精品推荐 start-->
      <div class="sczx zjjt jpzs fl" id="tabs-jp">

        <div class="tit">

          <h3 class="ls_i"><img src="<c:url value='/images/icon_tree_03.jpg'/>" alt="" /></h3>
          <h3>精品推荐</h3>
          <h6>Exhibition</h6>

          <s></s>
          <!-- tab -->
          <div class="in_t">
            <ul>
              <li class="">
                <a href="#tabs-1-jp" onclick="window.open('<c:url value='collection/getZjcp?typeid=3&styleid=0'/>');">专家推荐藏品</a>
              </li>
              <li class="">
                <a href="#tabs-2-jp" onclick="window.open('<c:url value='collection/getZbcp?typeid=2&styleid=0'/>');">珍宝台藏品</a>
              </li>
              <li class="">
                <a href="#tabs-3-jp" onclick="window.open('<c:url value='collection/getHycp?typeid=1&styleid=0'/>');">华豫藏品</a>
              </li>

            </ul>
          </div>

        </div>

      <!-- tab-专家推荐藏品 -->
        <div class="b_cont" id="tabs-1-jp">

            <ul class="list03 m_l_void1">
            <c:forEach items="${collectionList}" var="collection" varStatus="cdn">

              <li class="">
                <a class="vo_imgs" target="_blank" href="<c:url value='/collection/getCollectionus?id=${collection.id}'/>" target="_blank"/>
                <img src="${collection.imgurl}" width="156" height="142" alt="${collection.name}" />
                </a>
                   <p class="zj_title">
                      <a href="<c:url value='/collection/getCollectionus?id=${collection.id}'/>" target="_blank">${collection.name}</a>
                   </p>
              </li>
            </c:forEach>
            </ul>
        </div>

        <!-- tab-珍宝台藏品 -->
        <div class="b_cont" id="tabs-2-jp">
            <ul class="list03 m_l_void1">

            <c:forEach items="${collectionListZB}" var="collectionzb" varStatus="cdn">
                       <li class="m_l_none">
              <a class="vo_imgs" target="_blank" href="<c:url value='/collection/getCollectionus?id=${collectionzb.id}'/>" target="_blank"/>
              <img src="${collectionzb.imgurl}" width="156" height="142" alt="${collectionzb.name}" /></a>
                 <p class="zj_title">
                    <a href="<c:url value='/collection/getCollectionus?id=${collectionzb.id}'/>" target="_blank">${collectionzb.name}</a>
                 </p>
            </li>
              </c:forEach>
            </ul>
        </div>

        <!-- tab-华豫藏品 -->
        <div class="b_cont" id="tabs-3-jp">

            <ul class="list03 m_l_void1">

            <c:forEach items="${collectionListHY}" var="collectionhy" varStatus="cdn">
                       <li class="m_l_none">
              <a class="vo_imgs" target="_blank" href="<c:url value='/collection/getCollectionus?id=${collectionhy.id}'/>" target="_blank"/>
              <img src="${collectionhy.imgurl}" width="156" height="142" alt="${collectionhy.name}" /></a>
                 <p class="zj_title">
                    <a href="<c:url value='/collection/getCollectionus?id=${collectionhy.id}'/>" target="_blank">${collectionhy.name}</a>
                 </p>
            </li>
              </c:forEach>


            </ul>
        </div>

      </div>
  <!-- 精品推荐 END-->
    </div>


  </div>
<!-- 第三列 END -->

<!-- 第四列 -->


  <div class="main_four">

    <!-- 左侧 -->
    <div class="fl">


      <!--旗舰商家 strat-->
          <div class="sczx pmjg" id="tabs-paim">

            <div class="tit">

              <h3 class="ls_i"><img src="<c:url value='/images/icon_tree_03.jpg'/>" alt="" /></h3>
              <h3 onclick="window.open('<c:url value='/redirect?p=zhaoshang'/>')" style="cursor:pointer;">旗舰商家</h3>
              <h6>Flagshop</h6>

              <s></s>

              <!-- <div class="in_t left_in_t">
                <ul>
                  <li>
                    <a href="#tabs-1-paim">商家一</a>
                  </li>
                  <li>
                    <a href="#tabs-2-paim">商家二</a>
                  </li>

                </ul>
              </div> -->

            </div>
            <div>
              <p id="player1"><a href="http://www.macromedia.com/go/getflashplayer">Get the Flash Player</a> to see this player.</p>
            <script type="text/javascript">
             var s1 = new SWFObject("<c:url value='/swfvideo/FlvPlayer.swf'/>","single","370","195","7");
             s1.addParam("allowfullscreen","true");
             s1.addVariable("file","http://pic.wswhly.com:8080/fileManager/userFiles/video/jiangtan/3/jinlu.flv");

             s1.addVariable("image","http://pic.wswhly.com:8080/fileManager/userFiles/video/jiangtan/3/jinlu.jpg");
             s1.addVariable("width","370");
             s1.addVariable("height","195");
             s1.write("player1");
            </script>

            </div>
            <!-- tab-1 -->
            <div class="b_cont" id="tabs-1-paim"  style="display:none">
                <ul class="list05">
                  <c:forEach items="${flagshopList}" var="shop" varStatus="cdn" begin="0" end="1">
                  <li class="">
                        <div class="qjsj_img fl">

                          <p class="qjsj_p">
                              <a href="<c:url value='/redirect?p=zhaoshang'/>" target="_blank">
                            <img src="images/sub2.jpg" alt="苏富比"></a>

                          </p>
                        </div>
                        <div class="qjsj_title fl">
                          <!-- <div class="qjsj_names">
                                <a href="#">苏富比</a>
                          </div> -->
                          <div class="qjsj_js">点击图片查看--“旗舰商家”招商条件和流程介绍</div>
                        </div>

                  </li>
               </c:forEach>
                </ul>
            </div>
            <!-- tab-2 -->
            <div class="b_cont" id="tabs-2-paim" style="display:none">


                <ul class="list05">

                  <li class="">


                        <div class="qjsj_img fl">


                          <p class="qjsj_p">
                              <a href="#">
                            <img src="images/jiashid.jpg" alt="佳士得"></a>
                          </p>
                        </div>

                        <div class="qjsj_title fl">
                          <!-- <div class="qjsj_names">
                                <a href="#">佳士得</a>
                          </div> -->

                          <div class="qjsj_js">佳士得，世界著名艺术品拍卖行之一，拍品汇集了来自全球各地的珍罕艺术品、名表、珠宝首饰、汽车和名酒等精品。办事处分布于全球共90个主要城市，并在全球16个地点定期举行拍卖会，此外还提供与拍卖有关的服务，包括艺术品贮存及保安、教育、艺术图片库及物业等方面...</div>
                        </div>

                  </li>

                </ul>
            </div>

          </div>
      <!--旗舰商家 end-->
    </div>

    <!-- 右侧 -->
    <div class="fr">
          <div class="gg_img1">
            <a href="<c:url value='/redirect?p=temp/hdguonei'/>" target="_blank">
              <img src="images/ads_img/ad_banner1.jpg" alt="藏家团-国内嘉德、保利和瀚海秋拍文化之旅" />
            </a>
          </div>
    </div>


  </div>
<!-- 第四列 END -->



    </div>
  </div>

  <jsp:include page="foot/footer.jsp"></jsp:include>

  </body>
</html>
