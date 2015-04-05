package com.wswhly.bean.proficient;

import java.util.List;


public class ProficientListRespBean {

	private List<Proficient> list;
	private int count;
	
	public List<Proficient> getList() {
		return list;
	}

	public void setList(List<Proficient> list) {
		this.list = list;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	public class Proficient {
		private long id;
		private String name;
		private String imgurl;
		private String speciality;
		private String appellation;
		private String note;
		private String createdate;
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
		public String getImgurl() {
			return imgurl;
		}
		public void setImgurl(String imgurl) {
			this.imgurl = imgurl;
		}
		public String getSpeciality() {
			return speciality;
		}
		public void setSpeciality(String speciality) {
			this.speciality = speciality;
		}
		public String getAppellation() {
			return appellation;
		}
		public void setAppellation(String appellation) {
			this.appellation = appellation;
		}
		public String getNote() {
			return note;
		}
		public void setNote(String note) {
			this.note = note;
		}
		public String getCreatedate() {
			return createdate;
		}
		public void setCreatedate(String createdate) {
			this.createdate = createdate;
		}		
	}
}
