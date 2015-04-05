<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
  <head>
    <title>华豫之门官方网站-在线鉴定</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/css/onlinepic/onlinepicmain.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
	<style>
	/*  弹出层 */
.fppic_box{
	display: none;
	position: fixed;
	top:20%;
	left: 0;
	background: white;
	width: 95%;
	padding: 1em;
}
	</style>
	<script type="text/javascript">
setInterval("getC()",60000);  //1分钟刷新一次
function getC(){
		getCount(6);
		getCount(9);
		getCount(8);
		getCount(1);
}
	function getCount(state){
		$.ajax({type: "POST",
			dataType: "text",
			data:'state='+state,
			url: "<c:url value='/onlinepic/getPicCollCount'/>",
			success:function(data){
				$("#pstate"+state).html(data+"(件)");
			}
		});
	}
	$(function(){
	getZJ();
		getC();
	});


var currentpage = 1,
pagesize = 6,
count = -1;
state =6;
$(document).ready(function(){
	loaddata(1);
});

var geturl="<c:url value='/onlinepic/getPicCollForList'/>";
function loaddata(page){
	geturl="<c:url value='/onlinepic/getPicCollForList'/>";
	if(state==-1){
		geturl="<c:url value='/onlinepic/getMyPicCollForList'/>?zjuserid=-1";
		$('#titleid').html("<font color='red' size='3' >我要鉴定</font><p onclick='logout()';>&nbsp;&nbsp;(注&nbsp;&nbsp;销)</p>");
	}else if(state==6){
		$('#titleid').html("<font color='red' size='3' ><B>待复审</B></font><p onclick='logout()';>&nbsp;&nbsp;(注&nbsp;&nbsp;销)</p>");
	}else if(state==9){
		$('#titleid').html("<font color='red' size='3'><B>复审未通过</B></font><p onclick='logout()';>&nbsp;&nbsp;(注&nbsp;&nbsp;销)</p>");
	}else if(state==8){
		$('#titleid').html("<font color='red' size='3'><B>复审通过</B></font><p onclick='logout()';>&nbsp;&nbsp;(注&nbsp;&nbsp;销)</p>");
	}else if(state==1){
		$('#titleid').html("<font color='red' size='3'><B>待专家鉴定</B></font><p onclick='logout()';>&nbsp;&nbsp;(注&nbsp;&nbsp;销)</p>");
	}
	if(count != -1 && ((currentpage-1) * pagesize) >= count){
		$('#more').attr('disabled',"true");
		$('#more').html("无更多数据");
	}else{
	var state_v;
	if(state==-1){
		state_v=1;
	}else{
		state_v=state;
	}
		$.ajax({
	       type: "post",
	       dataType: "json",
	       url:geturl,
	       data: {page:page,rows:pagesize,state:state_v,ordercolumn:'yjresultsdate'},
	       beforeSend: function() {
	    	   $('#more').html("正在加载...");
	           $('#more').show();
		   },
	       success: function(data) {
	          count = data.total;
	          if(state==-1){
	          wyjdnum=count;
	          }
	           $("#pstate-1").html(wyjdnum+"(件)");
	          if(count<pagesize*page){
	           $('#more').attr('disabled',true);
	          }
	          if (count == 0) {
	        	  $('#thelist').append("<li>暂无数据</li>");
				  $('#more').hide();
				  count = -1;
	          } else {
		          $('#more').html("更多");
		          var cons="";
		          $.each(data.rows,function(index,collection){
		          		  var imgsr="";
		            	  var imgurlarray = collection.pic.split(',');
		            	  var imgsfd="";
		            	  var imgcount=0;
		            	  for(var i=0;i<imgurlarray.length;i++){
		            	   if(imgurlarray[i]!=''){
		            	      imgsfd+="http://admin.wswhly.com/zengjipaipin/"+imgurlarray[i]+",";
		            	      imgcount++;
		            	  	}
		            	  }
		            	  var findidurl="<c:url value='/onlinepic/getOnlinePicColl'/>?id="+collection.id;
		            	  cons+=" <dl class='rs-item pg1' data-mid='"+collection.id+"'>";
					      cons+="<a href=\"javascript:window.location.href='"+findidurl+"'\" class='clearfix ablock'>";
					       cons+=" <dt class='pic'>";

					       var filestart=imgurlarray[0].substring(0,imgurlarray[0].lastIndexOf('/'));
					       var fileend=imgurlarray[0].substring(imgurlarray[0].lastIndexOf('/'));
					       var img0=filestart+"/small/"+fileend;
					       var imgheight=($(window).height()-30)/2;
					       cons+="<img  height='"+imgheight+"px' src='http://admin.wswhly.com/zengjipaipin/"+img0+"' class='j_item_image pg1' onerror='javascript:this.src=\"http://admin.wswhly.com/zengjipaipin/"+imgurlarray[0]+"\"' data-brandid='408406' data-productid='53604267'  data-brandlazy='false'></dt>";
					       var shts="";
					       var statets="";
					       if(collection.state==6){
					       	statets+="待复审";
					       	shts+="  <span class='grallyprice'>请"+collection.yjresultsdate.substring(5,16)+"前复审</span>";
					       }else if(collection.state==9){
					       	statets+="复审未通过";
					       	shts+="  <span class='grallyprice'>鉴定时间"+collection.yjresultsdate.substring(5,16)+"</span>";
					       }else if(collection.state==8){
					       	statets+="复审通过";
					       	shts+="  <span class='grallyprice '>鉴定时间"+collection.resultsdate.substring(5,16)+"</span>";
					       }else if(collection.state==1){
					       	statets+="待专家鉴定";
					       	shts+="  <span class='grallyprice'>要求回复时间"+collection.yjresultsdate.substring(5,16)+"</span>";
					       }
					         cons+="<dd class='b_goods_name'>"+collection.name+"("+statets+")</dd>";
					        cons+=" </a>";

					       cons+=" <dd class='pricebox clearfix f-left'>"+shts+"</dd>";
					       cons+="<dd class='pricebox clearfix  f-left'><span class='f-left discount'>";
					       // cons+="<a  href=\"javascript:window.location.href='http://admin.wswhly.com//jqzoom/index.jsp?imgs="+imgsfd+"'\">图集("+imgcount+")</a>&nbsp;&nbsp;";
					        if(state==-1){
					        cons+="<a id='wyjd"+collection.id+"'  href=\"javascript:showfp("+collection.id+")\">分配专家</a>&nbsp;&nbsp;";
					        }
					       cons+="<a  href=\"javascript:window.location.href='<c:url value='/onlinepic/getOnlinePicColl'/>?id="+collection.id+"'\">详情</a>&nbsp;&nbsp;";
					      cons+="</span></dd>";

					  cons+="  </dl>";
		          });
		          $('#thelist').append(cons)
	          }
			  $(".zhedie").collapsible();
	          $('#thelist').listview('refresh');
			  $(".myuploadclass").controlgroup();
	       }
		});
	}
}

