<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<div class="user_left fl clear">
    <div class="user_bt">用户中心</div>
      <div class="left_navtop"></div>
      <div class="left_nav" >
      <dl class="user_list">
              <dt>账户管理</dt>
              <dd><a href="<c:url value='/mine/gotovip'/>" style="font-weight:bold">会员级别</a></strong></dd>
              <dd><a href="<c:url value='/user/UserCenter'/>">个人信息</a></dd>
              <dd><a href="<c:url value='/redirect?p=mine/changePassword'/>">修改密码</a></dd>

        </dl>
        <dl class="user_list">
              <dt>拍品管理</dt>
              <dd><a href="<c:url value='/collect/gotomylylots'/>" style="font-weight:bold">我的拍品</a></strong></dd>


        </dl>
        <dl class="user_list clear">
            <dt>海选管理</dt>
            <dd><a href="<c:url value='/mine/gotoenroll'/>" style="font-weight:bold">网上报名</a></dd>
            <dd><a href="<c:url value='/mine/applicationHistory'/>">报名历史</a></dd>
            <dd><a href="<c:url value='/mine/gotoupload'/>">上传藏品</a></dd>
            <!-- <dd><a href="<c:url value='/mine/mycollect'/>">我的收藏</a></dd> -->
        </dl>
        <dl class="user_list">
              <dt>资金管理</dt>
              <dd><a href="<c:url value='/redirect?p=mine/recharge1'/>" style="font-weight:bold">充值</a></dd>
              <dd><a href="<c:url value='/mine/mymoneylist'/>">收支明细</a></dd>
              <dd><a href="<c:url value='/mine/mypointslist'/>">积分明细</a></dd>


       </dl>

     </div>
     <div class="left_navbottom"></div>
  </div>