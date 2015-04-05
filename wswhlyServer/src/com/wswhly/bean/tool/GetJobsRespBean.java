package com.wswhly.bean.tool;

import java.util.List;

public class GetJobsRespBean {

	private List<Job> list;
	
	public List<Job> getList() {
		return list;
	}

	public void setList(List<Job> list) {
		this.list = list;
	}

	public class Job{
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
