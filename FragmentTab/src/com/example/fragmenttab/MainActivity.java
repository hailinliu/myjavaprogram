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
		//����actionbar�ĵ�����ʽ��tab����
		actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);
		//һ���������tabҳ������Ӽ����¼�
		actionBar.addTab(actionBar.newTab().setText("��һҳ").setTabListener(this));
		actionBar.addTab(actionBar.newTab().setText("�ڶ�ҳ").setTabListener(this));
		actionBar.addTab(actionBar.newTab().setText("����ҳ").setTabListener(this));
		
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}
@Override
protected void onRestoreInstanceState(Bundle savedInstanceState) {
	super.onRestoreInstanceState(savedInstanceState);
	//ѡ��ǰ�汣���������Ӧ��fragment
	if(savedInstanceState.containsKey(SELECTED_ITEM)){
	getActionBar().setSelectedNavigationItem(savedInstanceState.getInt(SELECTED_ITEM));
}}
	@Override
	protected void onSaveInstanceState(Bundle outState) {
		super.onSaveInstanceState(outState);
		//����ǰѡ�е�fragmentҳ���������浽Bundle��
		outState.putInt(SELECTED_ITEM, getActionBar().getSelectedNavigationIndex());
	}
	
@Override
	public void onTabReselected(Tab tab, FragmentTransaction ft) {
		
		
	}
	//��ָ��tab��ѡ��ʱ�������÷���
	@Override
	public void onTabSelected(Tab tab, FragmentTransaction ft) {
		//����һ���µ�fragment����
		Fragment fragment = new DummyFragment();
		//��һ��bundle���󣬰Ѳ����󶨺���fragment��
		Bundle bundle = new Bundle();
		bundle.putInt(DummyFragment.ARG_SECTION_NUMBER, tab.getPosition()+1);
	//��Fragment�������
	fragment.setArguments(bundle);
	//��ȡfragmenttransaction����
	FragmentTransaction fta = getFragmentManager().beginTransaction();
	//ʹ��Fragment����Activity�е�container���
	fta.replace(R.id.container, fragment);
	//�ύ����
	fta.commit();
	}

	@Override
	public void onTabUnselected(Tab tab, FragmentTransaction ft) {
		
		
	}

}
