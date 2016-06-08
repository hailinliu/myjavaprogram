package com.example.javaabtext_radiobutton;

import java.util.List;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;

public class FragmentAdapter extends FragmentPagerAdapter {
	private List<Fragment> fragmentlist;

	public FragmentAdapter(FragmentManager fm, List<Fragment> list) {
		super(fm);
		fragmentlist = list;
	}

	@Override
	public Fragment getItem(int arg0) {
		return fragmentlist.get(arg0);
	}

	@Override
	public int getCount() {
		return fragmentlist.size();
	}

}
