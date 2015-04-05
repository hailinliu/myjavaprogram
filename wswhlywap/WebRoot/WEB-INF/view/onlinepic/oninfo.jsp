<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
  <head>
    <title>华豫之门官方网站-详情</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link href="<c:url value='/lunbo/lookpic/photoswipe.css'/>" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="/lunbo/lookpic/lib/klass.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/lunbo/wapapplunbo/css/swipe.css'/>">
    <link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/css/onlinepic/onlinepicmain.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/lunbo/lookpic/code-photoswipe-jQuery-1.0.11.min.js'/>"></script>
<script type="text/javascript">

		/*
		 * IMPORTANT!!!
		 * REMEMBER TO ADD  rel="external"  to your anchor tags.
		 * If you don't this will mess with how jQuery Mobile works
		 */

		(function(window, $, PhotoSwipe){

			$(document).ready(function(){

				$('div.gallery-page')
					.live('pageshow', function(e){

						var
							currentPage = $(e.target),
							options = {},
							photoSwipeInstance = $("a", e.target).photoSwipe(options,  currentPage.attr('id'));

						return true;

					})

					.live('pagehide', function(e){

						var
							currentPage = $(e.target),
							photoSwipeInstance = PhotoSwipe.getInstance(currentPage.attr('id'));

						if (typeof photoSwipeInstance != "undefined" && photoSwipeInstance != null) {
							PhotoSwipe.detatch(photoSwipeInstance);
						}

						return true;

					});

			});

		}(window, window.jQuery, window.Code.PhotoSwipe));

	</script>

<style type="text/css">

.btn-purple {
  color: #fff;
  text-shadow: none;
  background-color: #f02387;
}
p{line-height: 30px; }

.goods_info h1 {
  padding: .3rem .2rem;
  font-size: .3rem;
  font-weight: 400;
  line-height: .4rem;
  color: #000;
  overflow: hidden;
  white-space: nowrap;
  word-break: break-all;
  text-overflow: ellipsis;
}
.u-detail-pricebox {
  margin-bottom: .2rem;
  line-height: .4rem;
}
.u-detail-price {
  float: left;
  margin-left: .2rem;
  font-size: .36rem;
  font-weight: 700;
  line-height: .5rem;
  color: #e4007f;
}

/*  弹出层 */
.backpic_box{
	display: none;
	position: fixed;
	top:20%;
	left: 0;
	background: #000;
	width: 95%;
	padding: 1em;
}
/*  弹出层 */
.fspic_box{
	display: none;
	position: fixed;
	top:20%;
	left: 0;
	background: #000;
	width: 95%;
	padding: 1em;
}
/*  弹出层 */
.sppic_box{
	display: none;
	position: fixed;
	top:20%;
	left: 0;
	background: #000;
	width: 95%;
	padding: 1em;
}


</style>
	<script type="text/javascript">

		function picback () {
			$('.backpic_box').show();
		}
		function closehis1 () {
			$('.backpic_box').hide();
		}
