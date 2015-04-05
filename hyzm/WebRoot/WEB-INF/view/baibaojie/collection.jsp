<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>百宝箱_卫视文化乐园-华豫之门官方网站</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/baibaojie/style.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/slideshow.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
	<meta name=keywords content="百宝箱,藏品"/>
	<meta name=description content="华豫之门百宝箱藏品"/>
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
							con+="<span class='fl ad_mar'>";
								con+="<a href='<c:url value='/BaiBao_getShop?redirect=/baibaojie/seller&id='/>"+objVal.id+"' target='_blank' class='fr'>"+objVal.shopname+"</a>";
							con+="</span>";
						con+="</p>";
						con+="<p class='shop_detail'>";	
							con+="<span class='sp_colet_num fr'>";
								con+="<span class='fr gray_clor'>件</span>";
								con+="<span class='fr gray_clor'>【"+objVal.sumcollection+"】</span>";
								con+="<span class='fr gray_clor'>共有</span>";
								con+="<a href='<c:url value='/BaiBao_getShop?redirect=/baibaojie/seller&id='/>"+objVal.id+"' target='_blank' class='add_mar'>"+objVal.username+"</a>";
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
    
     //加载左侧乐园藏品评论多
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
								con+="</span>";
						con+="</p>";
						con+="<p class='shop_detail'>";
							con+="<span class='sp_colet_num fr'>";
								con+="<span class='fr gray_clor'>评论</span>";
								con+="<span class='fr gray_clor'>【"+objVal.tsforums+"】</span>";
								con+="<span class='fr gray_clor'>共发表</span>";
								con+="<span class='fr gray_clor ad_ma'>"+objVal.shopname+"</span>";
								
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
			     });}
			}
	</script>
  </head>

  <body>
  <jsp:include page="../head/header.jsp"></jsp:include>
	<div class="content_collect">
		<div class="con_bread">
			<span class="gray_clor">当前位置</span> >
			<span><a href="<c:url value='/index'/>" target="_blank">乐园首页</a></span> >
			<span><a href="<c:url value='/baibaoindex/BaiBao_getIndex'/>" target="_blank">百宝箱</a></span> >
			<span class="gray_clor">藏品</span>
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
			
			 var type= '${mapc.type}'<c:if test="${mapc.type!=''&&mapc.type!=null}">+','</c:if>;
			  function setTypeVal(ts,val){
				  if(val!=''){
					  //判断是否已经存在  如果存在  表示要取消所选藏品种类
					  var str=val+',';
					  if(type.indexOf(str)>=0){
					    $(ts).removeClass('btn_href');
					  	type=type.replace(str,'');
					  }else{
					    $(ts).addClass('btn_href');
					  	type+=str;
					  }
				  }else{
				  	 $("input[name='type']").removeClass('btn_href');
				  	 $(ts).addClass('btn_href');
					 type=val;
				  }
				  search();
			 }	
			 
			 var startprice='${mapc.startprice}';
			 var endprice='${mapc.endprice}';
			 function setPriceVal(ts,start,end){
			 	$("input[name='price']").removeClass('btn_href');
			 	startprice=start;
			 	endprice=end;
			 	$(ts).addClass('btn_href');
			 	search();
			 }		
			 
			 var isagree='${mapc.isagree}';
			 function setIsagreeVal(ts,val){
			 	$("input[name='isagree']").removeClass('btn_href');
			 	isagree=val;
			 	$(ts).addClass('btn_href');
			 	search();
			 }
			 
			  var state='${mapc.state}';
			 function setStateVal(ts,val){
			 	$("input[name='state']").removeClass('btn_href');
			 	state=val;
			 	$(ts).addClass('btn_href');
			 	search();
			 }
			 
			  var iszj='${mapc.iszj}';
			 function setIszjVal(ts,val){
			    $("input[name='iszj']").removeClass('btn_href');
			 	iszj=val;
			 	$(ts).addClass('btn_href');
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
			 	var url="<c:url value='/BaiBao_getCollectionForList'/>?redirect=baibaojie/collection";
			 	if(type.indexOf(',')>=0){
			 		type=type.substring(0,type.length-1)
			 	}
			 	var wh="&type="+type+"&startprice="+startprice+"&endprice="+endprice+"&isagree="+isagree+"&state="+state+"&iszj="+iszj+"&keyword="+keyword+"&addresscode="+addresscode+"&ordercolumn="+ordercolumn+"&orderdesc="+orderdesc;
			 	window.location.href=encodeURI(url+wh);
			 }
			 
			</script>
			<div class="con_clect_right">
				<div class="con_clet_rt_tit">
					<span class="get_search">藏品筛选</span>
					<div>
						<span style="margin-right:5px;">关键字搜索：</span>
						<div class="search_box">
							<input type="text" name="keyword" id="keyword" class="search_input" value="${mapc.keyword}" />
							<button class="search_btn" onclick="search()"></button>
						</div>
					</div>
				</div>
				<div class="choice_more">
					<ul>
						<li class="ch_li">
							<p>
								<span class="gray_clor">藏品种类：</span>
								<input name='type' type="button" value="全部" <c:if test="${mapc.type ==''||mapc.type ==null}"> class="btn_href"</c:if> onclick="setTypeVal(this,'')"/>
								<input name='type' type="button" value="瓷器陶器" <c:if test="${fn:indexOf(mapc.type,'14')>=0}"> class="btn_href"</c:if> onclick="setTypeVal(this,'14')"/>
								<input name='type' type="button" value="玉器赏石" <c:if test="${fn:indexOf(mapc.type,'15')>=0}"> class="btn_href"</c:if> onclick="setTypeVal(this,'15')"/>
								<input name='type' type="button" value="青铜佛像"<c:if test="${fn:indexOf(mapc.type,'16')>=0}"> class="btn_href"</c:if> onclick="setTypeVal(this,'16')"/>
								<input name='type' type="button" value="书画古籍"<c:if test="${fn:indexOf(mapc.type,'17')>=0}"> class="btn_href"</c:if> onclick="setTypeVal(this,'17')"/>
								<input name='type' type="button" value="木器雕品"<c:if test="${fn:indexOf(mapc.type,'18')>=0}"> class="btn_href"</c:if> onclick="setTypeVal(this,'18')"/>
								<input name='type'  type="button" value="古币钱币"<c:if test="${fn:indexOf(mapc.type,'19')>=0}"> class="btn_href"</c:if> onclick="setTypeVal(this,'19')" "/>
								<input name='type' type="button" value="珠宝首饰"<c:if test="${fn:indexOf(mapc.type,'20')>=0}"> class="btn_href"</c:if>onclick="setTypeVal(this,'20')" />
							</p>
							<p class="pd1">
								<input name='type' type="button" value="油画雕塑"<c:if test="${fn:indexOf(mapc.type,'21')>=0}"> class="btn_href"</c:if>onclick="setTypeVal(this,'21')" style="margin-left:68px;"/>
								<input name='type' type="button" value="邮票邮品"<c:if test="${fn:indexOf(mapc.type,'22')>=0}"> class="btn_href"</c:if>onclick="setTypeVal(this,'22')"/>
								<input name='type' type="button" value="其他藏品"<c:if test="${fn:indexOf(mapc.type,'23')>=0}"> class="btn_href"</c:if> onclick="setTypeVal(this,'23')"/>
								<span class="gray_clor">(可多选)</span>
							</p>
						</li>
						<li class="ch_li">
							<p>
								<span class="gray_clor">藏品价格：</span>
								<input name='price' type="button"  value="全部" <c:if test="${mapc.startprice==''||mapc.startprice ==null}"> class="btn_href"</c:if> onclick="setPriceVal(this,'','')"/>
								<input name='price' type="button" value="1999元及以下"<c:if test="${mapc.startprice=='0'}"> class="btn_href"</c:if> onclick="setPriceVal(this,0,1999)"/>
								<input name='price' type="button" value="2000元--9999元" <c:if test="${mapc.startprice=='2000'}"> class="btn_href"</c:if>onclick="setPriceVal(this,2000,9999)"/>
								<input name='price' type="button" value="10000元--99999元"<c:if test="${mapc.startprice=='10000'}"> class="btn_href"</c:if> onclick="setPriceVal(this,10000,99999)"/>	
								<input name='price' type="button" value="10万元--100万元"<c:if test="${mapc.startprice=='100000'}"> class="btn_href"</c:if> onclick="setPriceVal(this,100000,1000000)"/>
								<input name='price' type="button" value="100万元以上"<c:if test="${mapc.startprice=='1000000'}"> class="btn_href"</c:if> onclick="setPriceVal(this,1000000,1000000000000)" />
							</p>
						</li>
						<!-- <li class="ch_li">
							<p>
								<span class="gray_clor">交易中转：</span>
								<input name='isagree' type="button" value="全部" <c:if test="${mapc.isagree==''||mapc.isagree ==null}"> class="btn_href"</c:if>  onclick="setIsagreeVal(this,'')"/>
								<input name='isagree' type="button" value="同意"<c:if test="${mapc.isagree=='1'}"> class="btn_href"</c:if> onclick="setIsagreeVal(this,'1')"/>
								<input name='isagree' type="button" value="不同意"<c:if test="${mapc.isagree=='2'}"> class="btn_href"</c:if> onclick="setIsagreeVal(this,'2')"/>
							</p>
						</li> -->
						<!-- <li class="ch_li">
							<p>
								<span class="gray_clor">交易状态：</span>
								<input  name='state' type="button" value="全部" <c:if test="${mapc.state==''||mapc.state ==null}"> class="btn_href"</c:if> onclick="setStateVal(this,'')"/>
								<input  name='state' type="button" value="待售中"<c:if test="${mapc.state=='2'}"> class="btn_href"</c:if> onclick="setStateVal(this,'2')"/>
								<input  name='state' type="button" value="已售罄"<c:if test="${mapc.state=='4'}"> class="btn_href"</c:if> onclick="setStateVal(this,'4')"/>
							</p>
						</li> -->
						<li class="ch_li">
							<p>
								<span class="gray_clor">专家推荐：</span>
								<input name='iszj' type="button" value="全部" <c:if test="${mapc.iszj==''||mapc.iszj ==null}"> class="btn_href"</c:if> onclick="setIszjVal(this,'')"/>
								<input name='iszj' type="button" value="有推荐" <c:if test="${mapc.iszj=='yes'}"> class="btn_href"</c:if> onclick="setIszjVal(this,'yes')"/>
								<input name='iszj' type="button" value="无推荐" <c:if test="${mapc.iszj=='no'}"> class="btn_href"</c:if> onclick="setIszjVal(this,'no')"/>
							</p>
						</li>
						<!-- <li class="ch_li">
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
								<%--<select name="addresscode" id="addresscode" class="shop_place">
									<option value="">全部地区</option>
									<option value="">华东--江苏省、浙江省、安徽省、福建省、江西省、山东省和上海市、台湾地区。</option>
									<option value="">华南--广东省、广西省、海南省、香港和澳门。</option>
									<option value="">华北--河北省、山西省、北京市、天津市和内蒙古。</option>
									<option value="">华中--湖北省、湖南省、河南省。</option>
									<option value="">东北--辽宁省、吉林省、黑龙江省。</option>
									<option value="">西南--四川省、云南省、贵州省、重庆市、西藏。</option>
									<option value="">西北--宁夏、新疆、青海、陕西、甘肃省。</option>
									<option value="">国外地区</option>
								</select>
							--%></p>
						</li> -->
					</ul>
				</div>
				<div class="choice_mennu">
					<ul>
						<li  class="ch_li" onclick="setOrdercolumn(this,'clicknum','desc')" <c:if test="${mapc.ordercolumn=='clicknum'}"> style="background-color: #A40809;color:#fff;"</c:if> style="margin-right:30px;">最热门</li>
						<li onclick="setOrdercolumn(this,'price','desc')" <c:if test="${mapc.ordercolumn=='price'&&mapc.orderdesc=='desc'}">style="background-color: #A40809;color:#fff;"</c:if>>价格↑</li>
						<li onclick="setOrdercolumn(this,'price','')" <c:if test="${mapc.ordercolumn=='price'&&mapc.orderdesc==''}"> style="background-color: #A40809;color:#fff;"</c:if> style="margin-right:30px;">价格↓</li>
						<li onclick="setOrdercolumn(this,'zjgrades','desc')" <c:if test="${mapc.ordercolumn=='zjgrades'&&mapc.orderdesc=='desc'}"> style="background-color: #A40809;color:#fff;"</c:if>>评分↑</li>
						<li onclick="setOrdercolumn(this,'zjgrades','')" <c:if test="${mapc.ordercolumn=='zjgrades'&&mapc.orderdesc==''}"> style="background-color: #A40809;color:#fff;"</c:if> style="margin-right:30px;">评分↓</li>
						<li onclick="setOrdercolumn(this,'tsforums','desc')" <c:if test="${mapc.ordercolumn=='tsforums'&&mapc.orderdesc=='desc'}"> style="background-color: #A40809;color:#fff;"</c:if>>评论↑</li>
						<li onclick="setOrdercolumn(this,'tsforums','')" <c:if test="${mapc.ordercolumn=='tsforums'&&mapc.orderdesc==''}"> style="background-color: #A40809;color:#fff;"</c:if>>评论↓</li>
					</ul>
				</div>
				<c:if test="${mapc.keyword!=null&&mapc.keyword!=''}">
				<div class="search_over">
					当前符合关键字 “${mapc.keyword}” 的藏品如下：
				</div>
				</c:if>
				<div class="collection_list">
				 <c:forEach items="${list}" var="coll" varStatus="cdn">
					<ul>
						<li>
							<div class="clect_list_left">
								<a href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${coll.id}" target="_blank">
									<img src="http://116.255.149.172:7080/wswhly/Baibaourl//${fn:split(coll.imgurl,',')[0]}" alt="" />
								</a>
								<p>
									编号
									<span>${coll.baibaonum}</span>
								</p>
								<button class="guanzhu_btn" onclick="AddAttention(${coll.id})"></button>
							</div>
							<div class="clect_list_right">
								<div class="clect_list_rt_name">
									<p style="width:336px;" class="fl"><a href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${coll.id}" target="_blank"><b class="red_clor">${coll.name}</b></a></p>
									<p style="width:139px;" class="red_clor fr"><b>${coll.price}元</b></p>
									<p>${coll.typename}</p>
								</div>
								<div class="clect_dt">
									<p class="dq1">
										<span class="gray_clor">交易中转：</span>
										<c:if test="${coll.isagree ==1}"><span>同意</span></c:if>
										<c:if test="${coll.isagree ==2}"><span>不同意</span></c:if>
										
									</p>
									<p>
										<span class="gray_clor">状态:</span>
										<c:if test="${coll.state ==1}"><span>审核中</span></c:if>
										<c:if test="${coll.state ==2}"><span>待售</span></c:if>
										<c:if test="${coll.state ==3}"><span>正在交易中转</span></c:if>
										<c:if test="${coll.state ==4}"><span>已售罄</span></c:if>
									</p>
								</div>
								<div class="clect_dt">
									<p class="dq1">
										<span class="gray_clor">专家推荐：</span>
										<span>${coll.zjname}</span>
									</p>
									<p>
										<span class="gray_clor">地址：</span>
										<span>${coll.fullname}</span>
									</p>
								</div>
								<div class="clect_dt">
									<p class="dq1">
										<span class="gray_clor">店铺名称：</span>
										<span>${coll.shopname}</span>
									</p>
									<p style="width:206px;">
										<span class="gray_clor">店主：</span>
										<span>${coll.dzusernaem}</span>

									</p>
