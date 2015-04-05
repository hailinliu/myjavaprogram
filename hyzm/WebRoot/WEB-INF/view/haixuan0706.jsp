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
            <li class="road_con">地铁9号线(北京西站上,六里桥下,2站)，<br>
换地铁10号线(十里河A口出,14站)， <br>下车向北820米</li>
        </ul>
        <ul class="road_ul">
          <li class="road_tit">北京站</li>
            <li class="road_con"> 638路(北京站东上,十里河桥北下,8站)，<br> 下车向西北140米
</li>
        </ul>
        <ul>
          <li class="road_tit">北京首都国际机场</li>
            <li class="road_con">机场大巴四惠线(首都机场(3号航站楼)上,<br>
青年路（大悦城）下,2站)，换地铁6号线(青年路上,呼家楼下,3站)，<br>
换地铁10号线(十里河A口出,6站)，下车向北820米

</li>
        </ul>
    </div>

<!--住宿指引-->
    <p class="xlzy">住宿指引</p>
        <div style="width:1140px;height:550px;border:#ccc solid 1px;font-size:12px" id="dituContent"></div>

</div>


<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addMarker();//向地图中添加marker
    }

    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(116.465822,39.874964);//定义一个中心点坐标
        map.centerAndZoom(point,18);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }

    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }

    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
  var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
  map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
  var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
  map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
  var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
  map.addControl(ctrl_sca);
    }

    //标注点数组
    var markerArr = [{title:"京瑞大厦",content:"海选现场",point:"116.466365|39.875366",isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}
     ,{title:"酒店",content:"我的备注",point:"116.466464|39.87603",isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}
     ,{title:"酒店",content:"我的备注",point:"116.46482|39.877456",isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}
     ,{title:"餐厅",content:"我的备注",point:"116.466886|39.87621",isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}
     ];
    //创建marker
    function addMarker(){
        for(var i=0;i<markerArr.length;i++){
            var json = markerArr[i];
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
            var point = new BMap.Point(p0,p1);
      var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point,{icon:iconImg});
      var iw = createInfoWindow(i);
      var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
      marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                        borderColor:"#808080",
                        color:"#333",
                        cursor:"pointer"
            });

      (function(){
        var index = i;
        var _iw = createInfoWindow(i);
        var _marker = marker;
        _marker.addEventListener("click",function(){
            this.openInfoWindow(_iw);
          });
          _iw.addEventListener("open",function(){
            _marker.getLabel().hide();
          })
          _iw.addEventListener("close",function(){
            _marker.getLabel().show();
          })
        label.addEventListener("click",function(){
            _marker.openInfoWindow(_iw);
          })
        if(!!json.isOpen){
          label.hide();
          _marker.openInfoWindow(_iw);
        }
      })()
        }
    }
    //创建InfoWindow
    function createInfoWindow(i){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    //创建一个Icon
    function createIcon(json){
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }

    initMap();//创建和初始化地图
</script>



<jsp:include page="foot/footer.jsp"></jsp:include>
</body>
</html>

