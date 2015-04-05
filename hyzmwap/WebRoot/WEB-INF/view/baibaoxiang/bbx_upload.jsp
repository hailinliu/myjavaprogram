<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>藏品上传</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<style type="text/css">
body {
	padding: 0;
	margin: 0;
	background: #fff;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	color: #444340;
}
h1 {
	font-size: 1.3em;
	padding: 10px 10px;
	margin: 0;
}
img {
	border: none;
}
a {
	color: #444340;
}
#MainContent {
	background: #ffffff;
	padding-bottom: 30px;
}
#Footer {
	padding: 10px;
	border-top: none;
}
.myUpload {
	margin: 0 auto
}
p strong{ font-weight:normal; color:#c40000; margin-right:.8em}
</style>
<link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.6.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/simple-inheritance.min.js'/>"></script>

<!-- NOTE: including the jQuery engine version -->
<script type="text/javascript" src="<c:url value='/jquery/code-photoswipe-jQuery-1.0.11.min.js'/>"></script>
</head>

<body>
<!--
该页面是百宝箱的藏品上传页面。
	如果用户也可以从 藏品页面点击 修改藏品进入该页面 进行藏品信息的修改。

-->
<div data-role="page" class="ui-page ui-page-theme-a ui-page-active" style="display:block">
  <div data-role="header" role="banner" class="ui-header ui-bar-inherit">
    <h1 class="ui-title" role="heading" aria-level="1">藏品上传</h1>
  </div>
  <div data-role="content" class="ui-content myUpload" role="main">

    <p><strong>*</strong><label for="name">藏品名称：</label></p>
    <p class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
      <input id="nameid"  type="text" name="name" maxlength="300" value="" placeholder="1-20个汉字">
    </p>
    <p><strong>*</strong><label for="price">藏品价格：</label></p>
    <p class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
      <input id="priceid" style="width:100px;" type="text" name="price" maxlength="300" value="" placeholder="请输入价格">
    </p>

      <p><strong>*</strong><label for="advertisement">广告语：</label></p>
    <p class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
      <input id="advertisementid" style="" type="text" name="advertisement" maxlength="300" value="" placeholder="1-18个汉字">
    </p>
    <p><strong>*</strong><label for="type">经营范围：</label>
      <select id="typeid" name="type">
        <option value="0">-- 请选择 --</option>
        <option value="14">瓷器陶器</option>
        <option value="15">玉器赏石</option>
        <option value="16">青铜佛像</option>
        <option value="17">书画古籍</option>
        <option value="18">木器雕品</option>
        <option value="19">古币钱币</option>
        <option value="20">珠宝首饰</option>
        <option value="21">油画雕塑</option>
        <option value="22">邮票邮品</option>
        <option value="23">其他藏品</option>
      </select>
    </p>
    <p style=" font-size:.8em; color:#F93">一次仅限上传一件（套、对）藏品。</p>
     <p><strong>*</strong><label for="isagree">交易中转：</label>
      <input type="radio" checked="checked" name="isagree" value="1">
      同意
      <input type="radio" name="isagree" value="2">
      不同意</p>
    <p><strong>*</strong><label for="uploadpic">上传图片：</label></p>
    <p class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
      <input type="file"  class="uploadPic1" name="uploadpic"/>
    </p>
    <p style=" font-size:.8em;"><strong>提示：</strong>
    图片大小： 支持 0 ~ 5M 图片上传；图片格式： jpg，jpeg，gif，bmp等；重要：请分别上传 身份证 正、反面清晰照片。</p>
    <p><strong>*</strong><label for="cpinfo">收藏品介绍(5000字以内)：</label></p>
    <p>
      <textarea class="ui-bar btn-positive   ui-shadow ui-corner-all" style="width:90%; text-align:left; " name="cpinfo" rows="3"></textarea>
    </p>
    <p style=" font-size:.8em; color:#F93"> 提示： 高古玉、高古瓷类及出土文物等拍卖法不允许拍卖藏品请勿上传。藏品图片，不得上传带有敏感信息的图片，如：含有违反法律法规的内容等。否则，卖家承担一切责任。</p>
    <p><a href="javascript:;" class="ui-bar ui-bar-a btn btn-positive btn-block ui-btn ui-shadow ui-corner-all">提交</a></p>
  </div>
</div>
</body>
</html>
