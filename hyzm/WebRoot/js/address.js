var countycode='';//县
var citycode='';//市
var provincecode='';//省
var dicaddressurl='http://www.wswhly.com/hyzm/getDicaddress?s='+Math.random()+'&parentcode=';
 function getAddress(coucode,showid){
 //生成span
 $("#"+showid).html('<span id="provincespan"></span> <span id="cityspan"></span><span id="countyspan"></span>');
 countycode=coucode;
 if(countycode!=''){
          citycode=countycode.substring(0,4)+'00'
          provincecode=countycode.substring(0,2)+'0000';//省
        }
        getProvince();
        getCity(provincecode);
        getCounty(citycode);
 }
 //获取所有省份
 function getProvince(){
 var con= "<select id='provincecode' name='provincecode' onchange='getCity(this.options[this.selectedIndex].value)'> <option value=''>--请选择省--</option>";
 	$.ajax({
        type:'post',
        url:dicaddressurl+"0",
        success:function(data){
         var jsonData = eval(data);
                $.each(jsonData, function(index, objVal) {
	                if(provincecode==objVal["code"]){
	                 con+="<option selected='selected' value='"+objVal["code"]+"'>"+objVal["name"]+"</option>";
	                }else{
	                con+="<option value='"+objVal["code"]+"'>"+objVal["name"]+"</option>";
	                }
                });
                 con+="</select>";
                 $("#provincespan").html(con);
        }
     });
 }
 
 //加载根据省份code加载市
 function getCity(provincecode_c){
 if(provincecode_c==''){$("#cityspan").html("<select><option value=''>--请选择市--</option></select>");$("#countyspan").html("<select><option value=''>--请选择县--</option></select>");return;}
 var con= "<select id='citycode' name='citycode' onchange='getCounty(this.options[this.selectedIndex].value)'> <option value=''>--请选择市--</option>";
 	$.ajax({
        type:'post',
         url:dicaddressurl+provincecode_c,
        success:function(data){
        //alert(data);
         var jsonData = eval(data);
         var indexval='';
                $.each(jsonData, function(index, objVal) {
               		if(citycode==objVal["code"]){
	                 con+="<option selected='selected' value='"+objVal["code"]+"'>"+objVal["name"]+"</option>";
	                 indexval=objVal["code"];
	                }else{
	                con+="<option value='"+objVal["code"]+"'>"+objVal["name"]+"</option>";
	                }
                });
                 con+="</select>";
                 $("#cityspan").html(con);
                 if(indexval==''){
                  getCounty('');
                 }
        }
     });
 }
 var CountyjsonData ="";
  //加载根据市code加载县
  function getCounty(citycode_c){
  if(citycode_c==''){$("#countyspan").html("<select id='countycode' name='countycode'><option value=''>--请选择县--</option></select>");return;}
   var con= "<select id='countycode' name='countycode'> <option value=''>--请选择县--</option>";
 	$.ajax({
        type:'post',
         url:dicaddressurl+citycode_c,
        success:function(data){
          CountyjsonData = eval(data);
                $.each(CountyjsonData, function(index, objVal) {
               		if(countycode==objVal["code"]){
	                 con+="<option selected='selected' value='"+objVal["code"]+"'>"+objVal["name"]+"</option>";
	                }else{
	                con+="<option value='"+objVal["code"]+"'>"+objVal["name"]+"</option>";
	                }
                });
                 con+="</select>";
                 $("#countyspan").html(con);
        }
     });
  }
  //验证是否选择
   function CheckCounty(){
   var checkcountycode=$("#countycode").val();
   if (checkcountycode!='undefined'&&checkcountycode!=null&&checkcountycode!=''){
   		 	return true;
   		}
   	return false;
  }
  //获取选中的县编码
  function getCountyCode(){
  return $("#countycode").val();
  }
  //获取选中的市编码
  function getCityCode(){
  return $("#citycode").val();
  }
  //获取选中的省份编码
  function getProvinceCode(){
  return $("#provincecode").val();
  }
  //获取选中的县名称
  function getCountyName(){
   var countyname_c="";
   var checkcountycode=$("#countycode").val();
   if (checkcountycode!='undefined'&&checkcountycode!=null&&checkcountycode!=''){
   	$.each(CountyjsonData, function(index, objVal) {
   		if(checkcountycode==objVal["code"]){
   		countyname_c=objVal["name"];
   		}
   	});
   	}
   	return countyname_c ;
  }
  //获取选择县的全称
  function getAddressFullName(){
  var fullname_c='';
   var checkcountycode=$("#countycode").val();
   if (checkcountycode!='undefined'&&checkcountycode!=null&&checkcountycode!=''){
   	$.each(CountyjsonData, function(index, objVal) {
   		if(checkcountycode==objVal["code"]){
   		fullname_c=objVal["fullname"];
   		}
   	});
   }
   return fullname_c;  	
  }
  
  
  
  