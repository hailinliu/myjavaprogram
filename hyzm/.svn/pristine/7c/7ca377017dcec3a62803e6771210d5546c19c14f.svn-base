<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>

    <title>百宝箱我的上传_卫视文化乐园-华豫之门官方网站</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
  <meta name=keywords content="上传">
  <meta name=description content="我的上传">
<script type="text/javascript">
function myCollections() {
	location.href = "<c:url value='/BaiBaoMine_getShopList'/>";
}

function gotoUpload() {
	location.href = "<c:url value='/gotoBaiBaoMine_UpdateCollection'/>";
}

function deleteUpload(value) {
	if (confirm("确认要删除该藏品？")) {
		location.href = "<c:url value='/BaiBaoMine_DeleteCollection'/>?id="+value;
    }
}
function openCollection(id) {
	if (confirm("确认要开启该藏品的交易中转吗？ 确定将代表您同意交易中转！")) {
		  $.ajax({
	         type:'post',
	         url:'<c:url value='/BaiBaoMine_OpenCollection'/>?opentrade=1&id='+id,
	         success:function(data){
	         var jsonData = eval(data);
	         if(data=='0000'){
	         	alert("开启成功！");
	         	window.location.href="<c:url value='/BaiBaoMine_getShopList'/>";
	         }else{
	         	alert(data);
	         }
	        }
	     });
    }
}
function closeCollection(id) {
	if (confirm("确认要关闭该藏品的交易中转吗？")) {
		  $.ajax({
	         type:'post',
	         url:'<c:url value='/BaiBaoMine_OpenCollection'/>?opentrade=2&id='+id,
	         success:function(data){
	         var jsonData = eval(data);
	         if(data=='0000'){
	         	alert("关闭成功！");
	         	window.location.href="<c:url value='/BaiBaoMine_getShopList'/>";
	         }else{
	         	alert(data);
	         }
	        }
	     });
    }
}
</script>
<style type="text/css">
  .bbj_cangpin p{
    width: 248px;
    height: 28px;
  }
  .bbj_jiequ{
    width: 186px;
    display: block;
    overflow: hidden;
    white-space:nowrap;
  }
</style>
  </head>
${messages}
  <body>
<jsp:include page="../../head/header.jsp"></jsp:include>

    <!--main style ben-->
<div class="main_box clear">

  <jsp:include page="../common/myMenu.jsp"></jsp:include>

