<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>华豫之门官方网站-卫视文化乐园</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <link rel="stylesheet" href="<c:url value='/jquery/jquery.mobile-1.4.3.min.css'/>" />
	<script src="<c:url value='/jquery/jquery-1.11.1.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.mobile-1.4.3.min.js'/>"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		
	});

	function submitform(){
		if($("#y").val() == ""){
			alert("请选择出生于那一年！");
	    	return;
		}
		if($("input[name=2]:checked").length == 0){
			alert("请选择收藏投资品类！");
	    	return;
		}
		if($("input[name=3]:checked").length == 0){
			alert("请选择收藏渠道！");
	    	return;
		}
		if($("input[name=4]:checked").length == 0){
			alert("请选择鉴定渠道！");
	    	return;
		}
		if($("input[name=5]:checked").length == 0){
			alert("请选择服务！");
	    	return;
		}
		if($("input[name=6]:checked").length == 0){
			alert("请选择收藏目的！");
	    	return;
		}
		$("#surveyform").submit();
	}

	</script>
  </head>
  <body>
  <div data-role="page">
  	<jsp:include page="../head/header.jsp?name=信息调查"></jsp:include>
  	<div data-role="content">
    	<form id="surveyform" name="form1" method="post" action="<c:url value='/surveyInfo'/>" data-ajax="false">
			<div>
		      <label>出生于：</label>
		      <select name="YY" id="y"></select>
		    </div>
		    <div>
		      <label>收藏履历</label>
		      <label><input type="radio" name="1" value="2年以下" checked="checked">2年以下</label>
		      <label><input type="radio" name="1" value="2-5年">2-5年</label>
		      <label><input type="radio" name="1" value="5-10年">5-10年</label>
		      <label><input type="radio" name="1" value="10年以上">10年以上</label>
		    </div>
		    <div>
		    	<label>收藏投资品类</label>
			    <label><input type="checkbox" name="2" value="瓷器陶器">瓷器陶器</label>
			    <label><input type="checkbox" name="2" value="玉器杂项">玉器杂项</label>
			    <label><input type="checkbox" name="2" value="书画古籍">书画古籍</label>
			    <label><input type="checkbox" name="2" value="青铜佛像">青铜佛像</label>
			    <label><input type="checkbox" name="2" value="家具木器">家具木器</label>
			    <label><input type="checkbox" name="2" value="珠宝国石">珠宝国石</label>
		    </div>
		    <div>
		      <label>收藏渠道</label>
		      <label><input type="checkbox" name="3" value="朋友圈">朋友圈</label>
		      <label><input type="checkbox" name="3" value="古玩城">古玩城</label>
		      <label><input type="checkbox" name="3" value="拍卖会">拍卖会</label>
		      <label><input type="checkbox" name="3" value="商家">商家</label>
		      <label><input type="checkbox" name="3" value="网络购买">网络购买</label>
		    </div>
		    <div>
		      <label>鉴定渠道</label>
		      <label><input type="checkbox" name="4" value="朋友圈">朋友圈</label>
		      <label><input type="checkbox" name="4" value="古玩商">古玩商</label>
		      <label><input type="checkbox" name="4" value="商家朋友">商家朋友</label>
		      <label><input type="checkbox" name="4" value="专业鉴定机构">专业鉴定机构</label>
		      <label><input type="checkbox" name="4" value="行业类项专家">行业类项专家</label>
		      <label><input type="checkbox" name="4" value="华豫之门专家">华豫之门专家</label>
		    </div>
		    <div>
		      <label>服务</label>
		      <label><input type="checkbox" name="5" value="出手藏品">出手藏品</label>
		      <label><input type="checkbox" name="5" value="购买藏品">购买藏品</label>
		      <label><input type="checkbox" name="5" value="鉴定估值">鉴定估值</label>
		      <label><input type="checkbox" name="5" value="浏览其他信息">浏览其他信息</label>
		    </div>
		    <div>
		      <label>收藏目的</label>
		      <label><input type="checkbox" name="6" value="个人爱好">个人爱好</label>
		      <label><input type="checkbox" name="6" value="投资">投资</label>
		    </div>
		    <div>
		      <label>参加过《华豫之门》的海选活动</label>
		      <label><input type="radio" name="7" value="否" checked="checked">否</label>
		      <label><input type="radio" name="7" value="是">是</label>
		    </div>
		    <div>
		      <label>藏品是否登上过《华豫之门》</label>
		      <label><input type="radio" name="8" value="未上节目" checked="checked">未上节目</label>
		      <label><input type="radio" name="8" value="上过节目真品">上过节目真品</label>
		      <label><input type="radio" name="8" value="上过节目仿品">上过节目仿品</label>
		      <label><input type="radio" name="8" value="登过珍宝台">登过珍宝台</label>
		    </div>
		    <div>
		      <label>艺术品价位区间</label>
		      <label><input type="radio" name="9" value="2万以下" checked="checked">2万以下</label>
		      <label><input type="radio" name="9" value="5万以下">5万以下</label>
		      <label><input type="radio" name="9" value="10万以下">10万以下</label>
		      <label><input type="radio" name="9" value="50万以下">50万以下</label>
		      <label><input type="radio" name="9" value="100万以下">100万以下</label>
		      <label><input type="radio" name="9" value="100万以上">100万以上</label>
		    </div>
		    <div>
		      <label>是否愿意接收信息推送</label>
		      <label><input type="radio" name="10" value="愿意" checked="checked">愿意</label>
		      <label><input type="radio" name="10" value="不愿意">不愿意</label>
		    </div>
		    <div>
		      <label>建议或意见</label>
		      <textarea name="memo" placeholder="200个汉字" rows="10"></textarea>
		    </div>
		</form>
		<input id="submitbutton" type="button" name="submit" class="btn" value="提交" onclick="submitform()"/>
  	</div>
  	<jsp:include page="../foot/footer.jsp"></jsp:include>
  </div>
 <script type="text/javascript">
 function YYstart() {
		//先给年下拉框赋内容
		var y = new Date().getFullYear();
		document.getElementById("y").options.add(new Option("请选择年", ""));

		for ( var i = (y - 100); i < (y - 10); i++)
			//以今年为准，前*年，后年
			document.form1.YY.options.add(new Option(" " + i + " 年", i));
		document.form1.YY.value = y;
		document.getElementById("y").options[0].selected = "true";
	}

	if (document.attachEvent)
		window.attachEvent("onload", YYstart);
	else
		window.addEventListener('load', YYstart, false);
 </script>
</body>
</html>