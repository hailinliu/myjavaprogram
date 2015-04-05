<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>国内团购_卫视文化乐园-华豫之门官方网站</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/shoufeijieshao.css'/>"/>
<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/box111.css'/>"/>
<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
<meta name=keywords content="国内团购，华豫之门官网活动">
<meta name=description content="华豫之门》藏家团-艺术品市场深度交流鉴赏自由行文化活动">
<script type="text/javascript">
function EnrollInfo(){

// 是否登录
            //
     var my_element=$(".login");
      if(my_element.length>0){

          $("#login_box").addClass('mod_show');
      // $("#login_box").show();
          return false;
      }else{
       var checkText=$("#select_id").find("option:selected").text();
       var checkValue=$("#select_id").val();
       if(checkValue=='0'){
       alert("对不起,您未选择团购地点!");
       return false;
       }
    $.ajax({
        type:'post',
        url:"<c:url value='/news/enrollInfo'/>",
        data:{
            bmstyle:"tuangou",
            style:checkText,
            desc:checkText
        },
        success:function(data){
            if(data = "0000"){
            $("#success_money").html('1000');
	           	$.ajax({
			        type:'post',
			        url:"<c:url value='/user/getMoney'/>",
	           		success:function(data){
	           			$("#success_currentmoney").html(data);
	           		}
	           		});
	           	$(".forgebox_guowai").show();
	           	return;
            }else{
                alert("报名失败");
        }
        }
    });
    }
  }

</script>
</head>
<body>
	<jsp:include page="../head/header.jsp"></jsp:include>

    <div id="tuangou_hd">
    	<div class="content tuangou_content" >
            <h1 style="font-size:24px;margin-bottom:20px;">《华豫之门》藏家团-艺术品市场深度交流鉴赏自由行文化活动</h1>
            <p class="biaoti">活动内容： </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;由《华豫之门》专家亲自带队，参加国内及周边国家各门类艺术品重要集中地的鉴赏与团购活动，旅行费用由旅游公司收取(仅收取藏友团出行期间住宿和交通费的成本价)，且藏友在参团合同中明确得到组织方在团购活动中绝不收取商家任何回扣和佣金以及绝没有任何强迫性购物的双重承诺。年度活动地区：翡翠缅甸行或腾冲行、金丝楠四川行、黄花梨仙游行、水晶东海行、珊瑚台湾行、寿山福建行、鸡血石内蒙行、字画日本行，到各地进行艺术品鉴赏与交流活动。</p>
            <p class="biaoti">报名条件： </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;注册成为网站会员，并通过实名认证后，升级为<span class="guibin">星级</span>会员及以上级别即可参与。<a onclick="login_on('<c:url value='/redirect?p=mine/vip'/>','1')" href="javascript:void(0)">查看会员级别服务及收费标准</a></p>
            <p class="biaoti">报名时间：</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;每个地区30人报名即可组团出行。</p>
            <p class="biaoti">注意事项：</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp; 本活动由《华豫之门》官网与康辉旅游公司联合举办，会员费用仅包含专家等服务人员及相关组织费用，签证和旅费自理、且由旅游公司收取。详细情况请联系客服电话：0371-60110891，报名成功后会有工作人员1个工作日内与您联系。</p>

            <div class="place">
                <span>请选择地点</span>
                <select name="city" id="select_id">
                    <option value="0">——请选择——</option>
                    <option value="1" >翡翠缅甸行或腾冲行</option>
                    <option value="2">金丝楠四川行</option>
                    <option value="3">黄花梨仙游行</option>
                    <option value="4">水晶东海行</option>
                    <option value="5">珊瑚台湾行</option>
                    <option value="6">寿山福建行</option>
                    <option value="7">鸡血石内蒙行</option>
                    <option value="8">字画日本行</option>
                </select>
            </div>
           <div class="nav_baoming" ><input type="button"  value="我要报名" class="baoming" onclick="EnrollInfo()"/>

			</div>

    	</div>
    </div>



    <div class="forgebox_guowai">
      <div class="easyDialogBox" style="">
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

              <a class="btn_href" href="<c:url value='/redirect?p=mine/recharge1'/>" style="margin-left:20px;">
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

    <jsp:include page="../foot/footer.jsp"></jsp:include>
</body>
</html>