<div class="user_right fr clear">
     <div class="onuser_tit2">我的上传</div>
     <div class="onuser_box4 clear">
     <p class="tiile_wz">您已上传了<span class="red">${count}</span>件收藏品信息！</p>
         <ul class="charge_list">
            <li onclick="gotoUpload()" style="cursor: pointer;">我要上传</li>
           <li class="red" onclick="myCollections()" style="cursor: pointer;">查看已上传</li>

         </ul>
        <div class="bottom_line"></div>
         <c:forEach items="${list}" var="upload" varStatus="cdn">
           <c:if test="${cdn.count % 3 == 1}">
	         <ul class="pic_list2">  	         
           </c:if>       
            <li>
            <img src="http://116.255.149.172:7080/wswhly/Baibaourl//${fn:split(upload.imgurl,',')[0]}" width="235" height="216" alt="${upload.name}" />
                  <div class="tab">
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td class="name">藏品名称：</td>
                          <td>${upload.name}</td>
                        </tr>
                        <tr>
                          <td class="name">藏品编号：</td>
                          <td>${upload.baibaonum}</td>
                        </tr>
                        <tr>
                          <td class="name">所属类别：</td>
                          <td><span><c:if test="${fn:indexOf(upload.type,'14')>=0}">瓷器陶器</c:if></span>
										<span><c:if test="${fn:indexOf(upload.type,'15')>=0}">玉器赏石</c:if></span>
										<span><c:if test="${fn:indexOf(upload.type,'16')>=0}">青铜金器</c:if></span>
										<span><c:if test="${fn:indexOf(upload.type,'17')>=0}">书画古籍</c:if></span>
										<span><c:if test="${fn:indexOf(upload.type,'18')>=0}">木器雕品</c:if></span>
										<span><c:if test="${fn:indexOf(upload.type,'19')>=0}">古币钱币</c:if></span>
										<span><c:if test="${fn:indexOf(upload.type,'20')>=0}">珠宝首饰</c:if></span>
										<span><c:if test="${fn:indexOf(upload.type,'21')>=0}">油画雕塑</c:if></span>
										<span><c:if test="${fn:indexOf(upload.type,'22')>=0}">邮票邮品</c:if></span>
										<span><c:if test="${fn:indexOf(upload.type,'23')>=0}">其他藏品</c:if></span></td>
                        </tr>
                        <tr>
                          <td class="name">上传时间：</td>
                          <td>${upload.formatcreatedate}</td>
                        </tr>
                        <tr>
                          <td class="name">状&nbsp;&nbsp;&nbsp;&nbsp;态：</td>
                          <td>
                         				 <c:if test="${upload.state ==1}"><span>审核中<c:if test="${upload.opentrade ==1}">（已开启交易中转）</c:if><c:if test="${upload.opentrade ==null||upload.opentrade ==2}">（未开启交易中转）</c:if></span></c:if>
										<c:if test="${upload.state ==2}"><span>待售<c:if test="${upload.opentrade ==1}">（已开启交易中转）</c:if><c:if test="${upload.opentrade ==null||upload.opentrade ==2}">（未开启交易中转）</c:if></span></c:if>
										<c:if test="${upload.state ==3}"><span>正在交易中转<c:if test="${upload.opentrade ==1}">（已开启交易中转）</c:if><c:if test="${upload.opentrade ==null||upload.opentrade ==2}">（未开启交易中转）</c:if></span></c:if>
										<c:if test="${upload.state ==4}"><span>已售罄<c:if test="${upload.opentrade ==1}">（已开启交易中转）</c:if><c:if test="${upload.opentrade ==null||upload.opentrade ==2}">（未开启交易中转）</c:if></span></c:if>
                          </td>
                        </tr>
                      </table>
                </div>
                <ul class="button_box" style="margin-top:10px;">              
                  <li><a href="<c:url value='/BaiBao_getCollection?redirect=baibaojie/shopdetails&id='/>${upload.id}" target="_blank"><img src="<c:url value='/images/chakan.jpg'/>" alt="查看" /></a></li>
                   <c:if test="${upload.state ==1}">
	                  <li><a href="<c:url value='/gotoBaiBaoMine_UpdateCollection?id=${upload.id}'/>" ><img src="<c:url value='/images/xiugai.jpg'/>" alt="修改" /></a></li>
	                  <li><a href="javascript:void(0)" onclick="deleteUpload(${upload.id})"><img src="<c:url value='/images/shanchu.jpg'/>" alt="删除" /></a></li>
                  </c:if>
                   <c:if test="${upload.state !=1}">
                    <li><a href="javascript:alert('审核通过不能修改!')" ><img src="<c:url value='/images/xiugai.jpg'/>" alt="修改" /></a></li>
                    <li><a href="javascript:alert('审核通过不能删除!')" ><img src="<c:url value='/images/shanchu.jpg'/>" alt="删除" /></a></li>
                  </c:if>
                   <!-- <c:if test="${upload.opentrade ==1}">
                   <li><a href="javascript:void(0)" onclick="closeCollection(${upload.id})">关闭交易中转</a></li>
                   </c:if> -->
                   <!-- <c:if test="${upload.opentrade ==null||upload.opentrade ==2}">
                   <li><a href="javascript:void(0)" onclick="openCollection(${upload.id})">开启交易中转</a></li>
                   </c:if> -->
                </ul>
                <div class="op_lk_zz">
                <c:if test="${upload.state==1||upload.state==2}">
                  <c:if test="${upload.opentrade ==1}">
                   <p class="lock_zz"><a href="javascript:void(0)" onclick="closeCollection(${upload.id})">关闭交易中转</a></p>
                   </c:if>
                   <c:if test="${upload.opentrade ==null||upload.opentrade ==2}">
                   <p class="lock_zz"><a href="javascript:void(0)" onclick="openCollection(${upload.id})">开启交易中转</a></p>
                   </c:if>
                 </c:if>
                </div>
                       
               </li>
               <c:if test="${cdn.count % 3 == 0}">
            </ul>
          </c:if>
         </c:forEach>
         <c:if test="${listsize % 3 != 0}">  
            </ul>
        </c:if>
     </div>

   <c:if test="${count / pageSize > 1}">
     <div class="paging2 clear">
        <pg:pager url="BaiBaoMine_getShopList" items="${count}" maxPageItems="6" maxIndexPages="5">
            <pg:param name="pageSize" value="${pageSize}" />
	        <ul class="paging_list2">
	             <pg:first><li class="bg_box"><a href="${pageUrl}">首页</a></li></pg:first>
                 <pg:pages><li><a href="${pageUrl}">${pageNumber}</a></li></pg:pages>
                 <pg:last><li class="bg_box"><a href="${pageUrl}">尾页</a></li></pg:last>
	        </ul>
        </pg:pager>
   </div>
   </c:if>

  </div><!--user_right end-->
</div>
<!--main style end-->

<jsp:include page="../../foot/footer.jsp"></jsp:include>
  </body>
</html>
