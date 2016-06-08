package com.example.javaabtext_radiobutton.util;

import java.util.List;
import java.util.Map;

import com.example.javaabtext_radiobutton.R;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

public class adaterListView extends BaseAdapter {
	private List<Map<String, Object>> list;
	//private Context context;
	private LayoutInflater inflater;

	public adaterListView( Context context,List<Map<String, Object>> list
			) {
		super();
		this.list = list;
		this.inflater = LayoutInflater.from(context);
	}

	public final class initView {
		public TextView txt_people;
		public TextView txt_timer;
		public TextView txt_message;
		public ImageView img_people;
	}

	/**
	 * 当前item数量
	 */
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return list.size();
	}

	@Override
	public Object getItem(int position) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long getItemId(int position) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {

		// 自定义itme视图
		initView view = null;
		if (convertView == null) {
			view = new initView();
			// 获取item视图
			convertView = inflater.inflate(R.layout.listview_item, null);
			view.txt_people = (TextView) convertView
					.findViewById(R.id.txt_people);
			view.txt_message = (TextView) convertView
					.findViewById(R.id.txt_message);
			view.txt_timer = (TextView) convertView
					.findViewById(R.id.txt_timer);
			view.img_people = (ImageView) convertView
					.findViewById(R.id.img_people);
			// 将view 放入 convertView
			convertView.setTag(view);
		} else {
			view = (initView) convertView.getTag();
		}
		view.txt_people.setText((String)list.get(position).get("txt_people"));
		view.txt_message.setText((String)list.get(position).get("txt_message"));
		view.txt_timer.setText((String)list.get(position).get("txt_timer"));
		view.img_people.setBackgroundResource((Integer)list.get(position).get("img_people"));
		return convertView;
	}

}
