<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>商家_百宝箱_卫视文化乐园-华豫之门官方网站</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/style.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/slideshow.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
	<meta name=keywords content="百宝箱,商家">
	<meta name=description content="华豫之门百宝箱商家">
	<style type="text/css">
		.collection_list li {
			height: 216px;
		}
		.dq1 {
			width: 240px;
		}
	</style>
	<script type="text/javascript">
	 //加载左侧乐园藏品谁家多
	 $(function(){
	  $("#maxcollli").html("数据正在努力，加载中请稍候... ...");
	    var con="";
	   $.ajax({
	         type:'post',
	         url:'<c:url value='/BaiBao_getShopMaxColl'/>?s='+Math.random(),
	         success:function(data){
	         var jsonData = eval(data);
	         if(data!='1111'){
	          $.each(jsonData, function(index, objVal) {
	          	con+="<li class='shop_rank'>";
						con+="<p>";
							con+="<span class='rank_num'>"+(parseInt(index)+1)+"</span>";
							con+="<span>";
								con+="<a href='<c:url value='/BaiBao_getShop?redirect=/baibaojie/seller&id='/>"+objVal.id+"' target='_blank' class='fl ad_mar'>"+objVal.shopname+"</a>";
							con+="</span>";
						con+="<p class='shop_detail'>";
							con+="<span class='sp_colet_num fr'>";
								con+="<span class='fr gray_clor'>件</span>";
								con+="<span class='fr gray_clor'>【"+objVal.sumcollection+"】</span>";
								con+="<span class='fr gray_clor'>共有</span>";
								con+="<a href='<c:url value='/BaiBao_getShop?redirect=/baibaojie/seller&id='/>"+objVal.id+"' target='_blank' class='add_mar'>"+objVal.username+"</a>";
								
								con+="</span>";
						con+="</p>";
					con+="</li>";
	          });
	          $("#maxcollli").html(con);
	         }else{
	         	$("#maxcollli").html("加载失败！");
	         }
	        }
	     });
    });

  //    //加载左侧乐园藏品评论多
	 $(function(){
	  $("#maxpli").html("数据正在努力，加载中请稍候... ...");
	    var con="";
	   $.ajax({
	         type:'post',
	         url:'<c:url value='/BaiBao_getShopMaxForums'/>?s='+Math.random(),
	         success:function(data){
	         var jsonData = eval(data);
	         if(data!='1111'){
	          $.each(jsonData, function(index, objVal) {
	          		con+="<li class='shop_rank'>";
						con+="<p>";
							con+="<span class='rank_num'>"+(parseInt(index)+1)+"</span>";
							con+="<a href='<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>"+objVal.id+"' target='_blank' class='fl ad_mar'>"+objVal.name+"</a>";
						con+="</p>";
						con+="<p class='shop_detail'>";
							con+="<span class='sp_colet_num fr'>";
							con+="<span class='pp_num'>";
								con+="<span class='fr gray_clor'>评论</span>";
								con+="<span class='fr gray_clor'>【"+objVal.tsforums+"】</span>";
								con+="<span class='fr gray_clor'>共发表</span>";
								con+="<span class='fr gray_clor'>"
								con+="<a href='<c:url value='/BaiBao_getShop?redirect=/baibaojie/seller&id='/>"+objVal.shopid+"' target='_blank' class='fl add_mar'>"+objVal.shopname+"</a>";
								
								con+="</span>";
								
						con+="</p>";
					con+="</li>";
	          });
	          $("#maxpli").html(con);
	         }else{
	         	$("#maxpli").html("加载失败！");
	         }
	        }
	     });
    });
	</script>
  </head>

  <body>
  <jsp:include page="../head/header.jsp"></jsp:include>
	<div class="content_collect">
		<div class="con_bread">
			<span class="gray_clor">当前位置</span> >
			<span><a href="<c:url value='/index'/>" target="_blank">乐园首页</a></span> >
			<span><a href="<c:url value='/baibaoindex/BaiBao_getIndex'/>" target="_blank">百宝箱</a></span> >
			<span class="gray_clor">商家</span>
		</div>
		<div>
			<div class="con_clect_left">
				<div class="con_left_tit">
					<p>乐园藏品谁家多</p>
				</div>
				<ul id="maxcollli">

				</ul>
						<!-- 第二分类 -->
				<div class="con_left_tit" style="margin-top:20px;">
					<p>推荐藏品</p>
				</div>
				<ul id="maxpli">
				</ul>
			</div>
			                                    <!-- 右部分 -->
			<script>
			var mainscope= '${mapc.mainscope}'<c:if test="${mapc.mainscope!=''}">+','</c:if>;
			  function setmainscopeVal(ts,val){
				  if(val!=''){
					  //判断是否已经存在  如果存在  表示要取消所选经营范围
					  var str=val+',';
					  if(mainscope.indexOf(str)>=0){
					    $(ts).removeClass('btn_href');
					  	mainscope=mainscope.replace(str,'');
					  }else{
					    $(ts).addClass('btn_href');
					  	mainscope+=str;
					  }
				  }else{
				  	 $("input[name='mainscope']").removeClass('btn_href');
				  	 $(ts).addClass('btn_href');
					 mainscope=val;
				  }
				  search();
			 }

			  var addresscode='${mapc.addresscode}';
			 function setAddresscodeVal(ts,val){
			  $("input[name='addresscode']").removeClass('btn_href');
			 	addresscode=val;
			 	$(ts).addClass('btn_href');
			 	search();
			 }

			  var ordercolumn='${mapc.ordercolumn}';
			 var orderdesc='${mapc.orderdesc}';
			 function setOrdercolumn(ts,ordercol,orderde){
			   $("input[name='ordercolumn']").removeClass('btn_href');
			 	ordercolumn=ordercol;
			 	orderdesc=orderde;
			 	$(ts).addClass('btn_href');
			 	search();
			 }


			 function search(){
			 	var keyword= $("#keyword").val();
			 	var url="<c:url value='/BaiBao_getShopForList'/>?redirect=baibaojie/sellers";
			 	if(mainscope.indexOf(',')>=0){
			 		mainscope=mainscope.substring(0,mainscope.length-1)
			 	}
			 	var wh="&mainscope="+mainscope+"&addresscode="+addresscode+"&keyword="+keyword+"&ordercolumn="+ordercolumn+"&orderdesc="+orderdesc;
			 	window.location.href=encodeURI(url+wh);
			 }
			</script>
			<div class="con_clect_right">
				<div class="con_clet_rt_tit">
					<span class="get_search">商家筛选</span>
					<div>
						<span style="margin-right:5px;">关键字搜索：</span>
						<div class="search_box">
							<input type="text" name="keyword" id="keyword" class="search_input" value="${mapc.keyword}" />
							<button class="search_btn"  onclick="search()"></button>
						</div>
					</div>
				</div>
				<div class="choice_more" style="height:110px;">
					<ul>
						<li class="ch_li">
							<p>
								<span class="gray_clor">经营范围：</span>
								<input name='mainscope' type="button" value="全部" <c:if test="${mapc.mainscope ==''||mapc.mainscope ==null}"> class="btn_href"</c:if> onclick="setmainscopeVal(this,'')"/>
								<input name='mainscope' type="button" value="瓷器陶器" <c:if test="${fn:indexOf(mapc.mainscope,'14')>=0}"> class="btn_href"</c:if> onclick="setmainscopeVal(this,'14')"/>
								<input name='mainscope' type="button" value="玉器赏石" <c:if test="${fn:indexOf(mapc.mainscope,'15')>=0}"> class="btn_href"</c:if> onclick="setmainscopeVal(this,'15')"/>
								<input name='mainscope' type="button" value="青铜佛像"<c:if test="${fn:indexOf(mapc.mainscope,'16')>=0}"> class="btn_href"</c:if> onclick="setmainscopeVal(this,'16')"/>
								<input name='mainscope' type="button" value="书画古籍"<c:if test="${fn:indexOf(mapc.mainscope,'17')>=0}"> class="btn_href"</c:if> onclick="setmainscopeVal(this,'17')"/>
								<input name='mainscope' type="button" value="木器雕品"<c:if test="${fn:indexOf(mapc.mainscope,'18')>=0}"> class="btn_href"</c:if> onclick="setmainscopeVal(this,'18')"/>
								<input name='mainscope'  type="button" value="古币钱币"<c:if test="${fn:indexOf(mapc.mainscope,'19')>=0}"> class="btn_href"</c:if> onclick="setmainscopeVal(this,'19')"/>
								<input name='mainscope' type="button" value="珠宝首饰"<c:if test="${fn:indexOf(mapc.mainscope,'20')>=0}"> class="btn_href"</c:if>onclick="setmainscopeVal(this,'20')"/>
							</p>
							<p class="pd1">
								<input name='mainscope' type="button" value="油画雕塑"<c:if test="${fn:indexOf(mapc.mainscope,'21')>=0}"> class="btn_href"</c:if>onclick="setmainscopeVal(this,'21')" style="margin-left:67px;"/>
								<input name='mainscope' type="button" value="邮票邮品"<c:if test="${fn:indexOf(mapc.mainscope,'22')>=0}"> class="btn_href"</c:if>onclick="setmainscopeVal(this,'22')"/>
								<input name='mainscope' type="button" value="其他藏品"<c:if test="${fn:indexOf(mapc.mainscope,'23')>=0}"> class="btn_href"</c:if> onclick="setmainscopeVal(this,'23')"/>
								<span class="gray_clor">(可多选)</span>
							</p>
						</li>
						<li class="ch_li">
							<p>
								<span class="gray_clor">卖家地址：</span>
								<input name='addresscode' type="button" value="全部" <c:if test="${mapc.addresscode==''||mapc.addresscode ==null}"> class="btn_href"</c:if> onclick="setAddresscodeVal(this,'')"/>
								<input name='addresscode' type="button" value="华东" <c:if test="${fn:indexOf(mapc.addresscode,'310000,320000,330000,340000,350000,360000,360000,710000')>=0}"> class="btn_href"</c:if> onclick="setAddresscodeVal(this,'310000,320000,330000,340000,350000,360000,360000,710000')"/>
								<input name='addresscode' type="button" value="华南" <c:if test="${fn:indexOf(mapc.addresscode,'440000,450000,460000,810000,820000')>=0}"> class="btn_href"</c:if> onclick="setAddresscodeVal(this,'440000,450000,460000,810000,820000')"/>
								<input name='addresscode' type="button" value="华北" <c:if test="${fn:indexOf(mapc.addresscode,'110000,120000,130000,140000,150000')>=0}"> class="btn_href"</c:if> onclick="setAddresscodeVal(this,'110000,120000,130000,140000,150000')"/>
								<input name='addresscode' type="button" value="华中" <c:if test="${fn:indexOf(mapc.addresscode,'410000,420000,430000')>=0}"> class="btn_href"</c:if> onclick="setAddresscodeVal(this,'410000,420000,430000')"/>
								<input name='addresscode' type="button" value="东北" <c:if test="${fn:indexOf(mapc.addresscode,'210000,220000,230000')>=0}"> class="btn_href"</c:if>onclick="setAddresscodeVal(this,'210000,220000,230000')"/>
								<input name='addresscode' type="button" value="西南" <c:if test="${fn:indexOf(mapc.addresscode,'500000,510000,520000,530000,540000')>=0}"> class="btn_href"</c:if> onclick="setAddresscodeVal(this,'500000,510000,520000,530000,540000')"/>
								<input name='addresscode' type="button" value="西北" <c:if test="${fn:indexOf(mapc.addresscode,'610000,620000,630000,640000,650000')>=0}"> class="btn_href"</c:if> onclick="setAddresscodeVal(this,'610000,620000,630000,640000,650000')"/>
								<input name='addresscode' type="button" value="国外地区" <c:if test="${fn:indexOf(mapc.addresscode,'910000')>=0}"> class="btn_href"</c:if>onclick="setAddresscodeVal(this,'910000')"/>
							</p>
						</li>
					</ul>
				</div>

				<c:if test="${mapc.keyword!=null&&mapc.keyword!=''}">
				<div class="search_over">
					当前符合关键字 “${mapc.keyword}” 的藏品如下：
				</div>
				</c:if>
				<div class="collection_list">
				<c:forEach items="${list}" var="shop" varStatus="cdn">
					<ul>
						<li>
							<div class="clect_list_left">
								<a href="<c:url value='/BaiBao_getShop?redirect=/baibaojie/seller&id='/>${shop.id}" target="_blank">
									<img src="http://116.255.149.172:7080/wswhly/Baibaourl/${shop.img}" alt="" />
								</a>
								<p>
									创建于：
									<span>${shop.formatcreatedate}</span>
								</p>
							</div>
							<div class="clect_list_right">
								<div class="clect_list_rt_name">
									<p class="fl"><b>商家：</b></p>
									<p class="fl"><a href="<c:url value='/BaiBao_getShop?redirect=/baibaojie/seller&id='/>${shop.id}" target="_blank"><b>${shop.username}</b></a></p>
									<p class="fr"><b>${shop.shopname}</b></p>
									<p class="fr"><b>店铺：</b></p>
								</div>
								<div class="clect_dt">
									<p class="dq1">
										<span class="gray_clor">共上传：</span>
										<span>${shop.sumcollection}</span>
										<span>件藏品</span>
									</p>
									<p style="width:134px;">
										<span class="gray_clor">待售中：</span>
										<span class="gray_clor">${shop.dscollection}</span>
										<span class="gray_clor">件藏品</span>
									</p>
									<p>
										<span class="gray_clor">已售罄：</span>
										<span class="gray_clor">${shop.yscollection}</span>
										<span class="gray_clor">件藏品</span>
									</p>
								</div>
								<div class="clect_dt">
									<p class="dq1" style="margin-left:0px;">
										<span class="gray_clor">当前共有：</span>
										<span class="gray_clor">${shop.jyzzcollection}</span>
										<span class="gray_clor">件藏品正在“交易中转”中</span>
									</p>
								</div>
								<div class="clect_dt">
									<p class="dq1">
										<span class="gray_clor">地址：</span>
										<span>${shop.shopaddress}</span>
									</p>
									<p style="width:134px;">
										<span class="gray_clor">评分：</span>
										<span>${shop.zjgrades}分</span>
										<span>（${shop.cyrsgrades}人参与）</span>
									</p>
									<p>
										<span class="gray_clor">评论：</span>
										<span>${shop.tsforums}条</span>
										<span>（${shop.cyrsforums}人参与）</span>
									</p>
								</div>
								<div class="clect_dt">
									<p>
										<span class="gray_clor">经营范围：</span>
										<span><c:if test="${fn:indexOf(shop.mainscope,'14')>=0}">瓷器陶器</c:if></span>
										<span><c:if test="${fn:indexOf(shop.mainscope,'15')>=0}">玉器赏石</c:if></span>
										<span><c:if test="${fn:indexOf(shop.mainscope,'16')>=0}">青铜金器</c:if></span>
										<span><c:if test="${fn:indexOf(shop.mainscope,'17')>=0}">书画古籍</c:if></span>
										<span><c:if test="${fn:indexOf(shop.mainscope,'18')>=0}">木器雕品</c:if></span>
										<span><c:if test="${fn:indexOf(shop.mainscope,'19')>=0}">古币钱币</c:if></span>
										<span><c:if test="${fn:indexOf(shop.mainscope,'20')>=0}">珠宝首饰</c:if></span>
										<span><c:if test="${fn:indexOf(shop.mainscope,'21')>=0}">油画雕塑</c:if></span>
										<span><c:if test="${fn:indexOf(shop.mainscope,'22')>=0}">邮票邮品</c:if></span>
										<span><c:if test="${fn:indexOf(shop.mainscope,'23')>=0}">其他藏品</c:if></span>
									</p>
								</div>
								<div class="clect_dt" style="width:536px;">
									<p>
										<span class="gray_clor">店主宣言：</span>
										<span>${shop.manifesto}</span>
									</p>
								</div>
							</div>
						</li>
					</ul>
					</c:forEach>
					 <c:if test="${count / pageSize > 1}">
				     <div class="fanye_clect">
				        <pg:pager url="BaiBao_getShopForList" items="${count}" maxPageItems="10" maxIndexPages="5">
				        <pg:param name="redirect" value="/baibaojie/sellers" />
				        <pg:param name="pageSize" value="${pageSize}" />
				        <pg:param name="mainscope" value="${mapc.mainscope}" />
				        <pg:param name="addresscode" value="${mapc.addresscode}" />
				        <pg:param name="keyword" value="${mapc.keyword}" />
				        <pg:param name="ordercolumn" value="${mapc.ordercolumn}" />
				        <pg:param name="orderdesc" value="${mapc.orderdesc}" />
					    <pg:first><a  href="${pageUrl}">首页</a></pg:first>
				        <pg:pages><a href="${pageUrl}">${pageNumber}</a></pg:pages>
				        <pg:last><a href="${pageUrl}">尾页</a></pg:last>
				        </pg:pager>
				   </div>
				   </c:if>
				</div>
			</div>
		</div>
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
