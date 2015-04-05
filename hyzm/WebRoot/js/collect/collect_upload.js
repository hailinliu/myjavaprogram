// JavaScript Document
$(function(){
    $(".pic_require").mouseover(function(){
        $(".pic_shuoming").css("display","block");
    });
    $(".pic_require").mouseout(function(){
        $(".pic_shuoming").css("display","none");
    });
    // 征集首页tab选项
    $(".pp_tab01").hover(function(){
        $(this).addClass("pp_tab_current");
        $(".tab001").css("display","block");
        $(".tab002").css("display","none");
        $(".pp_tab02").removeClass("pp_tab_current");
        $(".pp_tab03").removeClass("pp_tab_current");
        $(".tab003").css("display","none");
        $(".pp_dot").css("top","18px");
    });
    $(".pp_tab02").hover(function(){
        $(this).addClass("pp_tab_current");
        $(".tab001").css("display","none");
        $(".tab002").css("display","block");
        $(".tab003").css("display","none");
        $(".pp_tab01").removeClass("pp_tab_current");
        $(".pp_tab03").removeClass("pp_tab_current");
        $(".pp_dot").css("top","72px");
    });
    $(".pp_tab03").hover(function(){
        $(this).addClass("pp_tab_current");
        $(".tab001").css("display","none");
        $(".tab002").css("display","none");
        $(".tab003").css("display","block");
        $(".pp_tab01").removeClass("pp_tab_current");
        $(".pp_tab02").removeClass("pp_tab_current");
        $(".pp_dot").css("top","128px");
    });


        //  图片示例弹出
        $(".shili_img").mousemove(function() {
            $(".shili_tupian").show('slow');
            $("#upupup1").hide();
        });
        $(".shili_img").mouseout(function() {
            $(".shili_tupian").hide();
            $("#upupup1").show();
        });

})


