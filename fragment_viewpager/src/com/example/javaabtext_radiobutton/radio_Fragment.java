package com.example.javaabtext_radiobutton;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import android.widget.Toast;

import com.example.javaabtext_radiobutton.fragment.freament_hudong;
import com.example.javaabtext_radiobutton.fragment.freament_jieyue;
import com.example.javaabtext_radiobutton.fragment.freament_wode;

public class radio_Fragment extends FragmentActivity implements
		OnCheckedChangeListener {
	private RadioGroup radioGroup;
	private RadioButton rb1, rb2, rb3;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.radio_fragment);
		initview();
	}

	/**
	 * ≥ı ºªØ
	 */
	private void initview() {
		radioGroup = (RadioGroup) findViewById(R.id.radio_rg);
		rb1 = (RadioButton) findViewById(R.id.radio_rb1);
		rb2 = (RadioButton) findViewById(R.id.radio_rb2);
		rb3 = (RadioButton) findViewById(R.id.radio_rb3);
		radioGroup.setOnCheckedChangeListener(this);
		RadioButton tabHome = (RadioButton) findViewById(R.id.radio_rb1);
		tabHome.setChecked(true);
	}

	@Override
	public void onCheckedChanged(RadioGroup group, int checkedId) {
		switch (group.getCheckedRadioButtonId()) {
		case R.id.radio_rb1: {
			freament_hudong hudong = new freament_hudong();
			FragmentManager manager = getSupportFragmentManager();
			FragmentTransaction transaction = manager.beginTransaction();
			transaction.replace(R.id.framelayout, hudong);
			transaction.commit();
			Toast.makeText(getApplicationContext(), rb1.getText(),
					Toast.LENGTH_SHORT).show();
		}
			break;
		case R.id.radio_rb2: {
			freament_jieyue jieyue = new freament_jieyue();
			FragmentManager manager = getSupportFragmentManager();
			FragmentTransaction transaction = manager.beginTransaction();
			transaction.replace(R.id.framelayout, jieyue);
			transaction.commit();
			Toast.makeText(getApplicationContext(), rb2.getText(),
					Toast.LENGTH_SHORT).show();
		}
			break;
		case R.id.radio_rb3: {
			freament_wode wode = new freament_wode();
			FragmentManager manager = getSupportFragmentManager();
			FragmentTransaction transaction = manager.beginTransaction();
			transaction.replace(R.id.framelayout, wode);
			transaction.commit();
			Toast.makeText(getApplicationContext(), rb3.getText(),
					Toast.LENGTH_SHORT).show();
		}
			break;
		}
	}
}
