package com.example.javaabtext_radiobutton.fragment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.Inflater;

import android.app.ListActivity;
import android.location.Address;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import com.example.javaabtext_radiobutton.R;
import com.example.javaabtext_radiobutton.util.adaterListView;

public class freament_jieyue extends Fragment {
	private ListView listview;
	private List<Map<String, Object>> listMap;
	private Integer[] img_people = { R.drawable.a3, R.drawable.a1,
			R.drawable.a2, R.drawable.a2, R.drawable.a2 };
	private String[] txt_people = { "虫虫1", "虫虫2", "虫虫3", "虫虫4", "虫虫5" };
	private String[] txt_message = { "这是这样的日子", "这是这样的日子",
			"这是这样的日子", "这是这样的日子", "这是这样的日子" };
	private String[] txt_timer = { "13:45", "13:47", "13:47", "13:51", "13:52" };
	View view;

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		view = inflater.inflate(R.layout.freament_jieyue, container, false);
		listview = (ListView) view.findViewById(R.id.listview);
		listViewAdapter();
		return view;
	}

	private void listViewAdapter() {
		listMap = getlistItems();
		adaterListView adaterListView = new adaterListView(getActivity(),
				listMap);
		listview.setAdapter(adaterListView);
	}

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onActivityCreated(savedInstanceState);
	}

	private List<Map<String, Object>> getlistItems() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < txt_people.length; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("txt_people", txt_people[i]);

			map.put("txt_message", txt_message[i]);
			map.put("txt_timer", txt_timer[i]);
			map.put("img_people", img_people[i]);
			list.add(map);
		}
		return list;
	}
}
