$(function(){
	//手机号码验证
	$("#consigneemobile").blur(function(){
		var sMobile=$(this).val();
		if(!(/^1[123456789][0-9]\d{4,8}$/.test(sMobile))){ 
        alert("请正确填写您的手机号码！"); 
        $(this).focus(); 
        return false; 
    } 	
	})
	
	
		
	// 收货地址
	function choose(){
		$("#addressUl li").each(function(){
			$(this).addClass("Selected")
			$(this).find("input:radio").attr("checked","checked");
			$("#addressUl").css("display","block");
			
		})
		}
	

	//提交新地址	
	$("#beCreat").click(function(){
		if($('#consignee').val()=="" ){ alert("收件人姓名不能为空");}
		else if($('#consigneemobile').val()==""){ alert("收件人电话不能为空");}
		else if($('#consigneeaddress').val()==""){ alert("收货地址不能为空");}
		else{
		var $confirm=confirm("请确定您填写的信息："+"收件人姓名："+$('#consignee').val()+"收件人电话："+$('#consigneemobile').val()+"收货地址："+$('#consigneeaddress').val());
		var $creatLi="<li class='F14 Selected POINTER'><label class='FL'><span class='addressInfo'>"+$('#consigneeaddress').val()+"，</span><span class='zipCode'>"+$('#consignee').val()+"收，</span><span class='phoneNum'>"+$('#consigneemobile').val()+"</span></label></li>";
				if($confirm==true){
					$("#creatAddress").slideUp(300);
					$(".newAddress").show(800);
					$("#addressUl li").removeClass("Selected").find("input:radio").removeAttr("checked");
					$("#addressUl li:last").after($creatLi);
					choose();
				}
			}
		
		})
	$(function(){
	//订单成功提示
	$(".successM").animate({opacity:'1'},3000);
	$(".successM").animate({opacity:'0'},1000);
	$(".successM").animate({height:'0px',marginTop:'0px',marginBottom:'0px'},1000);
	//订单展开、隐藏
	$("#slide").toggle(function(){
		$(".slideDown").hide();
		$(".slideUp").show();
		$(".orderDl").show();
		},function(){
			$(".slideUp").hide();
			$(".slideDown").show();
			$(".orderDl").hide();
			})
	
	})

	})