function loadmore(){
    currentpage = currentpage + 1;
	loaddata(currentpage);
}
function todetail(id){
	location.href = "<c:url value='/onlinepic/olinePicByid?id='/>"+id;
}

function toupdate(id){
	location.href = "<c:url value='/onlinepic/gotoolinePicupdate?id='/>"+id;
}
function reload(s){
currentpage = 1;
pagesize = 6;
count = -1;
state=s;
 $('#thelist').html("");
  loaddata(1);
  $('#more').attr('disabled',false);
}
var fpid;
function showfp(id){
	fpid=id;
	if($("#wyjd"+fpid).text()=='分配专家'){
		$('.fppic_box').show();
	}else{
		alert("已分配专家！");
	}
}

//分配专家
var wyjdnum=0;
function upda(){
var zjuserid=$("#zjuserid").val();
if($("#zjuserid").val()!=''){
		$.ajax({
        type:'get',
        url:"<c:url value='/onlinepic/FpOnlinePicColl?id='/>"+fpid+"&zjuserid="+zjuserid,
        success:function(data){
          if(data==1){
           $('.fppic_box').hide();
           if(zjuserid!=-1){
            $("#wyjd"+fpid).text("已分配专家！");
            $("#pstate-1").html(wyjdnum-1+"(件)");
            wyjdnum=wyjdnum-1;
            }
          }else if(data==0){
            alert('失败！');
          }
          getC();
        }
	    });
}else{
	alert("请选择专家！");
}
}
//得到所有专家
function getZJ(){
	$.ajax({
        type:'get',
        url:"<c:url value='/onlinepic/getOnlinePicProf'/>",
	        success:function(data){
	        var jsonData = eval(data);
	      	 var cons="<select id='zjuserid' name='zjuserid' > <option value=''>--请选择专家--</option>";
	          $.each(jsonData, function(i, field){
	            cons+="<option value='"+field.userid+"'>"+field.name+"</option>";
	          });
	          cons+="</select>";
	          $("#zjdiv").html(cons);
	        }
	    });
}
function logout(){
	if(confirm('您确定要注销(用户名：${CurrentSession.userinfo.username})吗？')){
		window.location.href='<c:url value='/sys/logout'/>';
	}
}
</script>
</script>

  </head>

  <body>
  <div data-role="page">
 <div data-role="header" data-position="fixed" class="ui-header ui-bar-inherit ui-header-fixed slidedown">
	<h1><a id="titleid"></a></h1>
  </div>

 <div id="thelist" class="u-pro-list J_pro_list clearfix " data-offset="20" data-limit="20" data-img-class="j_item_image">
    <!--循环dl  藏品列表-->
    <!-- 分享 -->

  </div>
  <button id="more" class="ui-shadow ui-btn ui-corner-all" onclick="loadmore()">更多</button>

  <div data-role="footer" data-position="fixed">
	<div data-role="navbar">
		<ul>
<%--			<li><a href="javascript:reload(-1)" data-iconpos="top" data-icon="star" data-ajax="false">未分配专家<p id="pstate-1"></p></a></li>--%>
			<li><a href="javascript:reload(6)" data-iconpos="top" data-icon="star" data-ajax="false">待复审<p id="pstate6"></p></a></li>
			<li><a href="javascript:reload(9)" data-iconpos="gear" data-icon="star" data-ajax="false">复审未通过<p id="pstate9"></p></a></li>
			<li><a href="javascript:reload(8)" data-iconpos="gear" data-icon="star" data-ajax="false">复审通过 <p id="pstate8"></p></a></li>
			<li><a href="javascript:reload(1)" data-iconpos="gear" data-icon="star" data-ajax="false">待专家鉴定<p id="pstate1"></p></a></li>
		</ul>
	</div><!-- /navbar -->
  </div><!-- /footer -->
  </div>


 <!-- 分配专家 -->
		<div class="fppic_box" style="display: none;">
			<fieldset data-role="controlgroup">
				  <legend style="color:fff;">专家: <span id="zjdiv"></span></legend>
				
				</fieldset>
			<a href="" data-role="button" data-theme="b" onclick="upda()">确定</a>
			<a onclick="$('.fppic_box').hide();" data-role="button"  data-theme="c">取消</a>
		</div>
  </body>
</html>
