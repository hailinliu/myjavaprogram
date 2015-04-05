<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:include page="../head/header.jsp"></jsp:include>
  <head>

    <title>拍品征集_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/slideshow.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/collect/index.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/collect/collect_upload.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
	<meta name=keywords content="拍品征集">
	<meta name=description content="卫视文化乐园-华豫之门官方网站，拍品征集首页">
    <script type="text/javascript">
	  function login_btn2() {
          var userlevel='${userlevel}';
          var yemoney='${yemoney}';
          var num='${num}';
          var shopid='${flagmap.id}';

            // 是否登录
            var my_element=$(".login");
            if(my_element.length>0){
                $("#login_box").addClass('mod_show');

                return false;
            }

           if(userlevel==0){
       document.getElementById('freeopen').style.display='block';
          if(yemoney-100<0){
             document.getElementById('yueopen').style.display='block';
            return false;

        }
  }


   if(shopid!=""&&num>30){
        if(yemoney-100<0){
        document.getElementById('vipopen').style.display='block';
      return false;
    }
  }
  if(userlevel==1&&num>30){
     if(yemoney-100<0){
        document.getElementById('vipopen').style.display='block';
      return false;
    }
  }
  //如果为贵宾会员  可以免费上传60件
  if(userlevel==2&&num>60){
     if(yemoney-100<0){
       document.getElementById('vipopen').style.display='block';
      return false;
    }
  }
  //如果为高级会员  可以免费上传80件
  if(userlevel==3&&num>80){
     if(yemoney-100<0){
       document.getElementById('vipopen').style.display='block';
      return false;
    }
  }

  window.location.href="<c:url value='/collect/gotouplylots'/>";

}

	</script>
	</head>

  <body>


<!--main style ben-->
<div class="main_box clear" style="background:#F5E5C1;padding-top:20px;position:relative;">
    <div class="pp_jz_top"></div>
    <div class="pp_jz_sm">
        <div class="pp_jz_sm_left fl">
            <div class="pp_jz_sm_in fl">
                <div class="pp_tab pp_tab01">征集须知</div>
                <div class="pp_tab pp_tab_current pp_tab02">拍品征集序言</div>
                <div class="pp_tab pp_tab03" >审核须知</div>
                <div class="pp_dot"></div>
            </div>
            <div class="fl pp_jz_sm_txt tab002" style="">  <!--  tab01 -->
              <p>华豫官网拍品征集平台正式开通了！</p>
              <p>现面向全国藏友征集拍品，由乐园审核后，参加各大电商平台的网络保真拍卖会
