<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>

		<title>首页</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css"
			href="<c:url value="/jquery/themes/default/easyui.css"/>">
		<link rel="stylesheet" type="text/css"
			href="<c:url value="/jquery/themes/icon.css"/>">
		<script type="text/javascript"
			src="<c:url value="/jquery/jquery-1.8.0.min.js"/>"></script>
		<script type="text/javascript"
			src="<c:url value="/jquery/jquery.easyui.min.js"/>"></script>
		<script type="text/javascript"
			src="<c:url value="/jquery/locale/easyui-lang-zh_CN.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/jquery/js/highcharts.js"/>" ></script>
	    <script type="text/javascript" src="<c:url value="/jquery/js/modules/exporting.js"/>" ></script>
	    <script type="text/javascript" src="<c:url value="/jquery/js/themes/grid.js"/>" ></script>
	    <script type="text/javascript" src="<c:url value="/jquery/jquery.timers.js"/>" ></script>
<style type="text/css">
body{
font-size:12px;
FONT: 9pt 微软雅黑;
background:url(<c:url value="/images/lightblue.jpg"/>);
}
</style>
<script type="text/javascript">
var colors = Highcharts.getOptions().colors;
var options = {
        chart: {
 	      renderTo: 'enrollinfoid',
           defaultSeriesType: 'column'
        },
        title: {
                 text: '报名统计',
                 x: -20
        },
        subtitle: {
                 text: '当前报名统计',
                 x: -20
        },
        xAxis: {
                categories: ['报名人数', '报名藏品数', '报名总金额']
        },
        yAxis: {
                title: {
                         text: '当前数量'
                }
       },
       plotOptions: {
           column: {
               cursor: 'pointer',
               shadow:true,
               dataLabels: {
                   enabled: true,
                   color: colors[0],
                   style: {
                       fontWeight: 'bold'
                   },
               formatter: function() {
               	   if(this.x == '报名人数'){
	               	  return this.y+'人';
                   }else if(this.x == '报名藏品数'){
	                  return this.y+'件';
               	   }else {
	               	  return this.y+'万元';
                   }
               }
              }
           }
       },
       tooltip: {
           formatter: function() {
               var point = this.point;
               if(this.x == '报名人数'){
                   s = this.x +':<b>'+ this.y +'人 </b><br/>';
               }else if(this.x == '报名藏品数'){
                   s = this.x +':<b>'+ this.y +'件 </b><br/>';
               }else{
                   s = this.x +':<b>'+ this.y +'万元 </b><br/>';
               }
               return s;
           }
       },
       series: [],
       exporting: {
           enabled: false
       }
}

$(function(){
	$.ajax({
         type:'post',
         url:"<c:url value='/index/showEnrollInfo'/>",
         success:function(data){
             var result = eval("("+data+")");
        	 $('#enrollid').empty().append(result.cycle);
        	 $('#enrollnameid').empty().append(result.enrollname);
        	 $('#enrollbegindateid').empty().append(result.begindate);
        	 $('#enrollenddateid').empty().append(result.enddate);
        	 $('#enrollvaliddateid').empty().append(result.validdate);
        	 $('#enrollcreatedateid').empty().append(result.createdate);
        	 $('#enrollnumid').empty().append(result.enrollnum);
        	 $('#enrollcollectionid').empty().append(result.collectionnum);
        	 if (result.collectionmoney >= 1) {
        	   $('#enrollmoneyid').empty().append('￥'+result.enrollmoney+'万');
             } else {
               $('#enrollmoneyid').empty().append('￥'+result.enrollmoney*10000);
             }
         }
	});

	$.ajax({
	       type:'post',
	       url:"<c:url value='/index/getEnrollInfo'/>",
	       success:function(data){
	          if(data == '暂无数据'){
	        	  options.series = [{
	                  name:'<font style="font-family:微软雅黑">暂无数据</font>',
	                  data:data,
	                  color:'white'
	             }];
	          }else{
	              data = eval("("+data+")");
	        	  options.series = [{
	                  name:'<font style="font-family:微软雅黑">报名信息</font>',
	                  data:data,
	                  color:'purple'
	             }];
	          }
	             new Highcharts.Chart(options);
	       }
	    });
	
	function test(){
		location.reload();
	}
	$('body').everyTime('3hs',test);

});
</script>
<style>
ul，li{ float:left; margin:0px; padding: 0px;}
.top{background:#313131; height:31px; font-size:14px; font-weight:bold; padding-left:28px; line-height:31px; color:#FFF;}
.nav{ height:100px; color:#FFF; padding:6px 60px;background:#2FADD5; font-size:12px;}
.nav_td{background:url('<c:url value="/images/bg.gif"/>') center repeat;}
.nav_td span{color:#FFFF00;}
.anav{background:url('<c:url value="/images/aniu.jpg"/>') no-repeat; width:74px; height:30px; text-align:center; line-height:30px; display:block; color:#2BA9D1; text-decoration:none;}
.mian{padding-top:15px; color:#959595; line-height:24px;}
.font_sise{font-size:14px; color:#000;}
.font_sise2{font-size:14px; color:#30B0D5;}
.font_sise3{color:#30B0D5;}
.font_sise4{color:#FF0000;}
.padding10{padding:10px 0;}
.bor{border:1px solid #ccc; padding-left:15px; height:27px; padding-top:3px;}
.padding35{ padding-left:5px;padding-right: 5px}
</style>

	</head>

	<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr class="nav">
		<td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="nav_td"
				height="100" style="color: white">
				<tr>
					<td align="center"><a href="#" class="anav">当前报名期数</a></td>
					<td align="center"><a href="#" class="anav">当前报名名称</a></td>
					<td align="center"><a href="#" class="anav">起始日期</a></td>
					<td align="center"><a href="#" class="anav">结束日期</a></td>
					<td align="center"><a href="#" class="anav">鉴定日期</a></td>
					<td align="center"><a href="#" class="anav">创建日期</a></td>
					<td align="center"><a href="#" class="anav">报名人数</a></td>
					<td align="center"><a href="#" class="anav">报名藏品数</a></td>
					<td align="center"><a href="#" class="anav">报名总金额</a></td>
				</tr>
				<tr>
					<td id="enrollid" align="center"></td>
					<td id="enrollnameid" align="center"></td>
					<td id="enrollbegindateid" align="center"></td>
					<td id="enrollenddateid" align="center"></td>
					<td id="enrollvaliddateid" align="center"></td>
					<td id="enrollcreatedateid" align="center"></td>
					<td id="enrollnumid" align="center"></td>
					<td id="enrollcollectionid" align="center"></td>
					<td id="enrollmoneyid" align="center"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
	    <td>
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	               <td class="padding35" style="padding-top: 15px;">
	                   <div id="enrollinfoid" style="min-width: 400px; height: 290px; margin: 0 auto">报名信息</div>
	               </td>
	          </tr>
	        </table>
	    </td>
	</tr>
</table>
	</body>
</html>
