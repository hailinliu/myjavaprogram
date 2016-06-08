package com.example.javaabtext_radiobutton;

import java.util.ArrayList;
import java.util.List;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.example.javaabtext_radiobutton.fragment.freament_hudong;
import com.example.javaabtext_radiobutton.fragment.freament_jieyue;
import com.example.javaabtext_radiobutton.fragment.freament_wode;

public class viewPage_Fragment extends FragmentActivity{
	private ViewPager viewpager;
	private ImageView menu_hudong, menu_jieyue, menu_faxian;
	private TextView text_hudong, text_jieyue, text_faxian;
	private LinearLayout layout_hudong, layout_jieyue, layout_faxian;
	private List<Fragment> fragmentlist;
	private int pageNumItem;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		setContentView(R.layout.viewpage_fragment);
		initView();
		initBottomTittle();
		initViewAdapter();
		initOnChangeView();
	}

	/**
	 * 当viewPage滑动，控制按钮的变化
	 */
	private void initOnChangeView() {
		viewpager.setOnPageChangeListener(new OnPageChangeListener() {
			@Override
			public void onPageSelected(int arg0) {
				switch (viewpager.getCurrentItem()) {
				case 0: {
					img_exchang_black();
					menu_hudong
							.setImageResource(R.drawable.tab_address_pressed);
					break;
				}
				case 1: {
					img_exchang_black();
					menu_jieyue
							.setImageResource(R.drawable.tab_settings_pressed);
					break;
				}
				case 2: {
					img_exchang_black();
					menu_faxian.setImageResource(R.drawable.tab_weixin_pressed);
					break;
				}
				}

			}

			@Override
			public void onPageScrolled(int arg0, float arg1, int arg2) {
				// TODO Auto-generated method stub

			}

			@Override
			public void onPageScrollStateChanged(int arg0) {
				// TODO Auto-generated method stub

			}
		});

	}

	private void initView() {
		text_hudong = (TextView) findViewById(R.id.txt_hudong);
		text_jieyue = (TextView) findViewById(R.id.txt_jieyue);
		text_faxian = (TextView) findViewById(R.id.txt_faxian);
		layout_hudong = (LinearLayout) findViewById(R.id.tab_hudong);
		layout_faxian = (LinearLayout) findViewById(R.id.tab_faxian);
		layout_jieyue = (LinearLayout) findViewById(R.id.tab_jieyue);
		menu_hudong = (ImageView) findViewById(R.id.tab_img_hudong);
		menu_jieyue = (ImageView) findViewById(R.id.tab_img_jieyue);
		menu_faxian = (ImageView) findViewById(R.id.tab_img_qiangzuo);
		viewpager = (ViewPager) findViewById(R.id.ViewPagers);
	}

	private void initViewAdapter() {
		fragmentlist = new ArrayList<Fragment>();

		fragmentlist.add(new freament_hudong());
		fragmentlist.add(new freament_jieyue());
		fragmentlist.add(new freament_wode());
		FragmentAdapter adapter = new FragmentAdapter(
				getSupportFragmentManager(), fragmentlist);

		viewpager.setAdapter(adapter);
	}

	/**
	 * 初始化底部菜单
	 */
	private void initBottomTittle() {
		layout_hudong.setOnClickListener(new onclickBottomMennu(0));
		layout_jieyue.setOnClickListener(new onclickBottomMennu(1));
		layout_faxian.setOnClickListener(new onclickBottomMennu(2));
	}

	private class onclickBottomMennu implements OnClickListener {
		private int index = 0;

		public onclickBottomMennu(int i) {
			super();
			index = i;
		}

		@Override
		public void onClick(View v) {
			viewpager.setCurrentItem(index);
			switch (index) {
			case 0: {
				img_exchang_black();
				viewpager.setCurrentItem(0);
				menu_hudong.setImageResource(R.drawable.tab_address_pressed);
				System.out.println("index"+index);
				break;
			}
			case 1: {
				viewpager.setCurrentItem(1);
				img_exchang_black();
				menu_jieyue.setImageResource(R.drawable.tab_settings_pressed);
				System.out.println("index"+index);
				break;
			}
			case 2: {
				viewpager.setCurrentItem(2);
				img_exchang_black();
				menu_faxian.setImageResource(R.drawable.tab_weixin_pressed);
				System.out.println("index"+index);
				break;
			}
			}
		}
	}

	/**
	 * 字体or图片处理
	 */
	private void img_exchang_black() {
		/*
		 * text_hudong.setTextColor(getResources().getColor(R.color.huise));
		 * text_jieyue.setTextColor(getResources().getColor(R.color.huise));
		 * text_faxian.setTextColor(getResources().getColor(R.color.huise));
		 */
		menu_hudong.setImageDrawable(getResources().getDrawable(
				R.drawable.tab_address_normal));
		menu_jieyue.setImageDrawable(getResources().getDrawable(
				R.drawable.tab_settings_normal));
		menu_faxian.setImageDrawable(getResources().getDrawable(
				R.drawable.tab_weixin_normal));
	}

}
