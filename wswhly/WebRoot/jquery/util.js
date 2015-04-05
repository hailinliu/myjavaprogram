function formatDay(addday){
	var date = new Date(); 
	date.setDate(date.getDate()+addday);
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	var d = date.getDate();
	return y + '-' + (m < 10 ? '0' + m : m) + '-' + (d < 10 ? '0' + d : d);
}

function formatMonth(addmonth){
	var date = new Date(); 
	date.setMonth(date.getMonth()+addmonth);
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	var d = date.getDate();
	return y + '-' + (m < 10 ? '0' + m : m) + '-' + (d < 10 ? '0' + d : d);;
}

function getQuarterStartMonth(){
	var now = new Date();
	var y = now.getFullYear();
	var nowMonth = now.getMonth()+1;
	var m = 1;
	if(nowMonth<3){
		m = 1;
	}
	if(2<nowMonth && nowMonth<6){
		m = 3;
	}
	if(5<nowMonth && nowMonth<9){
		m = 6;
	}
	if(nowMonth>8){
		m = 9;
	}
	return y + '-' + (m < 10 ? '0' + m : m) + '-01';
}

function getYearStartMonth(){
	var now = new Date();
	var y = now.getFullYear();
	return y + '-01-01';
}

function getCurrentTime(){
	var date = new Date();
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	var d = date.getDate();
	var hh = date.getHours(); 
	var mm = date.getMinutes(); 
	var ss = date.getSeconds(); 
	return y + '-' + (m < 10 ? '0' + m : m) + '-' + (d < 10 ? '0' + d : d) + ' ' + (hh < 10 ? '0' + hh : hh) + ':' + (mm < 10 ? '0' + mm : mm) + ':' + (ss < 10 ? '0' + ss : ss);
}

//身份证格式验证
function checkCardidStyle(idcard){    
  var Errors=new Array("验证通过!","身份证号码位数不对!","身份证号码出生日期超出范围或含有非法字符!","身份证号码校验错误!","身份证地区非法!");    
  var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}    
  var idcard,Y,JYM;    
  var S,M;    
  var idcard_array = new Array();    
   idcard_array = idcard.split("");    
  if(area[parseInt(idcard.substr(0,2))]==null) return Errors[4];    
  switch(idcard.length){    
    case 15:    
      if ((parseInt(idcard.substr(6,2))+1900) % 4 == 0 || ((parseInt(idcard.substr(6,2))+1900) % 100 == 0 && (parseInt(idcard.substr(6,2))+1900) % 4 == 0 )){    
         ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性    
       }    
      else{    
         ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性    
       }    
      if(ereg.test(idcard))    
        return "<font color='green'>"+Errors[0]+"</font>";    
      else   
        return "<font color='red'>"+Errors[2]+"</font>";    
    break;    
  case 18:    
    if ( parseInt(idcard.substr(6,4)) % 4 == 0 || (parseInt(idcard.substr(6,4)) % 100 == 0 && parseInt(idcard.substr(6,4))%4 == 0 )){    
       ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式    
     }    
    else{    
     ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式    
     }    
    if(ereg.test(idcard)){    
       S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7 + (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9 + (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10 + (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5 + (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8 + (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4 + (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2 + parseInt(idcard_array[7]) * 1 + parseInt(idcard_array[8]) * 6 + parseInt(idcard_array[9]) * 3 ;    
       Y = S % 11;    
       M = "F";    
       JYM = "10X98765432";    
       M = JYM.substr(Y,1);    
      if(M == idcard_array[17])    
        return "<font color='green'>"+Errors[0]+"</font>";    
      else   
        return "<font color='red'>"+Errors[3]+"</font>";    
     }    
    else   
      return "<font color='red'>"+Errors[2]+"</font>";    
    break;    
  default:    
    return "<font color='red'>"+Errors[1]+"</font>";    
    break;    
   }    
}

//手机号格式验证
function checkMobileStyle(mobile){
	var partten = /^((\(\d{3}\))|(\d{3}\-))?13[0-9]\d{8}|15[0-9]\d{8}|18[0-9]\d{8}$/;
	return partten.test(mobile);
}
//验证储物柜柜号和箱号
function checkNumStyle(num){
	var partten = /^\d{1,2}$/;
	return partten.test(num);
}