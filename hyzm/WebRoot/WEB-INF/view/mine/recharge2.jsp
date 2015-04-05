<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>华豫之门-第三方充值</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/user.css'/>"/>
	<script type="text/javascript" src="<c:url value='/js/jquery-1.7.2.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/alert.js'/>"></script>
	<meta name=keywords content="华豫之门 河南华豫之门 郑州华豫之门 河南郑州华豫之门 中原华豫之门 河南中原华豫之门 河南郑州中原华豫之门 郑州中原华豫之门 河南卫视华豫之门 华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页">
	<meta name=description content="华豫之门首页 河南华豫之门首页 郑州华豫之门首页 河南郑州华豫之门首页 中原华豫之门首页 河南中原华豫之门首页 河南郑州中原华豫之门首页 郑州中原华豫之门首页 河南卫视华豫之门首页 古今文化寻根 打开华豫之门">
		<script type="text/javascript">
	
	function submitrecharge() {
		var money = $("#rechargemoney").val();
		if(money == ""){
			alert("请输入充值金额");
			return;
		}
		if(!isPriceNumber(money)){
			alert("请输入正确的充值金额");
			return;
		}
		$("#alipayment").attr('action', "<c:url value='/pay'/>");
  		$("#alipayment").submit();
  	}
	
	function isPriceNumber(_keyword){  
	    if(_keyword == "0" || _keyword == "0." || _keyword == "0.0" || _keyword == "0.00"){  
	        _keyword = "0"; return true;  
	    }else{  
	        var index = _keyword.indexOf("0");  
	        var length = _keyword.length;  
	        if(index == 0 && length>1){/*0开头的数字串*/  
	            var reg = /^[0]{1}[.]{1}[0-9]{1,2}$/;  
	            if(!reg.test(_keyword)){  
	                return false;  
	            }else{  
	                return true;  
	            }  
	        }else{/*非0开头的数字*/  
	            var reg = /^[1-9]{1}[0-9]{0,10}[.]{0,1}[0-9]{0,2}$/;  
	            if(!reg.test(_keyword)){  
	                return false;  
	            }else{  
	                return true;  
	            }  
	        }             
	        return false;  
	    }  
	}  
  	</script>
</head>

<body>
 <jsp:include page="../head/header.jsp"></jsp:include>

<!--main style ben-->
<div class="main_box clear">

  <jsp:include page="common/myMenu.jsp"></jsp:include>
  
  <div class="user_right fr clear">
     <div class="onuser_tit2">充值</div>
     
     <div class="onuser_box3 clear">
         <ul class="charge_list">
           <li><a href="<c:url value='/redirect?p=mine/recharge1'/>">网银在线充值</a></li>
           <li class="red"><a href="<c:url value='/redirect?p=mine/recharge2'/>">支付宝/财付通 余额充值</a></li>
           <li><a href="<c:url value='/redirect?p=mine/recharge3'/>">线下转款汇款</a></li>
         </ul>
        <div class="bottom_line"></div>
        <form id="alipayment" action="" method=post target="_blank">
        <ul class="money_list">
          <li>充值金额：</li>
          <li><input type="text" id="rechargemoney" name="money" value="" maxlength="10" /></li>
          <li>元</li>
        </ul>
        </form>
        <ul class="platform_list">
           <li>选择支付平台：</li>
           <li class="blod"><img src="images/zfb_1.jpg" onclick="" /></li>
           <li><img src="images/zfb_3.jpg"  onclick="alert('暂不支持');"/></li>
        </ul>
        
        <div class="submit_button"><input type="button" name="" onclick="submitrecharge()"/></div>     
            
     </div>
     
     

  </div><!--user_right end-->
  
</div>
<!--main style end-->  
<jsp:include page="../foot/footer.jsp"></jsp:include>

</body>
</html>