$(function(){
  	fisimgpic();
});
function fisimgpic(){
var pics='${item.pic}';
	var picsa= new Array();
	picsa=pics.split(",");
	 //var filestart=picsa[0].substring(0,picsa[0].lastIndexOf('/'));
	//var fileend=picsa[0].substring(picsa[0].lastIndexOf('/'));
	//var img0=filestart+"/small/"+fileend;
	$("#imgs1").html("<a onclick='location.href=\"http://admin.wswhly.com/zengjipaipin/"+picsa[0]+"\"' class='zoom'><img src='http://admin.wswhly.com/zengjipaipin/"+picsa[0]+"' width='320'></a>");
}
function setimgpic(){
if($('#loadimg').val()==0){
$('#loadimg').val('1');
$('#loadimg').text('隐藏图片');
 $('#picdiv').show();
	var pics='${item.pic}';
	var picsa= new Array();
	picsa=pics.split(",");
	var imgsfd="";
	for(var i=0;i<picsa.length;i++){
		if(picsa[i]!=null&&picsa[i]!=''&&picsa[i]!=' '){
		 $('#picdiv').append("<a onclick='location.href=\"http://admin.wswhly.com/zengjipaipin/"+picsa[i]+"\"' class='zoom'> <img src='http://admin.wswhly.com/zengjipaipin/"+picsa[i]+"' width='100%'/></a>");
		 imgsfd+="http://admin.wswhly.com/zengjipaipin/"+picsa[i]+",";
		}
	}
	 // $('#picdiv').append("<a href='http://admin.wswhly.com/jqzoom/index.jsp?imgs="+imgsfd+"'> 点击查看图集</a>");
}else{
$('#loadimg').val('0');
$('#loadimg').text('显示高清原图');
 $('#picdiv').hide();
}
}
<c:if test="${usertype==1}">
function thPic(){
var thstate = $("input[name='thstate'][type='radio']:checked").val();
	if(thstate==undefined||thstate==''||thstate=='undefined'){
		alert('请您选择退回原因！');
		return ;
	}else{
		if(!confirm('您确定退回吗？提交之后不能修改！')){
		return;
		}
			$.ajax({
		        type:'post',
		        url:"<c:url value='/onlinepic/thOnlinePicColl'/>",
		        data:{
		             state:thstate,
		             id:${item.id}
		    	},
		        success:function(data){
		          if(data==0){
		          	alert('失败请重试!');
		          }else{
		         	 alert('退回成功!');
		         	 window.location.href="<c:url value='/redirect?p=/admin/zjmain'/>";
		          	$('#messagetable').datagrid('reload')
		          	$('#scanmessageth').window('close');
		          }
		        }
			    });
		}
}
</c:if>

<c:if test="${usertype==2}">
function fsPic(){
var fsstate = $("input[name='fsstate'][type='radio']:checked").val();
if(fsstate==undefined||fsstate==''||fsstate=='undefined'){alert('请选择复审结果！');return;}
if(!confirm('您确定复审吗？提交之后不能修改！')){
return;
}
	$.ajax({
        type:'post',
        url:"<c:url value='/onlinepic/MyOnlinePicCollFs'/>",
        data:{
             state:fsstate,
             id:${item.id}
    	},
        success:function(data){
          if(data==0){
          	alert('失败请重试!');
          }else{
         	 alert('成功!');
          	  window.location.href="<c:url value='/redirect?p=/admin/adminmain'/>";
          }
        }
	    });
}
function spPic(){
var spisshangpai = $("input[name='spisshangpai'][type='radio']:checked").val();
if(spisshangpai==undefined||spisshangpai==''||spisshangpai=='undefined'){alert('请选择上拍信息！');return;}
if(${item.state}==6){
	if(!confirm('您确定上拍吗？同意上拍即表示复审通过！！！！！！')){
	return;
	}
}
	$.ajax({
        type:'post',
        url:"<c:url value='/onlinepic/OnlinePicCollSp'/>",
        data:{
             state:8,
             isshangpai:spisshangpai,
             id:${item.id}
    	},
        success:function(data){
          if(data==0){
          	alert('失败请重试!');
          }else{
         	 alert('成功!');
          	 window.location.href="<c:url value='/redirect?p=/admin/adminmain'/>";
          }
        }
	    });
}
</c:if>
	</script>




  </head>

  <body>

  <div data-role="page">
