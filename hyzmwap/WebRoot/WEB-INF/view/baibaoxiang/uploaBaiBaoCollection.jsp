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
			//显示加载器  
		    $.mobile.loading('show', {  
		        text: '正在上传...', //加载器中显示的文字  
		        textVisible: true, //是否显示文字  
		        theme: 'b',        //加载器主题样式a-e  
		        textonly: false,   //是否只显示文字  
		        html: ""           //要显示的html内容，如图片等  
		    }); 
		   				$.ajaxFileUpload({
			                url:"http://116.255.149.172:7080/wswhly/baibao/uploadBaibaourl/?newfilename="+newfilename,//用于文件上传的服务器端请求地址
			                secureuri:false,//一般设置为false
			                fileElementId:'uploadFile',//文件上传空间的id属性  <input type="file" id="file" name="file" />
			                dataType: 'text',//返回值类型 一般设置为json
			                contentType: "multipart/form-data",
			                success: function (data)  //服务器成功响应处理函数
			                {	
			                   $('#imglist').append("<img  class='img_lookbox'src='http://116.255.149.172:7080/wswhly/Baibaourl//"+yyyyMMdd+newfilename+agofilename+"' width=80 height=80 onclick=\"deleteImg(this,'"+yyyyMMdd+newfilename+agofilename+"')\"  />");
			                   $('#imgurl').val($('#imgurl').val()+yyyyMMdd+newfilename+agofilename+",");
			                    $.mobile.loading('hide');  
			                } ,
				            error: function (msg) {
				             $.mobile.loading('hide');  
				               $('#upimgstate').html("上传失败！请重试！");
				            }
					  	})
		}

 function deleteImg(obj1,name) {
			  $(obj1).closest(".img_lookbox").remove();
				var vals= $('#imgurl').val();
				$('#imgurl').val(vals.replace(name+",",""));
}
	
	$.mobile.loadingMessage = "\u6b63\u5728\u52a0\u8f7d\u6570\u636e\uff0c\u8bf7\u7a0d\u5019\u2026\u2026"; 
function checkForm() {
	if ($('#typeid').val() == 0) {
	   alert('请选择藏品类型');
       return false;
	}
	
	if ($.trim($('#nameid').val()).length <= 0) {
	   alert('请输入藏品名称');
       return false;
	}
	if ($('#priceid').val().length <= 0) {
	   alert('请填写价格');
       return false;
	}else{
		var reg = new RegExp('^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$');
	    if(!reg.test($('#priceid').val())){
	        alert("价格只能为数字!");
	         return false;
	    }
	}
	if ($('#imgurl').val().length <= 0) {
	   alert('请上传藏品图片');
       return false;
	}
	if ($('#nameid').val().length>20) {
	   alert('藏品名称最多为20个字！');
       return false;
	}
	if ($('#advertisementid').val().length>18) {
	   alert('广告语最多为18个字！');
       return false;
	}
	$.ajax({type: "POST",
	      dataType: "text",
	      url: "<c:url value='/BaiBaoMine_AddCollection'/>",
	      data: {
	      id:'${baibao.id}',
	      imgurl:$('#imgurl').val(),
	      type:$('#typeid').val(),
	      name:$('#nameid').val(),
	      isagree:$('input:radio[name=isagree]:checked').val(),
	      price:$('#priceid').val(),
	      advertisement:$('#advertisementid').val()
	      },
	      success:function(data){
	        if(data.indexOf("成功")){
	          //如果为添加
	          <c:if test="${baibao.id==null||baibao.id==''}">
	           if(confirm(data+'是否继续添加！')){
	           		location.reload();
	           }else{
	           	window.location.href="<c:url value='/BaiBaoMine_getShop'/>";
	           }
	          </c:if>
	          //如果为修改
	          <c:if test="${baibao.id!=null&&baibao.id!=''}">
	          	window.location.href="<c:url value='/redirect?p=baibaoxiang/bbx_cp'/>";
	          </c:if>
	        }else{
	        	alert(data);
	        }
	      }
	    });
}
	</script>
  </head>
  <body>
  <div data-role="page">
  	<jsp:include page="../head/header.jsp?name=藏品上传"></jsp:include>
  	<div data-role="content">
  	<form id="form1" name="form1">
			<button class="btn btn-primary btn-block btn-outlined" onclick="location.href='<c:url value='/redirect?p=baibaoxiang/bbx_cp'/>'">我的上传</button>
		  <input type="hidden" name="id" value="${baibao.id}"/>
         <input id="imgurl" type="hidden" name="imgurl" value="${baibao.imgurl}"/>
			<div>
		      <label>分类:</label>
		       <select id="typeid" name="type">
                               <option value="0">-- 请选择 --</option>
                               <c:forEach items="${typeList}" var="type">
                                 <option <c:if test="${baibao.type eq type.id}">selected="selected"</c:if> value="${type.id}">${type.name}</option>
                               </c:forEach>
                             </select>
		    </div>
		    <div>
		      <label>藏品名称(*1-20个汉字)：</label>
		      <input id="nameid" style="" type="text" name="name" maxlength="300" value="${baibao.name}" placeholder="" />
		    </div>
		    <div>
		      <label>价格(*价格)：</label>
		       <input id="priceid" style="width:100px;" type="text" name="price" maxlength="300" value="${baibao.price}" placeholder="" />
		    </div>
		    <div>
		      <label>交易中转：</label>
		      <label><input type="radio" checked="checked" name="isagree" <c:if test="${baibao.isagree ==1}">checked="checked"</c:if> value="1"/>同意</label>
              <label><input type="radio" name="isagree" <c:if test="${baibao.isagree==2}">checked="checked"</c:if> value="2"/>不同意</label>
		    </div>
		    <div>
		      <label>广告语(*1-18个汉字)：</label>
		    <label><input id="advertisementid" style="" type="text" name="advertisement" maxlength="300" value="${baibao.advertisement}" placeholder="" /></label>
		    </div>
		    <div>
		      <label>上传图片：</label>
		     <input type="file" name="uploadFile" id="uploadFile" onchange="inputFileChange()" />
					<div id="imglist">
					<c:forTokens items="${baibao.imgurl}" delims="," var="val">
				    	<img class='img_lookbox' src="http://116.255.149.172:7080/wswhly/Baibaourl/${val}" alt="" onclick="deleteImg(this,'${val}')"  width='80' height="80"/>
					</c:forTokens>
					</div>
					</p>
					<p><strong>提示：</strong> 上传成功之后在列表中显示！</p>
					<p>点击图片可以删除！</p>
					<p>图片大小： 支持 0 ~ 5M 图片上传</p>
					<p>图片格式： jpg，jpeg，gif，bmp等</p>
		    </div>
		    <input id="submitbutton" type="button" name="submit" class="btn" value="提交"  onclick="checkForm()"/>
		</form>
	</div>
  	<jsp:include page="../foot/footer.jsp"></jsp:include>
  </div>
</body>
</html>