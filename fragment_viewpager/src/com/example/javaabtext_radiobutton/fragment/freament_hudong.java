package com.example.javaabtext_radiobutton.fragment;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import android.app.ListActivity;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.Toast;

import com.example.javaabtext_radiobutton.R;
import com.example.javaabtext_radiobutton.Son_Freament;
import com.example.javaabtext_radiobutton.Son_Freament_two;

public class freament_hudong extends Fragment {

	private View view;
	private Button button;
	private ViewPager viewpager;
	private List<Fragment> fragment_all;

	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		view = inflater.inflate(R.layout.freament_hudong, container, false);
		initview();
		initviewpagerlist();
		return view;
	}

	private void initviewpagerlist() {
		fragment_all = new ArrayList<Fragment>();
		fragment_all.add(new Son_Freament());
		fragment_all.add(new Son_Freament_two());
		freament_SonHudong adapter = new freament_SonHudong(
				getChildFragmentManager(), fragment_all);
		viewpager.setAdapter(adapter);
	}

	private void initview() {
		button = (Button) view.findViewById(R.id.btn_hudong);
		viewpager = (ViewPager) view.findViewById(R.id.son_viewpager);
		button.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				Toast.makeText(getActivity(), "点击了按钮", Toast.LENGTH_SHORT)
						.show();
			}
		});
	}

	/**
	 * 对互动fragment页面进行管理
	 * 
	 * @author Administrator
	 * 
	 */
	public static class freament_SonHudong extends FragmentPagerAdapter {

		private List<Fragment> fragments;

		public freament_SonHudong(FragmentManager fm,
				List<Fragment> fragment_sonlist) {
			super(fm);
			this.fragments = fragment_sonlist;
		}

		@Override
		public Fragment getItem(int arg0) {
			// TODO Auto-generated method stub
			return fragments.get(arg0);
		}

		// 获取当前视图数量
		@Override
		public int getCount() {
			// TODO Auto-generated method stub
			return fragments.size();
		}
	}
}