<div data-role="header" data-position="fixed" class="ui-header ui-bar-inherit ui-header-fixed slidedown">
	<h1 class="ui-title" role="heading" aria-level="1">${item.name}详情</h1>
  </div>

  	  <div data-role="content">


  	  <div class="product_detail">
  	  	<!-- data-GetDetail="more"-->
  	  	<div class="tab_content pro_detail_info">
  	  		<div class="M_detail">
  	  			<div class="M_detailCon goods_info">

  	  				<div style="text-align:center;background:#f3f3f3;" id="imgs1" class="gallery-page">


  	  				</div>

  	  				<ul class="u-detail-introduce clearfix" style="display:block;">
  	  					<li>
  	  						<span class="u-indtit">藏品名称:</span>
  	  						${item.name}
  	  					</li>
  	  					<li>
  	  						<span class="u-indtit">类型:</span>
  	  						${item.typename}
  	  					</li>
  	  					<li>
  	  						<span class="u-indtit">尺寸/重量:</span>
  	  						${item.size}
  	  					</li>
  	  					<li>
  	  						<span class="u-indtit">上传时间:</span>
  	  						${item.uploaddate}
  	  					</li>

  	  					<li>
  	  						<span class="u-indtit">备注描述:</span>
  	  						${item.note}
  	  					</li>
  	  					<li>
  	  						<span class="u-indtit">状态:</span>
  	  						<c:if test="${item.state==1}">等待鉴定</c:if>
							<c:if test="${item.state==2}">等待鉴定</c:if>
							<c:if test="${item.state==3}">审核未通过，图片清晰度不够</c:if>
							<c:if test="${item.state==4}">审核未通过，该藏品所选门类与实际不符</c:if>
							<c:if test="${item.state==5}">审核未通过，请您核对藏品数量</c:if>
							<c:if test="${item.state==6}">专家已审核</c:if>
							<c:if test="${item.state==7}">过期未得到专家审核</c:if>
							<c:if test="${item.state==8}">后台复审通过</c:if>
							<c:if test="${item.state==9}">后台复审未通过</c:if>
  	  					</li>

  	  				</ul>
  	  				<hr>
				<c:if test="${item.state>=6}">
  	  				<ul class="u-detail-introduce u-detail-introduce2 clearfix" style="display:block;">
  	  						<li>
  	  						<span class="u-indtit">鉴定时间:</span>
  	  						${item.resultsdate}
  	  					</li>
  	  					<li>
  	  						<span class="u-indtit">鉴定专家:</span>
  	  						${item.zjname}
  	  					</li>
  	  					<li>
  	  						<span class="u-indtit">综合评价:</span>
  	  						<c:if test="${item.zhpg==1}">新</c:if><c:if test="${item.zhpg==2}">老</c:if><c:if test="${item.zhpg==3}">老仿</c:if>
  	  					</li>
  	  					<li>
  	  						<span class="u-indtit">年代:</span>
  	  						${item.niandai}
  	  					</li>
  	  					<li>
  	  						<span class="u-indtit">估值（万）:</span>
  	  						${item.guzhi}
  	  					</li>
  	  					<li>
  	  						<span class="u-indtit">行情走势:</span>
  	  						${item.hangqing}
  	  					</li>
  	  					<li>
  	  						<span class="u-indtit">是否推荐复审:</span>
  	  						<c:if test="${item.isshangpai==1}">不推荐复审</c:if><c:if test="${item.isshangpai==2}">推荐复审</c:if>
				<c:if test="${item.isshangpai==3}">送拍到国外大拍行送拍藏品展示</c:if><c:if test="${item.isshangpai==4}">送拍到国内大拍行送拍藏品展示</c:if><c:if test="${item.isshangpai==5}">送拍到淘宝平台网拍藏品展示</c:if>
				<c:if test="${item.isshangpai==6}">送拍到华豫官网微拍藏品展示</c:if>
  	  					</li>
  	  					<li>
  	  						<span class="u-indtit">详细说明:</span>
  	  						${item.detailnote}
  	  					</li>

  	  				</ul>
				</c:if>
						<!-- tup  -->

  	  				<div class="dc_img">
  	  				<button  id="loadimg" name="loadimg" value="0" onclick="setimgpic()">显示高清原图</button>
  	  					<div class="dc_img_con gallery-page" id="picdiv">
  	  						</div>

  	  				</div>
  	  			</div>
  	  		</div>
  	  	</div>

  	  </div>

  </div>
