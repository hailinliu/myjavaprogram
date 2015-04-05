<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>旗舰商家</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/getAuction.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
  	<style type="text/css">
		.banner_hb{margin-bottom:20px;}
	</style>
  </head>


  <body>&nbsp; 
  <jsp:include page="../head/header.jsp"></jsp:include>

<jsp:include page="../banner/banner.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear pmjg">
	<!-- 标题 -->
	<div class="tit_box">
		<p class="fl pmjg_tit">旗舰商家	</p>
		<p class="fr">当前共有<span class="jg_shuliang">&nbsp;5&nbsp;</span>家商家</p>
	</div>
	<!--苏富比 -->
	<div class="jg_box">
		<div class="fl img">
			<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>" target="_blank">
				<img src="<c:url value='/images/getAuction/sfb.jpg'/>"/>
			</a>
		</div>
		<div class="fr txt">
			<h3><a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>" target="_blank">苏富比</a></h3>
			<p class="jgjs">苏富比(Sotheby's ）与克里斯蒂（又译作佳士得）拍卖行、菲利普拍卖行并称为全球三大拍卖行。苏富比业务遍及全球40个国家，包括北京、莫斯科及多哈等新兴市场；主要拍卖中心设在美国纽约约...
				<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>" target="_blank">[详细]</a>
			</p>
			<dl>
				<dt class="fl">电话：</dt>
				<dd class="fl">111</dd>
			</dl>
			<dl>
				<dt class="fl">商家地址：</dt>
				<dd class="fl">111</dd>
			</dl>
			
		</div>
	</div>
	<!--佳士得 -->
	<div class="jg_box">
		<div class="fl img">
			<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>" target="_blank">
				<img src="<c:url value='/images/getAuction/jsd.jpg'/>"/>
			</a>
		</div>
		<div class="fr txt">
			<h3><a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>" target="_blank">佳士得</a></h3>
			<p class="jgjs">佳士得拍卖行（CHRISTIE'S，旧译克里斯蒂拍卖行），世界艺术品拍卖行之一。拍品汇集了来自全球各地的珍罕艺术品、名表、珠宝首饰、汽车和名酒等精品。现在，佳士得在全球32个国家设...
				<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>" target="_blank">[详细]</a>
			</p>
			<dl>
				<dt class="fl">电话：</dt>
				<dd class="fl">11111</dd>
			</dl>
			<dl>
				<dt class="fl">商家地址：</dt>
				<dd class="fl">11111</dd>
			</dl>
		</div>
	</div>
	<!--嘉德 -->
	<div class="jg_box">
		<div class="fl img">
			<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>" target="_blank">
				<img src="<c:url value='/images/getAuction/jd.jpg'/>"/>
			</a>
		</div>
		<div class="fr txt">
			<h3><a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>" target="_blank">嘉德</a></h3>
			<p class="jgjs">中国嘉德国际拍卖有限公司成立于1993年5月，是以经营中国文物艺术品为主的综合性拍卖公司，总部设于北京。每年定期举办春季、秋季大型拍卖会，以及四期“嘉德四季”拍卖会。公司设有...
				<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>" target="_blank">[详细]</a>
			</p>
			<dl>
				<dt class="fl">电话：</dt>
				<dd class="fl">11111</dd>
			</dl>
			<dl>
				<dt class="fl">商家地址：</dt>
				<dd class="fl">11111</dd>
			</dl>
		</div>
	</div>
	<!--保利-->
	<div class="jg_box">
		<div class="fl img">
			<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>" target="_blank">
				<img src="<c:url value='/images/getAuction/baoli.jpg'/>"/>
			</a>
		</div>
		<div class="fr txt">
			<h3><a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>" target="_blank">保利</a></h3>
			<p class="jgjs">北京保利国际拍卖有限公司是保利集团直属子公司，于2005年7月1日正式成立；秉承保利集团的优良品质，并依托雄厚的专家队伍和遍及海内外的业务关系网络，以诚信、专业、敬业的精神...
				<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>" target="_blank">[详细]</a>
			</p>
			<dl>
				<dt class="fl">电话：</dt>
				<dd class="fl">11111</dd>
			</dl>
			<dl>
				<dt class="fl">机构地址：</dt>
				<dd class="fl">11111</dd>
			</dl>
		</div>
	</div>
	<!--瀚海-->
	<div class="jg_box">
		<div class="fl img">
			<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>"  target="_blank">
				<img src="<c:url value='/images/getAuction/hanhai.jpg'/>"/>
			</a>
		</div>
		<div class="fr txt">
			<h3><a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>" target="_blank">瀚海</a></h3>
			<p class="jgjs">北京翰海拍卖有限公司成立于1994年1月，是经国家文物管理部门批准，由国内文物经营系统组建成立，从事综合文物艺术品拍卖的专业公司。为全民所有制企业，注册资本人民币1000万元。公司拥有...
				<a href="<c:url value='/redirect?p=flagship/getFlagshipinfo'/>" target="_blank">[详细]</a>
			</p>
			<dl>
				<dt class="fl">电话：</dt>
				<dd class="fl">11111</dd>
			</dl>
			<dl>
				<dt class="fl">商家地址：</dt>
				<dd class="fl">11111</dd>
			</dl>
		</div>
	</div>
	
	<div class="fanye">
		<a href="#">1</a>
		<a href="#">2</a>
		<a href="#">3</a>
	</div>
</div>

<!--main style end-->

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
