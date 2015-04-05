<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>我的藏品</title>

  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/son_page.css'/>"/>
  <script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery_date.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  </head>

  <body>
<jsp:include page="../head/header.jsp"></jsp:include>

    <!--main style ben-->
<div class="main_box clear">

  <jsp:include page="common/myMenu.jsp"></jsp:include>

  <div class="user_right fr clear">

     <div class="onuser_tit2">我的送拍藏品<span class="fr online_user"></span></div>

     <div class="onuser_box clear">
             <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bmls">
                  <tr>
                    <th>藏品名称</th>
                    <th>上传时间</th>
<%--                    <th>预计回复时间</th>--%>
                    <th>回复时间</th>
                    <th>估值（万）</th>
                    <th class="">状态</th>
                  </tr>

                   <c:forEach items="${list}" var="info" varStatus="cdn">
         <tr style="height:50px;">
                    <td style="width:180px;overflow:hidden;">${info.name}</td>
                    <td>${info.sfuploaddate}</td>
<%--                    <td>${info.sfyjresultsdate}之前</td>--%>
                    <td><c:if test="${info.state==8}">${info.sfresultsdate}</c:if></td>
                     <td><c:if test="${info.state==8&&info.level>=2}">${info.guzhi}<c:if test="${info.guzhi!=null&&info.guzhi!=''}">(万)</c:if></c:if></td>
                    <td id="zt_look">
                    <c:if test="${info.state==1}">
                   	 	 待鉴定
                    </c:if>
                    <c:if test="${info.state==2}">
                   	 	 正在鉴定
                    </c:if>
                     <c:if test="${info.state==3}">
                   		 审核未通过，图片清晰度不够，请修改!<br/>
                   		 <c:if test="${info.thcs<3}">
                   		  <a class="red_btns" style="margin:10px auto;" href="<c:url value='/onlinepic/gotoolinePicupdate'/>?id=${info.id}">点击修改</a>
                   		 </c:if>
                   		  <c:if test="${info.thcs>=3}">
                   		    您的3次修改机会已用完！
                   		 </c:if>
                    </c:if>
                     <c:if test="${info.state==4}">
                   		 审核未通过，该藏品所选门类与实际不符，请修改!<br/>
                   		 <c:if test="${info.thcs<3}">
                   		  <a class="red_btns" style="margin:10px auto;" href="<c:url value='/onlinepic/gotoolinePicupdate'/>?id=${info.id}">点击修改</a>
                   		 </c:if>
                   		  <c:if test="${info.thcs>=3}">
                   		    您的3次修改机会已用完！
                   		 </c:if>
                    </c:if>
                     <c:if test="${info.state==5}">
                   		 审核未通过，请您核对藏品数量,请修改!<br/>
                   		 <c:if test="${info.thcs<3}">
                   		  <a class="red_btns" style="margin:10px auto;" href="<c:url value='/onlinepic/gotoolinePicupdate'/>?id=${info.id}">点击修改</a>
                   		 </c:if>
                   		  <c:if test="${info.thcs>=3}">
                   		    您的3次修改机会已用完！
                   		 </c:if>
                    </c:if>
                     <c:if test="${info.state==6}">
                   		 正在鉴定
                    </c:if>
                     <c:if test="${info.state==8}">
                   		 已鉴定<a class="red_btns" style="float: right;margin-right:10px;" target="_blank" href="<c:url value='/onlinepic/olinePicByid'/>?id=${info.id}">鉴定结果</a>
                   		 (<c:if test="${info.isshangpai==1}">不推荐复审</c:if><c:if test="${info.isshangpai==2}">推荐复审</c:if>
				<c:if test="${info.isshangpai==3}"><a target=" _blank" href="<c:url value='/onlinepic/onlinePiclist?isshangpai=3&typeid='/>">送拍到国外大拍行送拍藏品展示</a></c:if><c:if test="${info.isshangpai==4}"><a target=" _blank" href="<c:url value='/onlinepic/onlinePiclist?isshangpai=3&typeid='/>">送拍到国内大拍行送拍藏品展示</a></c:if><c:if test="${info.isshangpai==5}"><a target=" _blank" href="<c:url value='/onlinepic/onlinePiclist?isshangpai=3&typeid='/>">送拍到淘宝平台网拍藏品展示</a></c:if>
				<c:if test="${info.isshangpai==6}"><a target=" _blank" href="<c:url value='/onlinepic/onlinePiclist?isshangpai=3&typeid='/>">送拍到华豫官网微拍藏品展示</a></c:if>)
                    </c:if>
                      <c:if test="${info.state==9}">
                   		  正在鉴定
                    </c:if>
                    </td>
                  </tr>
         </c:forEach>

              </table>
     </div>

     <div style="margin:20px 0;font-size:14px;" class="fr">* 您已上传 <i style="color:#ff0000">${count}</i> 件藏品</div>

      <div><a class="red_btns" style="margin:40px auto;width:150px;font-size:14px;" target="_blank" href="<c:url value='/onlinepic/gotoonlinepicupload'/>">我要鉴定(上传)</a></div>



  <div style="clear:both;"></div>

   <c:if test="${count / pageSize > 1}">
     <div class="paging clear">
        <pg:pager url="../onlinepic/myUpOlinePic" items="${count}" maxPageItems="10" maxIndexPages="5">
            <pg:param name="pageSize" value="${pageSize}" />
            <pg:param name="type" value="${type}" />
          <ul class="paging_list">
            <pg:first>
              <li class="bg_box">
                <a href="${pageUrl}">首页</a>
              </li>
            </pg:first>
            <pg:prev>
              <li class="bg_box bg_box2">
                <a href="${pageUrl}">上一页</a>
              </li>
            </pg:prev>
            <pg:pages>
              <li>
                <a href="${pageUrl}">${pageNumber}</a>
              </li>
            </pg:pages>

            <pg:next>
              <li class="bg_box bg_box3">
                <a href="${pageUrl}">下一页</a>
              </li>
            </pg:next>
            <pg:last>
              <li class="bg_box">
                <a href="${pageUrl}">尾页</a>
              </li>
            </pg:last>
          </ul>
        </pg:pager>

   </div>
   </c:if>
 <div style="clear:both;"></div>
   <div id="chusok" style=";font-size:16px;
