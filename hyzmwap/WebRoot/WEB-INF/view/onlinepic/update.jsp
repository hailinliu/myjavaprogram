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
	<script type="text/javascript" src="<c:url value='/jquery/code-photoswipe-jQuery-1.0.11.min.js'/>"></script>
	<script src="<c:url value='/js/ajaxfileupload.js'/>"></script>
	<script type="text/javascript">

function inputFileChange(){
			var newfilename=<%=request.getSession().hashCode()%>+""+new Date().getTime();
			var fi=$("#uploadFile").val();
			var agofilename=fi.substring(fi.lastIndexOf('.') );
			var mydate = new Date();
			var month=mydate.getMonth()+1;
			var day=mydate.getDate();
			if(month<10){
				month="0"+(mydate.getMonth()+1);
			}
			if(day<10){
				day="0"+mydate.getDate();
			}
			var yyyyMMdd=mydate.getFullYear()+""+month+""+day+"/";
				$('#upimgstate').html("正在上传图片...");
		   				$.ajaxFileUpload({
			                url:"http://admin.wswhly.com/collect/uploadCollection?newfilename="+newfilename,//用于文件上传的服务器端请求地址
			                secureuri:false,//一般设置为false
			                fileElementId:'uploadFile',//文件上传空间的id属性  <input type="file" id="file" name="file" />
			                dataType: 'text',//返回值类型 一般设置为json
			                contentType: "multipart/form-data",
			                success: function (data)  //服务器成功响应处理函数
			                {
			                   $('#imglist').append("<img  class='img_lookbox'src='http://admin.wswhly.com/zengjipaipin//"+yyyyMMdd+newfilename+agofilename+"' width=80 height=80 onclick=\"deleteImg(this,'"+yyyyMMdd+newfilename+agofilename+"')\"  />");
			                   $('#imgid').val($('#imgid').val()+yyyyMMdd+newfilename+agofilename+",");
			                   $('#upimgstate').html("图片上传成功！");
			                } ,
				            error: function (msg) {
				              $('#upimgstate').html("图片上传失败！请重试！");
				            }
					  	})

   			}
 function deleteImg(obj1,name) {
 if(confirm('您确定要删除该图片吗？')){
			  $(obj1).closest(".img_lookbox").remove();
				var vals= $('#imgid').val();
			var vals= $('#imgid').val();
		$('#imgid').val(vals.replace(name+",",""));
		}
}



var userlevel=${userlevel};
var mes="";


