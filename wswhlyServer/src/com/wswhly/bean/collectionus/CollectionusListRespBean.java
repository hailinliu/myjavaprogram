package com.wswhly.bean.collectionus;

import java.util.List;


public class CollectionusListRespBean {

	private List<Collectionus> list;
	private int count;
	
	public List<Collectionus> getList() {
		return list;
	}

	public void setList(List<Collectionus> list) {
		this.list = list;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	public class Collectionus {
		private long id;
		private long type;
		private long style;
		private String name;
		private String serialnum;
		private long userid;
		private String uploaddate;
		private String lastmodifydate;
		private String note;
		private String imgurl;
		private String imgurltitle;
		
		public String getImgurltitle() {
			return imgurltitle;
		}
		public void setImgurltitle(String imgurltitle) {
			this.imgurltitle = imgurltitle;
		}
		private int clicknum;
		
		private String uploadusername;
		
		private String typename;
		
		private String stylename;
		
		private String state;
		
		private String tvnum;
		
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public long getId() {
			return id;
		}
		public void setId(long id) {
			this.id = id;
		}
		public long getType() {
			return type;
		}
		public void setType(long type) {
			this.type = type;
		}
		public long getStyle() {
			return style;
		}
		public void setStyle(long style) {
			this.style = style;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getSerialnum() {
			return serialnum;
		}
		public void setSerialnum(String serialnum) {
			this.serialnum = serialnum;
		}
		public String getUploaddate() {
			return uploaddate;
		}
		public void setUploaddate(String uploaddate) {
			this.uploaddate = uploaddate;
		}
		public String getLastmodifydate() {
			return lastmodifydate;
		}
		public void setLastmodifydate(String lastmodifydate) {
			this.lastmodifydate = lastmodifydate;
		}
		public String getNote() {
			return note;
		}
		public void setNote(String note) {
			this.note = note;
		}
		public String getImgurl() {
			return imgurl;
		}
		public void setImgurl(String imgurl) {
			this.imgurl = imgurl;
		}
		public String getUploadusername() {
			return uploadusername;
		}
		public void setUploadusername(String uploadusername) {
			this.uploadusername = uploadusername;
		}
		public String getTypename() {
			return typename;
		}
		public void setTypename(String typename) {
			this.typename = typename;
		}
		public int getClicknum() {
			return clicknum;
		}
		public void setClicknum(int clicknum) {
			this.clicknum = clicknum;
		}
		public long getUserid() {
			return userid;
		}
		public void setUserid(long userid) {
			this.userid = userid;
		}
		public String getStylename() {
			return stylename;
		}
		public void setStylename(String stylename) {
			this.stylename = stylename;
		}
		public String getTvnum() {
			return tvnum;
		}
		public void setTvnum(String tvnum) {
			this.tvnum = tvnum;
		}
		
	}
}
