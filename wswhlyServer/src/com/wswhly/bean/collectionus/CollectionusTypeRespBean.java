package com.wswhly.bean.collectionus;

import java.util.List;

public class CollectionusTypeRespBean {

	private List<Type> list;
	
	public List<Type> getList() {
		return list;
	}

	public void setList(List<Type> list) {
		this.list = list;
	}

	public class Type{
		private long id;//类型id
		private String name;//类型name
		private String note;
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
		public String getNote() {
			return note;
		}
		public void setNote(String note) {
			this.note = note;
		}
		
	}
	
}
