<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>我的拍品</title>

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

     <div class="onuser_tit2">我的拍品<span class="fr online_user"></span></div>

     <div class="onuser_box clear">
             <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bmls">
                  <tr>
                    <th>拍品编号</th>
                    <th>拍品名称</th>
                    <th>所属专场</th>
                    <th>上传时间</th>
                    <th>预备价格</th>
                    <th class="">拍品状态</th>
                    <th class="none">初审评论</th>
                  </tr>
                   <c:forEach items="${mylotslist}" var="info" varStatus="cdn">
         <tr style="height:50px;">
                    <td>${info.lynumber}</td>
                    <td style="width:180px;overflow:hidden;">${info.name}</td>
                    <td>${info.specialname}</a></td>
                    <td>${info.formatuptime}</td>
                    <td>${info.ybprice}</td>
                    <td id="zt_look">
                    <c:if test="${info.state==1}">
                    待初审
                    </c:if>
                      <c:if test="${info.state==2}">
                    初审通过
                    <script type="text/javascript">
                      $(function(){
                        $('#chusok').show();
                        //  初审通过后 显示复审地址
                      })

                    </script>
                    </c:if>
                      <c:if test="${info.state==3}">
                    初审未通过
                    </c:if>
                      <c:if test="${info.state==4}">
                    复审通过
                    </c:if>

                      <c:if test="${info.state==5}">
                    复审未通过
                    </c:if>
                      <c:if test="${info.state==6}">
                    已签约
                    </c:if>
                      <c:if test="${info.state==7}">
                    拍卖中
                    </c:if>
                      <c:if test="${info.state==8}">
                    已成交
                    </c:if>
                      <c:if test="${info.state==9}">
                    流拍
                    </c:if>
                    </td>
                    <td> <c:if test="${info.state>1}">
                       ${info.trialcomments}
                    </c:if></td>
                  </tr>
         </c:forEach>

              </table>
     </div>

     <div style="margin:20px 0;font-size:14px;" class="fr">* 您已上传 <i style="color:#ff0000">${count}</i> 件拍品</div>



     <div id="chusok" style="margin:20px 0;font-size:14px;
line-height: 1.7;color:#ff0000;display:none;" class="fl">复审地点：北京市朝阳区东方博宝古玩书画城；若有疑问请及时联系客服。</div>


  <div style="clear:both;"></div>
     <div style="margin:20px 0;font-size:14px;
line-height: 1.7;" class="fl">
       温馨提示： 初审为看图鉴定，若因照片问题鉴定为仿品，您可联系客服或商务专员进行沟通。若在沟通后您对图片鉴定结果仍有不同意见，请留意本网“复审”的相关通知（时间、地点等），在复审时可带上实物，交由专家老师上手查看。相关交通食宿费用需自理，因此我们不建议您做这样的选择。
     </div>


   <c:if test="${count / pageSize > 1}">
     <div class="paging clear">
        <pg:pager url="../collect/gotomylylots" items="${count}" maxPageItems="10" maxIndexPages="10">
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

  </div><!--user_right end-->

</div>
<!--main style end-->
 <!-- 判断 url参数 页码用** -->
  <script type="text/javascript" language="javascript">

        $(document).ready(function() {
           var urlsval = url_request("pager.offset");   // 获取 offset参数
           var urlsval2 = parseInt(urlsval/9)+1;
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
