<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>乐园小店_商家_百宝箱_卫视文化乐园-华豫之门官方网站</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/style.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/slideshow.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
	<meta name=keywords content="百宝箱,乐园小店"/>
	<meta name=description content="华豫之门百宝箱商家"/>
	<style type="text/css">
		.collection_list li {
			height: 216px;
		}
		.dq1 {
			width: 240px;
		}
	</style>
	<script type="text/javascript">
	$(function(){

		// 分类多选，变色
		$(".ch_li input").click(function() {
			$(this).addClass('btn_href')
		});

	})

	</script>
  </head>

  <body>
  <jsp:include page="../head/header.jsp"></jsp:include>
	<div class="content_collect">
		<div class="con_bread">
			<span class="gray_clor">当前位置</span> >
			<span><a href="<c:url value='/index'/>" target="_blank">乐园首页</a></span> >
			<span><a href="<c:url value='/baibaoindex/BaiBao_getIndex'/>" target="_blank">百宝箱</a></span> >
			<span><a href="<c:url value='/BaiBao_getShopForList?redirect=baibaojie/sellers'/>" target="_blank">商家</a></span> >
			<span class="gray_clor">${item.shopname}</span>
		</div>
		<h1>${item.shopname}</h1>
		<div class="sj_t">
			<p class="fl" style="width:350px;">
				<span>商家：</span>
				<span>${item.username}</span>
			</p>
			<p class="creat_time fl">
				<span>创建于：</span>
				<span>${item.formatcreatedate}</span>
			</p>
				<div class="cp_lshare fr">
							<div class="fl" style="line-height:40px;">分享此店：</div>
							<div class="fl">
								<div class="bdsharebuttonbox bdshare-button-style0-24" data-bd-bind="1419411821189">
									<a href="#" class="bds_more" data-cmd="more"></a>
									<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
									<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
									<a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
									<a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
									<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
									<a href="#" class="bds_kaixin001" data-cmd="kaixin001" title="分享到开心网"></a>
								</div>
								<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin","kaixin001"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin","kaixin001"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
							</div>
						</div>
		</div>
		<div class="sel_left">
			<div class="sel_pic">
				<img src="http://116.255.149.172:7080/wswhly/Baibaourl/${item.img}" alt="" />
			</div>
			<div class="sel_jss">
				<p class="sel_js_tit"><b>店铺简绍：</b></p>
				<p class="sel_js">${item.desction}</p>
				<p class="sel_js_tit"><b>经营范围：</b></p>
				<p class="sel_js">
				<span><c:if test="${fn:indexOf(item.mainscope,'14')>=0}">瓷器陶器</c:if></span>
				<span><c:if test="${fn:indexOf(item.mainscope,'15')>=0}">玉器赏石</c:if></span>
				<span><c:if test="${fn:indexOf(item.mainscope,'16')>=0}">青铜金器</c:if></span>
				<span><c:if test="${fn:indexOf(item.mainscope,'17')>=0}">书画古籍</c:if></span>
				<span><c:if test="${fn:indexOf(item.mainscope,'18')>=0}">木器雕品</c:if></span>
				<span><c:if test="${fn:indexOf(item.mainscope,'19')>=0}">古币钱币</c:if></span>
				<span><c:if test="${fn:indexOf(item.mainscope,'20')>=0}">珠宝首饰</c:if></span>
				<span><c:if test="${fn:indexOf(item.mainscope,'21')>=0}">油画雕塑</c:if></span>
				<span><c:if test="${fn:indexOf(item.mainscope,'22')>=0}">邮票邮品</c:if></span>
				<span><c:if test="${fn:indexOf(item.mainscope,'23')>=0}">其他藏品</c:if></span>
				</p>
				<p class="sel_js_tit"><b>店主宣言：</b></p>
				<p class="sel_js">${item.manifesto}</p>
			</div>
			<div>
				<p class="sel_lx"><b>联系方式：</b></p>
				<p class="sel_xx">
					<span>尊称：</span>
					<span>${fn:substring(item.realname, 0, 1)}(先生/女士)</span>
				</p>
				<p class="sel_xx">
					<span>电话：</span>
					<span>${item.mobile}</span>
				</p>
				<p class="sel_xx">
					<span>地址：</span>
					<span>${item.fullname}${item.shopaddress}</span>
				</p>
				<p class="sel_xx">
					<span>微信号：</span>
					<span>${item.weixin}</span>
				</p>
				<img src="http://open.weixin.qq.com/qr/code/?username=${item.weixin}" alt="" class="x_ma" />
			</div>
		</div>
		<script>
		//添加关注
			function AddAttention(id){
				var my_element=$(".login");
		        if(my_element.length>0){				 //如果’会员登录‘dom 存在

		           	// $('#login_box').show();				// 未登录 弹出登陆框！
		           	$("#login_box").addClass('mod_show');
		           	return false;

		        } else {
					$.ajax({
			         type:'post',
			         url:'<c:url value='/BaiBao_AddAttention'/>?collectionid='+id,
			         success:function(data){
			         if(data=='0000'){
			         	alert("成功关注！");
			         }else{
			         	alert(data);
			         }
			        }
			     });
				}

			}



		var type="${mapc.type}";
		function setTypeVal(){
		 type=$("#mainscope").val();
		}
		var startprice='${mapc.startprice}';
		var endprice='${mapc.endprice}';
		function setPriceVal(){
		 if($("#price").val()=='1'){
			 startprice="0";
			 endprice="1999";
		 }else if($("#price").val()=='2'){
			 startprice="2000";
			 endprice="9999";
		 }else if($("#price").val()=='3'){
			 startprice="10000";
			 endprice="99999";
		 }else if($("#price").val()=='4'){
			 startprice="100000";
			 endprice="1000000";
		 } else if($("#price").val()=='5'){
			 startprice="1000000";
			 endprice="100000000000";
		 }else if($("#price").val()==''){
			 startprice="";
			 endprice="";
		 }
		}
		var state="${mapc.state}";
		function setStateVal(){
		 state=$("#state").val();
		}
		var isagree="${mapc.isagree}";
		function setIsagreeVal(){
		isagree=$("#isagree").val();
		}
		var iszj="${mapc.iszj}";
		function setIszjVal(){
		iszj=$("#iszj").val();
		}
		 var ordercolumn='${mapc.ordercolumn}';
			 var orderdesc='${mapc.orderdesc}';
			 function setOrdercolumn(ts,ordercol,orderde){
			 	ordercolumn=ordercol;
			 	orderdesc=orderde;
			 	search();
		 }
		 function search(){
			 	var url="<c:url value='/BaiBao_getShop'/>?redirect=/baibaojie/seller&id=${mapc.shopid}";
			 	var wh="&type="+type+"&startprice="+startprice+"&endprice="+endprice+"&isagree="+isagree+"&state="+state+"&iszj="+iszj+"&ordercolumn="+ordercolumn+"&orderdesc="+orderdesc;
			 	window.location.href=encodeURI(url+wh);
			 }
		</script>
			                                    <!-- 中间部分 -->
			<div class="con_clect_right" style="width:590px;float:left;margin:0 20px;">
				<div class="choice_mores">
					<div class="choice_op">
						<select name="mainscope" id="mainscope" onchange="setTypeVal()">
							<option value=""  <c:if test="${mapc.type ==''||mapc.type ==null}">  selected="selected"</c:if>>全部种类</option>
							<option value="14" <c:if test="${fn:indexOf(mapc.type,'14')>=0}">  selected="selected"</c:if> >瓷器陶器</option>
							<option value="15" <c:if test="${fn:indexOf(mapc.type,'15')>=0}">  selected="selected"</c:if>>玉器赏石</option>
							<option value="16" <c:if test="${fn:indexOf(mapc.type,'16')>=0}">  selected="selected"</c:if>>青铜佛像</option>
							<option value="17" <c:if test="${fn:indexOf(mapc.type,'17')>=0}">  selected="selected"</c:if>>书画古籍</option>
							<option value="18" <c:if test="${fn:indexOf(mapc.type,'18')>=0}">  selected="selected"</c:if>>木器雕品</option>
							<option value="19" <c:if test="${fn:indexOf(mapc.type,'19')>=0}">  selected="selected"</c:if>>古币钱币</option>
							<option value="20" <c:if test="${fn:indexOf(mapc.type,'20')>=0}">  selected="selected"</c:if>>珠宝首饰</option>
							<option value="21" <c:if test="${fn:indexOf(mapc.type,'21')>=0}">  selected="selected"</c:if>>油画雕塑</option>
							<option value="22" <c:if test="${fn:indexOf(mapc.type,'22')>=0}">  selected="selected"</c:if>>邮票邮品</option>
							<option value="23" <c:if test="${fn:indexOf(mapc.type,'23')>=0}">  selected="selected"</c:if>>其他藏品</option>
						</select>
						<select name="price" id="price" onchange="setPriceVal()" style="margin:0 38px;">
							<option value="" <c:if test="${mapc.startprice==''||mapc.startprice ==null}"> selected="selected"</c:if> >全部价格区间</option>
							<option value="1" <c:if test="${mapc.startprice=='0'}">selected="selected"</c:if>>1999元及以下</option>
							<option value="2" <c:if test="${mapc.startprice=='2000'}"> selected="selected""</c:if>>2000元--9999元</option>
							<option value="3" <c:if test="${mapc.startprice=='10000'}"> selected="selected"</c:if>>10000元--99999元</option>
							<option value="4" <c:if test="${mapc.startprice=='100000'}"> selected="selected""</c:if>>10万元--100万元</option>
							<option value="5" <c:if test="${mapc.startprice=='1000000'}">selected="selected"</c:if>>100万元以上</option>
						</select>
						<select name="state" id="state" onchange="setStateVal()">
							<option value=""  <c:if test="${mapc.state ==''||mapc.state ==null}">  selected="selected"</c:if>>全部状态</option>
							<option value="2" <c:if test="${mapc.state =='2'}">  selected="selected"</c:if>> 待售中</option>
							<option value="4" <c:if test="${mapc.state =='4'}">  selected="selected"</c:if>>已售罄</option>
						</select>
					</div>
					<div class="choice_op2" style="padding-left:16px;">
						交易中转：
						<select name="isagree" id="isagree" onchange="setIsagreeVal()" style="margin-right:54px;">
							<option value="" <c:if test="${mapc.isagree ==''||mapc.isagree ==null}">  selected="selected"</c:if>>全部</option>
							<option value="1" <c:if test="${mapc.isagree =='1'}">  selected="selected"</c:if>>同意</option>
							<option value="2" <c:if test="${mapc.isagree =='2'}">  selected="selected"</c:if>>不同意</option>
						</select>
						专家推荐：
						<select name="iszj" id="iszj" onchange="setIszjVal()">
							<option value="" <c:if test="${mapc.iszj ==''||mapc.iszj ==null}">  selected="selected"</c:if>>全部</option>
							<option value="yes" <c:if test="${mapc.iszj =='yes'}">  selected="selected"</c:if>>有推荐</option>
							<option value="no" <c:if test="${mapc.iszj =='no'}">  selected="selected"</c:if>>无推荐</option>
						</select>
					</div>
				</div>
				<div class="search_btt">
						<button class="go_search" onclick="search()">开始搜索</button>
					</div>
				<div class="choice_mennu" style="width:495px;padding-left:93px;margin-bottom:20px;">
					<ul>
					<li  class="ch_li" onclick="setOrdercolumn(this,'clicknum','desc')" <c:if test="${mapc.ordercolumn=='clicknum'}"> style="background-color: #A40809;color:#fff;"</c:if> style="margin-right:20px;">最热门</li>
						<li onclick="setOrdercolumn(this,'price','desc')" <c:if test="${mapc.ordercolumn=='price'&&mapc.orderdesc=='desc'}">style="background-color: #A40809;color:#fff;"</c:if>>价格↑</li>
						<li onclick="setOrdercolumn(this,'price','')" <c:if test="${mapc.ordercolumn=='price'&&mapc.orderdesc==''}"> style="background-color: #A40809;color:#fff;"</c:if> style="margin-right:20px;">价格↓</li>
						<li onclick="setOrdercolumn(this,'zjgrades','desc')" <c:if test="${mapc.ordercolumn=='zjgrades'&&mapc.orderdesc=='desc'}"> style="background-color: #A40809;color:#fff;"</c:if>>评分↑</li>
						<li onclick="setOrdercolumn(this,'zjgrades','')" <c:if test="${mapc.ordercolumn=='zjgrades'&&mapc.orderdesc==''}"> style="background-color: #A40809;color:#fff;"</c:if> style="margin-right:20px;">评分↓</li>
						<li onclick="setOrdercolumn(this,'tsforums','desc')" <c:if test="${mapc.ordercolumn=='tsforums'&&mapc.orderdesc=='desc'}"> style="background-color: #A40809;color:#fff;"</c:if>>评论↑</li>
						<li onclick="setOrdercolumn(this,'tsforums','')" <c:if test="${mapc.ordercolumn=='tsforums'&&mapc.orderdesc==''}"> style="background-color: #A40809;color:#fff;"</c:if>>评论↓</li>
					</ul>
				</div>