function submit(){
		var id=$("#id").val();
		var typeid=$("#typeid").val();
		var zjuserid=${item.zjuserid};
		var name=$("#name").val();
		var pic=$("#imgid").val();
		var size=$("#size").val();
		var note=$("#note").val();
		if (typeid==undefined||typeid<=0) {
		     alert('请选择藏品分类！');
		     return ;
		}
		//if (userlevel!=0&&(zjuserid==undefined||zjuserid<=0)) {
		//     alert('请选择鉴定专家！');
		//     return ;
		//}
		//if(userlevel==0){
		//	zjuserid=-1;
		//}

		if(name==''){
			alert('请选填写藏品名称！');
		     return ;
		}
		if(name.length>20){
			 alert('藏品名称不超过20个汉字！');
		     return ;
		}
		if(size==''){
			alert('请选填写尺寸/重量！');
		     return ;
		}
		if(note==''){
			alert('请选填写备注描述！');
		     return ;
		}
		if(note.length>2000){
			 alert('备注描述不超过2000个汉字！');
		     return ;
		}
		//图片 upimg_num
		if($('.img_lookbox').length==0||pic==''){
			alert('请上传图片!');
			return ;
		}
		if($('.img_lookbox').length>5){
			alert('您最多可以上传5张图片！');
			return ;
		}
		var tagsb=false;
		if(mes!=''){
			if(confirm(mes)){
				tagsb=true;
			}
		}else{
			tagsb=true;
		}
		if(tagsb){
			$.ajax({
	        type:'post',
	        url:"<c:url value='/onlinepic/onlinepicupdate'/>",
	        data:{
	             id:id,
	             thcs:${item.thcs}+1,
	             name:name,
	             typeid:typeid,
	             zjuserid:zjuserid,
	             size:size,
	             note:note,
	             pic:pic
	    	},
	        success:function(data){
	           if(data==1){
	         	 alert('修改成功!');
	         	 window.location.href="<c:url value='/redirect?p=mine/onlinepic'/>";
	          }else if(data==-1){
	         	 alert('修改失败，请重试!');
	          }
	        }
		    });
		}

}

	</script>
  </head>
  <body>
  <div data-role="page">
  	<jsp:include page="../head/header.jsp?name=藏品上传"></jsp:include>
  	<div data-role="content">
			<button class="btn btn-primary btn-block btn-outlined" onclick="location.href='<c:url value="/redirect?p=mine/onlinepic"/>'">我的上传</button>
		<form id="uploadform" method="post" action="<c:url value='/mine/uploadCollection'/>" enctype="multipart/form-data" data-ajax="false">
		<input type="hidden" id="id" name="id" value="${item.id}"/>
			<div>
		      <label>藏品分类</label>
		      <select id="typeid" name="typeid">
	            <option value="0" selected="selected">-- 请选择 --</option>
	            <c:forEach items="${typelist}" var="type">
	              <option <c:if test="${item.typeid eq type.id}">selected="selected"</c:if> value="${type.id}">${type.name}</option>
	            </c:forEach>
	          </select>
		    </div>
		  <!--  <div>
		      <label>请选择鉴定专家</label>
		      <c:if test="${userlevel!=0}">
		      <select id="zjuserid" name="zjuserid">
	            <option value="0" selected="selected">-- 请选择 --</option>
	            <c:forEach items="${proflist}" var="prof">
	              <option <c:if test="${item.userid eq prof.userid}">selected="selected"</c:if> value="${prof.userid}">${prof.name}</option>
	            </c:forEach>
	          </select>
	            </c:if>
	           <c:if test="${userlevel==0}">
	            <c:forEach items="${proflist}" var="prof" varStatus="cdn">${prof.name}&nbsp;&nbsp;&nbsp;</c:forEach> <font color='red'>免费会员不提供选择专家！您可以升级为会员！</font><a href="<c:url value='/mine/gotovip'/>">升级会员</a>
	         </c:if>

		    </div> -->
		    <div>
		      <label>藏品名称（必填）</label>
		      <input id="name" type="text" name="name" value="${item.name}" maxlength="300" placeholder="1-20个汉字" />
		    </div>
		    <div>
		      <label>藏品尺寸/重量（必填）</label>
		      <input id="size" type="text" name="size" maxlength="300" value="${item.size}" placeholder="藏品 尺寸/重量 属性" />
		    </div>
		    <div>
		      <label>图片</label>
		      <input type="hidden" id="imgid" name="imgid" value="${item.pic}"/>
		      <input type="file"  name="uploadFile" id="uploadFile" onchange="inputFileChange()"/>
		    </div>
			<div id="imglist">
			<c:forTokens items="${item.pic}" delims="," var="val">
				    	<img class='img_lookbox' src="http://admin.wswhly.com/zengjipaipin/${val}" alt="" onclick="deleteImg(this,'${val}')"  width='80' height="80"/>
			</c:forTokens>
		     </div>
		      <div id="upimgstate"></div>
		          <p style="font-size:0.8em"><strong>提示：</strong> 上传成功之后在列表中显示！<br>
		点击图片可以删除！<br>图片大小： 支持 0 ~ 5M 图片上传<br>图片格式： jpg，jpeg，gif，bmp等。
		        </div>
		    <div>
		      <label>备注：（必填）</label>
		      <textarea name="note" id="note" placeholder="200个汉字" rows="10">${item.note}</textarea>
		    </div>
		</form>
		<input id="submitbutton" type="button" name="submit" class="btn" value="提交" onclick="submit()"/>
	</div>
  	<jsp:include page="../foot/footer.jsp"></jsp:include>
  </div>
</body>
</html>