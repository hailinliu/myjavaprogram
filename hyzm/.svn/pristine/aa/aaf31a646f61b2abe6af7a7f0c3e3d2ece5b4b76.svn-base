<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hyzm.util.PropertiesUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>网上报名_海选报名_卫视文化乐园-华豫之门官方网站</title>

  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/haixuanbaoming.css'/>"/>
  <script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/slideshow.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  <script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
  <meta name=keywords content="网上报名，海选报名">
  <meta name=description content="华豫之门网上报名">
  <style type="text/css">

    .botton_11{
      /*display: none;*/
    }
    .bsnone{
      display: none;
    }

  </style>
  </head>

<script type="text/javascript">
 $(function(){
 	//加载专家
 	$("#zjjs").html("正在加载，请稍候... ...");
	   var con="";
	   $.ajax({
	         type:'post',
	         url:'<c:url value='/proficient/getBqProficients'/>?s='+Math.random(),
	         success:function(data){
	         var jsonData = eval(data);
	         var ins=jsonData.length-1;
	         if(data!='9999'){
	          $.each(jsonData, function(index, objVal) {
	         	 if(index%5==0){
	          	  con+="<ul class='person_list'>";
	          	  }
	          		con+="<li>";
		             con+=" <div class='lou_zuo'>";
		              con+="  <img src='"+objVal.imgurl+"'  class='tu1' alt='"+objVal.name+"' />";
		              con+="  <p>";
		              con+="    <a href='http://www.wswhly.com/proficient/getProficient?id="+objVal.id+"' target='_blank'>"+objVal.name+"</a>";
		              con+="  </p>";
		              con+="  <p class='p2'>（"+objVal.speciality+"）</p>";
		              if(objVal.isbqhx=='1'||objVal.isbqhx==1){
		             	con+="   <p class='p2'>（"+objVal.hxqh+"海选专家）</p>";
		              con+="  <botton class='botton_11' onclick=\"login_on('<c:url value='/proficient/'/>"+objVal.id+".dhtml#pl0',0)\"  style=''>我要评论</botton>";
		              }
		             con+=" </div>";
		            con+="</li>";
		            if(index%5==4||index==ins){
			          con+="</ul>";
			        }
	          });
	             $("#zjjs").html(con);
	         }else{
	         	$("#zjjs").html("加载失败！");
	         }
	        }
	     });
 });
</script>

<body>
<jsp:include page="head/header.jsp"></jsp:include>

 <div class="bmlc" style="margin-top:20px;">
  <p class="bm_lc da_bt" style="color:#fff;margin-top:0;">《华豫之门》鉴宝海选活动--网上报名流程</p>
    <div class="lc_moc">
      <img src="<c:url value='/images/liuchengtu2.png'/>" width="1140" height="160" usemap="#Map" border="0" alt="鉴宝海选活动-网上报名流程"/>
        <map name="Map" id="Map">
          <area shape="rect" coords="119,104,233,136" href="javascript:void(0)" onclick="login_on('',0)" /> <!--注册/登陆-->
          <area shape="rect" coords="229,25,308,59" href="javascript:void(0)" onclick="login_on('<c:url value='/mine/gotoupload'/>',1)" /> <!--上传藏品-->
          <area shape="rect" coords="348,105,429,137" href="javascript:void(0)" onclick="login_on('<c:url value='/mine/gotoenroll'/>',1)" /><!--网上报名，确认藏品信息和费用-->
          <area shape="rect" coords="578,25,651,55" href="javascript:void(0)" onclick="login_on('<c:url value='/redirect?p=mine/recharge1'/>',1)" />   <!--充值-->
          <area shape="rect" coords="680,107,763,136" href="javascript:void(0)" onclick="login_on('<c:url value='/mine/gotoenroll'/>',1)" />    <!--网上报名，选择藏品，支付-->
        </map>
    </div>
    <p style="text-align:center;font-size:14px;color:#DD6F75;">温馨提示：网上报名可以提前安排鉴定时间，并不能在网上进行藏品鉴定。还需藏友带上您的藏品来到活动现场，由专家为您亲自鉴定。</p>
</div>
<div class="haixuan_ad" style="margin:20px auto;">
  <!--  <a href="/hyzm/mine/gotoenroll" target="_blank;">

  </a>-->
  <img src="<c:url value='images/liuchengtu.jpg'/>" alt="网络报名现场鉴定流程"/>
</div>

