package com.example.javaabtext_radiobutton;


import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class CentenActivity extends Activity implements OnClickListener {
	private Button radioButton, viewPage;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_centen);
		initview();
	}

	/**
	 * 初始化控件
	 */
	private void initview() {
		radioButton = (Button) findViewById(R.id.radioButton);
		viewPage = (Button) findViewById(R.id.ViewPage);
		radioButton.setOnClickListener(this);
		viewPage.setOnClickListener(this);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.centen, menu);
		return true;
	}

	@Override
	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.radioButton: {
			Intent intent = new Intent(this, radio_Fragment.class);
			startActivity(intent);
			System.out.println("===========点击了单选");
			break;
		}
		case R.id.ViewPage: {
			Intent intent = new Intent(this, viewPage_Fragment.class);
			startActivity(intent);
			break;
		}

		}
	}
}
