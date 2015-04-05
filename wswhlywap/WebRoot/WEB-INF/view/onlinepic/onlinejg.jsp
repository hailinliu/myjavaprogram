<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
  <head>
    <title>鉴定</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />

    <link rel="stylesheet" href="<c:url value='/css/onlinepic/onlinepicmain.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>


	<script type="text/javascript">
var yuqiniandai="商,西周,战国,唐代,南宋,北宋,元代,明代早期,明代空白期,明代中期,明代晚期,明代末期,清早期,清中期,清晚期,清代顺治,清代康熙,清代雍正,清代乾隆,清代嘉庆,清代道光,清代咸丰,清代末期,清代同治,清代光绪,清代宣统,民国,现代艺术品,年代不明";
function setNianDai(){
	var fniand=yuqiniandai.split(',');
	 for(var i=0;i<fniand.length;i++){
	 	$('#niandaidiv').append("<input type='button' class='jgniandai' name='thniandai"+i+"' id='yshang"+i+"' value='"+fniand[i]+"' onclick='$(\"#jgniandai\").val(\""+fniand[i]+"\")'/>");
	 }
	 $('#jghangqingdiv').append("<input type='button' name='jghangqing"+i+"' id='jghangqing"+i+"' value='近5至10年该藏品有可能升值' onclick='$(\"#jghangqing\").val(\"近5至10年该藏品有可能升值\")'/>");
	 $('#jghangqingdiv').append("<input type='button' name='jghangqing"+i+"' id='jghangqing"+i+"' value='近5至10年该藏品有可能贬值' onclick='$(\"#jghangqing\").val(\"近5至10年该藏品有可能贬值\")'/>");
}
function setJGNianDai(jgpg){
			if(jgpg==1){
				$('#jgniandai').val('现代艺术品');
				$('#jgguzhitr').css("display","none");
				$('#jgisshangpaitr').css("display","none");
				$('#jghangqingtr').css("display","none");
			}else{
				$('#jgniandai').val('');
				$('#jgguzhitr').css("display","block");
				$('#jgisshangpaitr').css("display","block");
				$('#jghangqingtr').css("display","block");
			}
}
$(function(){
 <c:if test="${item.zhpg!=2&&item.zhpg!=3}">
		$('#jgguzhitr').css("display","none");
		$('#jgisshangpaitr').css("display","none");
		$('#jghangqingtr').css("display","none");
		</c:if>
        setNianDai();
	});
function setJg(){
var guzhi="";
var jgzhpgval=$("input[name='jgzhpg'][type='radio']:checked").val();
if(jgzhpgval==undefined||jgzhpgval==''||jgzhpgval=='undefined'){alert('请选择综合评估结果！');return;}
if($('#jgniandai').val()==''){alert('请填写年代！');return;}
	if(jgzhpgval!=1){//如果综合评估不为新
		//if(${item.level}>1){//如果用户基本为高级以上
			if($('#jgguzhi').val()==''){alert('请填写估值！');return;}
			guzhi=$('#jgguzhi').val();
		//}
		var jgisshangpaival=$("input[name='jgisshangpai'][type='radio']:checked").val();
		if(jgisshangpaival==undefined||jgisshangpaival==''||jgisshangpaival=='undefined'){alert('请选择是否推荐复审！');return;}
		if($('#jghangqing').val()==''){alert('请填写行情走势！');return;}

	}else{
		if($('#jgdetailnote').val()==''){alert('请填写详细说明！');return;}
		if($('#jgdetailnote').val().length<20){alert('详细说明不得少于20字！');return;}
	}
if(!confirm('您确定提交鉴定结果吗？提交之后不能修改！')){
return;
}
var isshangpai;
if(jgzhpgval==1){//如果综合评估为新 清空值
	$('#jgguzhi').val('');
	$('#jghangqing').val('');
	isshangpai=1;
}else{
isshangpai=$("input[name='jgisshangpai'][type='radio']:checked").val();
}
 $('.bm_over').show();
 
	$.ajax({
        type:'post',
        url:"<c:url value='/onlinepic/UpdateOnlinePicCollByProf'/>",
        data:{
             state:6,
             zhpg: $("input[name='jgzhpg'][type='radio']:checked").val(),
             niandai:$('#jgniandai').val(),
             guzhi:$('#jgguzhi').val(),
             hangqing:$('#jghangqing').val(),
             detailnote:$('#jgdetailnote').val(),
             isshangpai:isshangpai,
             id:${item.id}
    	},
        success:function(data){
        $('.bm_over').hide();
          if(data==0){
          	alert('失败请重试!');
          }else{
         	 alert('鉴定成功!');
         	 window.location.href="<c:url value='/redirect?p=/admin/zjmain'/>";
          }
        }
	    });
	 
}
	</script>


<style type="text/css">
  legend{padding: 15px 0;}
  .jgniandai{
    background: #000;
    color: #fff;
    padding:1em 1em;
    margin-top: .6em;
    margin-right: .6em;
    float: left;
  }
   /*遮蔽层*/
    .bm_over{
      height:1000px;width:100%;background:rgba(0,0,0,0.4);background:#000;filter:alpha(Opacity=80);-moz-opacity:0.8;opacity: 0.8;position: absolute;z-index: 1000;text-align:center;font-family:微软雅黑; display: none;
  }

