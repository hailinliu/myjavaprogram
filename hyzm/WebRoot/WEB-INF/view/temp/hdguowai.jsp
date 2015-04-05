<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>国外拍卖_卫视文化乐园-华豫之门官方网站</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/shoufeijieshao.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/bnameinfo.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/box111.css'/>"/>
<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/datetime1/WdatePicker.js'/>"></script>
<meta name=keywords content="国外拍卖，华豫之门官网活动">
<meta name=description content="《华豫之门》藏家团-美国苏富比与佳士得秋拍收藏文化之旅">
<script>

 // 判断是否登录  和弹出层
      function login_btn() {

            // 是否登录
            //
            var my_element=$(".login");
            if(my_element.length>0){

                $("#login_box").addClass('mod_show');
        // $("#login_box").show();
                return false;
            }else{
               document.getElementById('light').style.display='block';
                document.getElementById('fade').style.display='block';
            }

      }



 function EnrollInfo(){



       if($('#name').val() ==""){
        alert("请输入姓名!");
        return;
        }
        if($('#tel').val()== ""){
        alert("请输入联系电话!");
        return;
        }
        if($('#email').val()== ""){
        alert("请输入您的邮箱!");
        return;
        }

        var sexaa =  $("input[name=sex]:checked").length;
        // alert(zhuanjia);
         if (sexaa == 0) {
                  alert("请选择您的性别！");
                  return;
             }



        if($('#idcard').val()== ""){
        alert("请输入您的身份证号!");
        return;
        }
        if($('#address').val()== ""){
        alert("请输入您的联系住址!");
        return;
        }

         var scpz = $("input[name=VoteOption1]:checked").length;
        // alert(zhuanjia);
         if (scpz == 0) {
                  alert("请选择收藏种类！");
                  return;
             }

         var zhuanjia = $("input[name=VoteOption]:checked").length;
        // alert(zhuanjia);
         if (zhuanjia == 0) {
                  alert("请选择带队专家！");
                  return;
             }

         var visa = $("input[name=visa]:checked").length;
        // alert(zhuanjia);
         if (visa == 0) {
                  alert("请选择是否有护照或绿卡！");
                  return;
             }else{

                if($("#visa1").attr("checked")){

                    var qz = $("input[name=qz]:checked").length;  //签证
                     if (qz == 0) {
                          alert("请选择是否有美国签证！");
                          return;
                     }else{
                        if($("#qz_1").attr("checked")){
                            if ($("#time1").val()=='') {
                                alert("请选择到期时间！");
                                return;
                            }
                        }

                     }

                }

                 if($("#visa2").attr("checked")){
                    if ($("#ipcard").val()=='') {
                        alert("请填写护照号！");
                        return;
                    }

                    var qz = $("input[name=qz]:checked").length;  //签证
                     if (qz == 0) {
                          alert("请选择是否有美国签证！");
                          return;
                     }else{
                        if($("#qz_1").attr("checked")){
                            if ($("#time1").val()=='') {
                                alert("请选择到期时间！");
                                return;
                            }
                        }

                     }

                }

                if($("#b_card").attr("checked")){
                    if ($("#ip_card").val()=='') {
                        alert("请填写绿卡！");
                        return;
                    }
                }
             }

        var suituan = $("input[name=ns1]:checked").length;
        // alert(zhuanjia);
         if (suituan == 0) {
                  alert("请选择是否随团出发！");
                  return;
             }

        var sexs="";
        if(document.getElementById("sex1").checked==true){
         sexs="男";
        }else if(document.getElementById("sex2").checked==true){
         sexs="女";
        }
        var visa="";
        if(document.getElementById("visa1").checked==true){
         visa= "是";
        }else if(document.getElementById("visa2").checked==true){
         visa= "否";
        }

        var joins="";
        if(document.getElementById("joins1").checked==true){
         joins="是";
        }else if(document.getElementById("joins2").checked==true){
         joins="否";
        }
        var time=$('#time1').val();
        var r=document.getElementsByName("VoteOption1");
        var r1=document.getElementsByName("VoteOption");
        var style="";
        var lader="";
        $('input[name="VoteOption1"]:checked').each(function(){
          style+=$(this).val()+',';
        });
        $('input[name="VoteOption"]:checked').each(function(){
         lader+=$(this).val()+',';
         });
    $.ajax({
        type:'post',
        url:"<c:url value='/news/enrollInfo'/>",
        data:{
            bmstyle:"guowai",
            name: $('#name').val(),
            tel:$('#tel').val(),
            email:$('#email').val(),
            sex:sexs,
            idcard:$('#idcard').val(),
            ipcard:$('#ipcard').val(),
            address:$('#address').val(),
            visa:visa,
            useTime:time,
            style:style,
            lader:lader,
            joins:joins,
            desc:$('#desc').val()
        },
        success:function(data){
            if(data = "0000"){
            	$("#success_money").html($(".money_hj").text());
	           	$.ajax({
			        type:'post',
			        url:"<c:url value='/user/getMoney'/>",
	           		success:function(data){
	           			$("#success_currentmoney").html(data);
	           		}
	           		});
                // document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none';
                   $("#light").hide();
                   $("#fade").hide();
	           	$(".forgebox_guowai").show();
	           	return;
            	//alert('提交成功，1个工作日内将有客服与您联系，请保持通讯畅通');

            	//window.location.href="http://www.wswhly.com/redirect?p=mine/recharge1";
            }else{
                alert("报名失败");
        }
        }
    });

  }


