//顶部伸展广告
if ($("#js_ads_banner_top_slide")){
	var $bannerB = $("#js_ads_banner_top_slide"),
		$bannerS = $("#js_ads_banner_top");
	setTimeout(function(){$bannerB.slideDown(1000);},2500);
	setTimeout(function(){$bannerB.slideUp(1000,function (){$bannerS.slideDown(1000);});},8500);
}