<%--				<div class="colect_zt">--%>
<%--					<span>待售中/已售罄</span>--%>
<%--					<span>***</span>--%>
<%--					<span>件藏品</span>--%>
<%--				</div>--%>
				<div class="collection_lis">
					<ul>
					<c:forEach items="${list}" var="coll" varStatus="cdn">
						<li>
							<div class="clect_lis_left">
								<a href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${coll.id}" target="_blank">
									<img src="http://116.255.149.172:7080/wswhly/Baibaourl//${fn:split(coll.imgurl,',')[0]}" alt="" />
								</a>
								<p>
									编号：
									<span>${coll.baibaonum}</span>
								</p>
								<button class="guanzhu_btn"  onclick="AddAttention(${coll.id})"></button>
							</div>
							<div class="clect_lis_right">
								<div class="clect_lis_rt_name">
									<p class="colet_name"><a href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${coll.id}" target="_blank"><b>${coll.name}</b></a></p>
									<p><span><c:if test="${fn:indexOf(coll.type,'14')>=0}">瓷器陶器</c:if></span>
									<span><c:if test="${fn:indexOf(coll.type,'15')>=0}">玉器赏石</c:if></span>
									<span><c:if test="${fn:indexOf(coll.type,'16')>=0}">青铜金器</c:if></span>
									<span><c:if test="${fn:indexOf(coll.type,'17')>=0}">书画古籍</c:if></span>
									<span><c:if test="${fn:indexOf(coll.type,'18')>=0}">木器雕品</c:if></span>
									<span><c:if test="${fn:indexOf(coll.type,'19')>=0}">古币钱币</c:if></span>
									<span><c:if test="${fn:indexOf(coll.type,'20')>=0}">珠宝首饰</c:if></span>
									<span><c:if test="${fn:indexOf(coll.type,'21')>=0}">油画雕塑</c:if></span>
									<span><c:if test="${fn:indexOf(coll.type,'22')>=0}">邮票邮品</c:if></span>
									<span><c:if test="${fn:indexOf(coll.type,'23')>=0}">其他藏品</c:if></span></p>
								</div>
								<div class="clect_news">
									<p class="pd2">
										<span class="gray_clor">价格：￥</span>
										<span>${coll.price}</span>
										<span>元</span>
									</p>
									<p>
										<span class="gray_clor">交易中转：</span>
										<c:if test="${coll.isagree ==1}"><span>同意</span></c:if>
										<c:if test="${coll.isagree ==2}"><span>不同意</span></c:if>
									</p>

								</div>
								<div class="clect_news">
									<p class="pd2">
										<span class="gray_clor">状态：</span>
										<c:if test="${coll.state ==1}"><span>审核中</span></c:if>
										<c:if test="${coll.state ==2}"><span>待售</span></c:if>
										<c:if test="${coll.state ==3}"><span>正在交易中转</span></c:if>
										<c:if test="${coll.state ==4}"><span>已售罄</span></c:if>
									</p>
									<p>
										<span class="gray_clor">上传时间：</span>
										<span>${item.formatcreatedate}</span>
									</p>
								</div>
								<div class="clect_news">
									<p class="pd2">
										<span class="gray_clor">专家 推荐：</span>
										<span>${coll.zjname}</span>
									</p>
									<p>
										<span class="gray_clor">地址：</span>
										<span>${coll.fullname}</span>
									</p>
								</div>
								<div class="clect_news">
									<p class="pd2">
										<span class="gray_clor">评分</span>
										<span>${coll.zjgrades}分</span>
										<span>（${coll.cyrsgrades}人参与）</span>
									</p>
									<p>
										<span class="gray_clor">评论：</span>
										<span>${coll.tsforums}条</span>
										<span>（${coll.cyrsforums}人参与）</span>
									</p>
								</div>
								<!-- <div class="clect_news">
									<p>
										<span class="gray_clor">一句话广告：</span>
										<span>${coll.advertisement}</span>
									</p>
								</div> -->
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="cp-tj">
				<div class="cptj_tit">
					藏品统计
				</div>
				<div class="bd1">
					<p>
						<span>共上传：</span>
						<span>${item.sumcollection}</span>
						<span>件藏品</span>
					</p>
					<p class="bd2">
						<span class="gray_clor">总评分：</span>
						<span class="gray_clor"><c:if test="${item.zjgrades==null}">0</c:if><c:if test="${item.zjgrades!=null}">${item.zjgrades}</c:if></span>
						<span class="gray_clor">分</span>
					</p>
					<p class="bd2">
						<span class="gray_clor">总评论：</span>
						<span class="gray_clor"><c:if test="${item.tsforums==null}">0</c:if><c:if test="${item.tsforums!=null}">${item.tsforums}</c:if></span>
						<span class="gray_clor">条</span>
					</p>
				</div>
				<div class="bd1">
					<p>
						<span>审核中：</span>
						<span>${item.shcollection}</span>
						<span>件藏品</span>
					</p>
				</div>
				<div class="bd1">
					<p>
						<span>待售中：</span>
						<span>${item.dscollection}</span>
						<span>件藏品</span>
					</p>
					<p class="bd2">
						<span class="gray_clor">累计评分：</span>
						<span class="gray_clor"><c:if test="${item.dszjgrades==null}">0</c:if><c:if test="${item.dszjgrades!=null}">${item.dszjgrades}</c:if></span>
						<span class="gray_clor">${item.dszjgrades}分</span>
					</p>
					<p class="bd2">
						<span class="gray_clor">累计评论：</span>
						<span class="gray_clor"><c:if test="${item.dscountforums==null}">0</c:if><c:if test="${item.dscountforums!=null}">${item.dscountforums}</c:if></span>
						<span class="gray_clor">条</span>
					</p>
				</div>
				<div class="bd1">
					<p>
						<span>已售罄：</span>
						<span>${item.yscollection}</span>
						<span>件藏品</span>
					</p>
					<p class="bd2">
						<span class="gray_clor">累计评分：</span>
						<span class="gray_clor"><c:if test="${item.yszjgrades==null}">0</c:if><c:if test="${item.yszjgrades!=null}">${item.yszjgrades}</c:if></span>
						<span class="gray_clor">分</span>
					</p>
					<p class="bd2">
						<span class="gray_clor">累计评论：</span>
						<span class="gray_clor"><c:if test="${item.ystsforums==null}">0</c:if><c:if test="${item.ystsforums!=null}">${item.ystsforums}</c:if></span>
						<span class="gray_clor">条</span>
					</p>
				</div>
				<p class="jyzz">当前共有<span>${item.jyzzcollection}</span>藏品正在“交易中转”中</p>