</style>

  </head>

  <body>
    <!-- 遮蔽层！！！ -->
  <div id="bmover" class="bm_over">
    <h3 style="font-size:25px;color:#F6ED10;padding-top:800px;">正在提交，请稍候...</h3>
  </div>
  <div data-role="page">
  <div data-role="header" data-position="fixed" class="ui-header ui-bar-inherit ui-header-fixed slidedown">
	<h1 class="ui-title" role="heading" aria-level="1">${item.name}鉴定</h1>
  </div>

      <div data-role="content">
        <form id="loginForm" action="<c:url value="/sys/login"/>
        " method="post" >

         <!-- 综合结论 -->

        <div data-role="collapsible-set">
          <div data-role="collapsible" data-collapsed="false">
            <h3>综合结论 <i style="color:red">* 必选</i></h3>
        <div data-role="">

         <fieldset data-role="controlgroup">

              <label for="pd1">新</label>
              <input type="radio" name="jgzhpg" <c:if test="${item.zhpg==1}"> checked="checked"</c:if> id="pd1" value="1" onclick="setJGNianDai(1)">
              <label for="pd2">老</label>
              <input type="radio" name="jgzhpg" <c:if test="${item.zhpg==2}"> checked="checked"</c:if> id="pd2" value="2" onclick="setJGNianDai(2)">
              <label for="pd3">老仿</label>
              <input type="radio" name="jgzhpg"  <c:if test="${item.zhpg==3}"> checked="checked" </c:if>id="pd3" value="3" onclick="setJGNianDai(3)">
          </fieldset>
        </div>
        </div>
        </div>

        <!-- 年代 -->

        <div data-role="collapsible-set" id="jgniandaitr">
          <div data-role="collapsible" data-collapsed="false">
            <h3>年代判定 </h3>

            <div data-role="">

               <fieldset data-role="" id="niandaidiv">

                     <input type="text" name="jgniandai" id="jgniandai" value="${item.niandai}">
					如以下选项：<br/>
                </fieldset>
             </div>

          </div>

        </div>
 <c:if test="${item.level>1}">
        <!-- 估价 -->

        <div data-role="collapsible-set" id="jgguzhitr">
          <div data-role="collapsible" data-collapsed="false">
            <h3>初步估值 </h3>

            <div data-role="">
                <label for="name">估价(万)：</label>
                 <input type="text" name="jgguzhi" id="jgguzhi" value="${item.guzhi}">
             </div>

          </div>

        </div>
  </c:if>
 	<!-- 上拍 -->

        <div data-role="collapsible-set" id="jgisshangpaitr">
          <div data-role="collapsible" data-collapsed="false">
            <h3>是否推荐复审 </h3>

            <div data-role="">
                 <fieldset data-role="controlgroup">

                    <label for="jgisshangpai1">不推荐复审</label>
                    <input type="radio" name="jgisshangpai" id="jgisshangpai1" <c:if test="${item.isshangpai==1}"> checked="checked"</c:if> value="1">
                    <label for="jgisshangpai2">推荐复审</label>
                    <input type="radio" name="jgisshangpai" id="jgisshangpai2" <c:if test="${item.isshangpai==2}"> checked="checked"</c:if> value="2">

                </fieldset>
             </div>

          </div>

        </div>
        <!-- 走势 -->

        <div data-role="collapsible-set" id="jghangqingtr">
          <div data-role="collapsible" data-collapsed="false">
            <h3>走势分析 </h3>

            <div data-role="">
                 <fieldset data-role="controlgroup" id="jghangqingdiv">
					<input type="text" name="jghangqing" id="jghangqing" value="${item.hangqing}">
					如以下选项：<br/>
                </fieldset>
             </div>

          </div>

        </div>

        <!-- 补充说明 -->

        <div data-role="collapsible-set">
          <div data-role="collapsible" data-collapsed="false">
            <h3>补充说明 <i style="color:red"></i></h3>

            <div data-role="">
                 <textarea name="jgdetailnote" id="jgdetailnote" cols="30" rows="10">${item.detailnote}</textarea>
             </div>

          </div>

        </div>






        <!-- <input id="passwordid" type="password" name="password" placeholder="密码" value=""/>
       -->

      </form>


      </div>




  <div data-role="footer" data-position="fixed">
	<div data-role="navbar">
		<ul>
			<li>
				<a href="javascript:window.location.href='<c:url value='/redirect?p=/admin/zjmain'/>'" data-iconpos="top" data-icon="gear" data-ajax="false">首页</a>
				</li>
			<li>
			<a href="" onclick="setJg()" data-iconpos="top" data-icon="gear" data-ajax="false">鉴定完毕
			</a>
			</li>
			<li>
				<a class="lookpics" href="javascript:window.location.href='<c:url value='/onlinepic/getOnlinePicColl'/>?id=${item.id}'" data-iconpos="gear" data-icon="star" data-ajax="false">查看藏品
					</a>


			</li>




		</ul>
	</div><!-- /navbar -->
  </div><!-- /footer -->
  </div>


	<!-- 退回原因选择 -->


  </body>
</html>