<%--									<p>--%>
<%--										<a href="#">联系方式</a>--%>
<%--									</p>--%>
								</div>
								<div>
									<span class="gray_clor">一句话广告：</span>
									<span>${coll.advertisement}</span>
								</div>
								<div class="clect_dt">
									<p class="dq1">
										<span class="gray_clor">评分：</span>
										<span>${coll.zjgrades}分</span>
										<span>（${coll.cyrsgrades}人参与）</span>
									</p>
									<p>
										<span class="gray_clor">评论：</span>
										<span>${coll.tsforums}条</span>
										<span>（${coll.cyrsforums}人参与）</span>
									</p>
								</div>
<%--								<div class="clect_py">--%>
<%--									<p>--%>
<%--										11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111--%>
<%--										<span><a href="#">更多》</a></span>--%>
<%--									</p>--%>
<%--								</div>--%>
							</div>
						</li>
					</ul>
					</c:forEach>
					 <c:if test="${count / pageSize > 1}">
				     <div class="fanye_clect">
				        <pg:pager url="BaiBao_getCollectionForList" items="${count}" maxPageItems="10" maxIndexPages="5">
				        <pg:param name="redirect" value="baibaojie/collection" /> 
				        <pg:param name="pageSize" value="${pageSize}" /> 
				        <pg:param name="type" value="${mapc.type}" /> 
				        <pg:param name="startprice" value="${mapc.startprice}" /> 
				        <pg:param name="endprice" value="${mapc.endprice}" /> 
				        <pg:param name="isagree" value="${mapc.isagree}" /> 
				        <pg:param name="state" value="${mapc.state}" /> 
				        <pg:param name="iszj" value="${mapc.iszj}" /> 
				        <pg:param name="keyword" value="${mapc.keyword}" /> 
				        <pg:param name="addresscode" value="${mapc.addresscode}" /> 
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
			</div>
		</div>
	</div>
	<div style="clear:both;"></div>
	 <script type="text/javascript">
	
	$(document).ready(function() {
           var urlsval = url_request("pager.offset");   // 获取 offset参数

           var urlsval2 = parseInt(urlsval/10)+1;
            $(".fanye_clect>a").each(function(){
                if ($(this).text()==urlsval2) {
                    $(this).css("background-color","#c91818");
                    $(this).css("color","#fff");
                }
            });
});

 </script>

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