line-height: 2;background:#f3f3f3;padding:20px;" class="viotabl1">
        <p style="font-weight:bold;">会员须知：</p>
       <p>1.普通会员：（会员费 无），每件鉴定费用 <font color='red'>100元/件</font>，实物复审不收取费用，鉴定时间为 <font color='red'>10个工作日以内</font>，网络拍卖佣金为 10%！</p>

       <p>2.星级会员：（会员费 1000元 一年制），每件鉴定费用 <font color='red'>50元/件</font>，实物复审收费 <font color='red'>50元/件</font>，鉴定时间为 <font color='red'>5个工作日以内</font>，网络拍卖佣金为：佣金为8%！</p>
       <p>3.贵宾会员：（会员费 1万 元一年制），免费鉴定： <font color='red'>10件</font>，超出每件鉴定费用 <font color='red'>50元</font>，鉴定时间为 <font color='red'>72小时</font>以内，提供估值服务！网络拍卖佣金为 7%！</p>
       <p>4.高级会员：（会员费 2万 元一年制），免费鉴定 <font color='red'>20件</font>，超出每件鉴定费用 <font color='red'>50元</font>，鉴定时间为 <font color='red'>48小时</font>内，提供估值服务！网络拍卖佣金为 6%！</p>
       <p>5.超级会员：（会员费 3万 元一年制），免费鉴定 <font color='red'>30件</font>，超出每件鉴定费用 <font color='red'>50元</font>，鉴定时间为 <font color='red'>24小时</font>内，提供估值服务！网络拍卖佣金为 5%！</p>

       <p></p>
       <p style="font-weight:bold;">* 更多服务 请看下表</p>



            <!-- CSS goes in the document HEAD or added to your external stylesheet -->
            <style type="text/css">
            .viotabl1 p{
              line-height: 2.2;
              font-size: 12px;
            }
            table.imagetable {
              font-family: verdana,arial,sans-serif;
              font-size:11px;
              color:#333333;
              border-width: 1px;
              border-color: #999999;
              border-collapse: collapse;
              width: 850px;
            }
            table.imagetable th {
              background:#b5cfd2 url('cell-blue.jpg');
              border-width: 1px;
              padding: 8px 0;
              border-style: solid;
              border-color: #999999;
            }
            table.imagetable td {
              background:#dcddc0 url('cell-grey.jpg');
              border-width: 1px;
              padding: 8px;
              border-style: solid;
              border-color: #999999;
              text-align: center;
              line-height: 30px;
            }
            .fred{
              color: red;
            }
            </style>

            <!-- Table goes in the document BODY -->
            <table class="imagetable">
            <tr>
              <th>享受服务</th>
              <th>普通会员</th>
              <th>星级会员</th>
              <th>贵宾会员</th>
              <th>高级会员</th>
              <th>超级会员</th>
            </tr>
            <tr>
              <td>会员费用</td>
              <td class="fred">无</td>
              <td class="fred">1000元/年</td>
              <td class="fred">1万元/年</td>
              <td class="fred">2万元/年</td>
              <td class="fred">3万元/年</td>
            </tr>
            <tr>
              <td>免费图片鉴定</td>
              <td class="fred">0件</td>
              <td class="fred">0件</td>
              <td class="fred">10件</td>
              <td class="fred">20件</td>
              <td class="fred">30件</td>
            </tr>
            <tr>
              <td>图片鉴定费用</td>
              <td class="fred">100元/件</td>
              <td class="fred">50元/件</td>
              <td class="fred">50元/件<br />(超出免费件数)</td>
              <td class="fred">50元/件<br />(超出免费件数)</td>
              <td class="fred">50元/件<br />(超出免费件数)</td>
            </tr>
            <tr>
              <td>实物复审</td>
              <td class="fred">0元/件</td>
              <td class="fred">50元/件</td>
              <td class="fred">0元/件</td>
              <td class="fred">0元/件</td>
              <td class="fred">0元/件</td>
            </tr>
            <tr>
              <td>图片鉴定时间</td>
              <td class="fred">10个工作日以内</td>
              <td class="fred">5个工作日以内</td>
              <td class="fred">72个小时以内</td>
              <td class="fred">48个小时以内</td>
              <td class="fred">24个小时以内</td>
            </tr>
            <tr>
              <td>实物鉴定</td>
              <td class="fred">x</td>
              <td class="fred">x</td>
              <td class="fred">可预约鉴定地点</td>
              <td class="fred">可预约鉴定地点</td>
              <td class="fred">可预约鉴定地点</td>
            </tr>
            <tr>
              <td>网络送拍佣金</td>
              <td class="fred">10%</td>
              <td class="fred">8%</td>
              <td class="fred">7%</td>
              <td class="fred">6%</td>
              <td class="fred">5%</td>
            </tr>
            <tr>
              <td>估值服务</td>
              <td class="fred">x</td>
              <td class="fred">x</td>
              <td class="fred">提供</td>
              <td class="fred">提供</td>
              <td class="fred">提供</td>
            </tr>
            <tr>
              <td>藏品送拍<br>(每年享受对国内外大拍行送拍藏品)</td>
              <td class="fred">x</td>
              <td class="fred">x</td>
              <td class="fred">1件</td>
              <td class="fred">3件</td>
              <td class="fred">5件</td>
            </tr>


            </table>
          </div>

  </div><!--user_right end-->

</div>
<!--main style end-->
 <!-- 判断 url参数 页码用** -->
  <script type="text/javascript" language="javascript">

        $(document).ready(function() {
           var urlsval = url_request("pager.offset");   // 获取 offset参数
           var urlsval2 = parseInt(urlsval/10)+1;
            $(".paging_list>li>a").each(function(){
                if ($(this).text()==urlsval2) {
                    $(this).addClass('ymseled')
                }
            });


        });
    </script>
<jsp:include page="../foot/footer.jsp"></jsp:include>
  </body>
</html>
