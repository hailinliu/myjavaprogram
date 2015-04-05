<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <html>
 <head>
   <title>用户详情</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	function getuserinfo(id){
      $.ajax({
		      type:'post',
		     url:"/wswhly/sys/getUserById", 
		      data:'id='+id,
		      success:function(data){
		      data=$.parseJSON(data);	
		   
		           $('#oneusernameid').empty().append(data.username);
		           $('#onesexid').empty().append(data.sex);
					    	if(data.sex == 1){
						    $('#onesexid').empty().append('男');
					    }else if(data.sex == 2){
						    $('#onesexid').empty().append('女');
						}else {
						    $('#onesexid').empty().append('保密');
						}
					    $('#onemobileid').empty().append(data.mobile);
					    $('#onecreatedateid').empty().append(data.createdate);
					    $('#oneemailid').empty().append(data.email);
					    $('#onerealnameid').empty().append(data.realname);
					    $('#oneidcardid').empty().append(data.idcard);
					    $('#onejobid').empty().append(data.jobname);
					    $('#oneaddressid').empty().append(data.address);
					    $('#onepointid').empty().append(data.point);
					    $('#onemoneyid').empty().append(data.money);
					    $('#onelevelid').empty().append(data.username);
					    if(data.level == 0){
						     $('#onelevelid').empty().append('免费会员');
						}else if(data.level == 1){
						     $('#onelevelid').empty().append('星级会员');
						}else if(data.level ==2){
						     $('#onelevelid').empty().append('贵宾会员');
						}else if(data.level ==3){
						     $('#onelevelid').empty().append('高级会员');
						}else if(data.level ==4){
						     $('#onelevelid').empty().append('超级会员');
						}
						if(data.state == 1){
						    $('#onestateid').empty().append('正常');
					    }else if(data.state == 2){
						    $('#onestateid').empty().append('冻结');
						}else if(data.state == 3){
						    $('#onestateid').empty().append('删除');
						}
		      }
		   });
		   $('#scanuser').window('open');	
}
	$(function(){
		$('#scanuser').window('close');

				});
			
	</script>
	<style type="text/css">
		input,textarea{
			border:1px solid #ccc;
			padding:2px;
		}
		body{
	        FONT: 9pt 微软雅黑;
	        background:url(<c:url value="/images/lightblue.jpg"/>);
	    }
	    TD {
	FONT: 12px 微软雅黑
}
#oneusertable {border-right:1px solid lightgreen;border-bottom:1px solid green}
#oneusertable td{border-left:1px solid lightgreen;border-top:1px solid green}
	</style>
	</head>
	<body>
	<div id="scanuser" class="easyui-window" data-options="title:'用户详情',iconCls:'icon-search',modal:true" style="width:700px;height:500px;padding:5px;background: #fafafa;overflow:auto;">
	   <div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center',border:false" style="padding:10px;background:#fff;border:1px solid #ccc;">
			<table id="oneusertable" width="100%" cellpadding="5" cellspacing="1">
			  <tr>
			    <td width="30%">登录名：</td>
			    <td id="oneusernameid"></td>
			  </tr>
			  <tr>
			    <td>性别：</td>
			    <td id="onesexid"></td>
			  </tr>
			  <tr>
			    <td>手机号：</td>
			    <td id="onemobileid"></td>
			  </tr>
			  <tr>
			    <td>创建时间：</td>
			    <td id="onecreatedateid"></td>
			  </tr>
			  <tr>
			    <td>电子邮箱：</td>
			    <td id="oneemailid"></td>
			  </tr>
			  <tr>
			    <td>真实姓名：</td>
			    <td id="onerealnameid"></td>
			  </tr>
			  <tr>
			    <td>身份证号：</td>
			    <td id="oneidcardid"></td>
			  </tr>
			  <tr>
			    <td>职业：</td>
			    <td id="onejobid"></td>
			  </tr>
			  <tr>
			    <td>地址：</td>
			    <td id="oneaddressid"></td>
			  </tr>
			  <tr>
			    <td>积分：</td>
			    <td id="onepointid"></td>
			  </tr>
			  <tr>
			    <td>余额：</td>
			    <td id="onemoneyid"></td>
			  </tr>
			  <tr>
			    <td>会员等级：</td>
			    <td id="onelevelid"></td>
			  </tr>
			  <tr>
			    <td>状态：</td>
			    <td id="onestateid"></td>
			  </tr>
			  
			</table>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#scanuser').window('close');">关闭</a>
		</div>
	  </div>
	</div>
</body>
</html>