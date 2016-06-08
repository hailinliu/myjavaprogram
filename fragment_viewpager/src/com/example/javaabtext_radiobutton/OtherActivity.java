package com.example.javaabtext_radiobutton;

import java.util.Timer;
import java.util.TimerTask;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

public class OtherActivity extends Activity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.otheractivity);

		final Intent intent = new Intent(this, CentenActivity.class);
		
}
}