</script>
</head>
<body>
    <jsp:include page="../head/header.jsp"></jsp:include>

    <div id="fade" class="black_overlay" style="height:1500px;"></div>
     <div id="main_nav">
        <!--  活动 -->
        <div class="guowai content" >
            <h1 style="font-size:24px;margin-bottom:20px;">《华豫之门》藏家团-美国苏富比与佳士得秋拍收藏文化之旅</h1>
            <p class="biaoti">活动内容： </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;由《华豫之门》专家亲自带队，九月中旬赴美国纽约参加苏富比和佳士得秋季拍卖会预展及拍卖活动。藏家团将根据不同藏品种类（分玉器、铜器、字画、瓷器和珠宝五大类团）由华豫专家王育成、余光仁、黄鼎、高明利、陈建明和古方分别带队组成，到两个拍卖会预展现场和第五大道的藏家自选珠宝店面进行指导分析，并由专家亲自带团参观游览当地的唐人街古董跳蚤市场，体验异域大众收藏文化风土人情。</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;通过华豫官网报名预审后由美国苏富比和佳士得公司出具邀请函到大使馆进行签证，纽约活动期间入住市区临近拍卖现场的五星级酒店，活动全程由空调大巴接送，并由专业翻译全程提供免费服务。</p>
            <p class="biaoti">报名条件： </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;注册成为网站会员，并通过实名认证后，升级为<span class="red1">高级</span>会员及以上级别即可参与。<a onclick="login_on('<c:url value='/redirect?p=mine/vip'/>','1')" href="javascript:void(0)">查看会员级别服务及收费标准</a></p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;<span class="red1">您也可以仅参加本次活动哦！</span>

            </p>
            <p class="biaoti">时间：</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;报名时间：2014年7月1日 -- 2014年8月8日。</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;秋拍时间：2014年9月12日 -- 2014年9月16日。</p>
            <p class="biaoti">注意事项：</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;1、本活动由《华豫之门》官网与康辉旅游公司联合举办，会员费用仅包含专家和翻译等服务人员及相关组织费用，签证和旅费自理并由旅游公司收取或藏友自理。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;2、签证办理及旅费事宜将在报名结束后（8月初），召集报名成员统一商议，将根据报名人员情况及机票住宿要求分别由旅行公司报价，《华豫之门》官网负责统一组织协调，承诺旅行费用仅收取出行期间住宿和交通费用的成本价。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;3、藏友亦可自由行赴美，在团拍期间约定汇合。具体时间将在报名结束后（8月初）统一安排，并通知藏友。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;">4、本次活动如因行程安排报名本人无法参团，亦可委托代理人参加。如您或代理人均无法到场，可由我公司专业人员代理竞拍拍卖会藏品，详情请联系客服电话。</span><br>
            &nbsp;&nbsp;&nbsp;&nbsp;5、在团行程期间请遵照国家相应法律法规和与旅游公司签订的出行协议。详细情况请联系客服电话：0371-60110891，报名成功后会有工作人员在一个工作日内与您联系。
            </p>
            <p class="biaoti">特别提醒： </p>
             <p class="biaoti" >&nbsp;&nbsp;&nbsp;&nbsp; 如您需了解美国佳士得和苏富比秋拍品图录后再选择交费，为了能够及时办理签证，您可继续点击报名，并在填写报名资料后选择在网站充值支付<font style="color:#2951F0;">1200元</font>签证费用，我们将委托旅行公司先办理美国大使馆签证工作。签证办理后费用不予退回，敬请知晓。</p>

            <div class="nav_baoming guowai_bm" id="btn1" style="width:126px;">
                <!-- <input type="button"  value="我要报名" class="baoming guowai_baoming" onclick="login_btn();"/> -->
                <input type="button"  value="报名已结束" class="baoming guowai_baoming"  style="background:#9E9E9E;" />

                <!-- <p><a href="<c:url value='/uploadWX/baoming.xls'/>">报名表下载</a></p> -->
            </div>

            <!--弹出充值框-->
            <!-- <div class="guowai_cz" style="display:none;">
                <div class="jiantou"></div>
                <p>VIP高级（及以上级别）会员方能参与，请先充值。&nbsp;<a href="http://www.wswhly.com/redirect?p=mine/vip">查看会员服务及收费标准</a></p>
                <p class="red1">充值金额：20000元</p>
                <div class="tjcz">
                   <input type="button" value="提交充值" class="baoming"onclick="window.location.href='<c:url value='/pay'/>?money=20000'" />
                </div>
                <p>充值成功后，24小时内将有客服与您联系</p>

            </div> -->
        </div>



        <!-- 报名信息表 -->
        <div class="ww_box">
        <div class="content content2 white_content" id="light" style="padding-bottom:60px;">
            <a class="close" href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">

            </a>
            <div  style="position:absolute;left:400px;bottom:10px;background:#fff;padding:0px; ">
                <input  style="width:150px;height:40px;-moz-border-radius: 5px; -webkit-border-radius: 5px;background:#B82326;" type="button"  value="提交报名" class="baoming guowai_baoming " onclick=" EnrollInfo();" />
             </div>

            <!-- <div class="onuser_tit t_center">一、活动信息</div>
             <div class="onuser_cont">

               <ul class="onuser_list fl clear" style="height:118px;">
                 <li>
                     <span class="lname_info">活动内容：</span>
                     <span>藏家团-赴美参加纽约苏富比和佳士得秋拍会</span>
                 </li>
                 <li>
                     <span class="lname_info">秋拍时间：</span>
                     <span>2014年9月12日-9月16日</span>
                 </li>
                 <li>
                     <span class="lname_info">带队候选专家：</span>
                     <span>王育成、余光仁、黄鼎、高明利、陈建明、古方</span>
                 </li>

               </ul>
             </div> -->

            <!-- 2 -->
            <!-- 判断是否有绿卡 -->



            <div class="onuser_tit t_center">一、报名信息</div>
             <div class="onuser_cont">
               <!-- <a href="#" target="_blank"><img src="<c:url value='/images/yun.jpg'/>" />

               </a> -->

                <!-- <div class="n_info">
                    <span>· 活动内容</span>
                </div> -->
               <ul class="onuser_list fl clear onuser_k" style="height:auto;">
                 <li>
                     <span class="lname_info"><b style="color:#000">* </b>姓名(或代理人姓名)：</span>
                     <span><input id="name" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" /></span>
                 </li>
                 <li>
                     <span class="lname_info" style="width:100px;"><b style="color:#000">* </b>联系电话：</span>
                     <span><input id="tel" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" onkeyup="value=value.replace(/[^\d]/g,'') " /></span>
                 </li>
                 <li>
                     <span class="lname_info"><b style="color:#000">* </b>邮箱：</span>
                     <span><input id="email" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" /></span>
                 </li>
                  <li>
                     <span class="lname_info" style="width:100px;"><b style="color:#000">* </b>性别：</span>
                     <span>

                     <input id="sex1" name="sex" type="radio" value="1" /> 男
                     <input id="sex2" name="sex" type="radio" value="2" /> 女

                     </span>
                 </li>

                 <li>
                     <span class="lname_info"><b style="color:#000">* </b>身份证号：</span>
                     <span><input id="idcard" class="input_out" name="" type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/></span>
                 </li>
                 <li>
                     <span class="lname_info" style="width:100px;"><b style="color:#000;">* </b>联系地址：</span>
                     <span><input id="address" class="input_out" name="" type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" style="width:270px;" /></span>
                 </li>


               </ul>

               <ul class="onuser_list fl clear" style="height:auto;">

                 <li>
                     <span class="lname_info fl"><b style="color:#000">* </b>您喜欢的藏品门类：</span>
                     <span style="padding-right:15px;height:39px;">
                            <input id="style1" type='checkbox' name='VoteOption1' value="玉器"> 玉器
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="style2" type='checkbox' name='VoteOption1' value="铜器 "> 铜器
                             &nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="style3" type='checkbox' name='VoteOption1' value="字画"> 字画
                             &nbsp;&nbsp;
                            <input id="style4" type='checkbox' name='VoteOption1' value="瓷器"> 瓷器
                             &nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="style5" type='checkbox' name='VoteOption1' value="珠宝"> 珠宝
                     </span>

                 </li>

                 <li>

                     <span class="lname_info"><b style="color:#000">* </b>您希望的带队专家：</span>
                     <span style="border-right:0px dotted #bcbcbc;padding-right:15px;height:39px;">
                       <input type='checkbox' name='VoteOption' value="王育成 "> 王育成
                        &nbsp;&nbsp;
                            <input type='checkbox' name='VoteOption' value="余光仁"> 余光仁
                             &nbsp;&nbsp;

                            <input type='checkbox' name='VoteOption' value="黄鼎"> 黄鼎
                             &nbsp;&nbsp;
                            <input type='checkbox' name='VoteOption' value="高明利"> 高明利
                             &nbsp;&nbsp;
                            <input type='checkbox' name='VoteOption' value="陈建明"> 陈建明
                             &nbsp;&nbsp;

                            <input type='checkbox' name='VoteOption' value="古方"> 古方
                 </li>
                 <li>
                     <span class="lname_info"><b style="color:#000">* </b> 是否有护照或绿卡：</span>

                     <span>
                         <input id="visa1" name ="visa" type="radio" value="" /> 无
                         &nbsp;&nbsp;
                         <input id="visa2"  name="visa" type="radio" value="" /> 护照号：

                     </span>
                     <span><input style="width:180px;" id="ipcard" class="input_out" name="ipcard" type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" /></span>


                     <span style="margin-left:30px;">

                         <input id="b_card" name="visa" type="radio" value="绿卡" /> 绿卡号：

                     </span>
                     <span><input style="width:180px;" id="ip_card" class="input_out" name="" type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" /></span>
                 </li>

                 <li class="lvkabd" style="position: relative;">
                    <div class="none_cad1"></div>
                     <span class="lname_info"><b style="color:#000">* </b>是否有美国签证：</span>
                     <span>
                         <input id="qz_1" name ="qz" type="radio" value="" /> 有，&nbsp; 签证有效期截止时间：


                     </span>

                     <span>

                       <input id="time1" class="Wdate input_out" type="text" onClick="WdatePicker()" name="datess">

                    </span>
                    <span  style="margin-left:43px;">

                         <input id="qz_2"  name="qz" type="radio" value="" /> 无

                     </span>
                 </li>


                 <li style="">
                     <span class="lname_info" style=""><b style="color:#000">* </b>是否随团出发：</span>
                     <span>
                        <input id="joins1" name="ns1" type="radio" value="" /> 是
                        &nbsp;&nbsp;&nbsp;&nbsp;
                         <input id="joins2" name="ns1" type="radio" value="" /> 否，我要自主行动，然后在纽约与藏家团汇合</span>
                    </span>

                 </li>

                <li style="height:90px;">
                     <span class="t_bold">如您通过本藏家团出行，您是否有随团旅游需要，能够赴美时间及预计美国停留时间、是否有同行家属等要求：</span><br/>
                     <span><input id="desc" class="input_out input_text" name="" type="text" style="width:850px;" /></span>

                 </li>

               </ul>

             </div>

             <!-- 3 -->

            <!-- <div class="onuser_tit t_center">二、收费标准及报名方式</div>
             <div class="onuser_cont" style="height:auto">


                <div class="n_info lname_info" style="height:60px;">
                    <span style="margin:20px auto">收费标准：</span>
                </div>
               <ul class="onuser_list fl clear oncl3" style="width:749px;height:60px;">
                 <li class="">

                     <span class="">1、VIP高级会员：会费20000元/年，参与国外及港澳顶级拍卖会的春秋大拍会时一年含两次华豫专家陪同的现场指导服务；</span>


                 </li>
                <li class="">

                     <span class="">2、VIP超级会员：会费30000元/年，参与国内、外顶级拍卖行的春秋大拍会时一年含四次华豫专家陪同的现场指导服务；</span>


                 </li>

               </ul>


             </div> -->

             <!-- 4 -->

            <!-- 计算会员充值钱数 -->
            <script type="text/javascript">

                $(document).ready(function(){

                // 绿卡
                var b_cards = $("#b_card");  // 绿卡
                var lvkabd = $(".lvkabd");  // 绿卡li

                 var visa1 = $("#visa1");  // 护照
                 var visa2 = $("#visa2");  // 护照

                  b_cards.change(function(){
                       $(".none_cad1").css('display','block');

                    });
                  visa1.change(function(){
                       // lvkabd.show();
                       $(".none_cad1").css("display","none");
                    });
                  visa2.change(function(){
                       // lvkabd.show();
                       $(".none_cad1").css("display","none");
                    });

                // 签证 有无的效果
                    $("#qz_2").change(function(){
                       if($("#qz_2").attr("checked")){

                        $("#time1").css('background-color','#d3d3d3');
                        $("#time1").val("");
                        $("#time1").attr("disabled","disabled");  //无效
                        return;
                        // alert("xx");
                     }
                    });

                    $("#qz_1").change(function(){
                       if($("#qz_1").attr("checked")){

                        $("#time1").css('background-color',' #fff');
                        // $("#time1").attr("disabled",""); //移除click
                        $("#time1").removeAttr("disabled");
                        return;
                        // alert("xx");
                     }
                    });

                    $("#b_card").change(function(){
                       if($("#b_card").attr("checked")){

                        $("#time1").val("");
                        return;
                        // alert("xx");
                     }
                    });


                    // *********************************

                    var daiban1 = $("#daiban1");// 获得网站代办数目
                    var vips_1 = $("#vips_1");// vip1
                   var vips_2 = $("#vips_2");
                   var vips_no = $("#vips_no");
                   var vips_no2 = $("#vips_no2");

                // 获取各个数字值
                    var num0 = daiban1.val();
                    var num1 = vips_1.val();
                    var num2 = vips_2.val();
                    var num_no = vips_no.val();
                    var num_no2 = vips_no2.val();



                   var money_hj = $(".money_hj"); //总和

                    function vips_sum2(){
                        vips_1.change(function(){

                                var sum = (num1-0)+(num0-0);
                                money_hj.text(sum);
                            });
                            vips_2.change(function(){

                                var sum = (num2-0)+(num0-0);
                                money_hj.text(sum);
                            });
                            vips_no.change(function(){

                                var sum = (num_no-0)+(num0-0);;
                                money_hj.text(sum)
                            });
                            vips_no2.change(function(){

                                var sum = (num_no2-0)+(num0-0);;
                                money_hj.text(sum)
                            });
                   }

                   function vips_sum(){
                        vips_1.change(function(){

                               var sum = (num1-0);
                                money_hj.text(sum);

                            });
                            vips_2.change(function(){

                                var sum = (num2-0);
                                money_hj.text(sum);
                            });
                            vips_no.change(function(){

                                var sum = (num_no-0);
                                money_hj.text(sum);
                            });
                            vips_no2.change(function(){

                                var sum = (num_no2-0);
                                money_hj.text(sum);
                            });

                   }

                   function vips_sum3(){
                        vips_1.change(function(){
                                daiban1.change(function(){

                                    if(daiban1.attr("checked")){

                                        var sum = (num0-0)+(num1-0);
                                        money_hj.text(sum);

                                    }
                                });

                               var sum = (num1-0);
                               money_hj.text(sum);

                            });
                        vips_2.change(function(){
                                daiban1.change(function(){

                                    if(daiban1.attr("checked")){

                                        var sum = (num0-0)+(num2-0);
                                        money_hj.text(sum);

                                    }
                                });

                               var sum = (num2-0);
                               money_hj.text(sum);

                            });
                        vips_no.change(function(){
                                daiban1.change(function(){

                                    if(daiban1.attr("checked")){

                                        var sum = (num0-0)+(num_no-0);
                                        money_hj.text(sum);
                                    }
                                });

                               var sum = (num_no-0);
                               money_hj.text(sum);

                            });
                        vips_no2.change(function(){
                                daiban1.change(function(){

                                    if(daiban1.attr("checked")){

                                        var sum = (num0-0)+(num_no2-0);
                                        money_hj.text(sum);

                                    }
                                });

                               var sum = (num_no2-0);
                               money_hj.text(sum);

                            });

                   }


                vips_sum();
                vips_sum3();

                // 如果复选框被选中


                    daiban1.change(function(){

                        if(daiban1.attr("checked")){
                            // alert("网址代办");

                           var sum = (num0-0);
                            money_hj.text(sum);

                            vips_sum2();

                        }
                        else{

                                if (vips_1.attr("checked")) {
                                    var sum = (num1-0);
                                    money_hj.text(sum);
                                };
                                if (vips_2.attr("checked")) {
                                    var sum = (num2-0);
                                    money_hj.text(sum);
                                };
                                if (vips_no.attr("checked")) {
                                    var sum = (num_no-0);
                                    money_hj.text(sum);
                                };
                                if (vips_no2.attr("checked")) {
                                    var sum = (num_no2-0);
                                    money_hj.text(sum);
                                };

                                vips_sum();
                        }

                    });

                });

            </script>

            <div class="onuser_tit t_center">二、费用及会员升级选择：</div>
            <div class="onuser_cont" style="height:auto">


                <div class="n_info lname_info" style="height:30px;">
                    <span style="margin:0px auto">&nbsp;&nbsp;&nbsp;&nbsp;签证：</span>
                </div>
               <ul class="onuser_list fl clear oncl3" style="width:749px;height:30px;overflow:hidden;">
                 <li style="float:left;width:734px;">

                     <span class="">
                        <input id="daiban1" type='checkbox' name='daiban1' value="1200">
                         由网站联系旅游公司协助办理签证，费用1200元。

                     </span>
                 </li>
               </ul>

               <div class="n_info lname_info" style="border-top:1px dotted #bcbcbc;height:123px;">
                    <span style="margin:45px auto">会员升级：</span>
                </div>
               <ul class="onuser_list fl clear" style="width:749px;height:124px;">
                 <li class="info2 fl" style="height:30px;width:734px;">

                     <span style="height: 100%;line-height: 2.5;">
                         <input id="vips_1" type='radio' name='vipsm2' value="20000">
                         升级为高级会员，会费20000元/年，一年含2次华豫专家陪同参与的国外及港澳顶级拍卖行的春秋大拍会现场指导服务；

                    </span>


                 </li>
                 <li class="info2 fl" style="height:30px;width:734px;">

                     <span style="height: 100%;line-height: 2.5;">

                         <input id="vips_2" type='radio' name='vipsm2' value="30000">
                        升级为超级会员，会费30000元/年，一年含4次华豫专家陪同参与的国内、外顶级拍卖行的春秋大拍会现场指导服务；


                    </span>


                 </li>
                 <li class="info2 fl" style="height:30px;width:734px;">

                     <span style="height: 100%;line-height: 2.5;">

                         <input id="vips_no" type='radio' name='vipsm2' value="10000">
                         暂不升级高级或超级会员，仅选择参与本次活动，费用10000元；（注：同时享有网站星级会员的其他服务）
                    </span>


                 </li>
                 <li class="info2 fl" style="height:30px;width:734px;">

                     <span style="height: 100%;line-height: 2.5;">
                         <input id="vips_no2" type='radio' name='vipsm2' value="0" checked>
                          等待签证结果再做决定。
                    </span>


                 </li>


               </ul>

               <div class="n_info lname_info" style="border-top:1px dotted #bcbcbc;height:40px;">
                    <span style="margin:0px auto;">费用共计：</span>
                </div>
               <ul class="onuser_list fl clear" style="width:749px;height:40px;">
                 <li class="info2 none fl" style="height:100%;line-height:2;">
                     <span class="money_hj" style="color: #f40;font-size: 22px;font-family: Arial;vertical-align: middle;float:left;display:inline-block;">
                        0
                    </span>
                    <span style="color:#f40;font-size: 22px;vertical-align: middle;float:left;display:inline-block;">
                         元
                    </span>


                 </li>


               </ul>

             </div>

        </div>
    </div>
    </div>


  <div class="forgebox_guowai">
      <div class="easyDialogBox">
      <div id="easyDialogWrapper" class="easyDialog_wrapper" style="display: block; margin: 0px;">
          <div class="easyDialog_content">
              <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                  <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_guowai" id="closeBtn">×</a>
                    【 信息提示 】
              </h4>

              <div class="easyDialog_text">
                <font color="red" style="font-size:18px;">提交成功！</font>
              </div>

              <div class="info_text">
                请继续完成支付或会员升级环节，1个工作日内将有客服与您联系。
              </div>

              <div class="info_text info_textmoney">
                您当前账户余额：
                  <span id="success_currentmoney"></span>
                  元， 参与活动需支付：
                  <span id="success_money"></span>
                  元。

              </div>

              <div class="info_text a_sj">

                  <a class="btn_href" href="<c:url value='/mine/gotovip'/>" style="margin-left:80px;">
                     余额充足，我要去升级会员！
                 </a>


                 <script type="text/javascript">

                    function moneys_bz(){
                        window.location.href="<c:url value='/redirect?p=mine/recharge1'/>&moneys=" + parseInt($(".money_hj").text());
                    }

                  </script>
                  <a id="moneys" class="btn_href" href="javascript:void(0)" style="margin-left:20px;" onclick="moneys_bz()">
                    余额不足，我要充值！
                  </a>

              <!-- <a href="javascript:void(0)" onclick="location.reload()">关闭窗口</a> -->
              </div>



         <!--  <div class="easyDialog_footer">
              <button class="btn_normal" id="easyDialogNoBtn">取消</button>
              <button class="btn_highlight" id="easyDialogYesBtn">确定</button>
          </div> -->
              </div>
          </div>
      </div>
  </div>


  <!-- dddddddd -->


    <jsp:include page="../foot/footer.jsp"></jsp:include>
</body>
</html>

