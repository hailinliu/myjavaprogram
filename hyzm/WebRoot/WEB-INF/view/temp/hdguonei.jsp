<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>国内拍卖_卫视文化乐园-华豫之门官方网站</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/shoufeijieshao.css'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/bnameinfo.css'/>"/>
<meta name=keywords content="国内拍卖，华豫之门官网活动">
<meta name=description content="《华豫之门》藏家团-国内嘉德、保利和瀚海秋拍收藏文化之旅">
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
       // var visa="";
       // if(document.getElementById("visa1").checked==true){
       //  visa= "是";
       // }else if(document.getElementById("visa2").checked==true){
       //  visa= "否";
       /// }

        var joins="";
        if(document.getElementById("joins1").checked==true){
         joins="是";
        }else if(document.getElementById("joins2").checked==true){
         joins="否";
        }
     //   var time=$('#time1').val();
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
            bmstyle:"guonei",
            name: $('#name').val(),
            tel:$('#tel').val(),
            email:$('#email').val(),
            sex:sexs,
            idcard:$('#idcard').val(),
            // ipcard:$('#ipcard').val(),
            address:$('#address').val(),
            // visa:visa,
            // useTime:time,
            style:style,
            lader:lader,
            joins:joins,
            desc:$('#desc').val()
        },
        success:function(data){
            if(data = "0000"){
            // alert('提交成功，1个工作日内将有客服与您联系，请保持通讯畅通');
            // var vips1money = $('input[name="vips1"]:checked').val();
            // window.location.href="<c:url value='/pay'/>?money="+vips1money;
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

    <div id="fade" class="black_overlay" style="height:1320px;"></div>

     <div id="guonei_ad">
    	<div class="guonei_hd content">
            <h1 style="font-size:24px;margin-bottom:20px;">《华豫之门》藏家团-国内嘉德、保利和瀚海秋拍收藏文化之旅</h1>
            <p class="biaoti">活动内容： </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;由《华豫之门》专家亲自带队，参加国内大型秋季拍卖会活动。藏家团将根据不同藏品种类（分玉器、铜器、字画、瓷器和珠宝首饰）由著名收藏专家王育成、余光仁、黄鼎、高明利、陈建明和古方分别带队组成，到拍卖会预展现场进行拍卖指导分析。</p>
            <p class="biaoti">报名条件： </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;注册成为网站会员，并通过实名认证后，升级为<span class="guibin">贵宾</span>会员及以上级别即可参与。<a onclick="login_on('<c:url value='/redirect?p=mine/vip'/>','1')" href="javascript:void(0)">查看会员级别服务及收费标准</a></p>
              <p>&nbsp;&nbsp;&nbsp;&nbsp;<span class="red1">您也可以仅参加本次活动哦！</span>

            </p>
            <p class="biaoti">时间：</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;秋拍时间：三家拍卖行2014秋拍时间。</p>
            <p class="biaoti">注意事项：</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;1、本活动由《华豫之门》官网与康辉旅游公司联合举办，会员费用仅包含专家等服务人员及相关组织费用，旅行费用由旅游公司收取或藏友自理。<br>
            &nbsp;&nbsp;&nbsp;&nbsp;2、会员报名成功后，将于每月底根据当月报名情况举行一次说明会，最后一次说明会将在拍卖会开始一周前举行，说明会统一与会员确认集合方式及旅行费用，将根据报名人员情况及机票住宿要求分别由旅行公司报价，《华豫之门》官网负责统一组织协调，承诺旅行费用仅收取出行期间住宿和交通费用的成本价。<br />
            &nbsp;&nbsp;&nbsp;&nbsp;3、自由行会员将在每月报名说明会举行后通知您具体汇合时间流程安排。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;4、所有参团会员将在拍卖会举办前一天在拍卖会预展现场或周边酒店举行专家见面会，由专家对拍品讲解分析。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;5、本次活动如因行程安排报名本人无法参团，亦可委托代理人参加。<br>
            &nbsp;&nbsp;&nbsp;
            <span style="color:red;">6、如您或代理人无法到场，可由我公司专业人员代理竞拍拍卖会藏品，详情请联系客服电话。</span><br>
            &nbsp;&nbsp;&nbsp;&nbsp;
            </p>
            <div class="nav_baoming" >
                <input type="button"  value="我要报名" class="baoming guowai_baoming" onclick="login_btn();"/>
            </div>
    	</div>
    <!-- 报名信息表 -->
        <div class="ww_box">
        <div class="content content2 white_content" id="light" style="padding-bottom:60px;">
            <a class="close" href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">

            </a>
            <div  style="position:absolute;left:400px;bottom:10px;background:#fff;padding:0px; ">
                <input  style="width:150px;height:40px;-moz-border-radius: 5px; -webkit-border-radius: 5px;background:#B82326;" type="button"  value="提交报名" class="baoming guowai_baoming " onclick=" EnrollInfo();" />
             </div>



            <div class="onuser_tit t_center">一、报名信息</div>
             <div class="onuser_cont">
               <!-- <a href="#" target="_blank"><img src="<c:url value='/images/yun.jpg'/>" />

               </a> -->

                <!-- <div class="n_info">
                    <span>· 活动内容</span>
                </div> -->
               <ul class="onuser_list fl clear" style="height:auto;">
                 <li>
                     <span class="lname_info">姓名(或代理人姓名)：</span>
                     <span><input id="name" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" /></span>
                 </li>
                 <li>
                     <span class="lname_info">联系电话：</span>
                     <span><input id="tel" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" onkeyup="value=value.replace(/[^\d]/g,'') "/></span>
                 </li>
                 <li>
                     <span class="lname_info">邮箱：</span>
                     <span><input id="email" class="input_out"  type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" /></span>
                 </li>
                  <li>
                     <span class="lname_info">性别：</span>
                     <span>

                     <input id="sex1" name="sex" type="radio" value="1" /> 男
                     <input id="sex2" name="sex" type="radio" value="2" /> 女

                     </span>
                 </li>

                 <li>
                     <span class="lname_info">身份证号：</span>
                     <span><input id="idcard" class="input_out" name="" type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/></span>
                 </li>

                 <li>
                     <span class="lname_info">联系地址：</span>
                     <span><input id="address" class="input_out" name="" type="text" onfocus="this.className='input_on';this.onmouseout=''" onblur="this.className='input_off';this.onmouseout=function(){this.className='input_out'};" onmousemove="this.className='input_move'" onmouseout="this.className='input_out'" style="width:500px;"/></span>
                 </li>

                 <li>
                     <span class="lname_info">您喜欢的藏品门类：</span>
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

                     <span class="lname_info">您希望的带队专家：</span>
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
                            </span>
                 </li>

                 <li style="height:50px;line-height:50px;">
                     <span class="lname_info" style="height:50px;line-height:1.5;">您是否自行前往拍卖会，并自行解决食宿：</span>
                     <span>
                        <input id="joins1" name="ns1" type="radio" value="" /> 是
                         <input id="joins2" name="ns1" type="radio" value="" /> 否</span>
                    </span>

                 </li>

                <li style="height:90px;">
                     <span class="t_bold">如您通过本藏家团出行，将为您安排机票/火车票及酒店预定，您是否有随团旅游需要，是否有同行家属等：</span><br/>
                     <span><input id="desc" class="input_out input_text" name="" type="text" style="width:850px;" /></span>

                 </li>

               </ul>
             </div>

             <!-- 3 -->
             <!-- 4 -->

           <script type="text/javascript">

                $(document).ready(function(){

                    var daiban1 = $("#daiban1");// 获得网站代办数目
                    var vips_1 = $("#vips_1");// vip1
                   var vips_2 = $("#vips_2");
                   var vips_no = $("#vips_no");

                // 获取各个数字值
                    var num0 = daiban1.val();
                    var num1 = vips_1.val();
                    var num2 = vips_2.val();
                    var num_no = vips_no.val();

                   var money_hj = $(".money_hj"); //总和

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

                   }

                vips_sum();

                // 如果复选框被选中
                //

                });
            </script>
             <div class="onuser_tit t_center">二、费用及会员升级选择：</div>
            <div class="onuser_cont" style="height:auto">


               <div class="n_info lname_info" style="border-top:1px dotted #bcbcbc;height:91px;">
                    <span style="margin:15px auto;">会员升级：</span>
                </div>
               <ul class="onuser_list fl clear" style="width:749px;height:92px;">
                 <li class="info2 fl" style="height:30px;width:734px;">

                     <span style="height: 100%;line-height: 2.5;">
                         <input id="vips_1" type='radio' name='vipsm2' value="10000">
                         升级为 贵宾会员：会费10000元/年，一年含2次华豫专家陪同参与的国内顶级拍卖行的春秋大拍会现场指导服务；

                    </span>

                 </li>
                 <li class="info2 fl" style="height:30px;width:734px;">

                     <span style="height: 100%;line-height: 2.5;">

                         <input id="vips_2" type='radio' name='vipsm2' value="30000">
                       升级为 超级会员，会费30000元/年，一年含4次华豫专家陪同参与的国内、外顶级拍卖行的春秋大拍会现场指导服务；


                    </span>
                 </li>

                 <li class="info2 fl" style="height:30px;width:734px;">

                     <span style="height: 100%;line-height: 2.5;">

                         <input id="vips_no" type='radio' name='vipsm2' value="5000">
                         暂不升级贵宾或超级会员，仅选择参与本次活动，费用5000元/次；（注：同时享有网站星级会员的其他服务）
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
    <!-- 提交成功 弹出框 -->
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
              </div>
              </div>
          </div>
      </div>
  </div>
    <jsp:include page="../foot/footer.jsp"></jsp:include>
</body>
</html>
