<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>网上报名</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <jsp:include page="../head/header.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/resetpwd.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>


    <script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/resetpwd.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>

<style type="text/css">
    .cz_go a:link,.cz_go a:visited{font-size:20px;color:#406eba;text-decoration:none;font-family: 微软雅黑}
    .cz_go a:hover{color:#9D0104;text-decoration:underline;}
    .cz_go .center_a{margin:0 65px;}
    .box_span{font-size:24px;color:#a00104;}
</style>
<style type="text/css">
        .foot_hb{margin-top: 0 !important;}

        a:hover{
            color: #FF0000;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!--充值成功-->
    <div id="g_doc" style="font-family: 微软雅黑">
        <div class="g_hd">
            <div class="g_in">
                <h1 class="f_ff1">乐园账号</h1>
                <div class="shuxian">|</div>
                <h2 class="f_ff1">充值成功</h2>
            </div>
        </div>
        <div class="main_box" style="height:400px;margin-top:120px;">
            <div style="text-align:center;background:#fff;padding:40px 0;line-height:60px;box-shadow:1px 2px 13px #ccc;">
                <p style="font-size:20px;">您的账户&nbsp;&nbsp;
                    <span class="box_span" style="color:#FF0000;">${username}</span>&nbsp;&nbsp;充值了&nbsp;&nbsp;
                    <span class="box_span" style="color:#FF0000;">${overMoney}</span>&nbsp;&nbsp;元，
                    <!-- 充值后账户余额为&nbsp;&nbsp;
                    <span class="box_span">${money}</span> &nbsp;&nbsp;元。 -->
                </p>
                <div class="" style="font-size:16px;">
                   距离海选报名成功还差最后一步......
                    <a href="<c:url value='/mine/gotoenroll'/>" class="center_a" target="_blank" style="color:#0000FF;padding:0 10px">继续报名</a>


                </div>
                <div class="cz_go">
                    <a style="color:#0000FF;" href="<c:url value='/mine/mymoneylist'/>">查看收支明细</a>
                    <!-- <a href="<c:url value='/mine/gotoenroll'/>" class="center_a" target="_blank">继续网上报名</a>
                    <a href="<c:url value='/mine/gotovip'/>" target="_blank">继续升级会员</a> -->
                </div>

            </div>
        </div>
    </div>
<jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
