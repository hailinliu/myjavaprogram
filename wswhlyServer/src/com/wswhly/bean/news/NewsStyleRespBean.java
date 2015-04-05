package com.wswhly.bean.news;

import java.util.List;

public class NewsStyleRespBean {

	private List<Style> list;
	
	public List<Style> getList() {
		return list;
	}

	public void setList(List<Style> list) {
		this.list = list;
	}

	public class Style{
		private long id;
		private String name;
		public long getId() {
			return id;
		}
		public void setId(long id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		
	}
}
