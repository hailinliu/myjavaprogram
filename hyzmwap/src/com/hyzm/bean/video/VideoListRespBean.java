package com.hyzm.bean.video;

import java.util.List;


public class VideoListRespBean {

	private List<Video> list;
	private int count;
	
	public List<Video> getList() {
		return list;
	}

	public void setList(List<Video> list) {
		this.list = list;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	public class Video {
		private long id;
		private String title;
		private String imgurl;
		private String name;
		private String proficient;
		private int clicknum;
		private String note;
		private String uploaddate;
		public long getId() {
			return id;
		}
		public void setId(long id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getImgurl() {
			return imgurl;
		}
		public void setImgurl(String imgurl) {
			this.imgurl = imgurl;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getProficient() {
			return proficient;
		}
		public void setProficient(String proficient) {
			this.proficient = proficient;
		}
		public int getClicknum() {
			return clicknum;
		}
		public void setClicknum(int clicknum) {
			this.clicknum = clicknum;
		}
		public String getNote() {
			return note;
		}
		public void setNote(String note) {
			this.note = note;
		}
		public String getUploaddate() {
			return uploaddate;
		}
		public void setUploaddate(String uploaddate) {
			this.uploaddate = uploaddate;
		}
	}
}
