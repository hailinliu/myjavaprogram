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

    //首页轮转图
    var footer=$("#footer");
	var bannerPic=$("#bannerPic");//获取轮转图外围DIV
	var bannerUl=$("#bannerPic ul");//获取轮转图Ul
		bannerUl.html(bannerUl.html()+bannerUl.html());//设置li的个数翻倍
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



	//动画设置
	bannerUl.width();//设置UL的宽度
	function mar(){
		if (a<=liNum/2){
			bannerUl.animate({left:-a*liWidth+'px'},1000);
			a++;
				}
				else{
					bannerUl.animate({left:'0'},0);
					a=1;
					}
		}

		$marTime=setInterval(mar,6000);	//设置定时器
		mar();


	/*bannerLi.each(function(){
		$(this).on("swipeleft",function(){//向左滑动
			clearInterval($marTime);//关闭定时器
			var tempLeft=bannerUl.css("left");//获取当前Ul位置
			var overLeft=parseInt(tempLeft)-liWidth+'px';//设置滑动后位置
			bannerUl.animate({left:overLeft},700);
			$marTime=setInterval(mar,4000);	//设置定时器
		mar();
		}).on("swiperight",function(){//向右滑动
			clearInterval($marTime);//关闭定时器
			var tempLeft=bannerUl.css("left");//获取当前Ul位置
			var overLeft=parseInt(tempLeft)+liWidth+'px';//设置滑动后位置
			bannerUl.animate({left:overLeft},700);
			$marTime=setInterval(mar,4000);	//设置定时器


		});
	})*/
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
})