<c:if test="${usertype==1}">
  <!-- 退回原因选择 -->

		<div class="backpic_box" style="display: none;">
			<fieldset data-role="controlgroup">
				  <legend style="color:fff;">请选择退回原因:</legend>
				  <input type="radio" name="thstate" id="radio-choice-1" value="3"  />
				  <label for="radio-choice-1">图片清晰度不够</label>
				  <input type="radio" name="thstate" id="radio-choice-2" value="4" />
				  <label for="radio-choice-2">该藏品所选门类与实际不符</label>
				  <input type="radio" name="thstate" id="radio-choice-3" value="5" />
				  <label for="radio-choice-3">请核对藏品数量再次上传</label>
				</fieldset>
			<a href="" data-role="button" data-theme="b" onclick="thPic()">确定</a>
			<a onclick="closehis1()" data-role="button"  data-theme="c">取消</a>
		</div>
</c:if>

<c:if test="${usertype==2}">
  <!-- 复审 -->
		<div class="fspic_box" style="display: none;">
			<fieldset data-role="controlgroup">
				  <legend style="color:fff;">复审:</legend>
				  <input type="radio" name="fsstate" id="fsradio-choice-1" value="8"  />
				  <label for="fsradio-choice-1">复审通过</label>
				  <input type="radio" name="fsstate" id="fsradio-choice-2" value="9" />
				  <label for="fsradio-choice-2">复审未通过</label>
				</fieldset>
			<a href="" data-role="button" data-theme="b" onclick="fsPic()">确定</a>
			<a onclick="$('.fspic_box').hide();" data-role="button"  data-theme="c">取消</a>
		</div>

  <!-- 上拍-->

		<div class="sppic_box" style="display: none;">
			<fieldset data-role="controlgroup">
				  <legend style="color:fff;">上拍:</legend>
				  <input type="radio" name="spisshangpai" id="spradio-choice-1" value="3"  />
				  <label for="spradio-choice-1">送拍到国外大拍行送拍藏品展示</label>
				  <input type="radio" name="spisshangpai" id="spradio-choice-2" value="4" />
				  <label for="spradio-choice-2">送拍到国内大拍行送拍藏品展示</label>
				  <input type="radio" name="spisshangpai" id="spradio-choice-3" value="5" />
				  <label for="spradio-choice-3">送拍到淘宝平台网拍藏品展示</label>
				   <input type="radio" name="spisshangpai" id="spradio-choice-4" value="6" />
				  <label for="spradio-choice-4">送拍到华豫官网微拍藏品展示</label>
				</fieldset>
			<a href="" data-role="button" data-theme="b" onclick="spPic()">确定</a>
			<a onclick="$('.sppic_box').hide();" data-role="button"  data-theme="c">取消</a>
		</div>
</c:if>







  <div data-role="footer" data-position="fixed">
	<div data-role="navbar">
		<ul>
			<c:if test="${usertype==1}">
				<li>
				<a href="javascript:window.location.href='<c:url value='/redirect?p=/admin/zjmain'/>'" data-iconpos="top" data-icon="gear" data-ajax="false">首页</a>
				</li>
				<c:if test="${item.state==1||item.state==9}">
				<li>
				<a href="javascript:window.location.href='<c:url value='/onlinepic/gotoOnlineUpJg'/>?id=${item.id}'" data-iconpos="top" data-icon="gear" data-ajax="false">鉴定
				</a>
				</li>
				<li>
					<a class="picback" onclick="picback()" data-iconpos="gear" data-icon="star" data-ajax="false">退回
						</a>
				</li>
				</c:if>
			</c:if>
			<c:if test="${usertype==2}">
				<li>
				<a href="javascript:window.location.href='<c:url value='/redirect?p=/admin/adminmain'/>'" data-iconpos="top" data-icon="gear" data-ajax="false">首页</a>
				</li>
				<c:if test="${item.state==6}">
				<li>
				<a  onclick="$('.fspic_box').show();"  data-iconpos="top" data-icon="gear" data-ajax="false">复审</a>
				</li>
				</c:if>
				<c:if test="${item.state==6||item.state==8}">
				<li>
				<a  onclick="$('.sppic_box').show();" data-iconpos="top" data-icon="gear" data-ajax="false">上拍</a>
				</li>
				</c:if>
			</c:if>
		</ul>
	</div><!-- /navbar -->
  </div><!-- /footer -->
  </div>


	<!-- 退回原因选择 -->


  </body>
</html>