<%--				<div class="cptj_tit">--%>
<%--					店内藏品最新评论--%>
<%--				</div>--%>
<%--				<div class="cp_pl">--%>
<%--					<p class="cp_name"><a href="#">藏品名称</a></p>--%>
<%--					<p class="cp_p">11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</p>--%>
<%--					<p class="gray_clor">网友名称</p>--%>
<%--					<p class="gray_clor dchf">--%>
<%--						<span><a href="#">顶</a></span>--%>
<%--						<span>（**）</span>--%>
<%--						<span><a href="#">踩</a></span>--%>
<%--						<span>（**）</span>--%>
<%--						<span><a href="#">回复</a></span>--%>
<%--					</p>--%>
<%--				</div>--%>
			</div>

		</div>
		 <c:if test="${count / pageSize > 1}">
				     <div class="fanye_clect">
				        <pg:pager url="BaiBao_getShop" items="${count}" maxPageItems="10" maxIndexPages="5">
				        <pg:param name="redirect" value="baibaojie/seller" />
				        <pg:param name="id" value="${mapc.shopid}" />
				        <pg:param name="pageSize" value="${pageSize}" />
				        <pg:param name="type" value="${mapc.type}" />
				        <pg:param name="startprice" value="${mapc.startprice}" />
				        <pg:param name="endprice" value="${mapc.endprice}" />
				        <pg:param name="isagree" value="${mapc.isagree}" />
				        <pg:param name="state" value="${mapc.state}" />
				        <pg:param name="iszj" value="${mapc.iszj}" />
				        <pg:param name="ordercolumn" value="${mapc.ordercolumn}" />
				        <pg:param name="tsforums" value="${mapc.tsforums}" />
				        <pg:param name="orderdesc" value="${mapc.orderdesc}" />

					    <pg:first><a  href="${pageUrl}">首页</a></pg:first>
				        <pg:pages><a href="${pageUrl}">${pageNumber}</a></pg:pages>
				        <pg:last><a href="${pageUrl}">尾页</a></pg:last>
				        </pg:pager>
				   </div>
				   </c:if>
	</div>
	 <script type="text/javascript">

	$(document).ready(function() {
           var urlsval = url_request("pager.offset");   // 获取 offset参数

           var urlsval2 = parseInt(urlsval/10)+1;
            $(".fanye_clect>a").each(function(){
                if ($(this).text()==urlsval2) {
                    $(this).css("background-color","#c91818");
                }
            });
});

 </script>
	<div style="clear:both;"></div>
  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
