package com.example.fragmenttab;

import android.app.Fragment;
import android.os.Bundle;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public class DummyFragment extends Fragment {
public static final String ARG_SECTION_NUMBER = "section_number";
//�÷����ķ���ֵ���Ǹ�Fragment��ʾ��View���
@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
	TextView textView = new TextView(getActivity());
	textView.setGravity(Gravity.START);
	//��ȡ������Fragmentʱ����Ĳ���Bundle
	Bundle args = getArguments();
	//����textview��ʾ���ı�
	textView.setText(args.getInt(ARG_SECTION_NUMBER)+"");
	textView.setTextSize(30);
	//���ظ�textView
	
		return textView;
	}
}
