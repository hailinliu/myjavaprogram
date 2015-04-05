$(function(){
    //首页样式设置
    //header__高度设置以header 52高度为准
    var header=$("#header"),
    	headerA=$("#header a");
    headerA.each(function(){$(this).height(header.width()/8)});//设置header中a的高度
    //footerer__高度设置以第一个A的高度为准
    var footer=$("#footer"),
    	footerLi=$("#footer li"),
    	footerLiFirst=$("#footer li:eq(0)"),
    	footerA=$("#footer a");
    footerLiFirst.height(footer.width()/8);
    footerLi.each(function(){
    	$(this).height(footerLiFirst.height());
    	$(this).find('a').height(footerLiFirst.height());
    });

    //首页轮转图样式
	var bannerPic=$("#bannerPic");//获取轮转图外围DIV
	var bannerUl=$("#bannerPic ul");//获取轮转图Ul
	var bannerImg=$("#bannerPic img");//获取轮转图内所有图片
	var bannerLi=$("#bannerPic li");//获取所有LI
	bannerLi.each(function(){
		$(this).width(bannerPic.width());//设置所有LI的宽度
	})
	var liWidth=$("#bannerPic li").eq(0).width();//获取第一个li的宽度
	var liNum=$("#bannerPic li").length;//获取li的个数
	var a=1;
	//样式设置
	bannerPic.height(bannerPic.width()*2/5);// 设置轮转图高度
	bannerImg.each(function(){
		$(this).width(bannerPic.width());//设置图片宽度
		$(this).height(bannerPic.width()*2/5);//设置图片高度
	})
	//首页轮转图
	var spot="<dl>";
	var n=$("#bannerPic dd.focusDd").index();
	for(var g=0;g<bannerLi.length;g++){spot+="<dd class='blurDd'></dd>";}
		spot+="</dl>";
	bannerPic.append(spot);
	var bannerDd=$("#bannerPic dd");
	var liLength=bannerLi.length;
	var timer=null;
	bannerLi.eq(0).show();
	bannerDd.eq(0).removeClass("blurDd").addClass("focusDd");

	function col(){
		bannerLi.eq(n).fadeIn().siblings().hide();
		bannerDd.eq(n).removeClass("blurDd").addClass("focusDd").siblings().removeClass("focusDd").addClass("blurDd");
		n<liLength?n++:n=0;
	};

	function fMIn(){timer=setInterval(col,4000);};
	fMIn();
	col();

	bannerLi.each(function(){
		$(this).on("swipeleft",function(){
			clearInterval(timer);
			if($(this).index()+1==liLength){
				bannerLi.eq(0).fadeIn().siblings().hide();
				bannerDd.eq(0).removeClass("blurDd").addClass("focusDd").siblings().removeClass("focusDd").addClass("blurDd");
				fMIn();
			}
			else{
				bannerLi.eq($(this).index()+1).fadeIn().siblings().hide();
				bannerDd.eq($(this).index()+1).removeClass("blurDd").addClass("focusDd").siblings().removeClass("focusDd").addClass("blurDd");
				fMIn();
			}
	}).on("swiperight",function(){
			clearInterval(timer);
			if($(this).index()==0){
				bannerLi.eq(liLength-1).fadeIn().siblings().hide();
				bannerDd.eq(liLength-1).removeClass("blurDd").addClass("focusDd").siblings().removeClass("focusDd").addClass("blurDd");
				fMIn();
			}
			else{
				bannerLi.eq($(this).index()-1).fadeIn().siblings().hide();
				bannerDd.eq($(this).index()-1).removeClass("blurDd").addClass("focusDd").siblings().removeClass("focusDd").addClass("blurDd");
				fMIn();
			}
	})
});
















    //八个按钮
    //alert($(document).height());
    var icoHeight=$(window).height()-bannerPic.height();//八个按钮应该占有的高度
    var liFirstWidth=$("#nav li:eq(0)").width();//获取第一个图标的宽度
	$("#nav li").each(function(){
		$(this).width(liFirstWidth);//设置LI的宽度为第一个LI的宽度
		$(this).height(icoHeight/4);//设置LI的高度，为UL的1/4
    	$(this).find("a").height(liFirstWidth*139/180*0.8)
    					.width(liFirstWidth*0.8);
    					//设置每个图标A的高度，宽高比为139/180,再缩小0.8倍，防止溢出；设置每个图标A的宽度，再缩小0.8倍，防止溢出
    	var spaceWidth=($(this).width()-$(this).find("a").width())/2;
    	var spaceHeight=($(this).height()-$(this).find("a").height())/2;
    	$(this).find("a").css({"left":spaceWidth+'px',"top":spaceHeight+'px'});



    	$(this).css("border-bottom","1px solid #4a3e18");//设置每个图标的底部边框
    });
    $("#nav li:eq(6),#nav li:eq(7)").css("border-bottom","none");//设置最后两个图标的底部边框为空
    $("#nav li:even").each(function(){
    	$(this).css("border-right","1px solid #4a3e18");//设置偶数图标的右边框
    });





//注销
function logout(){
		$.ajax({type: "POST",
			dataType: "text",
			url: "<c:url value='/user/Logout'/>",
			success:function(data){
				if(data == "0000"){
					window.location.href="<c:url value='/redirect?p=login'/>";
				}
			}
		});
	}
});


