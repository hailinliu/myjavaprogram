// JavaScript Document
$(document).ready(function(e) {
	/*会员等级页面 浮动说明*/
	$(".ws").mouseover(function(){
		$(".fd_baoming").css("display","block");
		$(".zs_jt").css("top","174px").css("display","block");
	}).mouseout(function(){
		$(".fd_baoming").css("display","none");
		$(".zs_jt").css("display","none");
	});
	$(".LL").mouseover(function(){
		$(".fd_liulan").css("display","block");
		$(".zs_jt").css("top","215px").css("display","block");
	}).mouseout(function(){
		$(".fd_liulan").css("display","none");
		$(".zs_jt").css("display","none");
	});
	$(".sp").mouseover(function(){
		$(".fd_guankan").css("display","block");
		$(".zs_jt").css("top","256px").css("display","block");
	}).mouseout(function(){
		$(".fd_guankan").css("display","none");
		$(".zs_jt").css("display","none");
	});
	$(".jd").mouseover(function(){
		$(".fd_jianding").css("display","block");
		$(".zs_jt").css("top","299px").css("display","block");
	}).mouseout(function(){
		$(".fd_jianding").css("display","none");
		$(".zs_jt").css("display","none");
	});
	$(".fb").mouseover(function(){
		$(".fd_chushou").css("display","block");
		$(".zs_jt").css("top","341px").css("display","block");
	}).mouseout(function(){
		$(".fd_chushou").css("display","none");
		$(".zs_jt").css("display","none");
	});
	$(".jp").mouseover(function(){
		$(".fd_jingpai").css("display","block");
		$(".zs_jt").css("top","383px").css("display","block");
	}).mouseout(function(){
		$(".fd_jingpai").css("display","none");
		$(".zs_jt").css("display","none");
	});
	$(".tg").mouseover(function(){
		$(".fd_tuangou").css("display","block");
		$(".zs_jt").css("top","423px").css("display","block");
	}).mouseout(function(){
		$(".fd_tuangou").css("display","none");
		$(".zs_jt").css("display","none");
	});
	$(".guoneipaimai").mouseover(function(){
		$(".fd_paimai").css("display","block");
		$(".zs_jt").css("top","466px").css("display","block");
	}).mouseout(function(){
		$(".fd_paimai").css("display","none");
		$(".zs_jt").css("display","none");
	});

	$(".guowaipaimai").mouseover(function(){
		$(".fd_paimai2").css("display","block");
		$(".zs_jt").css("top","509px").css("display","block");
	}).mouseout(function(){
		$(".fd_paimai2").css("display","none");
		$(".zs_jt").css("display","none");
	});

	$(".cpsp").mouseover(function(){
		$(".fd_cpsp").css("display","block");
		$(".zs_jt").css("top","548px").css("display","block");
	}).mouseout(function(){
		$(".fd_cpsp").css("display","none");
		$(".zs_jt").css("display","none");
	});

	$(".lz").mouseover(function(){
		$(".fd_lz").css("display","block");
		$(".zs_jt").css("top","591px").css("display","block");
	}).mouseout(function(){
		$(".fd_lz").css("display","none");
		$(".zs_jt").css("display","none");
	});

	$(".wangpai").mouseover(function(){
		$(".fd_wangpai").css("display","block");
		$(".zs_jt").css("top","548px").css("display","block");
	}).mouseout(function(){
		$(".fd_wangpai").css("display","none");
		$(".zs_jt").css("display","none");
	});
	$(".dapaihui").mouseover(function(){
		$(".fd_dapaihui").css("display","block");
		$(".zs_jt").css("top","587px").css("display","block");
	}).mouseout(function(){
		$(".fd_dapaihui").css("display","none");
		$(".zs_jt").css("display","none");
	});



	//  会员等级 切换
	var code = 0;


	if ($.trim($("#status").text())=='免费会员') {

			$(".sj1").click(function(){

				 code=parseInt(1000);
				 // alert("1");
	             $("#code").html(code);
				 $("#code1").html(code);

				 $(".sj1").css("background","#9D0104");
				 $(".sj2").css("background","#09C");
				 $(".sj3").css("background","#09C");
				 $(".sj4").css("background","#09C");
				 $('#viplevelid').val(1);
				 $("#initvipid").text($("#status").text());
				$("#mydengji").html("星级会员");

			 });

			$(".sj2").click(function(){

				 code=parseInt(10000);
				 // alert("1");
	             $("#code").html(code);
				 $("#code1").html(code);

				 $(".sj1").css("background","#09C");
				 $(".sj2").css("background","#9D0104");
				 $(".sj3").css("background","#09C");
				 $(".sj4").css("background","#09C");


				 $('#viplevelid').val(2);
				 $("#initvipid").text($("#status").text());
				$("#mydengji").html("贵宾会员");

			 });
			$(".sj3").click(function(){
				 code=parseInt(20000);
	             $("#code").html(code);
				 $("#code1").html(code);

				 $(".sj1").css("background","#09C");
				 $(".sj2").css("background","#09C");
				 $(".sj3").css("background","#9D0104");
				 $(".sj4").css("background","#09C");


				 $('#viplevelid').val(3);
				 $("#initvipid").text($("#status").text());
				$("#mydengji").html("高级会员");

			 });
			$(".sj4").click(function(){
				 code=parseInt(30000);
	             $("#code").html(code);
				 $("#code1").html(code);

				 $(".sj1").css("background","#09C");
				 $(".sj2").css("background","#09C");
				 $(".sj3").css("background","#09C");
				 $(".sj4").css("background","#9D0104");


				 $('#viplevelid').val(4);
				 $("#initvipid").text($("#status").text());
				$("#mydengji").html("超级会员");

			 });
		} else if ($.trim($("#status").text())=='星级会员') {
			$(".sj1").css("background","#838282");
			//$(".sj1").css("background","#9D0104");
			$(".sj1").unbind("click");

			$(".sj2").click(function(){

				 code=parseInt(10000);
				 // alert("1");
	             $("#code").html(code);
				 $("#code1").html(code);

				 $(".sj1").css("background","#838282");
				 $(".sj2").css("background","#9D0104");
				 $(".sj3").css("background","#09C");
				 $(".sj4").css("background","#09C");


				 $('#viplevelid').val(2);
				 $("#initvipid").text($("#status").text());
				$("#mydengji").html("贵宾会员");

			 });
			$(".sj3").click(function(){
				 code=parseInt(20000);
	             $("#code").html(code);
				 $("#code1").html(code);

				 $(".sj1").css("background","#838282");
				 $(".sj2").css("background","#09C");
				 $(".sj3").css("background","#9D0104");
				 $(".sj4").css("background","#09C");


				 $('#viplevelid').val(3);
				 $("#initvipid").text($("#status").text());
				$("#mydengji").html("高级会员");

			 });
			$(".sj4").click(function(){
				 code=parseInt(30000);
	             $("#code").html(code);
				 $("#code1").html(code);

				 $(".sj1").css("background","#838282");
				 $(".sj2").css("background","#09C");
				 $(".sj3").css("background","#09C");
				 $(".sj4").css("background","#9D0104");


				 $('#viplevelid').val(4);
				 $("#initvipid").text($("#status").text());
				$("#mydengji").html("超级会员");

			 });
		} else if($.trim($("#status").text()) =='贵宾会员' ) {

			$(".sj1").css("background","#838282");
			$(".sj2").css("background","#838282");
			//$(".sj2").css("background","#9D0104");
			$(".sj1") .unbind("click");
			 $(".sj2") .unbind("click");
			 $(".sj3").click(function(){
				 code=parseInt(20000);
	             $("#code").html(code);
				 $("#code1").html(code);


				 $(".sj1").css("background","#838282");
				 $(".sj2").css("background","#838282");
				 $(".sj3").css("background","#9D0104");
				 $(".sj4").css("background","#09C");


				 $('#viplevelid').val(3);
				 $("#initvipid").text($("#status").text());
				$("#mydengji").html("高级会员");

			 });
			$(".sj4").click(function(){
				 code=parseInt(30000);
	             $("#code").html(code);
				 $("#code1").html(code);

				 $(".sj1").css("background","#838282");
				 $(".sj2").css("background","#838282");
				 $(".sj3").css("background","#09C");
				 $(".sj4").css("background","#9D0104");


				 $('#viplevelid').val(4);
				 $("#initvipid").text($("#status").text());
				$("#mydengji").html("超级会员");

			 });
		} else if($.trim($("#status").text())=='高级会员') {
			 $(".sj1").css("background","#838282");
			 $(".sj2").css("background","#838282");
			 $(".sj3").css("background","#838282");
			 //$(".sj3").css("background","#9D0104");

			 $(".sj1") .unbind("click");
			 $(".sj2") .unbind("click");
			 $(".sj3") .unbind("click");
			 $(".sj4").click(function(){
				 code=parseInt(30000);
	             $("#code").html(code);
				 $("#code1").html(code);

				 $(".sj1").css("background","#838282");
				 $(".sj2").css("background","#838282");
				 $(".sj3").css("background","#838282");
				 $(".sj4").css("background","#9D0104");

				 $('#viplevelid').val(4);
				 $("#initvipid").text($("#status").text());
				$("#mydengji").html("超级会员");

			 });

				// alert("等级2");
		} else if ($.trim($("#status").text())=='超级会员') {
			$(".sj1") .unbind("click");
			 $(".sj2") .unbind("click");
			 $(".sj3") .unbind("click");
			 $(".sj4") .unbind("click");
			 $(".sj1").css("background","#838282");
			 $(".sj2").css("background","#838282");
			 $(".sj3").css("background","#838282");
			 $(".sj4").css("background","#838282");
			 //$(".sj4").css("background","#9D0104");
		}

	/*mouseover 时 tr背景变色*/
	$(".tr1").mouseover(function(){
		$(".tr1").addClass("tr_current");
	}).mouseout(function(){
		$(".tr1").removeClass("tr_current");
	})
	$(".tr2").mouseover(function(){
		$(".tr2").addClass("tr_current");
	}).mouseout(function(){
		$(".tr2").removeClass("tr_current");
	})
	$(".tr3").mouseover(function(){
		$(".tr3").addClass("tr_current");
	}).mouseout(function(){
		$(".tr3").removeClass("tr_current");
	})
	$(".tr4").mouseover(function(){
		$(".tr4").addClass("tr_current");
	}).mouseout(function(){
		$(".tr4").removeClass("tr_current");
	})
	$(".tr5").mouseover(function(){
		$(".tr5").addClass("tr_current");
	}).mouseout(function(){
		$(".tr5").removeClass("tr_current");
	})
	$(".tr6").mouseover(function(){
		$(".tr6").addClass("tr_current");
	}).mouseout(function(){
		$(".tr6").removeClass("tr_current");
	})
	$(".tr7").mouseover(function(){
		$(".tr7").addClass("tr_current");
	}).mouseout(function(){
		$(".tr7").removeClass("tr_current");
	})
	$(".tr8").mouseover(function(){
		$(".tr8").addClass("tr_current");
	}).mouseout(function(){
		$(".tr8").removeClass("tr_current");
	})
	$(".tr9").mouseover(function(){
		$(".tr9").addClass("tr_current");
		$(".td_4").css("background","#B7EDFF");
	}).mouseout(function(){
		$(".tr9").removeClass("tr_current");
		$(".td_4").css("background","");
	})
	$(".tr10").mouseover(function(){
		$(".tr10").addClass("tr_current");
	}).mouseout(function(){
		$(".tr10").removeClass("tr_current");
	})
	$(".tr12").mouseover(function(){
		$(".tr12").addClass("tr_current");
	}).mouseout(function(){
		$(".tr12").removeClass("tr_current");
	})
	$(".tr13").mouseover(function(){
		$(".tr13").addClass("tr_current");
	}).mouseout(function(){
		$(".tr13").removeClass("tr_current");
	})

});