<div class="haixuan_content">
  <div class="da_bt"><a href="http://www.wswhly.com/proficient/getProficients" target="_blank">专家介绍</a></div>
  <div class="zjjs" name="zjjs" id="zjjs" style="height:auto;padding-bottom:15px;">
    </div>


                                         <!-- 线路指引-->
    <p class="xlzy">线路指引</p>
    <div class="road_sm">
      <ul class="road_ul">
          <li class="road_tit">北京西站</li>
            <li class="road_con">4站乘坐 地铁7号线(焦化厂方向), 在菜市口站下车<br />
50米站内换乘 地铁4号线大兴线(天宫院方向)在 黄村西大街站 下车(D口出)<br />
150米步行至 兴雅国际珠宝城。</li>
        </ul>
        <ul class="road_ul">
          <li class="road_tit">北京站</li>
            <li class="road_con">乘坐 地铁2号线(内环), 在 宣武门站 下车<br />
 乘坐 地铁4号线大兴线(天宫院方向), 在 黄村西大街站 下车(D口出)<br />
步行150米至 兴雅国际珠宝城
。</li>
        </ul>
        <ul>
          <li class="road_tit">北京首都国际机场</li>
            <li class="road_con">至首都机场(3号航站楼)站
乘坐 机场大巴四惠线, 在 青年路（大悦城）站 下车
步行260米至 青年路站
乘坐地铁6号线(海淀五路居方向), 在 呼家楼站 下车
乘坐 地铁10号线(内环), 在 角门西站 下车
乘坐 地铁4号线大兴线(天宫院方向), 在 黄村西大街站 下车(D口出)
步行150米至 兴雅国际珠宝城</li>
        </ul>
    </div>

<!--住宿指引-->
    <p class="xlzy">住宿指引</p>
        <div style="width:1140px;height:550px;border:#ccc solid 1px;font-size:12px" id="map"></div>

</div>


  <script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
      createMap();//创建地图
      setMapEvent();//设置地图事件
      addMapControl();//向地图添加控件
      addMapOverlay();//向地图添加覆盖物
    }
    function createMap(){
      map = new BMap.Map("map");
      map.centerAndZoom(new BMap.Point(116.3388,39.736918),17);
    }
    function setMapEvent(){
      map.enableScrollWheelZoom();
      map.enableKeyboard();
      map.enableDragging();
      map.enableDoubleClickZoom()
    }
    function addClickHandler(target,window){
      target.addEventListener("click",function(){
        target.openInfoWindow(window);
      });
    }
    function addMapOverlay(){
      var markers = [
        {content:"地址：   北京黄村镇兴华南路1号（人民医院西侧，地铁4号线黄村西大街站D出口南行20米)  电话：   (010)81289999",title:"枫丹之旅商务酒店",imageOffset: {width:0,height:3},position:{lat:39.736578,lng:116.338548}},
        {content:"地址：   黄村西大街62号（地铁/公交黄村西大街站下车红绿灯西100米路南即到）  电话：   (010)69228798",title:"国缘假日宾馆兴丰店",imageOffset: {width:0,height:3},position:{lat:39.73715,lng:116.335386}},
        {content:"地址：   大兴区黄村西大街46号（近地铁4号线黄村西大街站）  电话：   (010)69235293",title:"银奥宾馆",imageOffset: {width:0,height:3},position:{lat:39.73723,lng:116.336339}},
        {content:"地址：   大兴区黄村镇兴华大街三段25号（大兴区公安分局对面）  电话：   (010)69237878",title:"加码主题酒店",imageOffset: {width:0,height:3},position:{lat:39.738843,lng:116.338526}},
        {content:"地址：   北京市大兴区黄村西大街2号  电话：   (010)69243282",title:"环美宾馆",imageOffset: {width:0,height:3},position:{lat:39.737216,lng:116.345623}},
        {content:"地址：   大兴区黄村镇兴丰大街西侧星城商厦一层正门(黄村西大街与兴丰大街交叉口西南角)  电话：   (010)69263699",title:"如家快捷酒店",imageOffset: {width:0,height:3},position:{lat:39.736495,lng:116.345892}}
      ];
      for(var index = 0; index < markers.length; index++ ){
        var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
        var marker = new BMap.Marker(point,{icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(20,25),{
          imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
        })});
        var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
        var opts = {
          width: 200,
          title: markers[index].title,
          enableMessage: false
        };
        var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
        marker.setLabel(label);
        addClickHandler(marker,infoWindow);
        map.addOverlay(marker);
      };
    }
    //向地图添加控件
    function addMapControl(){
      var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
      scaleControl.setUnit(BMAP_UNIT_METRIC);

      map.addControl(scaleControl);
      var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:0});
      map.addControl(navControl);
      var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:false});
      map.addControl(overviewControl);
    }
    var map;
      initMap();
  </script>


<jsp:include page="foot/footer.jsp"></jsp:include>
</body>
</html>

