<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>旗舰商家 列表页</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  <link rel="stylesheet" type="text/css" href="<c:url value='/css/qjshop/qjsj_list.css'/>"/>

	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>


	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
	<script type="text/javascript">



	</script>
  </head>

  <body>


<jsp:include page="../banner/banner.jsp"></jsp:include>

<!--main style ben-->
  <div class="qj_list_box">
  		<div class="qj_list_head">
  			<p>旗舰商家</p>
  			<span>共&nbsp;*&nbsp;*&nbsp;个商家</span>
  		</div>
  		<ul class="qj_shop_list">
  			<li>
  				<div class="shops_name">
  					<p class="fl b">商家名称</p>
  					<span class="fr">商家导语商家导语商家导语</span>
  				</div>
  				<div class="shop_box">
  					<div class="fl shop_box_left">
						<div class="fl qj_list_pics">
							<a href="<c:url value='/redirect?p=flagship/qjsj_info'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
						</div>
						<div class="fl qj_list_txt">
							<div class="qj_shop_lb">
								<span class="fl b">主营：</span>
								<span class="fl">藏品类别</span>
							</div>
							<div class="qj_shop_ls">
								<span class="fl b">
								简介：
								</span>
								<p class="fl">是是拉近了是是是是的是是是是是是是是的的是是的的士速递都是是是是收到都是是...</p>
							</div>
							<button class="goto_shop b">进入商家</button>
						</div>
  					</div>
  					<div class="fr qj_shop_right_box">
  						<div class="qj_listpic">
							<a href="<c:url value='/redirect?p=flagship/qjsj_lookimg'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
  						</div>
  						<div class="qj_listpic qj_listpic_center">
							<a href="<c:url value='/redirect?p=flagship/qjsj_lookimg'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
  						</div>
  						<div class="qj_listpic">
							<a href="<c:url value='/redirect?p=flagship/qjsj_lookimg'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
  						</div>
  					</div>
  				</div>
  			</li>
  			<li>
  				<div class="shops_name">
  					<p class="fl b">商家名称</p>
  					<span class="fr">商家导语商家导语商家导语</span>
  				</div>
  				<div class="shop_box">
  					<div class="fl shop_box_left">
						<div class="fl qj_list_pics">
							<a href="<c:url value='/redirect?p=flagship/qjsj_info'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
						</div>
						<div class="fl qj_list_txt">
							<div class="qj_shop_lb">
								<span class="fl b">主营：</span>
								<span class="fl">藏品类别</span>
							</div>
							<div class="qj_shop_ls">
								<span class="fl b">
								简介：
								</span>
								<p class="fl">是是拉近了是是是是的是是是是是是是是的的是是的的士速递都是是是是收到都是是...</p>
							</div>
							<button class="goto_shop b">进入商家</button>
						</div>
  					</div>
  					<div class="fr qj_shop_right_box">
  						<div class="qj_listpic">
							<a href="<c:url value='/redirect?p=flagship/qjsj_lookimg'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
  						</div>
  						<div class="qj_listpic qj_listpic_center">
							<a href="<c:url value='/redirect?p=flagship/qjsj_lookimg'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
  						</div>
  						<div class="qj_listpic">
							<a href="<c:url value='/redirect?p=flagship/qjsj_lookimg'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
  						</div>
  					</div>
  				</div>
  			</li>
  			<li>
  				<div class="shops_name">
  					<p class="fl b">商家名称</p>
  					<span class="fr">商家导语商家导语商家导语</span>
  				</div>
  				<div class="shop_box">
  					<div class="fl shop_box_left">
						<div class="fl qj_list_pics">
							<a href="<c:url value='/redirect?p=flagship/qjsj_info'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
						</div>
						<div class="fl qj_list_txt">
							<div class="qj_shop_lb">
								<span class="fl b">主营：</span>
								<span class="fl">藏品类别</span>
							</div>
							<div class="qj_shop_ls">
								<span class="fl b">
								简介：
								</span>
								<p class="fl">是是拉近了是是是是的是是是是是是是是的的是是的的士速递都是是是是收到都是是...</p>
							</div>
							<button class="goto_shop b">进入商家</button>
						</div>
  					</div>
  					<div class="fr qj_shop_right_box">
  						<div class="qj_listpic">
							<a href="<c:url value='/redirect?p=flagship/qjsj_lookimg'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
  						</div>
  						<div class="qj_listpic qj_listpic_center">
							<a href="<c:url value='/redirect?p=flagship/qjsj_lookimg'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
  						</div>
  						<div class="qj_listpic">
							<a href="<c:url value='/redirect?p=flagship/qjsj_lookimg'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
  						</div>
  					</div>
  				</div>
  			</li>
  			<li>
  				<div class="shops_name">
  					<p class="fl b">商家名称</p>
  					<span class="fr">商家导语商家导语商家导语</span>
  				</div>
  				<div class="shop_box">
  					<div class="fl shop_box_left">
						<div class="fl qj_list_pics">
							<a href="<c:url value='/redirect?p=flagship/qjsj_info'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
						</div>
						<div class="fl qj_list_txt">
							<div class="qj_shop_lb">
								<span class="fl b">主营：</span>
								<span class="fl">藏品类别</span>
							</div>
							<div class="qj_shop_ls">
								<span class="fl b">
								简介：
								</span>
								<p class="fl">是是拉近了是是是是的是是是是是是是是的的是是的的士速递都是是是是收到都是是...</p>
							</div>
							<button class="goto_shop b">进入商家</button>
						</div>
  					</div>
  					<div class="fr qj_shop_right_box">
  						<div class="qj_listpic">
							<a href="<c:url value='/redirect?p=flagship/qjsj_lookimg'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
  						</div>
  						<div class="qj_listpic qj_listpic_center">
							<a href="<c:url value='/redirect?p=flagship/qjsj_lookimg'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
  						</div>
  						<div class="qj_listpic">
							<a href="#" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
  						</div>
  					</div>
  				</div>
  			</li>
  			<li>
  				<div class="shops_name">
  					<p class="fl b">商家名称</p>
  					<span class="fr">商家导语商家导语商家导语</span>
  				</div>
  				<div class="shop_box">
  					<div class="fl shop_box_left">
						<div class="fl qj_list_pics">
							<a href="<c:url value='/redirect?p=flagship/qjsj_info'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
						</div>
						<div class="fl qj_list_txt">
							<div class="qj_shop_lb">
								<span class="fl b">主营：</span>
								<span class="fl">藏品类别</span>
							</div>
							<div class="qj_shop_ls">
								<span class="fl b">
								简介：
								</span>
								<p class="fl">是是拉近了是是是是的是是是是是是是是的的是是的的士速递都是是是是收到都是是...</p>
							</div>
							<button class="goto_shop b">进入商家</button>
						</div>
  					</div>
  					<div class="fr qj_shop_right_box">
  						<div class="qj_listpic">
							<a href="<c:url value='/redirect?p=flagship/qjsj_lookimg'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
  						</div>
  						<div class="qj_listpic qj_listpic_center">
							<a href="<c:url value='/redirect?p=flagship/qjsj_lookimg'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
  						</div>
  						<div class="qj_listpic">
							<a href="<c:url value='/redirect?p=flagship/qjsj_lookimg'/>" target="_blank">
								<img src="<c:url value='/images/flagship/qj_pics.jpg'/>" alt="" />
							</a>
  						</div>
  					</div>
  				</div>
  			</li>
  		</ul>
  		<div class="qj_ye">
  			<a href="#">第一页</a>
  			<a href="#">上一页</a>
  			<a href="#" class="page_on">1</a>
  			<a href="#">2</a>
  			<a href="#">3</a>
  			<a href="#">下一页</a>
  			<a href="#">尾页</a>
  			<a href="#">共三页</a>
  		</div>
  </div>

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
