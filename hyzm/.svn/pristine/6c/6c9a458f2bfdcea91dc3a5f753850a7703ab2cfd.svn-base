<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<jsp:directive.page import="com.hyzm.bean.CurrentSession"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>百宝箱商品详情_卫视文化乐园-华豫之门官方网站</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/style.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/bbstyle.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/slideshow.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
	<meta name=keywords content="百宝箱,藏品"/>
	<meta name=description content="华豫之门百宝箱藏品"/>
  </head>
<script>
//交易中转
function BaiBao_AddTransfer(shopuserid,collectionid){
var my_element=$(".login");
		        if(my_element.length>0){				 //如果’会员登录‘dom 存在

		           	// $('#login_box').show();				// 未登录 弹出登陆框！
		           	$("#login_box").addClass('mod_show');
		           	return false;

		        } else {
					if(shopuserid=='${CurrentSession.id}'){
						alert('您不能购买自己的藏品');
						// 您不能申请自己藏品的交易中转
						return false;
					}else{
						$.ajax({
					         type:'post',
					         url:'<c:url value='/BaiBao_AddTransfer'/>?shopuserid='+shopuserid+"&collectionid="+collectionid,
					         success:function(data){
					         if(data=='0000'){
					         	//alert("您已确认使用交易中转功能，可拨打0371-60110891，稍候工作人员将与您取得联系！");
					         	window.location.href="<c:url value='/BaiBao_getUserSellerCenter'/>";
					         }else{
					         	alert(data);
					         }
					        }
					     });
					}
 			}
}

//专家图件
function BaiBao_UpdateCollectionByZj(id){

			var my_element=$(".login");
		        if(my_element.length>0){				 //如果’会员登录‘dom 存在

		           	// $('#login_box').show();				// 未登录 弹出登陆框！
		           	$("#login_box").addClass('mod_show');
		           	return false;

		        } else {

 			 $.ajax({
			         type:'post',
			         url:'<c:url value='/BaiBao_UpdateCollectionByZj'/>?id='+id,
			         success:function(data){
			         if(data=='0000'){
			         	alert("推荐成功！");
			         	location.reload();
			         }else{
			         	alert(data);
			         }
			        }
			     });
 			}
}
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
	 //加载右侧相关藏品
	 $(function(){
	  $("#xgcp").html("数据正在努力，加载中请稍候... ...");
	    var con="";
	   $.ajax({
	         type:'post',
	         url:'<c:url value='/BaiBao_getCollectionRand'/>?pagesize=4&s='+Math.random(),
	         success:function(data){
	         var jsonData = eval(data);
	         if(data!='1111'){
	          $.each(jsonData, function(index, objVal) {

	          con+="<li class='cps_rank'>";
						con+="<p>";
							con+="<span class='cprank_num'>"+(parseInt(index)+1)+"</span>";
							con+="<span>";
							con+="	<a href='<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>"+objVal.id+"' target='_blank'>"+objVal.name+"</a>";
							con+="</span>";
						con+="</p>";
						con+="<p class='cps_detail'>";
							con+="<span class='hnf_name'>价格：</span>";
							con+="<span class='cps_pric1'>";
								con+=objVal.price+"元";
							con+="</span>";
						con+="</p>";
						con+="<p class='cps_detail'>";
							con+="<span class='hnf_name'>店主地址：</span>";
							con+="<span class=''>";
							con+=objVal.fullname;
							con+="</span>";
						con+="</p>";
						// con+="<p class='cps_detail'>";
						// 	con+="<span class='hnf_name'>一句话广告：</span>";
						// 	con+="<span class='add_wid'>";
						// 	con+=objVal.advertisement;
						// 	con+="</span>";
						// con+="</p>";
					con+="</li>";
	          });
	          $("#xgcp").html(con);
	         }else{
	         	$("#xgcp").html("加载失败！");
	         }
	        }
	     });
    });
    //加载右侧藏品评分多
	 $(function(){
	  $("#pfd").html("数据正在努力，加载中请稍候... ...");
	    var con="";
	   $.ajax({
	         type:'post',
	         url:'<c:url value='/BaiBao_getShopMaxGrade'/>?pagesize=4&s='+Math.random(),
	         success:function(data){
	         var jsonData = eval(data);
	         if(data!='1111'){
	          $.each(jsonData, function(index, objVal) {
	          con+="<li class='cps_rank'>";
						con+="<p>";
							con+="<span class='cprank_num'>"+(parseInt(index)+1)+"</span>";
							con+="<span>";
								con+="<a href='<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>"+objVal.id+"' target='_blank'>"+objVal.name+"</a>";
							con+="</span>";
						con+="</p>";
						con+="<p class='cps_detail'>";
							con+="<span class='hnf_name'>价格：</span>";
							con+="<span class='cps_pric1'>";
							con+=objVal.price+"元";
							con+="</span>";
						con+="</p>";
						con+="<p class='cps_detail'>";
							con+="<span class='hnf_name'>评分：</span>";
							con+="<span class=''>";
							if(objVal.zjgrades=='undefined'||objVal.zjgrades==undefined){
								con+="0";
							}else{
								con+=objVal.zjgrades;
							}
								con+="分 ("+objVal.cyrsgrades+"人参与)";
							con+="</span>";
						con+="</p>";
						// con+="<p class='cps_detail'>";
						// 	con+="<span class='hnf_name'>一句话广告：</span>";
						// 	con+="<span class='add_wid'>";
						// 	con+=objVal.advertisement;
						// 	con+="</span>";
						// con+="</p>";
					con+="</li>";

	          });
	          $("#pfd").html(con);
	         }else{
	         	$("#pfd").html("加载失败！");
	         }
	        }
	     });
    });
