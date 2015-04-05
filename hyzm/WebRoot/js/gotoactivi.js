
//  js
// 所有活动页 全局JS  如 “gotohyzm”、"gemcoll"、"vipcoll"  "我要上华豫"



// ********[ 我要上华豫、珍宝征集等活动 -- 发布判定 ]***************

// 发布判断
function cp_State(viplevel,ahref,message2) {

	// viplevel(会员等级 变量  需程序传过来);
	// ahref  ( 要跳转的链接 )
	// message2 ( 弹出提示框 )

	//   ******** 是否登录
  	var my_element=$(".login");
	if (my_element.length > 0) {
			$("#login_box").addClass('mod_show');
		// $('#login_box').show();
		return false;
	} else {

		if (viplevel > 0) {
			window.location.href = ahref;

		} else {
			alert(message2);
			return false;
		}
	}

}

function cp_State2(viplevel,ahref,message2,levelnum) {

	// viplevel(会员等级 变量  需程序传过来);
	// ahref  ( 要跳转的链接 )
	// message2 ( 弹出提示框 )

	//   ******** 是否登录
  	var my_element=$(".login");
	if (my_element.length > 0) {
			$("#login_box").addClass('mod_show');
		// $('#login_box').show();
		return false;
	} else {

		if (viplevel > levelnum) {
			window.location.href = ahref;

		} else {
			alert(message2);
			return false;
		}
	}

}

//  投票
//
function my_vote(collectionid,ajax_url) {
	var my_element = $(".login");
	if (my_element.length > 0) {
			$("#login_box").addClass('mod_show');
		// $('#login_box').show();
		return false;
	} else {
		$.ajax({
			type: 'post',
			url: ajax_url,
			data: {
				collectionid: collectionid
			},
			success: function(data) {
				if (data == '0000') {
					alert("投票成功！");
					location.reload();
				} else {
					alert(data)
				}
			}
		});
	}
}
// "屏幕分辨率的高：" window.screen.height
//"屏幕分辨率的宽：" window.screen.width
function tv_screen() {
	var tv_height = window.screen.height;
		var tv_width = window.screen.width;
		if (tv_width<=1280) {
			$('.wl_Widget').addClass('wl_1024_800')

		}
		if (tv_width<1024) {
				$('.wl_Widget').css({
					bottom: '-77px',
					right: '0'
				});
			};
	// alert(tv_width);
}
$(function() {
	tv_screen();
})
