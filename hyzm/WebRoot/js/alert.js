// JavaScript Document
/*
 *
 * @authors xiao liang  [公共样式js 不要轻易动！]
 * @date    2014-08-30 16:31:22
 * @version $Id$
 */

$(document).ready(function(e) {

	//登录块

    $(".login").click(function(){
    	$("#login_box").addClass('mod_show');
    	// $("#login_box").show();
	});
	$(".pop_bgs").click(function(){	// 点击透明 背景登陆消失
		// $("#login_box").removeClass('mod_show');
         $(".pop_upbox").removeClass('mod_show');

    	// $("#login_box").hide();
	});

	/*xiaoguo 关闭效果*/

	$(".off_guowai").click(function(){
		$(".forgebox_guowai").css("display","none");
	});
	$(".off_x").click(function(){
		$(".forgebox_guowai").css("display","none");
		$("#login_box").removeClass('mod_show');
        $(".pop_upbox").removeClass('mod_show');
	});
	$(".winload").click(function(){
		window.location.reload();
	});


    /*分页 宽度 自动居中！！*/

    var fenye_ul = $('.paging_list').width();
    var fenye_ul_li = $('ul.paging_list>li.bg_box').width();
    var fenye_ul_li_lenght = $('ul.paging_list>li').length;

    $('.paging_list').css('width', +parseInt(fenye_ul_li * (fenye_ul_li_lenght+1)) + 'px');

});


// 判断是否登录  和 跳转页面 -- 晓亮 20140827*/
// *******************************************************
	function login_on(ahref1,blanks) {

		// message1 --   弹出框提示语！
		// ahref1 --  跳转页面！
		// blanks --  提示状态('0'代表当前页面打开，'1'代表新页面打开 _blank)！

        //  ******** 是否登录
        var my_element=$(".login");
        if(my_element.length>0){				 //如果’会员登录‘dom 存在

           	// $('#login_box').show();				// 未登录 弹出登陆框！
           	$("#login_box").addClass('mod_show');
           	return false;

        }else{
        	if (blanks==0) {
        		window.location.href=ahref1;
        	}
        	if (blanks==1) {
        		window.open(ahref1);
        	}
        	return true;
        }

	}

	//  判断登陆后 弹出调查表或者某些层  *******************************************************
	function login_doc() {

		// message1 --   弹出框提示语！
		// ahref1 --  跳转页面！
		// blanks --  提示状态('0'代表当前页面打开，'1'代表新页面打开 _blank)！

        //  ******** 是否登录
        var my_element=$(".login");
        if(my_element.length>0){				 //如果’会员登录‘dom 存在

           	$('#login_box').show();				// 未登录 弹出登陆框！
           	return false;

        }else{
        	$('.forgebox_guowai').show();
        	return true;
        }

	}


