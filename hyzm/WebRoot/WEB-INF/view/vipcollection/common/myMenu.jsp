<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<div class="user_left fl clear">
    <div class="user_bt">会员藏品区</div>
      <div class="left_nav" style="height:auto;padding-bottom:20px;border-bottom:1px solid #ccc;">

        <dl class="user_list clear">
            <dt>会员藏品区藏品</dt>
            <dd><a href="<c:url value='/vote/gotovipupload'/>" style="font-weight:bold">发布藏品</a></dd>
          <!--   <dd><a href="<c:url value='/vote/activityAllList'/>">我要投票</a></dd> -->
            <!-- <dd><a href="<c:url value='/redirect?p=gotohyzm/gotohyzm'/>">往期回顾</a></dd> -->
            <dd><a href="<c:url value='/vote/myVipRelease'/>">我的发布</a></dd>
        </dl>
        <!-- <dl class="user_list">
              <dt>资金管理</dt>
              <dd><a href="<c:url value='/redirect?p=mine/recharge1'/>" style="">充值</a></dd>
              <dd><a href="<c:url value='/mine/mymoneylist'/>">收支明细</a></dd>
              <dd><a href="<c:url value='/mine/mypointslist'/>">积分明细</a></dd>


       </dl> -->


     </div>
  </div>