！</p>
              <p>华豫之门专家团全程把关，专业服务团队全程跟踪。诚挚沟通，合作共赢！</p>
              <p>专业的拍卖，离我们并不遥远....</p>
            </div>
            <div class="fl pp_jz_sm_txt tab001" style="padding:34px 10px 0 28px;height:134px;width:547px;display:none;">       <!-- tab02 -->
              <p>2014年度的拍卖征集时，凡是上过华豫之门电视节目的藏品（必须出示华豫之门节目证书）可直接与我们官网的各类项服务专员联系集中后，由各专场的主持专家进行核审确认即可，不必在进行初审。</p>
            </div>
            <div class="fl pp_jz_sm_txt tab003" style="padding:22px 10px 0 28px;height:146px;width:547px;display:none;">       <!-- tab02 -->
              <p>华豫之门官网在网络保真拍卖征集活动中，对未通过初审和实物复核的送拍品，均会在每次征集活动结束后的一周内在网上集中发布该送拍品图片下的简短说明来解释未入选原因，而对官网贵宾以上级别的客户，我们的商务专员在每次征集活动结束后的一周内，会单独发送邮件进行解释说明。</p>
            </div>

        </div>
        <div class="pp_jz_sm_right fr">
            <p>
              <span class="pp_s1 fl">1</span>
              <span class="fl">
                <a href="javascript:void(0)" target="_blank">
                  佛教造像与礼器专场
                </a>
              </span>
            </p>
            <p>
              <span class="pp_s1 fl">2</span>
              <span class="fl">
                <a href="javascript:void(0)" target="_blank">
                  明清瓷器专场
                </a>
              </span>
            </p>
            <p>
              <span class="pp_s1 fl">3</span>
              <span class="fl">
                <a href="javascript:void(0)" target="_blank">
                  现当代书画专场
                </a>
              </span>
            </p>
            <p>
              <span class="pp_s1 fl">4</span>
              <span class="fl">
                <a href="javascript:void(0)" target="_blank">
                  传世玉饰与手珠专场
                </a>
              </span>
            </p>
            <div class="pp_zc_tit"> <!-- 标题 -->
            </div>
        </div>
    </div>
    <div class="pp_tits">
            征集流程图
    </div>
    <div>
      <img src="<c:url value='/images/collect/pp_liucheng.png'/>" alt="拍品征集流程图" />
    </div>
    <div class="pp_tits">
            上传资格和费用标准
    </div>
    <div class="pp_requires">
        <ul class="pp_requires_left fl">
          <li>
            <span class="pp_s2 fl">上传拍品时：</span>
            <span class="fl pp_s2_txt">
              鉴定费：免费会员需支付鉴定费，每件100元。其他会员免鉴定费。
            </span>
          </li>
          <li>
            <span class="pp_s2 fl">复审通过后：</span>
            <span class="fl pp_s2_txt">
              电子图录费：您需支付每件100元的电子图录费用。
            </span>
          </li>
          <li>
            <span class="pp_s2 fl">拍卖后：</span>
            <span class="fl pp_s2_txt" style="line-height:20px;height:45px;padding-top:2px;">
              拍卖成功后，各项费用结算，需参照《保真藏品专场委托拍卖合同》执行</a>。
              若流拍，则无其他费用支出。
            </span>
          </li>
        </ul>
        <div class="pp_requires_right fr">
          <div style="margin-top:41px;*margin-top:35px;">
            <img src="<c:url value='/images/collect/pp_shoufei.png'/>" alt="收费标准" width="418" height="228px" />
          </div>
          <div style="margin-top:12px;padding-left:318px;">
            <a href="javascript:void(0)" onclick="login_on('<c:url value='/mine/gotovip'/>',1)" class="sjhy">我要升级会员</a>
          </div>
        </div>
         <div class="yzh_text" style="clear:both;">
          <div class="smh_1" ><i style="color:#fff">致送拍藏友：</i></div><br>
          <p>
          非常感谢广大藏友对“卫视文化乐园”网拍藏品征集的大力支持，自网拍藏品开始征集以来，大量藏家踊跃参与，经过评审专家的审核鉴定，已确定一批可以参拍藏品。根据拍卖会相关要求，拍卖藏品不但需要专家认可，还需要向省级国家文物部门申请报备。</p>
          <p>目前才通过复核的藏品上拍时间需要到2015年第一季度方可排期，因此请各位参与征集送拍的藏友耐心等待，我们将在您的藏品通过复审后先进行拍照并登记归档（具体时间和地点由商务专员通知），待上拍时间确定后再与您联系确实签约事宜。</p>
          <p>再次感谢您的支持和理解！</p>

        </div>
    </div>
    <div class="up_load">
          <button  onclick="login_btn2();">我要上传拍品</button>
    </div>
                <!--免费会员弹出框 -->
    <div  id="freeopen" class="forgebox_guowai" style="">
      <div class="easyDialogBox" style="margin-top:15%;">
        <div  class="easyDialog_wrapper">
          <div class="easyDialog_content" style="">
                  <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                      <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_guowai" id="closeBtn">×</a>
                        【 信息提示 】
                  </h4>

                    <div  style="font-size:16px;text-align:center;margin-top:15px;">
                      尊敬的免费会员<span style="color:red;">${CurrentSession.username}</span>，上传拍品每件需支付100元。
                    </div>

                    <div class="info_text" style="height:67px;text-align:left;padding:20px 128px 0;">
                      <button onclick="location.href='<c:url value='/collect/gotouplylots'/>'" style="border:1px solid #ccc;height:30px;width:120px;font-size:14px;color:#000;border-radius:4px;float:left;cursor:pointer;" >继续上传拍品</button>
                      <p class="gbck" style="text-decoration:underline;cursor:pointer;float:left;margin-left:72px;font-size:14px;color:#00A9FF;display:block;width:100px;"><a href="<c:url value='/mine/gotovip'/>" style="color:#00A9FF;">我要去升级</a></p>
                    </div>
              </div>
              </div>
          </div>
      </div>
                      <!--余额不足弹出框 -->
    <div id="yueopen" class="forgebox_guowai" style="">
      <div class="easyDialogBox" style="margin-top:15%;">
        <div  class="easyDialog_wrapper">
          <div class="easyDialog_content" style="">
                  <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                      <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_guowai" id="closeBtn">×</a>
                        【 信息提示 】
                  </h4>

                    <div  style="font-size:16px;text-align:center;margin:62px 0;">
                      对不起，余额不足，请先&nbsp;<a href="<c:url value='/redirect?p=mine/recharge1'/>" target="_blank" style="color:#00A9FF;">充值</a>&nbsp;。
                    </div>
              </div>

              </div>
          </div>
      </div>

                   <!--收费会员，上传30件达到上限，弹出框 -->
    <div   id="vipopen" class="forgebox_guowai" style="">
      <div class="easyDialogBox" style="margin-top:15%;">
        <div class="easyDialog_wrapper">
          <div class="easyDialog_content" style="">
                  <h4 class="easyDialog_title" id="easyDialogTitle" style="cursor: move;">
                      <a href="javascript:void(0)" title="关闭窗口" class="close_btn off_guowai" id="closeBtn">×</a>
                        【 信息提示 】
                  </h4>

                    <div  style="font-size:16px;text-align:center;margin-top:20px;">
                      尊敬的<span style="color:red;">会员</span><span style="color:red;">${CurrentSession.username}</span>，您的送拍数量已达限制。
                    </div>
                    <div  style="font-size:16px;text-align:center;margin-top:15px;">
                      <a href="<c:url value='/collect/gotouplylots'/>" style="color:#00A9FF;">继续上传拍品</a>
                    </div>
                    <div  style="font-size:16px;text-align:center;margin-top:15px;margin-bottom:30px;">
                      <span>
                        <a href="<c:url value='/collect/gotomylylots'/>" style="color:#00A9FF;">查看送拍记录</a>
                      </span>
                      <span>每件需支付100元鉴定费</span>
                    </div>

              </div>

              </div>
          </div>
      </div>

</div>

  <jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
