<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.taobao.api.internal.util.WebUtils"/>
<jsp:directive.page import="java.io.IOException"/>
<jsp:directive.page import="com.hyzm.util.ComplTosimple"/>
<jsp:directive.page import="java.net.URLEncoder"/>
<%
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <% String urlss = basePath+"redirect/?"+request.getQueryString();
 String lotsid=urlss.substring(urlss.lastIndexOf("/")+1,urlss.length());
 String zcid="";
 try{
 	zcid=urlss.substring(urlss.lastIndexOf("/id/")+4,urlss.lastIndexOf("/type/"));
 }catch(Exception e){
 }
  urlss=URLEncoder.encode(urlss, "UTF-8");
   %>
  <%
   	String url="http://119.254.110.231:8088/ny/home/index.php/"+request.getParameter("url");
   	System.out.println(url);
      Map<String,String> postData = new HashMap<String,String>();  
      postData.put("pid", request.getParameter("pid"));  
      postData.put("anumber", request.getParameter("anumber"));  
      postData.put("actId", request.getParameter("actId"));  
      postData.put("cnt", request.getParameter("cnt"));  
      String s="";
      try{
      s=WebUtils.doPost(url, postData, 30000, 30000);
       s=s.replaceAll("/ny/", "http://119.254.110.231:8088/ny/");
      s=s.replace("class=\"row row-black-bg\"", "style=\"display:none;\"");
      s=s.replaceAll("class=\"footer-nav\"", " class=\"footer-nav\" style=\"display: none;\"");
      s=s.replaceAll("class=\"col-xs-12 footer\"", " class=\"col-xs-12 footer\" style=\"display: none;\"");
      s=s.replace("http://119.254.110.231:8088/ny/home/index.php",basePath+"redirect?p=daigou/JSD2&url=");
      s=s.replaceAll("class=\"col-xs-12 global-width detail-qrcode\"","class=\"col-xs-12 global-width detail-qrcode\" id=\"ewmdiv\"");
 	  s=s.replaceAll("function getList","function getssss");
 	   s=s.replaceAll("ny/commons/js/custom.js","");
 	   s=s.replaceAll("JSD2&url=/User/goFeedback","DaiGouInfo&conurl="+urlss+"&lotsid="+lotsid);
      }catch(IOException e){
          e.printStackTrace();
      }
   %>
   
<%--   //繁体转简体--%>
   <%=new ComplTosimple().complTosimple(s)%>
<script>
 function getList(from, callback){
          if (loading){
              return false;
          }
          loading = true;
          $(".loading-list").show();
    	  $.get("<%=basePath%>getJSD?loadAmount="+loadAmount+"&from="+from+"&zcid=<%=zcid%>",
                function(result){
                callback(result);
                loading = false;
                $(".loading-list").hide();
                });
      }
function lxfEndtime(){
          $(".time-set").each(function(){
                var lxfday=$(this).attr("lxfday");//用来判断是否显示天数的变量
                var endtime = new Date($(this).attr("endtime")).getTime();//取结束日期(毫秒值)
                var nowtime = new Date().getTime();        //今天的日期(毫秒值)
                var youtime = endtime-nowtime;//还有多久(毫秒值)
                var seconds = youtime/1000;
                var minutes = Math.floor(seconds/60);
                var hours = Math.floor(minutes/60);
                var days = Math.floor(hours/24);
                var CDay= days ;
                var CHour= hours % 24;
                var CMinute= minutes % 60;
                var CSecond= Math.floor(seconds%60);//"%"是取余运算，可以理解为60进一后取余数，然后只要余数。
                if(endtime<=nowtime){
                        $(this).html("活动已结束")//如果结束日期小于当前日期就提示过期啦
                        }else{
                                if($(this).attr("lxfday")=="no"){
                                        $(this).html("<i>距拍卖开始还有:</i><span>"+CHour+"</span>时<span>"+CMinute+"</span>分<span>"+CSecond+"</span>秒");          //输出没有天数的数据
                                        }else{
                        $(this).html("距拍卖开始还有:&nbsp;<span>"+days+"</span>天<span>"+CHour+"</span>时<span>"+CMinute+"</span>分<span>"+CSecond+"</span>秒");          //输出有天数的数据
                                }
                        }
          });
   setTimeout("lxfEndtime()",1000);
  };
  $(document).ready(function() {
	 $("#ewmdiv").html("<img src='http://qr.liantu.com/api.php?text=<%=urlss%>'/>");
	 $(".detail-title").append("<a href='<%=basePath%>redirect?p=daigou/DaiGouInfo&conurl=<%=urlss%>&lotsid=<%=lotsid%>' style='color: #fff;background: #810B0B;padding: 8px 20px;text-decoration: none;border-radius: 5px;'>申请代购</a>");
	  $(".pull-right").hide();
    });
</script>