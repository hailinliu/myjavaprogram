<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>资讯_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/zixun/zixun.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
	<meta name=keywords content="资讯，收藏资讯，拍卖资讯">
	<meta name=description content="华豫之门收藏资讯分类，包含各种资讯信息。">
  </head>

  <body>
  <jsp:include page="../head/header.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear" style="margin-top:10px;">
  <div class="zixun_box_left">
      <div class="zixun_bread">
          <span>
            <a href="<c:url value='/redirect?p=index'/>" target="_blank">首页</a>
          </span>
          <span>></span>
          <span>
            <a href="<c:url value='/redirect?p=news/zixun_index'/>" target="_blank">新闻动态</a>
          </span>
          <span>></span>
          <span>
            拍卖资讯
          </span>
      </div>
      <ul class="pm_zixun_list">
            <li>
                <div class="fl zixun_img">
                  <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">
                    <img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
                  </a>
                </div>
                <div class="fr zixun_news_in">
                   <p class="zixun_tit">
                      <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">
                          资讯标题资讯标题资讯标题
                      </a>
                    </p>
                    <p class="zixun_small">是是拉近了是是是是的是是是是是是是是的的是是的的士速递都是是是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都.....</p>
                    <p>
                      <span class="huise">2014-09-10</span>
                      <span class="huise">08:30</span>
                      <span class="read_more">
                        <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">阅读全文</a>
                      </span>
                    </p>
                </div>
              </li>
              <li>
                <div class="fl zixun_img">
                  <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">
                    <img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
                  </a>
                </div>
                <div class="fr zixun_news_in">
                   <p class="zixun_tit">
                      <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">
                          资讯标题资讯标题资讯标题
                      </a>
                    </p>
                    <p class="zixun_small">是是拉近了是是是是的是是是是是是是是的的是是的的士速递都是是是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都.....</p>
                    <p>
                      <span class="huise">2014-09-10</span>
                      <span class="huise">08:30</span>
                      <span class="read_more">
                        <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">阅读全文</a>
                      </span>
                    </p>
                </div>
              </li>
              <li>
                <div class="fl zixun_img">
                  <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">
                    <img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
                  </a>
                </div>
                <div class="fr zixun_news_in">
                   <p class="zixun_tit">
                      <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">
                          资讯标题资讯标题资讯标题
                      </a>
                    </p>
                    <p class="zixun_small">是是拉近了是是是是的是是是是是是是是的的是是的的士速递都是是是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都.....</p>
                    <p>
                      <span class="huise">2014-09-10</span>
                      <span class="huise">08:30</span>
                      <span class="read_more">
                        <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">阅读全文</a>
                      </span>
                    </p>
                </div>
              </li>
              <li>
                <div class="fl zixun_img">
                  <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">
                    <img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
                  </a>
                </div>
                <div class="fr zixun_news_in">
                   <p class="zixun_tit">
                      <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">
                          资讯标题资讯标题资讯标题
                      </a>
                    </p>
                    <p class="zixun_small">是是拉近了是是是是的是是是是是是是是的的是是的的士速递都是是是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都.....</p>
                    <p>
                      <span class="huise">2014-09-10</span>
                      <span class="huise">08:30</span>
                      <span class="read_more">
                        <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">阅读全文</a>
                      </span>
                    </p>
                </div>
              </li>
              <li>
                <div class="fl zixun_img">
                  <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">
                    <img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
                  </a>
                </div>
                <div class="fr zixun_news_in">
                   <p class="zixun_tit">
                      <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">
                          资讯标题资讯标题资讯标题
                      </a>
                    </p>
                    <p class="zixun_small">是是拉近了是是是是的是是是是是是是是的的是是的的士速递都是是是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都.....</p>
                    <p>
                      <span class="huise">2014-09-10</span>
                      <span class="huise">08:30</span>
                      <span class="read_more">
                        <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">阅读全文</a>
                      </span>
                    </p>
                </div>
              </li>
              <li>
                <div class="fl zixun_img">
                  <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">
                    <img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
                  </a>
                </div>
                <div class="fr zixun_news_in">
                   <p class="zixun_tit">
                      <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">
                          资讯标题资讯标题资讯标题
                      </a>
                    </p>
                    <p class="zixun_small">是是拉近了是是是是的是是是是是是是是的的是是的的士速递都是是是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都.....</p>
                    <p>
                      <span class="huise">2014-09-10</span>
                      <span class="huise">08:30</span>
                      <span class="read_more">
                        <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">阅读全文</a>
                      </span>
                    </p>
                </div>
              </li>
              <li>
                <div class="fl zixun_img">
                  <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">
                    <img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
                  </a>
                </div>
                <div class="fr zixun_news_in">
                   <p class="zixun_tit">
                      <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">
                          资讯标题资讯标题资讯标题
                      </a>
                    </p>
                    <p class="zixun_small">是是拉近了是是是是的是是是是是是是是的的是是的的士速递都是是是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都是是收到都.....</p>
                    <p>
                      <span class="huise">2014-09-10</span>
                      <span class="huise">08:30</span>
                      <span class="read_more">
                        <a href="<c:url value='/redirect?p=news/zixuninfo'/>" target="_blank">阅读全文</a>
                      </span>
                    </p>
                </div>
              </li>
        </ul>
        <div class="fanye">
          <a href="javascript:void(0)" >首页</a>
          <a href="javascript:void(0)" >上一页</a>
          <a href="javascript:void(0)"  class="current_ye">1</a>
          <a href="javascript:void(0)" >下一页</a>
          <a href="javascript:void(0)" >尾页</a>
          <a href="javascript:void(0)" >共1页</a>
        </div>
  </div>
  <jsp:include page="../news/zixuncommen/zixun_right.jsp"></jsp:include>
</div>

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