</script>
  <body>
  <jsp:include page="../head/header.jsp"></jsp:include>
	<div class="content_collect">
		<div class="con_bread">
			<span class="gray_clor">当前位置</span> >
			<span><a href="<c:url value='/index'/>">乐园首页</a></span> >
			<span><a href="<c:url value='/baibaoindex/BaiBao_getIndex'/>">百宝箱</a></span> >
			<span><a href="<c:url value='/BaiBao_getCollectionForList?redirect=baibaojie/collection'/>">藏品</a></span> >
			<span><a href="#">${item.name}</a></span>

		</div>

		<div class="bb_cp_lbox">

		</div>

		<!-- 左侧 -->
		<div class="bb_cp_lbox">
				<div class="cpinfo_1">
					<div class="cp_limg">
						<a href="#" class="cp_lpics"><img src="http://116.255.149.172:7080/wswhly/Baibaourl//${fn:split(item.imgurl,',')[0]}"  alt="" /></a>
						<div class="cp_lsid">
							<span class=" fl">编号：${item.baibaonum}</span>
							<a href="#"  class="mcp_ylooks fl" onclick="AddAttention(${item.id})">+ 加关注</a>
						</div>
						<div class="cp_lshare">
							<div class="fl">分享：</div>
							<div class="fl">
								<div class="bdsharebuttonbox">
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

					<div class="cp_rinfo">
						<div class="cp_names1">
							<span class="csname fl">${item.name}</span>
							<span class="csfenl fr"><span><c:if test="${fn:indexOf(item.type,'14')>=0}">瓷器陶器</c:if></span>
										<span><c:if test="${fn:indexOf(item.type,'15')>=0}">玉器赏石</c:if></span>
										<span><c:if test="${fn:indexOf(item.type,'16')>=0}">青铜金器</c:if></span>
										<span><c:if test="${fn:indexOf(item.type,'17')>=0}">书画古籍</c:if></span>
										<span><c:if test="${fn:indexOf(item.type,'18')>=0}">木器雕品</c:if></span>
										<span><c:if test="${fn:indexOf(item.type,'19')>=0}">古币钱币</c:if></span>
										<span><c:if test="${fn:indexOf(item.type,'20')>=0}">珠宝首饰</c:if></span>
										<span><c:if test="${fn:indexOf(item.type,'21')>=0}">油画雕塑</c:if></span>
										<span><c:if test="${fn:indexOf(item.type,'22')>=0}">邮票邮品</c:if></span>
										<span><c:if test="${fn:indexOf(item.type,'23')>=0}">其他藏品</c:if></span></span>
						</div>
						<div style="clear:both;"></div>
						<div class="cp_jsinfo">
							<div class="infos2_l fl">
								<p class="infos2_p">
									<span>价格：</span> <i class="cps2_price">￥${item.price}元</i>
								</p>
								<p class="infos2_p">
									<span>状态：</span> <i class=""><c:if test="${item.state ==1}"><span>审核中</span></c:if>
										<c:if test="${item.state ==2}"><span>待售</span></c:if>
										<c:if test="${item.state ==3}"><span>正在交易中转</span></c:if>
										<c:if test="${item.state ==4}"><span>已售罄</span></c:if></i>
								</p>
								<p class="infos2_p">
									<span>专家推荐：</span> <i class=""><c:if test="${item.zjname!=null}">${item.zjname}</c:if>
									<%
									CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
									if(currentsession!=null){
									//判断当前用户id  是否是专家id
									String userid=String.valueOf(currentsession.getId());
									String [] zjuserid= PropertiesUtil.getPropertiesValue("zjuserid").split(",");
									boolean tag=false;
									for(int i=0;i<zjuserid.length;i++){
										if(userid==zjuserid[i].trim()||userid.equals(zjuserid[i].trim())){
											tag=true;
											break;
										}
									}
									if(tag){
									 %>
									<c:if test="${item.zjname==null}"><i class="info-show" onclick="javascript: BaiBao_UpdateCollectionByZj(${item.id});">推荐</i></c:if>
									<%}
									} %>
									</i>
								</p>
								<p class="infos2_p">
									<span>店铺：</span> <i class="">${item.shopname}</i>
									
								</p>
								<p class="infos2_p">
									<span>联系方式：</span> <i class="info-show" onclick="javascript:$('.lx2_us').show();" onmouseout="$('.lx2_us').hide();" >点击显示</i>
								</p>
								<div class="lx2_us">
									<p class="heir_phone">${itemshop.mobile}</p>
									<p>联系人：${itemshop.realname}</p>
									<p>地址：${itemshop.shopaddress}</p>
								</div>
							</div>
							<div class="infos2_r fr">
								<p class="infos2_p"><span>交易中转：</span><i><c:if test="${item.isagree=='1'}">同意</c:if>
										<c:if test="${item.isagree=='2'}">不同意</c:if></i></p>
								<p class="infos2_p"><span>上传时间：</span><i>${item.formatcreatedate}</i></p>
								<p class="infos2_p"><span>地址：</span><i>${item.fullname}</i></p>

							</div>
							<div style="clear:both;"></div>
							<div class="infotop2">本站只展示店主上传的各种信息，并不保证其真实性，请谨慎交易</div>
							<c:if test="${item.opentrade ==1&&item.state==2}">
							<div class="for_zhonzhuan">
								<p class="for_zhonzhuan_s" onclick="BaiBao_AddTransfer(${itemshop.userid},${item.id});"  >立即购买</p>
							</div>
							</c:if>
							<!-- <div class="info_yijug">
								<p class="infos2_p">
									<span>广告话：</span> <i>${item.advertisement}</i>
								</p>

							</div> -->

							<!-- <div class="infos2_l fl">
								<p class="infos2_p">
									<span>评分： </span> <i class="">${item.zjgrades}分（${item.cyrsgrades}人参与）</i>
								</p>

							</div>
							<div class="infos2_r fl">
								<p class="infos2_p">
									<span>评论： </span> <i class="">${item.tsforums}条（${item.cyrsforums}人参与）</i>
								</p>

							</div> -->
						</div>
					</div>
				</div>

				<!-- 藏品介绍 -->
				<div class="cpjs_box2">
					<div class="cpjs_11 fl">藏品介绍:</div>
					<div class="cpjs_text1 fr">${item.note}</div>
				</div>

				<div class="cpjs_img11">
				<c:forTokens items="${item.imgurl}" delims="," var="val">
				    <img src="http://116.255.149.172:7080/wswhly/Baibaourl/${val}" alt="" />
				</c:forTokens>

				</div>

		</div>
		<!-- 右侧 -->
		<div class="bb_cp_rbox">
			<div class="toplist_box_tit xg_cptit">
				<p>相关藏品</p>
			</div>

			<div class="cpsr_1">
				<ul id="xgcp">
				</ul>
			</div>
			<!-- <div class="abds_img1"><img src="<c:url value='/images/absimg/banner_list_left.jpg'/>" alt="" /></div> -->

			<!-- 评分最多 -->
			<div class="toplist_box_tit xg_cptit">
				<p>当前评分最多藏品</p>
			</div>

			<div class="cpsr_1">
				<ul id="pfd">


				</ul>
			</div>
		</div>

	</div>
	<div style="clear:both;"></div>
  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
