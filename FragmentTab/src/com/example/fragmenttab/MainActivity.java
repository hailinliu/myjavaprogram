package com.example.fragmenttab;

import android.os.Bundle;
import android.app.ActionBar;
import android.app.ActionBar.Tab;
import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentTransaction;
import android.view.Menu;

public class MainActivity extends Activity implements ActionBar.TabListener{
	private static final String SELECTED_ITEM = "selected_item";
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	
		ActionBar actionBar= getActionBar();
		//设置actionbar的导航方式，tab导航
		actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);
		//一次添加三个tab页，并添加监听事件
		actionBar.addTab(actionBar.newTab().setText("第一页").setTabListener(this));
		actionBar.addTab(actionBar.newTab().setText("第二页").setTabListener(this));
		actionBar.addTab(actionBar.newTab().setText("第三页").setTabListener(this));
		
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}
@Override
protected void onRestoreInstanceState(Bundle savedInstanceState) {
	super.onRestoreInstanceState(savedInstanceState);
	//选中前面保存的索引对应的fragment
	if(savedInstanceState.containsKey(SELECTED_ITEM)){
	getActionBar().setSelectedNavigationItem(savedInstanceState.getInt(SELECTED_ITEM));
}}
	@Override
	protected void onSaveInstanceState(Bundle outState) {
		super.onSaveInstanceState(outState);
		//将当前选中的fragment页的索引保存到Bundle中
		outState.putInt(SELECTED_ITEM, getActionBar().getSelectedNavigationIndex());
	}
	
@Override
	public void onTabReselected(Tab tab, FragmentTransaction ft) {
		
		
	}
	//当指定tab被选中时，激发该方法
	@Override
	public void onTabSelected(Tab tab, FragmentTransaction ft) {
		//创建一个新的fragment对象
		Fragment fragment = new DummyFragment();
		//建一个bundle对象，把参数绑定后传入fragment中
		Bundle bundle = new Bundle();
		bundle.putInt(DummyFragment.ARG_SECTION_NUMBER, tab.getPosition()+1);
	//向Fragment传入参数
	fragment.setArguments(bundle);
	//获取fragmenttransaction对象
	FragmentTransaction fta = getFragmentManager().beginTransaction();
	//使用Fragment代替Activity中的container组件
	fta.replace(R.id.container, fragment);
	//提交事务
	fta.commit();
	}

	@Override
	public void onTabUnselected(Tab tab, FragmentTransaction ft) {
		
		
	}

}
